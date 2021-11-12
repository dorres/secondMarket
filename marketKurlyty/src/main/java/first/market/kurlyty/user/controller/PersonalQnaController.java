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
	
// 寃뚯떆�뙋 �씫湲� 
	@RequestMapping("/personalQnaBoard.do")
	public String getList(HttpServletRequest request, PersonalQnaVO vo, Model model) {
		HttpSession session = request.getSession();
		vo.setUser_id((String) session.getAttribute("userId"));
		
		List<PersonalQnaVO> boardList = personalqnaService.getPersonalQnaList(vo);
		System.out.println(boardList.get(0).getQna_personal_serial());
		model.addAttribute("personalqnaboard", boardList);
		return "customerCenter/personalQnaBoard";
	}
	
// 湲� �옉�꽦�븯湲� �럹�씠吏�濡� �씠�룞(userId�쓽 �쟾�솕踰덊샇, �씠硫붿씪 遺덈윭�삤湲�)
	
	@GetMapping("/personalQnaWrite.do")
	public String getUser(HttpServletRequest request, UserVO vo, Model model) {
		HttpSession session = request.getSession();
		vo.setUser_id((String)session.getAttribute("userId"));
		
		model.addAttribute("UserData", personalqnaService.getUser(vo));
		
		return "customerCenter/personalQnaWrite";
	}

//湲��쓣 �옉�꽦�빐�꽌 insert
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
		 //1.DB �썝蹂멸��졇�삤湲� (serial瑜� 媛�吏�怨�)
		 PersonalQnaVO getPersonalQna = personalqnaService.getPersonalQna(vo);
		 //System.out.println(getPersonalQna.getQna_personal_title());
		 //2.紐⑤뜽�뿉 媛�吏�怨좎삩 db�썝蹂몄쓣 �떞�븘以��떎. *�깮諛� �긽�옄瑜� 留뚮뱾�뼱 以��떎.
		 model.addAttribute("getPersonalQna", getPersonalQna);
		 //3.�뼱�뒓 �럹�씠吏�濡� �꽆�뼱媛��뒗媛�. >> personalQnaWrite濡� �꽆�뼱媛꾨떎 . // 洹� �씠�썑濡� jsp濡� 泥섎━�븯�뒗 寃껋씠�떎. 
		 
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

