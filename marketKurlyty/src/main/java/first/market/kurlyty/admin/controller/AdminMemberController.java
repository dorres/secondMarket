package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;

@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminService adminService;
	
	//�����ڿ��� ��������������
	@RequestMapping("admin_userList.mdo")
	public String adminuserList(AdminUserVO adminUser, Model model) {
		model.addAttribute("userList", adminService.userList(adminUser));
		return "admin_userList";
	}
	
	//�����ڿ��� �Ŵ�������������
	@RequestMapping("admin_adminList.mdo")
	public String memberAdmin(AdminVO admin, Model model) {
		model.addAttribute("adminList", adminService.adminList(admin));
		return "admin_adminList";
	}
	
	//�Ŵ��� ����
	@RequestMapping("update.mdo")
	public String update(AdminVO admin, Model model) {
			model.addAttribute("update", adminService.loginGetUser(admin));
		return "admin_update";
	}
	
	@RequestMapping("updateProc.mdo")
	public String updateManager(AdminVO admin) {
		int sucess = 0;
		sucess = adminService.updateManager(admin);
		if(sucess==1) {
			return "admin_update.mdo";
		}else {
			return "redirect:admin.adminList";
		}
	}
	
	//�Ŵ��� ����
		@RequestMapping(value = "/delete", method = RequestMethod.POST) 
		public String deleteManager(AdminVO admin) {
			int sucess = 0;
			sucess = adminService.deleteManager(admin);
			if(sucess==1) {
				return "admin_adminList";
			}else {
				return "redirect:admin.adminList";
			}
		}
}
