package first.market.kurlyty.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import first.market.kurlyty.user.service.user_address_listService;
import first.market.kurlyty.user.vo.user_address_listVO;

@Controller
public class user_address_listController {
	@Autowired
	private user_address_listService user_address_listService;
	HttpSession session;
	

	@GetMapping("/user_address_list.do")
	public String user_address_list( HttpSession session, user_address_listVO vo, Model model) throws Exception {
		String user_id=(String)session.getAttribute("userId");	
		model.addAttribute("list",user_address_listService.getBoard(user_id));
		return "mykurly/destination";
	}
	@GetMapping("/destination_new.do")
	public String user_address_list2(String myZipcode,String myAddress, String star,Model model) {
		model.addAttribute("myZipcode",myZipcode);
		model.addAttribute("myAddress", myAddress);
		model.addAttribute("star", star);
		return "mykurly/destination_new";
	}

	@GetMapping("/destination_update.do")
	public String user_address_list3(String user_phone, String user_name, String user_address2,Model model) {
		model.addAttribute("user_phone", user_phone);
		model.addAttribute("user_address2", user_address2);
		model.addAttribute("user_name", user_name); 
		 
		return "mykurly/destination_update";
	}
	@RequestMapping(value="/user_address_list_new.do" ,method=RequestMethod.POST)
	public String user_address_list4(HttpServletRequest request,user_address_listVO vo, Model model) throws Exception {
		System.out.println("1111111111");
		String user_zipcode= request.getParameter("user_zipcode");
		String user_address1 = request.getParameter("user_address1");
		String user_address2 = request.getParameter("user_address2");
		
		System.out.println(user_zipcode+user_address1+user_address2);
		System.out.println();
		
		return "mykurly/destination";
	}


}
