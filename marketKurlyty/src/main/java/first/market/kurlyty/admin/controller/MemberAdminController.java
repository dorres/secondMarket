package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminVO;

@Controller
public class MemberAdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("member.mdo")
	public String memberAdmin(AdminVO admin, Model model) {
		model.addAttribute("adminmember", service.memberAdmin(admin));
		return "admin_member";
	}
}
