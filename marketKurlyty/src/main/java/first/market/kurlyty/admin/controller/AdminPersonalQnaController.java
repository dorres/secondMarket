package first.market.kurlyty.admin.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminQnaVO;

@Controller
public class AdminPersonalQnaController {
	
	@Autowired
	private AdminService adminService;
	
	//1:1���� ����Ʈ (�亯 ���)
	@RequestMapping("admin_personalQnaWaitList.mdo")
	public String personalQnaWaitList(Model model) {
		model.addAttribute("qnaWaitList",adminService.getPersonalQnaWaitList());
		return "qna/admin_personalQnaWaitList";
	}
	
	//1:1���� ���λ��� (�亯 ���)
	@RequestMapping("admin_personalQnaWait.mdo")
	public String personalQnaWait(AdminQnaVO qna, Model model) {
		model.addAttribute("qnaWait",adminService.getPersonalQnaWait(qna));
		return "qna/admin_personalQnaWait";
	}
	
	//������ -1:1���� �亯�ۼ�(update)
	@RequestMapping("admin_personalQnaWaitUpdate.mdo")
	public String personalQnaWaitUpdate(AdminQnaVO qna) {
		int success =0;
		System.out.println(qna.getQna_personal_answer_title());
		success = adminService.updateQnaWait(qna);
		if(success != 0) {
			return "redirect:admin_personalQnaWaitList.mdo";		
		}else {
			return "redirect:admin_personalQnaWait.mdo";
			
		}
	}
	
	//������ --1:1���� ����(delete)
	@RequestMapping("admin_personalQnaWaitDelete.mdo")
	public String personalQnaWaitDelete(AdminQnaVO qna) {
		int success =0;
		success = adminService.deleteQnaWait(qna);
		if(success != 0) {
			return "redirect:admin_personalQnaWaitList.mdo";		
		}else {
			return "redirect:admin_personalQnaWait.mdo";
			
		}
	}
	
	// =========================================================================
	
	//1:1���� ����Ʈ (�亯 �Ϸ�)
	@RequestMapping("admin_personalQnaFinishList.mdo")
	public String personalQnaFinishList(Model model) {
		model.addAttribute("qnaFinishList",adminService.getPersonalQnaFinishList());
		return "qna/admin_personalQnaFinishList";
	}

	//1:1���� ���λ��� (�亯 �Ϸ�)
	@RequestMapping("admin_personalQnaFinish.mdo")
	public String personalQnaFinish(AdminQnaVO qna, Model model) {
		model.addAttribute("qnaFinish",adminService.getPersonalQnaFinish(qna));
		return "qna/admin_personalQnaFinish";
	}
	
	//1:1���� �亯����(update)
	@RequestMapping("admin_personalQnaFinishUpdate.mdo")
	public String personalQnaFinishUpdate(AdminQnaVO qna) {
		int success =0;
		success = adminService.updateQnaFinish(qna);
		if(success != 0) {
			return "redirect:admin_personalQnaFinishList.mdo";		
		}else {
			return "redirect:admin_personalQnaFinish.mdo";
			
		}
	}
	
	// ������ --1:1���� ����(delete)
	@RequestMapping("admin_personalQnaFinishDelete.mdo")
	public String personalQnaFinishDelete(AdminQnaVO qna) {
		int success =0;
		success = adminService.deleteQnaFinish(qna);
		if(success != 0) {
			return "redirect:admin_personalQnaFinishList.mdo";		
		}else {
			return "redirect:admin_personalQnaFinish.mdo";
			
		}
	}
}
