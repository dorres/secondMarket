package first.market.kurlyty.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String user_address_list2(String myZipcode,String myAddress, String star,String user_id, String whatsPage,Model model) {
		
		model.addAttribute("myZipcode",myZipcode);
		model.addAttribute("myAddress", myAddress);
		model.addAttribute("star", star);
		model.addAttribute("user_id", user_id);
		if(whatsPage!=null)
			model.addAttribute("whatsPage", whatsPage);
		return "mykurly/destination_new";
	}

	@GetMapping("/destination_update.do")
	public String user_address_list3(boolean address_default,int address_serial,String user_address1,String user_phone, String user_name, String user_address2,Model model) {
		model.addAttribute("user_phone", user_phone);
		model.addAttribute("user_address2", user_address2);
		model.addAttribute("user_name", user_name); 
		model.addAttribute("user_address1", user_address1); 
		model.addAttribute("address_serial", address_serial);
		model.addAttribute("address_default",address_default);
		//user_address_listService.update(vo);
		return "mykurly/destination_update";
	}
	@RequestMapping(value="/user_address_list_new.do" ,method=RequestMethod.POST)
	@ResponseBody
	public String user_address_list4(HttpServletRequest request,user_address_listVO vo, Model model) throws Exception {
		String user_id=request.getParameter("user_id");
		String user_zipcode= request.getParameter("user_zipcode");
		String user_address1 = request.getParameter("user_address1");
		String user_address2 = request.getParameter("user_address2");
		
		user_address_listService.insert(vo);
		model.addAttribute("list");
		
		return "mykurly/destination";
	}
	
	@RequestMapping(value="/user_address_list_update.do" ,method=RequestMethod.POST)
	public String user_address_list5(user_address_listVO vo, Model model) throws Exception {
		
		user_address_listService.update(vo);
		model.addAttribute("list");
		
		return "mykurly/destination";
	}
	@RequestMapping(value="/updateDefaulAddress.do", produces = "html/text; charset=UTF-8")
	@ResponseBody
	public String updateDefaultAddress(user_address_listVO vo,HttpSession session) {
		vo.setUser_id((String)session.getAttribute("userId"));
		user_address_listService.setDefaultAddress(vo);
		return "???????????? ??????????????.";
	}
	@RequestMapping(value="/deleteAddress.do", produces="html/text; charset=UTF-8")
	@ResponseBody
	public String deleteAddress(user_address_listVO vo) {
		user_address_listService.deleteAddress(vo);
		return "?????? ??????????????.";
	}

}
