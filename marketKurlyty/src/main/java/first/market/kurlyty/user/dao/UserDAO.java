package first.market.kurlyty.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.emailsend.EmailSendVO;
import first.market.kurlyty.user.vo.UserDetailsVO;
import first.market.kurlyty.user.vo.UserVO;

@Repository
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public UserVO getUser(UserVO user) {
		return sqlSession.selectOne("UserDAO.getUser", user);
	}
	public UserVO checkEmail(UserVO user) {
		return sqlSession.selectOne("UserDAO.checkEmail",user);
	}
	public int insertUser(UserVO user) {
		return sqlSession.insert("UserDAO.insertUser", user);
	}
	public void insertUserDetails(UserVO user) {
		sqlSession.insert("UserDAO.insertUserDetails",user);
	}
	public void insertUserAddressList(UserVO user) {
		sqlSession.insert("UserDAO.insertUserAddressList", user);
	}
	public void updateUser(UserVO user) {
		sqlSession.update("UserDAO.updateUser", user);
	}
	public UserDetailsVO getUserStatus(String userId) {
		return sqlSession.selectOne("UserDAO.getUserStatus",userId);
	}
	public String idFind(UserVO user) {
		return sqlSession.selectOne("UserDAO.idFind", user);
	}
	public String pwFind(UserVO user) {
		return sqlSession.selectOne("UserDAO.pwFind",user);
	}
	public EmailSendVO getSendEmailKey() {
		return sqlSession.selectOne("UserDAO.getSendEmailKey");
	}
	public void newPw(UserVO user) {
		sqlSession.update("UserDAO.newPw", user);
	}
}
