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

import com.sun.tools.internal.ws.processor.model.Request;

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
		System.out.println(boardList.get(0).getQna_personal_serial());
		model.addAttribute("personalqnaboard", boardList);
		return "customerCenter/personalQnaBoard";
	}
	
// 글 작성하기 페이지로 이동(userId의 전화번호, 이메일 불러오기)
	
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
		success = personalqnaService.insertPersonalQna(vo);
		if(success !=0) {
			return "redirect:personalQnaBoard.do";
		}else {
			return "customerCenter/personalQnaWrite";
		}
		   //model.addAttribute("personalqnaboard", personalqnaService.insertPersonalQna(vo));
     
	}		
	
	@RequestMapping("/deletePersonalQna.do")
	public String deletePersonalQna(HttpServletRequest Request, PersonalQnaVO vo) {
		int success = 0;
		success = personalqnaService.deletePersonalQna(vo);
		if(success != 0) {
			return "redirect:personalQnaBoard.do";
		}else {
			return "customerCenter/personalQnaBoard";
		}
	}
	
	
	 @GetMapping("/updatePersonalQna.do") 
	 public String updatePersonalQna(PersonalQnaVO vo, Model model) {

		
		// System.out.println(vo.getQna_personal_serial());
		 //1.DB 원본가져오기 (serial를 가지고)
		 PersonalQnaVO getPersonalQna = personalqnaService.getPersonalQna(vo);
		 //System.out.println(getPersonalQna.getQna_personal_title());
		 //2.모델에 가지고온 db원본을 담아준다. *택배 상자를 만들어 준다.
		 model.addAttribute("getPersonalQna", getPersonalQna);
		 //3.어느 페이지로 넘어가는가. >> personalQnaWrite로 넘어간다 . // 그 이후로 jsp로 처리하는 것이다. 
		 
		 return "customerCenter/personalQnaWrite";
	 }


	 @PostMapping("/updatePersonalQna.do")
	 public String updatePostPersonalQna(PersonalQnaVO vo) {
		 int success = 0; 
		 success = personalqnaService.updatePersonalQna(vo);
		 if(success != 0) {
			 return "redirect:personalQnaBoard.do";
		 }else {
			 return "customerCenter/personalQnaWrite";
		 }
	 }


}

