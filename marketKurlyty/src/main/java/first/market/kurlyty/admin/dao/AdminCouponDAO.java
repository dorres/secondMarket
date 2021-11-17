package first.market.kurlyty.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.admin.vo.AdminCouponVO;
import first.market.kurlyty.user.vo.UserVO;

@Repository
public class AdminCouponDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertCoupon(AdminCouponVO couponVo) {
		sqlSession.insert("AdminDAO.insertCoupon", couponVo);
		
	}

	public AdminCouponVO getCoupon(AdminCouponVO couponVo) {
		return sqlSession.selectOne("AdminDAO.selectCoupon", couponVo);
	}
}