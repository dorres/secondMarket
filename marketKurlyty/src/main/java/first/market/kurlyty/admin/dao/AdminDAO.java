package first.market.kurlyty.admin.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.admin.vo.AdminNoticeVO;
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
	
	public List<AdminVO> getAdminList(AdminVO admin){
		return sqlSession.selectList("AdminDAO.getAdminList", admin);
	}
	
	public List<AdminUserVO> getUserList(AdminUserVO adminUser){
		return sqlSession.selectList("AdminDAO.getUserlist", adminUser);
	}

	//매니저 수정
	public int updateManager(AdminVO admin) {
		return sqlSession.update("AdminDAO.update", admin);
	}
	//매니저 삭제
	public int deleteManager(AdminVO admin) {
		return sqlSession.delete("AdminDAO.delete", admin);
	}
	
	//유저 삭제
	public int deleteUser(AdminUserVO user) {
		return sqlSession.delete("")
	}
	
	public List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice){
		return sqlSession.selectList("AdminDAO.getNoticeList",notice);
	}
	
	public AdminNoticeVO getNotice(AdminNoticeVO notice) {
		return sqlSession.selectOne("AdminDAO.getNotice",notice);
	}
	
	public int updateNotice(AdminNoticeVO notice) {
		return sqlSession.update("AdminDAO.updateNotice",notice);
	}
	
	public int deleteNotice(AdminNoticeVO notice){
		return sqlSession.delete("AdminDAO.deleteNotice",notice);
	}
	
	public int insertNotice(AdminNoticeVO notice) {
		return sqlSession.insert("AdminDAO.insertNotice",notice);

	}
}
