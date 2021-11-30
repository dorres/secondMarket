package first.market.kurlyty.user.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.CouponDAO;
import first.market.kurlyty.user.vo.CouponVO;

@Service
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponDAO couponDao;
	
	@Override
	public List<CouponVO> getMyCoupons(String userId){
		List<CouponVO> couponList = new ArrayList<CouponVO>();
		List<CouponVO> myCoupon = couponDao.getMyCoupon(userId);
		for(CouponVO coupon:myCoupon) {
			CouponVO couponInfo = couponDao.getCouponInfo(coupon.getCoupon_use_coupon_serial());
			if(couponInfo!=null) {
				couponInfo.setCoupon_use_serial(coupon.getCoupon_use_serial());
				couponList.add(couponInfo);
			}
		}
		return couponList;
	}

	@Override
	public void useCoupon(int couponSerial) {
		couponDao.useCoupon(couponSerial);
	}

	@Override
	public List<CouponVO> getAllMyCoupons(String userId) {
		List<CouponVO> couponList = new ArrayList<CouponVO>();
		List<CouponVO> myCoupon = couponDao.getAllMyCoupon(userId);
		for(CouponVO coupon:myCoupon) {
			CouponVO couponInfo = couponDao.getCouponInfo(coupon.getCoupon_use_coupon_serial());
			if(couponInfo!=null) {
				couponInfo.setCoupon_use_serial(coupon.getCoupon_use_serial());
				couponInfo.setCoupon_use_status(coupon.getCoupon_use_status());
				couponList.add(couponInfo);
			}
		}
		return couponList;
	}
}
