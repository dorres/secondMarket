package first.market.kurlyty.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminLoginController {
	@RequestMapping("admin_login.mdo")
	public String adminJoin() {
		return "admin_login";
	}
}
