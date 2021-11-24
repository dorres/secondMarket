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
	
	//1:1문의 리스트 (답변 대기)
	@RequestMapping("admin_personalQnaWaitList.mdo")
	public String personalQnaWaitList(Model model) {
		model.addAttribute("qnaWaitList",adminService.getPersonalQnaWaitList());
		return "qna/admin_personalQnaWaitList";
	}
	
	//1:1문의 세부사항 (답변 대기)
	@RequestMapping("admin_personalQnaWait.mdo")
	public String personalQnaWait(AdminQnaVO qna, Model model) {
		model.addAttribute("qnaWait",adminService.getPersonalQnaWait(qna));
		return "qna/admin_personalQnaWait";
	}
	
	//관리자 -1:1문의 답변작성(update)
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
	
	//관리자 --1:1문의 삭제(delete)
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
	
	//1:1문의 리스트 (답변 완료)
	@RequestMapping("admin_personalQnaFinishList.mdo")
	public String personalQnaFinishList(Model model) {
		model.addAttribute("qnaFinishList",adminService.getPersonalQnaFinishList());
		return "qna/admin_personalQnaFinishList";
	}

	//1:1문의 세부사항 (답변 완료)
	@RequestMapping("admin_personalQnaFinish.mdo")
	public String personalQnaFinish(AdminQnaVO qna, Model model) {
		model.addAttribute("qnaFinish",adminService.getPersonalQnaFinish(qna));
		return "qna/admin_personalQnaFinish";
	}
	
	//1:1문의 답변수정(update)
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
	
	// 관리자 --1:1문의 삭제(delete)
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
