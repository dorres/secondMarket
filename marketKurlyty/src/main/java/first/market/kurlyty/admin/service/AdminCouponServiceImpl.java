package first.market.kurlyty.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import first.market.kurlyty.admin.dao.AdminCouponDAO;
import first.market.kurlyty.admin.vo.AdminCouponVO;

@Repository
@Service("adminCouponService")
public class AdminCouponServiceImpl implements AdminCouponService{
	@Autowired
	private AdminCouponDAO couponDao;

	@Override
	public void insertCoupon(AdminCouponVO couponVo) {
		couponDao.insertCoupon(couponVo);
	}
}