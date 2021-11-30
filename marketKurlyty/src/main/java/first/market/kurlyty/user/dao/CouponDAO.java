package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.CouponVO;

@Repository
public class CouponDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<CouponVO> getMyCoupon(String userId){
		return sqlSession.selectList("UserDAO.getMyCoupon",userId);
	}
	public CouponVO getCouponInfo(int couponSerial) {
		return sqlSession.selectOne("UserDAO.getCouponInfo",couponSerial);
	}
	public List<CouponVO> getAllMyCoupon(String userId){
		return sqlSession.selectList("UserDAO.getAllMyCoupon", userId);
	}
	public void useCoupon(int couponSerial) {
		sqlSession.update("UserDAO.useCoupon",couponSerial);
	}
	
}
