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
	
	@RequestMapping("/admin_couponpub.mdo") // 쿠폰 발행 페이지
	public String adminCouponPub(Model model){
			return "coupon/admin_couponpub";
	}
	@RequestMapping("/admin_insertCoupon.mdo")
	public String adminCouponInsert(AdminCouponVO couponVo, Model model) {
		adminCouponService.insertCoupon(couponVo);
		return "redirect:admin_couponpub.mdo";
	}
}// end