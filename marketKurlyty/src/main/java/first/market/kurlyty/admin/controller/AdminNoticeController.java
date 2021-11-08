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
	
	//������ -�������� ����Ʈ
	@RequestMapping("admin_noticeList.mdo")
	public String adminNoticeList(AdminNoticeVO notice, Model model) {
		model.addAttribute("noticeList", adminService.getNoticeList(notice));
		return "admin_noticeList";
	}
	//������ -�������� ���λ���
	@RequestMapping("admin_notice.mdo")
	public String adminNotice(AdminNoticeVO notice, Model model) {
		model.addAttribute("notice", adminService.getNotice(notice));
		return "admin_notice";
	}
	
	//������ -�������� ����(update)
	@RequestMapping("admin_noticeUpdate.mdo")
	public String adminNoticeUpdate(AdminNoticeVO notice) {

		int success =0;
		success = adminService.updateNotice(notice);
		if(success != 0) {
			return "redirect:admin_noticeList.mdo";
		}else {
			return "redirect:admin_notice.mdo";
		}
	}
	
	//������ -�������� ����(delete)
	@RequestMapping("admin_noticeDelete.mdo")
	public String adminNoticeDelete(AdminNoticeVO notice) {
		int success =0;
		success = adminService.deleteNotice(notice);
		if(success != 0) {
			return "redirect:admin_noticeList.mdo";
		}else {
			return "redirect:admin_notice.mdo";
		}
	}
	
	//������ -�������� ���������
	@RequestMapping("admin_noticeWrite.mdo")
	public String adminNoticeWrite(AdminNoticeVO notice) {
		return "admin_noticeWrite";
	}
	
	//������ -�������� ���(insert)
	@RequestMapping("admin_noticeInsert.mdo")
	public String adminNoticeInsert(AdminNoticeVO notice) {
		int success =0;
		success = adminService.insertNotice(notice);
		if(success != 0) {
			return "redirect:admin_noticeList.mdo";
		}else {
			return "redirect:admin_noticeWrite.mdo";
		}
	}
	
	
}
