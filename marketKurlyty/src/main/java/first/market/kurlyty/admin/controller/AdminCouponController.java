package first.market.kurlyty.admin.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminCouponVO;

@Controller
public class AdminCouponController {

	@Autowired
	private AdminService adminService;
	
	//쿠폰 목록 리스트
	@RequestMapping("admin_couponList.mdo")
	public String adminCouponList(Model model) {
		model.addAttribute("couponList",adminService.getCouponList());
		return "coupon/admin_couponList";
	}
	
	//쿠폰 세부페이지
	@RequestMapping("admin_coupon.mdo")
	public String adminCoupon(Model model, AdminCouponVO coupon) {
		model.addAttribute("coupon", adminService.getCoupon(coupon));
		return "coupon/admin_coupon";
	}
	
	//적립금 수정
	@RequestMapping("admin_couponUpdate.mdo")
	public String adminMembershipUpdate(AdminCouponVO coupon) {
		int success =0;
		
		success =adminService.updateCoupon(coupon);
		
		if(success != 0) 
			return "redirect:admin_couponList.mdo";
		else 
			return "redirect:admin_coupon.mdo";
		
	}
	
	//쿠폰 등록
	@RequestMapping("admin_couponWrite.mdo")
	public String adminCouponWrite() {
		return "coupon/admin_couponWrite";
	}
	
	//쿠폰 등록(insert)
	@RequestMapping("admin_couponInsert.mdo")
	public String adminCouponInsert(AdminCouponVO coupon) {
		int success =0;
		success = adminService.insertCoupon(coupon);
		
		if(success != 0) 
			return "redirect:admin_couponList.mdo";
		else 
			return "admin_couponWrite";
	}
	//쿠폰 삭제
	@RequestMapping("admin_CouponDelete.mdo")
	public String adminCouponDelete(AdminCouponVO coupon) {
		int success=0;
		
		success = adminService.deleteCoupon(coupon);
		if(success != 0) 
			return "redirect:admin_couponList.mdo";
		else 
			return "redirect:admin_couponList.mdo";
		
	}
	
}
