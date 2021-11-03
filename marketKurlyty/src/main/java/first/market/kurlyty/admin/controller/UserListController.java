package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.user.vo.UserVO;

@Controller
public class UserListController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("userlist.mdo")
	public String userList(UserVO user, Model model) {
		model.addAttribute("userList", service.userList(user));
		return "admin_userList";
}
}
