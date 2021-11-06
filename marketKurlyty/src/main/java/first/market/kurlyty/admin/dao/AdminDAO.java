package first.market.kurlyty.admin.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.admin.vo.AdminFAQVO;
import first.market.kurlyty.admin.vo.AdminNoticeVO;
import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;

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
//	public AdminUserVO getUser(AdminUserVO adminUserVO) {
//		return sqlSession.selectOne("AdminDAO.getUserList", adminUserVO);
//	}

	public int updateManager(AdminVO admin) {
		return sqlSession.update("AdminDAO.update", admin);
	}
	public int deleteManager(AdminVO admin) {
		return sqlSession.delete("AdminDAO.delete", admin);
	}
	
	public int updateUser1(AdminUserVO user) {
		return sqlSession.delete("AdminDAO.updateUser1", user);
	}
	public int updateUser2(AdminUserVO user) {
		return sqlSession.delete("AdminDAO.updateUser2", user);
	}
	
	//---------------------------------------------------------------
	//공지사항 목록	
	public List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice){
		return sqlSession.selectList("AdminDAO.getNoticeList",notice);
	}
	
	//공지사항 세부사항
	public AdminNoticeVO getNotice(AdminNoticeVO notice) {
		return sqlSession.selectOne("AdminDAO.getNotice",notice);
	}
	//공지사항 수정
	public int updateNotice(AdminNoticeVO notice) {
		return sqlSession.update("AdminDAO.updateNotice",notice);
	}
	
	//공지사항 삭제
	public int deleteNotice(AdminNoticeVO notice){
		return sqlSession.delete("AdminDAO.deleteNotice",notice);
	}
	
	//공지사항 등록
	public int insertNotice(AdminNoticeVO notice) {
		return sqlSession.insert("AdminDAO.insertNotice",notice);
	}
	
	//-------------------------------------------------------------------
	//자주하는질문 목록
	public List<AdminFAQVO> getFAQList(AdminFAQVO faq){
		return sqlSession.selectList("AdminDAO.getFAQList",faq);
	}
	
	//자주하는질문 세부 사항
	public AdminFAQVO getFAQ(AdminFAQVO faq) {
		return sqlSession.selectOne("AdminDAO.getFAQ",faq);
	}
	
	//자주하는질문 수정
	public int updateFAQ(AdminFAQVO faq) {
		return sqlSession.update("AdminDAO.updateFAQ",faq);
	}
	
	//자주하는질문 삭제
	public int deleteFAQ(AdminFAQVO faq){
		return sqlSession.delete("AdminDAO.deleteFAQ",faq);
	}
	
	//자주하는질문 등록
	public int insertFAQ(AdminFAQVO faq) {
		return sqlSession.insert("AdminDAO.insertFAQ",faq);
	}
	
}
