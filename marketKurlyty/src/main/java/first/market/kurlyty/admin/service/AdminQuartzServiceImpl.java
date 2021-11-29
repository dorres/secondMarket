package first.market.kurlyty.admin.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.admin.dao.AdminDAO;
import first.market.kurlyty.admin.vo.AdminCouponVO;

@Service("couponService")
public class AdminQuartzServiceImpl implements AdminQuartzService {
	
	@Autowired
	private AdminDAO adminDao;
	
	@Override
	public void testJobMethod() {
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		List<AdminCouponVO> endList = adminDao.getCouponDate();
		for(AdminCouponVO end : endList) {
			if(end.getCoupon_end().before(now)){
				adminDao.updateCouponDate(end);
			}
		}
	}
}
