package first.market.kurlyty.admin.controller;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminVO;
import first.market.kurlyty.user.controller.SecurityUtil;
import first.market.kurlyty.user.vo.UserVO;

@Controller
public class AdminJoinController {
	
	@Autowired
	private AdminService adminService;
	
	//관리자 회원가입페이지
	@RequestMapping("admin_join.mdo")
	public String adminJoin(Model model) {
		return "manager/admin_join";
	}
	
	//관리자 회원가입-아이디 체크
		@RequestMapping(value="idCheck.mdo", produces="html/text; charset=utf-8")
		@ResponseBody
		public String idCheck(AdminVO admin) {
			boolean used = adminService.idCheck(admin);
			if(used)
				return "{\"message\":\"사용가능한 아이디 입니다.\",\"usedId\":\"가능\"}";
			else
				return "{\"message\":\"사용 불가능한 아이디 입니다.\",\"usedId\":"
						+ "\"불가능\"}";
		}
	
}
