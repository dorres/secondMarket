package first.market.kurlyty.admin.controller;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminTermsAgreementVO;
import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;
import first.market.kurlyty.user.controller.SecurityUtil;

@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminService adminService;
	//유저목록 리스트
	@RequestMapping("admin_userList.mdo")
	public String adminuserList(AdminUserVO adminUser, Model model) {
		model.addAttribute("userList", adminService.userList(adminUser));
		return "user/admin_userList";
	}
	//매니저 목록 리스트
	@RequestMapping("admin_adminList.mdo")
	public String memberAdmin(AdminVO admin, Model model) {
		model.addAttribute("adminList", adminService.adminList(admin));
		return "manager/admin_adminList";
	}
	//매니저 등록
	@RequestMapping("joinProc.mdo")
	public String joinProc(AdminVO admin) {
		int success = 0;
		try {
			String securityPw = SecurityUtil.sha256(admin.getAdmin_pw());
			admin.setAdmin_pw(securityPw);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		success = adminService.joinProc(admin);
		if(success==1) {
			return "redirect:admin_adminList.mdo";
		}else {
			return "redirect:join.mdo";
		}
	}
	
	//매니저 목록 수정페이지
	@RequestMapping("update.mdo")
	public String update(AdminVO admin, Model model) {
			model.addAttribute("update", adminService.loginGetUser(admin));
		return "manager/admin_update";
	}
	//수정
	@RequestMapping("updateProc.mdo")
	public String updateManager(AdminVO admin) {
		int sucess = 0;
		sucess = adminService.updateManager(admin);
		if(sucess!=0) {
			return "redirect:admin_adminList.mdo";
		}else {
			return "manager/admin_update";
		}
	}
	//삭제
		@RequestMapping("deleteMember.mdo") 
		public String deleteManager(AdminVO admin) {
			int sucess = 0;
			sucess = adminService.deleteManager(admin);
			if(sucess!=0) {
				return "redirect:admin_adminList.mdo";
			}else {
				return "update.mdo";
			}
		}

		//회원 수정
		@RequestMapping("updateUser.mdo")
		@ResponseBody
		public int updateUser(AdminUserVO user) {
			int success = 0;
			success = adminService.updateUser(user);
			
			return success;

		}
		//회원 삭제
		@RequestMapping("deleteUser.mdo")
		public String deleteUser(AdminUserVO user) {
			int success = 0;
			success = adminService.deleteUser(user);
			if(success !=0) {
				return "redirect:admin_userList.mdo";
		}else {
			return "redirect:admin_userList.mdo";
		}
}
		//약관관리 리스트
		@RequestMapping("terms_agreeList.mdo")
		public String getTermsAgreeList(AdminTermsAgreementVO agree, Model model) {
			model.addAttribute("agreeList", adminService.getTermsAgree(agree));
			return "terms/admin_terms_agreementList";
		}
		//약관 등록 이동
		@RequestMapping("admin_terms.mdo")
		public String terms(AdminTermsAgreementVO agree) {
			return "terms/admin_terms";
		}
		//약관 등록 
		@RequestMapping("insertTerms.mdo")
		public String insertTerms(AdminTermsAgreementVO agree) {
			int success = 0;
			success = adminService.insertTerms(agree);
			if(success != 0) {
				return "redirect:terms_agreeList.mdo";
				}else {
					return "redirect:admin_terms.mdo";
				}
		}
		//약관 수정 화면
		@RequestMapping("termsDetails.mdo")
		public String getTerms(AdminTermsAgreementVO agree, Model model) {
			model.addAttribute("getTerms", adminService.getTerms(agree));
			return "terms/admin_termsDetails";
		}
		//약관 수정
		@RequestMapping("updateTerms.mdo")
		public String updateTerms(AdminTermsAgreementVO agree) {
				int success = 0;
				success = adminService.updateTerms(agree);
				if(success != 0) {
					return "redirect:terms_agreeList.mdo";
				}else {
					return "redirect:termsDetails.mdo";
				}
		}
		//약관 삭제
		@RequestMapping("deleteTerms.mdo")
		public String deleteTerms(AdminTermsAgreementVO agree) {
			int success = 0;
			success = adminService.deleteTerms(agree);
			if(success != 0) {
				return "redirect:terms_agreeList.mdo";
			}else {
				return "redirect:termDetail.mdo";
			}
		}
		
		
}
