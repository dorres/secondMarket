package first.market.kurlyty.user.service;

import java.util.List;

import first.market.kurlyty.user.vo.CouponVO;

public interface CouponService {

	List<CouponVO> getMyCoupons(String userId);
	List<CouponVO> getAllMyCoupons(String userId);
	void useCoupon(int couponSerial);
}