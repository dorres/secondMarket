package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminNoticeVO;


@Controller
public class AdminNoticeController {
	
	@Autowired
	private AdminService adminService;
	
	//관리자 -공지사항 리스트
	@RequestMapping("admin_noticeList.mdo")
	public String adminNoticeList(AdminNoticeVO notice, Model model) {
		model.addAttribute("noticeList", adminService.getNoticeList(notice));
		return "admin_noticeList";
	}
	//관리자 -공지사항 세부사항
	@RequestMapping("admin_notice.mdo")
	public String adminNotice(AdminNoticeVO notice, Model model) {
		model.addAttribute("notice", adminService.getNotice(notice));
		return "admin_notice";
	}
	
	//관리자 -공지사항 수정(update)
<<<<<<< HEAD
	@RequestMapping("admin_noticeProc.mdo")
	public String adminNoticeProc(AdminNoticeVO notice) {
=======
	@RequestMapping("admin_noticeUpdate.mdo")
	public String adminNoticeUpdate(AdminNoticeVO notice) {
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
		int success =0;
		success = adminService.updateNotice(notice);
		if(success != 0) {
			return "redirect:admin_noticeList.mdo";
		}else {
			return "admin_notice";
		}
	}
	
	//관리자 -공지사항 삭제(delete)
	@RequestMapping("admin_noticeDelete.mdo")
	public String adminNoticeDelete(AdminNoticeVO notice) {
		int success =0;
		success = adminService.deleteNotice(notice);
		if(success != 0) {
			return "redirect:admin_noticeList.mdo";
		}else {
			return "admin_notice";
		}
	}
	
	//관리자 -공지사항 등록페이지
	@RequestMapping("admin_noticeWrite.mdo")
	public String adminNoticeWrite(AdminNoticeVO notice) {
		return "admin_noticeWrite";
	}
	
	//관리자 -공지사항 등록(insert)
	@RequestMapping("admin_noticeInsert.mdo")
	public String adminNoticeInsert(AdminNoticeVO notice) {
		int success =0;
		success = adminService.insertNotice(notice);
		if(success != 0) {
			return "redirect:admin_noticeList.mdo";
		}else {
			return "admin_noticeWrite";
		}
	}
	
	
}
