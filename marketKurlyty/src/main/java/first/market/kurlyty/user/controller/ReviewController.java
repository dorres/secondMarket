package first.market.kurlyty.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import first.market.kurlyty.user.service.ReviewService;
import first.market.kurlyty.user.vo.ReviewVO;
import first.market.kurlyty.user.vo.User_order_listVO;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewservice;
		
	@RequestMapping("/review.do")
	public String review(HttpSession session, User_order_listVO vo, Model model) {
		String user_id = (String)session.getAttribute("userId");
		Integer count = reviewservice.count(user_id) == null ? 0:reviewservice.count(user_id);
		
		model.addAttribute("review", reviewservice.reviewList(user_id));
		model.addAttribute("count", count);
		return "mykurly/review";
	}
	
	@RequestMapping("/revieWrite.do")
	public String reviewW(User_order_listVO vo, Model model) {
		model.addAttribute("goods", reviewservice.reviewWrite(vo.getOrder_details_serial()));
		return "mykurly/reviewWrite";
	}
	
	@RequestMapping(value="/reviewProc.do" ,method=RequestMethod.POST)
	public String reviewInsert(ReviewVO vo) {
		reviewservice.insertReview(vo);
		return "mykurly/review";
	}

}
