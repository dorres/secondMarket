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
	public String adminCouponPub(AdminCouponVO CouponVo, Model model){
		// DB 쿠폰번호 가져오기
		AdminCouponVO couponVo = adminCouponService.selectCoupon(CouponVo);
		
		String dbCoupon = couponVo.getCoupon_code(); // DB에 있는 쿠폰번호
		
		if(CouponVo.getCoupon_code().equals(dbCoupon)) {
			model.addAttribute("couponData", couponVo);
			return "mykurly/infoModify2";
		}
		return dbCoupon;
	}
}// end