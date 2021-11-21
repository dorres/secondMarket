package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminMembershipVO;

@Controller
public class AdminMemberShipController {

	@Autowired
	private AdminService adminService;
	
	//적립금 리스트
	@RequestMapping("admin_membershipList.mdo")
	public String adminMembershipList(Model model) {
		model.addAttribute("membershipList",adminService.getMembershipList());
		return "membership/admin_membershipList";
	}
	//적립금 세부페이지
	@RequestMapping("admin_membership.mdo")
	public String adminMembership(Model model, AdminMembershipVO membership) {
		model.addAttribute("membership", adminService.getMembership(membership));
		return "membership/admin_membership";
	}
	//적립금 수정
	@RequestMapping("admin_membershipUpdate.mdo")
	public String adminMembershipUpdate(AdminMembershipVO membership) {
		int success =0;
		
		success =adminService.updateMembership(membership);
		
		if(success != 0) 
			return "redirect:admin_membershipList.mdo";
		else 
			return "redirect:admin_membership.mdo";
		
	}
	//적립금 등록
	@RequestMapping("admin_membershipWrite.mdo")
	public String adminMembershipWrite(AdminMembershipVO membership) {
		return "membership/admin_membershipWrite";
	}
	//적립금 등록페이지
	@RequestMapping("admin_membershipInsert.mdo")
	public String adminMembershipInsert(AdminMembershipVO membership) {
		int success =0;
		
		success = adminService.insertMembership(membership);
		
		if(success != 0) 
			return "redirect:admin_membershipList.mdo";
		else 
			return "admin_membershipWrite";
	}
	//적립금 삭제
	@RequestMapping("admin_membershipDelete.mdo")
	public String adminMembershipDelete(AdminMembershipVO membership) {
		int success=0;
		
		success = adminService.deleteMembership(membership);
		if(success != 0) 
			return "redirect:admin_membershipList.mdo";
		else 
			return "redirect:admin_membershipList.mdo";
		
	}
}
