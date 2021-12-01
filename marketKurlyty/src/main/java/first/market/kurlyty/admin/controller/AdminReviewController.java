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
	
	//∏Æ∫‰¿÷¥¬ ªÛ«∞
	@RequestMapping("getReviewGoodsName.mdo")
	public String getReviewGoodsName(AdminReviewVO review, Model model) {
		model.addAttribute("reviewgoodsname", adminService.getReviewGoodsName(review));
		return "review/reviewGoodsName";
	}
	//∏Æ∫‰ ∏ÆΩ∫∆Æ
	@RequestMapping("getReviewList.mdo")
	public String getReviewList(AdminReviewVO review, Model model) {
		model.addAttribute("reviewList", adminService.getReviewList(review));
		return "review/admin_reviewList";
	}
	
	//∏Æ∫‰ ªË¡¶
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
	
	//∏Æ∫‰ ≥ªøÎ
	@RequestMapping("getReviewContent.mdo")
	public String getReviewContent(AdminReviewVO review, Model model) {
		model.addAttribute("reviewcon", adminService.getReviewContent(review));
		return "review/admin_reviewContent";
	}
	
	@RequestMapping("updateReview.mdo")
	public int updateReview(AdminReviewVO review) {
		int success =0;
		review.isReview_best_up();
		
		success = adminService.updateReview(review);
		return success;
	}
}
