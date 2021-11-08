package first.market.kurlyty.admin.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.admin.vo.AdminFAQVO;
import first.market.kurlyty.admin.vo.AdminNoticeVO;
import first.market.kurlyty.admin.vo.AdminQnaVO;
import first.market.kurlyty.admin.vo.AdminTermsAgreementVO;
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
	//회원 수정 출력
	public AdminUserVO getUser(AdminUserVO user) {
		return sqlSession.selectOne("AdminDAO.getUser", user);
	}
	public int updateUser1(AdminUserVO user) {
		return sqlSession.update("AdminDAO.getUser1", user);
	}
	public int updateUser2(AdminUserVO user) {
		return sqlSession.update("AdminDAO.getUser2", user);
	}
//
	public int updateManager(AdminVO admin) {
		return sqlSession.update("AdminDAO.update", admin);
	}
	public int deleteManager(AdminVO admin) {
		return sqlSession.delete("AdminDAO.delete", admin);
	}
	//유저 수정
	public int updateUser(AdminUserVO user) {
		return sqlSession.update("AdminDAO.updateUser", user);
	}
	//유저 삭제
	public int deleteUser(AdminUserVO user) {
		return sqlSession.delete("AdminDAO.deleteUser", user);
	}
	//약관관리
	public List<AdminTermsAgreementVO> getTermsAgree(AdminTermsAgreementVO agree){
		return sqlSession.selectList("AdminDAO.getTermsAgree");
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
	
	//-------------------------------------------------------------------
	//1:1문의 답변 대기	리스트
	public List<AdminQnaVO> getPersonalQnaWaitList(){
		return sqlSession.selectList("AdminDAO.getPersonalQnaWaitList");
	}
	
	//1:1문의 답변 대기 세부사항
	public AdminQnaVO getPersonalQnaWait(AdminQnaVO qna){
		return sqlSession.selectOne("AdminDAO.getPersonalQnaWait", qna);
	}
	
	//1:1문의 답변 등록
	public int updateQnaWait(AdminQnaVO qna){
		return sqlSession.update("AdminDAO.updateQnaWait", qna);
	}
	
	//1:1문의 답변 삭제
	public int deleteQnaWait(AdminQnaVO qna){
		return sqlSession.delete("AdminDAO.deleteQnaWait", qna);
	}
	
	//================================================================
	// 1:1문의 답변 완료 리스트
	public List<AdminQnaVO> getPersonalQnaFinishList(){
		return sqlSession.selectList("AdminDAO.getPersonalQnaFinishList");
	}
	
	//1:1문의 답변 완료 세부사항
	public AdminQnaVO getPersonalQnaFinish(AdminQnaVO qna){
		return sqlSession.selectOne("AdminDAO.getPersonalQnaFinish", qna);
	}
	
	//1:1문의 답변 완료 수정
	public int updateQnaFinish(AdminQnaVO qna){
		return sqlSession.update("AdminDAO.updateQnaFinish", qna);
	}
	
	//1:1문의 답변 삭제
	public int deleteQnaFinish(AdminQnaVO qna){
		return sqlSession.delete("AdminDAO.deleteQnaFinish", qna);
	}
}
