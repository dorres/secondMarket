package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminUserVO;

@Controller
public class AdminUserController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("adminuser.mdo")
	public String adminuserList(AdminUserVO adminuser, Model model) {
		model.addAttribute("adminuserList", service.adminuserList(adminuser));
		return "adminuser_List";
	}
}
