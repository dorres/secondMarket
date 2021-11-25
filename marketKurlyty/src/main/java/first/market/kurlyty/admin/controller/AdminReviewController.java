package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminReviewVO;

@Controller
public class AdminReviewController {
		
	@Autowired
	private AdminService adminService;
	
	//���� ����Ʈ
	@RequestMapping("getReviewList.mdo")
	public String getReviewList(AdminReviewVO review, Model model) {
		model.addAttribute("reviewList", adminService.getReviewList(review));
		return "review/admin_reviewList";
	}
	
	//���� ����
	@RequestMapping("deleteReview.mdo")
	public String deleteReview(AdminReviewVO review) {
		int delete = 0;
		delete = adminService.deleteReview(review);
		if(delete != 0 ) {
			return "redirect:getReviewList.mdo";
		}else {
			return "redirect:getReviewList.mdo";
		}
	}
}
