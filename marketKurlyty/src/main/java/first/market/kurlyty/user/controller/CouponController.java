package first.market.kurlyty.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.user.service.CouponService;

@Controller
public class CouponController {
	@Autowired
	private CouponService couponService;
	
	@RequestMapping("/couponPage.do")
	public String couponPage(Model model, HttpSession session) {
		String userId=(String) session.getAttribute("userId");
		model.addAttribute("myCoupon",couponService.getAllMyCoupons(userId));
		return "mykurly/coupon";
	}
}
