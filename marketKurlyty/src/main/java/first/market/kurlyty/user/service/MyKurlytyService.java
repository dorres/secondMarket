package first.market.kurlyty.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.MyKurlytyDAO;
import first.market.kurlyty.user.vo.UserDetailsVO;

@Service
public class MyKurlytyService implements MyKurlytyServe {
	@Autowired
	private MyKurlytyDAO myKurlytyDao;
	
	@Override
	public UserDetailsVO getMyInfo(String userId) {
		UserDetailsVO userDetail = myKurlytyDao.getUserDetail(userId);
		String couponCount = myKurlytyDao.getCouponCount(userId);
		String pointRate = myKurlytyDao.getPointRate(userDetail.getUser_membership_name());
		userDetail.setCouponCount(couponCount);
		userDetail.setPointRate(pointRate);
		return userDetail;
	}
}
