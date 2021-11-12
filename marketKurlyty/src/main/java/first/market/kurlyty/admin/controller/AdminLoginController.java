package first.market.kurlyty.admin.controller;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminVO;
import first.market.kurlyty.user.controller.SecurityUtil;

@Controller
@SessionAttributes("adminId")
public class AdminLoginController {
	
	@Autowired
	private AdminService adminService;
	
	//������ �α���������
	@RequestMapping("admin_login.mdo")
	public String adminlogin() {
		return "admin_login";
	}
	
	//�����ڸ���������
	@RequestMapping("admin_index.mdo")
	public String adminIndex() {
		return "admin_index";
	}
	
	//������ �α���ó��
	@RequestMapping("loginProc.mdo")
	public String adminJoin(AdminVO admin, Model model) {
		String securityPw = null;
		AdminVO adminInfo = adminService.loginGetUser(admin);
		String dbPw = adminInfo.getAdmin_pw();
		
		try {
			securityPw = SecurityUtil.sha256(admin.getAdmin_pw());
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		if(dbPw.equals(securityPw)) {
			model.addAttribute("adminId", admin.getAdmin_id());
			return "admin_index";
		}else {
			return "redirect:admin_login.mdo";
		}
	}
	
	//������ �α׾ƿ�ó��
	@RequestMapping("logoutProc.mdo")
	public String logout(SessionStatus sessionStatus) {
		adminService.logout(sessionStatus);
		return "redirect:admin_login.mdo";
	}
	

}