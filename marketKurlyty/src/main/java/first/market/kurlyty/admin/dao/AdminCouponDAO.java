package first.market.kurlyty.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.admin.vo.AdminCouponVO;

@Repository
public class AdminCouponDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertCoupon(AdminCouponVO couponVo) {
		sqlSession.insert("AdminDAO.insertCoupon", couponVo);
		
	}

	public List<AdminCouponVO> getCoupon() {
		return sqlSession.selectList("AdminDAO.selectCoupon");
	}
	
	public List<AdminCouponVO> getIssCoupon() {
		return sqlSession.selectList("AdminDAO.selectIssCoupon");
	}
}