package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminCouponService;
import first.market.kurlyty.admin.vo.AdminCouponVO;

@Controller
public class AdminCouponController {
	
	@Autowired
	private AdminCouponService adminCouponService;
	
	@RequestMapping("/admin_couponpub.mdo") // ÄíÆù ¹ßÇà ÆäÀÌÁö
	public String adminCouponPub(Model model){
		model.addAttribute("getcoupon",adminCouponService.getCoupon());
			return "coupon/admin_couponpub";
	}
	@RequestMapping("/admin_insertCoupon.mdo") // ÄíÆù ¹ßÇà ÆäÀÌÁö
	public String adminCouponInsert(AdminCouponVO couponVo, Model model) {
		adminCouponService.insertCoupon(couponVo);
		return "redirect:admin_couponpub.mdo";
	}
	@RequestMapping("/admin_couponiss.mdo")
	public String adminCouponIss(Model model) {
		model.addAttribute("getisscoupon",adminCouponService.getIssCoupon());
		return "coupon/admin_couponiss";
	}
	@RequestMapping("/admin_couponpop.mdo") // ÆË¾÷
	public String adminCouponPop(Model model) {
		model.addAttribute("getcoupon",adminCouponService.getCoupon());
		return "coupon/admin_couponpop";
	}
	@RequestMapping("/admin_couponpop2.mdo") // ÆË¾÷
	public String adminCouponPop2(Model model) {
		model.addAttribute("getcoupon",adminCouponService.getCoupon());
		return "coupon/admin_couponpop2";
	}
}// end