package first.market.kurlyty.admin.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;
import first.market.kurlyty.user.vo.UserVO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public AdminVO getAdmin(AdminVO admin) {
		return sqlSession.selectOne("AdminDAO.getAdmin",admin);
	}
	
	public int insertAdmin(AdminVO admin) {
		return sqlSession.insert("AdminDAO.insertAdmin", admin);
	}
	
	public List<AdminVO> memberAdmin(AdminVO admin){
		return sqlSession.selectList("AdminDAO.memberAdmin", admin);
	}
	public List<UserVO> userList(UserVO user){
		return sqlSession.selectList("AdminDAO.userList", user);
	}
	public List<AdminUserVO> adminuserList(AdminUserVO adminuser){
		return sqlSession.selectList("AdminDAO.adminuserlist", adminuser);
	}
}
