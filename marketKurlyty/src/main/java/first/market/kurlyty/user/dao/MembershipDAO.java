package first.market.kurlyty.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.MembershipVO;

@Repository
public class MembershipDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public MembershipVO getMembership(String user_membership_name) {
		return sqlSession.selectOne("membershipDAO.getMemgershipData",user_membership_name);
	}
	public String getMembershipOfUser(String user_id) {
		return sqlSession.selectOne("membershipDAO.getMembershipOfUser",user_id);
	}
}
