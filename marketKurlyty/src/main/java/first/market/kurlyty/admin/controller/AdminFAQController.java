package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminFAQVO;
import first.market.kurlyty.admin.vo.AdminNoticeVO;

@Controller
public class AdminFAQController {
	
	@Autowired
	private AdminService adminService;
	
	//관리자 - 자주하는 질문 리스트
	@RequestMapping("admin_FAQList.mdo")
	public String adminFAQList(AdminFAQVO faq, Model model) {
		model.addAttribute("faqList",adminService.getFAQList(faq));
		return "admin_FAQList";
	}
	
	//관리자 -자주하는 질문 세부사항
	@RequestMapping("admin_FAQ.mdo")
	public String adminFAQ(AdminFAQVO faq, Model model) {
		model.addAttribute("faq", adminService.getFAQ(faq));
		return "admin_FAQ";
	}
	
	//관리자 -자주하는 질문 수정(update)
	@RequestMapping("admin_FAQUpdate.mdo")
	public String adminFAQUpdate(AdminFAQVO faq) {
		int success =0;
		success = adminService.updateFAQ(faq);
		if(success != 0) {
			return "redirect:admin_FAQList.mdo";		
		}else {
			return "admin_FAQ";
			
		}
	}
	
	//관리자 -자주하는 질문 삭제(delete)
	@RequestMapping("admin_FAQDelete.mdo")
	public String adminFAQDelete(AdminFAQVO faq) {
		int success =0;
		success = adminService.deleteFAQ(faq);
		if(success != 0) {
			return "redirect:admin_FAQList.mdo";
		}else {
			return "admin_FAQ";
		}
	}
	
	//관리자 -자주하는 질문 등록페이지
	@RequestMapping("admin_FAQWrite.mdo")
	public String adminFAQWrite(AdminFAQVO faq) {
		return "admin_FAQWrite";
	}
	
	//관리자 -자주하는 질문 등록(insert)
	@RequestMapping("admin_FAQInsert.mdo")
	public String adminFAQInsert(AdminFAQVO faq) {
		int success =0;
		success = adminService.insertFAQ(faq);
		if(success != 0) {
			return "redirect:admin_FAQList.mdo";
		}else {
			return "admin_fAQWrite";
		}
	}
	
}
