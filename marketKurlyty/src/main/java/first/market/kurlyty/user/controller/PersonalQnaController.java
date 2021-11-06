package first.market.kurlyty.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.user.service.PersonalQnaService;
import first.market.kurlyty.user.vo.PersonalQnaVO;
import first.market.kurlyty.user.vo.UserVO;


@Controller
public class PersonalQnaController {
	@Autowired
	private PersonalQnaService personalqnaService;
	
// 게시판 읽기 
	@RequestMapping("/personalQnaBoard.do")
	public String getList(HttpServletRequest request, PersonalQnaVO vo, Model model) {
		HttpSession session = request.getSession();
		vo.setUser_id((String) session.getAttribute("userId"));
		
		List<PersonalQnaVO> boardList = personalqnaService.getPersonalQnaList(vo);
		model.addAttribute("personalqnaboard", boardList);
		return "customerCenter/personalQnaBoard";
	}
	
// 글 작성하기 페이지로 가기
	@GetMapping("/personalQnaWrite.do")
	public String getUser(HttpServletRequest request, UserVO vo, Model model) {
		HttpSession session = request.getSession();
		vo.setUser_id((String)session.getAttribute("userId"));
		model.addAttribute("UserData", personalqnaService.getUser(vo));
		return "customerCenter/personalQnaWrite";
	}

//글을 작성해서 insert
	@PostMapping("/insertPersonalQna.do")
	public String insertPersonalQna(PersonalQnaVO vo) {
		System.out.println(vo.getUser_id());
//		HttpSession session = request.getSession();
		int success =0;
		//System.out.println(vo.getQna_personal_content());
		success = personalqnaService.insertPersonalQna(vo);
		if(success !=0) {
			return "redirect:personalQnaBoard.do";
		}else {
			return "customerCenter/personalQnaWrite";
		}
        //model.addAttribute("personalqnaboard", personalqnaService.insertPersonalQna(vo));
		
		}
	}