package first.market.kurlyty.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.admin.vo.AdminCouponVO;

@Repository
public class AdminCouponDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public AdminCouponVO insertCoupon(AdminCouponVO couponVo) {
		return couponVo;
	}
}