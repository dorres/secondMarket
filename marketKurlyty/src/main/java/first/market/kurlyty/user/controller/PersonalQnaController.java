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
import first.market.kurlyty.user.vo.User_order_listVO;


@Controller
public class PersonalQnaController {
	@Autowired
	private PersonalQnaService personalqnaService;
	
	
// 
	@RequestMapping("/personalQnaBoard.do")
	public String getList(HttpServletRequest request, PersonalQnaVO vo, Model model) {
		HttpSession session = request.getSession();
		vo.setUser_id((String) session.getAttribute("userId"));
		
		List<PersonalQnaVO> boardList = personalqnaService.getPersonalQnaList(vo);
		model.addAttribute("personalqnaboard", boardList);
		return "customerCenter/personalQnaBoard";
	}
	
	@GetMapping("/personalQnaWrite.do")
	public String getUser(HttpServletRequest request, UserVO vo, Model model,User_order_listVO lo) {
		HttpSession session = request.getSession();
		vo.setUser_id((String)session.getAttribute("userId"));
		model.addAttribute("UserData", personalqnaService.getUser(vo));
		model.addAttribute("order_merchant_serial",personalqnaService.getMerchantSerial(lo));
		
		return "customerCenter/personalQnaWrite";
	}

//
	@PostMapping("/insertPersonalQna.do")
	public String insertPersonalQna(PersonalQnaVO vo) {
		System.out.println(vo.getUser_id());
		int success =0;
		success = personalqnaService.insertPersonalQna(vo);
		if(success !=0) {
			return "redirect:personalQnaBoard.do";
		}else {
			return "customerCenter/personalQnaWrite";
		}
    
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
		 //1.call(get DB) to get SERIAL
		 PersonalQnaVO getPersonalQna = personalqnaService.getPersonalQna(vo);
		 //System.out.println(getPersonalQna.getQna_personal_title());
		 //2. put Origianl DB in model(=percel Box)
		 model.addAttribute("getPersonalQna", getPersonalQna);
		 //3. going to personalQnaWrite and start processing '.JSP'
		 
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

