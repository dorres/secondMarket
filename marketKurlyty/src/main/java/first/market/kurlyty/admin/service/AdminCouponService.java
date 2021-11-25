package first.market.kurlyty.admin.service;

import java.util.List;

import first.market.kurlyty.admin.vo.AdminCouponVO;

public interface AdminCouponService {
	void insertCoupon(AdminCouponVO couponVo);
	List<AdminCouponVO> getCoupon();
	List<AdminCouponVO> getIssCoupon();
}