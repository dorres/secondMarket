package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminMembershipVO;

@Controller
public class AdminCouponController {

	@Autowired
	private AdminService adminService;
	
	//���� ��� ����Ʈ
	@RequestMapping("admin_couponList.mdo")
	public String adminCouponList(Model model) {
		model.addAttribute("couponList",adminService.getCouponList());
		return "coupon/admin_couponList";
	}
	
//	//������ ����������
//	@RequestMapping("admin_membership.mdo")
//	public String adminMembership(Model model, AdminMembershipVO membership) {
//		model.addAttribute("membership", adminService.getMembership(membership));
//		return "membership/admin_membership";
//	}
//	//������ ����
//	@RequestMapping("admin_membershipUpdate.mdo")
//	public String adminMembershipUpdate(AdminMembershipVO membership) {
//		int success =0;
//		
//		success =adminService.updateMembership(membership);
//		
//		if(success != 0) 
//			return "redirect:admin_membershipList.mdo";
//		else 
//			return "redirect:admin_membership.mdo";
//		
//	}
	
	//���� ���
	@RequestMapping("admin_couponWrite.mdo")
	public String adminCouponWrite() {
		return "coupon/admin_couponWrite";
	}
	
//	//������ ���(insert)
//	@RequestMapping("admin_membershipInsert.mdo")
//	public String adminMembershipInsert(AdminMembershipVO membership) {
//		int success =0;
//		
//		success = adminService.insertMembership(membership);
//		
//		if(success != 0) 
//			return "redirect:admin_membershipList.mdo";
//		else 
//			return "admin_membershipWrite";
//	}
//	//������ ����
//	@RequestMapping("admin_membershipDelete.mdo")
//	public String adminMembershipDelete(AdminMembershipVO membership) {
//		int success=0;
//		
//		success = adminService.deleteMembership(membership);
//		if(success != 0) 
//			return "redirect:admin_membershipList.mdo";
//		else 
//			return "redirect:admin_membershipList.mdo";
//		
//	}
	
}
