package first.market.kurlyty.admin.controller;


import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminCouponVO;
import first.market.kurlyty.admin.vo.AdminMembershipVO;

@Controller
public class AdminCouponController {

	@Autowired
	private AdminService adminService;
	
	//���� ��� ����Ʈ
	@RequestMapping("admin_couponList.mdo")
	public String adminCouponList(Model model) {
		
		model.addAttribute("couponList",adminService.getCouponList());
		return "coupon/admin_couponList";
	}
	
	//���� ����������
	@RequestMapping("admin_coupon.mdo")
	public String adminCoupon(Model model, AdminCouponVO coupon) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		AdminCouponVO vo = adminService.getCoupon(coupon);
		String start = sdf.format(vo.getCoupon_start());
		String end = sdf.format(vo.getCoupon_end());
		
		model.addAttribute("coupon", vo);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		return "coupon/admin_coupon";
	}
	
	//���� ����
	@RequestMapping("admin_couponUpdate.mdo")
	public String adminMembershipUpdate(AdminCouponVO coupon) {
		int success =0;
		System.out.println(coupon.getCoupon_serial());
		success =adminService.updateCoupon(coupon);
		
		if(success != 0) 
			return "redirect:admin_couponList.mdo";
		else 
			return "redirect:admin_coupon.mdo";
		
	}
	
	//���� ���
	@RequestMapping("admin_couponWrite.mdo")
	public String adminCouponWrite() {
		return "coupon/admin_couponWrite";
	}
	
	//���� ���(insert)
	@RequestMapping("admin_couponInsert.mdo")
	public String adminCouponInsert(AdminCouponVO coupon) {
		int success =0;
		success = adminService.insertCoupon(coupon);
		
		if(success != 0) 
			return "redirect:admin_couponList.mdo";
		else 
			return "admin_couponWrite";
	}
	//���� ����
	@RequestMapping("admin_couponDelete.mdo")
	public String adminCouponDelete(AdminCouponVO coupon) {
		int success=0;
		
		success = adminService.deleteCoupon(coupon);
		if(success != 0) 
			return "redirect:admin_couponList.mdo";
		else 
			return "redirect:admin_couponList.mdo";
	}
	//====================================================================
	//���� �����Ȳ ����Ʈ
	@RequestMapping("admin_couponUseList.mdo")
	public String adminCouponUseList(Model model) {
		
		model.addAttribute("couponList",adminService.getCouponUseList());
		return "coupon/admin_couponUseList";
	}
	//���� �����Ȳ ����������
	@RequestMapping("admin_couponUse.mdo")
	public String adminCouponUse(Model model, AdminCouponVO coupon) {
		model.addAttribute("couponList",adminService.getCouponList());
		model.addAttribute("membershipList",adminService.getMembershipList());
		return "coupon/admin_couponUse";
	}
	

	//���� �����Ȳ (�����߱�â)
	@RequestMapping("admin_couponUseWrite.mdo")
	public String adminCouponUseWrite() {
		return "coupon/admin_couponUseWrite";
	}
	
	//���� �����Ȳ (�����߱�-insert)
	@RequestMapping("admin_couponUseInsert.mdo")
	@ResponseBody
	public int adminCouponUseInsert(AdminCouponVO coupon) {
		int success =1;
		
		List<AdminCouponVO> idList = adminService.getUserId(coupon);
		
		for(AdminCouponVO id : idList) {
			coupon.setCoupon_use_userid(id.getUser_id());
			int result =adminService.insertCouponUse(coupon);
			if(result == 0) {
				success = result;
			}
		}
		return success;
	}
	//���� ����
	@RequestMapping("admin_couponUseDelete.mdo")
	public String adminCouponUseDelete(AdminCouponVO coupon) {
		int success=0;
		
		success = adminService.deleteCouponUse(coupon);
		if(success != 0) 
			return "redirect:admin_couponUseList.mdo";
		else 
			return "redirect:admin_couponUseList.mdo";
	}
	
}
