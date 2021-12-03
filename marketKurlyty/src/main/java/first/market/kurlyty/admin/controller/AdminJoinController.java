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
	
	//������ ȸ������������
	@RequestMapping("admin_join.mdo")
	public String adminJoin(Model model) {
		return "manager/admin_join";
	}
	
	//������ ȸ������-���̵� üũ
		@RequestMapping(value="idCheck.mdo", produces="html/text; charset=utf-8")
		@ResponseBody
		public String idCheck(AdminVO admin) {
			boolean used = adminService.idCheck(admin);
			if(used)
				return "{\"message\":\"��밡���� ���̵� �Դϴ�.\",\"usedId\":\"����\"}";
			else
				return "{\"message\":\"��� �Ұ����� ���̵� �Դϴ�.\",\"usedId\":"
						+ "\"�Ұ���\"}";
		}
	
}
