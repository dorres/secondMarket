package first.market.kurlyty.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.UserDetailsVO;

@Repository
public class MyKurlytyDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	 public String getCouponCount(String userId) {
		 return sqlSession.selectOne("myKurlytyDAO.getCouponCount",userId);
	 }
	 public String getPointRate(String membership) {
		 return sqlSession.selectOne("myKurlytyDAO.getPointRate",membership);
	 }
	 public UserDetailsVO getUserDetail(String userId) {
		 return sqlSession.selectOne("myKurlytyDAO.getUserDetail",userId);
	 }
}
