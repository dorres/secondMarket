package first.market.kurlyty.admin.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.admin.vo.AdminBannerVO;
import first.market.kurlyty.admin.vo.AdminCategoryMainVO;
import first.market.kurlyty.admin.vo.AdminFAQVO;
import first.market.kurlyty.admin.vo.AdminNoticeVO;
import first.market.kurlyty.admin.vo.AdminQnaVO;
import first.market.kurlyty.admin.vo.AdminRegistVO;
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
	//ȸ�� ���� ���
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
	//���� ����
	public int updateUser(AdminUserVO user) {
		return sqlSession.update("AdminDAO.updateUser", user);
	}
	//���� ����
	public int deleteUser(AdminUserVO user) {
		return sqlSession.delete("AdminDAO.deleteUser", user);
	}
	//������� ����Ʈ
	public List<AdminTermsAgreementVO> getTermsAgreeList(AdminTermsAgreementVO agree){
		return sqlSession.selectList("AdminDAO.getTermsAgreeList", agree);
	}
	// ��� ���
	public int insertTerms(AdminTermsAgreementVO agree) {
		return sqlSession.insert("AdminDAO.insertTerms", agree);
	}

	//��� ����
	public int updateTerms(AdminTermsAgreementVO agree) {
		return sqlSession.update("AdminDAO.updateTerms", agree);
	}
	
	//��� ����
	public AdminTermsAgreementVO getTerms(AdminTermsAgreementVO agree) {
		return sqlSession.selectOne("AdminDAO.getTerms", agree);
	}
	
	//��� ����
	public int deleteTerms(AdminTermsAgreementVO agree) {
		return sqlSession.delete("AdminDAO.deleteTerms", agree);
	}
	
	//��ǰ���
	public int insertGoods(AdminRegistVO regist) {
		return sqlSession.insert("RegistDAO.insertRegist", regist);
	}
	
	//��ǰ��ȸ����Ʈ
	public List<AdminRegistVO> getGoods(AdminRegistVO regist) {
		return sqlSession.selectList("RegistDAO.getGoods", regist);
	}
	//================================================================

	//�������� ���	

	public List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice){
		return sqlSession.selectList("AdminDAO.getNoticeList",notice);
	}

	//�������� ���λ���
	public AdminNoticeVO getNotice(AdminNoticeVO notice) {
		return sqlSession.selectOne("AdminDAO.getNotice",notice);
	}
	//�������� ����
	public int updateNotice(AdminNoticeVO notice) {
		return sqlSession.update("AdminDAO.updateNotice",notice);
	}
	
	//�������� ����
	public int deleteNotice(AdminNoticeVO notice){
		return sqlSession.delete("AdminDAO.deleteNotice",notice);
	}
	
	//�������� ���
	public int insertNotice(AdminNoticeVO notice) {
		return sqlSession.insert("AdminDAO.insertNotice",notice);
	}
	
	//================================================================
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
	
	//================================================================
	//1:1���� �亯 ���	����Ʈ
	public List<AdminQnaVO> getPersonalQnaWaitList(){
		return sqlSession.selectList("AdminDAO.getPersonalQnaWaitList");
	}
	
	//1:1���� �亯 ��� ���λ���
	public AdminQnaVO getPersonalQnaWait(AdminQnaVO qna){
		return sqlSession.selectOne("AdminDAO.getPersonalQnaWait", qna);
	}
	
	//1:1���� �亯 ���
	public int updateQnaWait(AdminQnaVO qna){
		return sqlSession.update("AdminDAO.updateQnaWait", qna);
	}
	
	//1:1���� �亯 ����
	public int deleteQnaWait(AdminQnaVO qna){
		return sqlSession.delete("AdminDAO.deleteQnaWait", qna);
	}
	//-------------------------------------------------------------------
	// 1:1���� �亯 �Ϸ� ����Ʈ
	public List<AdminQnaVO> getPersonalQnaFinishList(){
		return sqlSession.selectList("AdminDAO.getPersonalQnaFinishList");
	}
	
	//1:1���� �亯 �Ϸ� ���λ���
	public AdminQnaVO getPersonalQnaFinish(AdminQnaVO qna){
		return sqlSession.selectOne("AdminDAO.getPersonalQnaFinish", qna);
	}
	
	//1:1���� �亯 �Ϸ� ����
	public int updateQnaFinish(AdminQnaVO qna){
		return sqlSession.update("AdminDAO.updateQnaFinish", qna);
	}
	
	//1:1���� �亯 ����
	public int deleteQnaFinish(AdminQnaVO qna){
		return sqlSession.delete("AdminDAO.deleteQnaFinish", qna);
	}
	
	//==================================================================
	//������ ��ʵ��
	public int insertBanner(AdminBannerVO banner) {
		return sqlSession.insert("AdminDAO.insertBanner",banner);
	}
	
	//������ ��ʸ���Ʈ
	public List<AdminBannerVO> getBannerList(){
		return sqlSession.selectList("AdminDAO.getBannerList");
	}
	
	//������ ��ʼ��λ���
	public AdminBannerVO getBanner(AdminBannerVO banner) {
		return sqlSession.selectOne("AdminDAO.getBanner",banner);
	}
	
	public int updateBanner1(AdminBannerVO banner) {
		return sqlSession.update("AdminDAO.updateBanner1",banner);
	}
	
	public int updateBanner2(AdminBannerVO banner) {
		return sqlSession.update("AdminDAO.updateBanner2",banner);
	}
	
	public int deleteBanner(AdminBannerVO banner) {
		return sqlSession.delete("AdminDAO.deleteBanner",banner);
	}
	
	//================================================================
	//������ ����ī�װ� ����Ʈ
	public List<AdminCategoryMainVO> getCategory1List(){
		return sqlSession.selectList("AdminDAO.getCategory1List");
	}
	
	public int insertCategory1(AdminCategoryMainVO category1) {
		return sqlSession.insert("AdminDAO.insertCategory1",category1);
	}
	
	public int getCategory1Column() {
		return sqlSession.selectOne("AdminDAO.getCategory1Column");
	}
	
	public int getIconBlack(AdminCategoryMainVO category1) {
		return sqlSession.selectOne("AdminDAO.getIconBlack",category1);
	}
	public int getIconColor(AdminCategoryMainVO category1) {
		return sqlSession.selectOne("AdminDAO.getIconColor",category1);
	}
	public int deleteCategory1(AdminCategoryMainVO category1) {
		return sqlSession.delete("AdminDAO.deleteCategory1",category1);
	}
	public AdminCategoryMainVO getCategory1(AdminCategoryMainVO category1) {
		return sqlSession.selectOne("AdminDAO.getCategory1",category1);
	}


	
}
