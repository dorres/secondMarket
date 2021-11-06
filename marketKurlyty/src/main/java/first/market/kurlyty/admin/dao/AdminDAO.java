package first.market.kurlyty.admin.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

<<<<<<< HEAD
=======
import first.market.kurlyty.admin.vo.AdminFAQVO;
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
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
<<<<<<< HEAD
	
=======
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
	//�������� ���	
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
	public List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice){
		return sqlSession.selectList("AdminDAO.getNoticeList",notice);
	}
	
<<<<<<< HEAD
	public AdminNoticeVO getNotice(AdminNoticeVO notice) {
		return sqlSession.selectOne("AdminDAO.getNotice",notice);
	}
	
=======
	//�������� ���λ���
	public AdminNoticeVO getNotice(AdminNoticeVO notice) {
		return sqlSession.selectOne("AdminDAO.getNotice",notice);
	}
	//�������� ����
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
	public int updateNotice(AdminNoticeVO notice) {
		return sqlSession.update("AdminDAO.updateNotice",notice);
	}
	
<<<<<<< HEAD
=======
	//�������� ����
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
	public int deleteNotice(AdminNoticeVO notice){
		return sqlSession.delete("AdminDAO.deleteNotice",notice);
	}
	
<<<<<<< HEAD
	public int insertNotice(AdminNoticeVO notice) {
		return sqlSession.insert("AdminDAO.insertNotice",notice);
	}
=======
	//�������� ���
	public int insertNotice(AdminNoticeVO notice) {
		return sqlSession.insert("AdminDAO.insertNotice",notice);
	}
	
	//-------------------------------------------------------------------
	//�����ϴ����� ���
	public List<AdminFAQVO> getFAQList(AdminFAQVO faq){
		return sqlSession.selectList("AdminDAO.getFAQList",faq);
	}
	
	//�����ϴ����� ���� ����
	public AdminFAQVO getFAQ(AdminFAQVO faq) {
		return sqlSession.selectOne("AdminDAO.getFAQ",faq);
	}
	
	//�����ϴ����� ����
	public int updateFAQ(AdminFAQVO faq) {
		return sqlSession.update("AdminDAO.updateFAQ",faq);
	}
	
	//�����ϴ����� ����
	public int deleteFAQ(AdminFAQVO faq){
		return sqlSession.delete("AdminDAO.deleteFAQ",faq);
	}
	
	//�����ϴ����� ���
	public int insertFAQ(AdminFAQVO faq) {
		return sqlSession.insert("AdminDAO.insertFAQ",faq);
	}
	
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
}
