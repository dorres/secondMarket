package first.market.kurlyty.admin.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.admin.vo.AdminBannerVO;
import first.market.kurlyty.admin.vo.AdminCategoryGoodsVO;
import first.market.kurlyty.admin.vo.AdminCategoryMainVO;
import first.market.kurlyty.admin.vo.AdminCategorySubVO;
import first.market.kurlyty.admin.vo.AdminFAQVO;
import first.market.kurlyty.admin.vo.AdminGoodsStockVO;
import first.market.kurlyty.admin.vo.AdminNoticeVO;
import first.market.kurlyty.admin.vo.AdminQnaVO;
import first.market.kurlyty.admin.vo.AdminRegistVO;
import first.market.kurlyty.admin.vo.AdminStockVO;
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
	//약관관리 리스트
	public List<AdminTermsAgreementVO> getTermsAgreeList(AdminTermsAgreementVO agree){
		return sqlSession.selectList("AdminDAO.getTermsAgreeList", agree);
	}
	// 약관 등록
	public int insertTerms(AdminTermsAgreementVO agree) {
		return sqlSession.insert("AdminDAO.insertTerms", agree);
	}

	//약관 수정
	public int updateTerms(AdminTermsAgreementVO agree) {
		return sqlSession.update("AdminDAO.updateTerms", agree);
	}
	
	//약관 정보
	public AdminTermsAgreementVO getTerms(AdminTermsAgreementVO agree) {
		return sqlSession.selectOne("AdminDAO.getTerms", agree);
	}
	
	//약관 삭제
	public int deleteTerms(AdminTermsAgreementVO agree) {
		return sqlSession.delete("AdminDAO.deleteTerms", agree);
	}
	
	//상품등록
	public int insertGoods(AdminRegistVO regist) {
		return sqlSession.insert("RegistDAO.insertRegist", regist);
	}
	
	//상품조회리스트
	public List<AdminRegistVO> goodsList(AdminRegistVO regist){
		return sqlSession.selectList("RegistDAO.getGoodsList", regist);
	}
	
	//상품 조회
	public AdminRegistVO getGoods(AdminRegistVO regist) {
		return sqlSession.selectOne("RegistDAO.getGoods", regist);
	}
	
	//상품 수정
	public int updateGoods(AdminRegistVO regist) {
		return sqlSession.update("RegistDAO.updateGoods", regist);
	}
	
	//상품 삭제
	public int deleteGoods(AdminRegistVO regist) {
		return sqlSession.delete("RegistDAO.deleteGoods", regist);
	}
	
	//입고 조회
	public List<AdminStockVO> getStockList(AdminStockVO stock) {
		return sqlSession.selectList("RegistDAO.stockList", stock);
	}
	
	//입고 수정
	public int updateStock(AdminStockVO stock) {
		return sqlSession.update("RegistDAO.updateStock", stock);
	}
	
	//수량 합계
	public AdminStockVO sumStock(AdminStockVO stock) {
		return sqlSession.selectOne("RegistDAO.stockSum", stock);
	}
	
	//판매등록
	public AdminStockVO getStock(AdminStockVO stock) {
		return sqlSession.selectOne("RegistDAO.getStock", stock);
	}
	public int updatePrice(AdminRegistVO regist) {
		return sqlSession.update("RegistDAO.updatePrice", regist);
	}
	public int insertStock(AdminStockVO stock) {
		return sqlSession.insert("RegistDAO.insertStock", stock);
	}
	//================================================================

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
	
	//================================================================
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
	
	//================================================================
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
	//-------------------------------------------------------------------
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
	
	//==================================================================
	//관리자 배너등록
	public int insertBanner(AdminBannerVO banner) {
		return sqlSession.insert("AdminDAO.insertBanner",banner);
	}
	
	//관리자 배너리스트
	public List<AdminBannerVO> getBannerList(){
		return sqlSession.selectList("AdminDAO.getBannerList");
	}
	
	//관리자 배너세부사항
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
	//관리자 메인카테고리 리스트
	public List<AdminCategoryMainVO> getCategory1List(){
		return sqlSession.selectList("AdminDAO.getCategory1List");
	}
	
	public int insertCategory1(AdminCategoryMainVO category1) {
		return sqlSession.insert("AdminDAO.insertCategory1",category1);
	}
	
	public int getCategory1Column() {
		return sqlSession.selectOne("AdminDAO.getCategory1Column");
	}
	
	public int getIconBlack(String black) {
		return sqlSession.selectOne("AdminDAO.getIconBlack",black);
	}
	public int getIconColor(String color) {
		return sqlSession.selectOne("AdminDAO.getIconColor",color);
	}
	public int deleteCategory1(AdminCategoryMainVO category1) {
		return sqlSession.delete("AdminDAO.deleteCategory1",category1);
	}
	public AdminCategoryMainVO getCategory1(AdminCategoryMainVO category1) {
		return sqlSession.selectOne("AdminDAO.getCategory1",category1);
	}
	public int updateCategory1(AdminCategoryMainVO category1) {
		return sqlSession.update("AdminDAO.updateCategory1",category1);
	}
	//----------------------------------------------------------------
	//관리자 서브카테고리 리스트
	public List<AdminCategorySubVO> getCategory2List(){
		return sqlSession.selectList("AdminDAO.getCategory2List");
	}
	public int insertCategory2(AdminCategorySubVO category2) {
		return sqlSession.insert("AdminDAO.insertCategory2",category2);
	}
	public int getCategory2Column() {
		return sqlSession.selectOne("AdminDAO.getCategory2Column");
	}
	public AdminCategorySubVO getCategory2(AdminCategorySubVO category2) {
		return sqlSession.selectOne("AdminDAO.getCategory2",category2);
	}
	public int updateCategory2(AdminCategorySubVO category2) {
		return sqlSession.update("AdminDAO.updateCategory2",category2);
	}
	public int deleteCategory2(AdminCategorySubVO category2) {
		return sqlSession.delete("AdminDAO.deleteCategory2",category2);
	}
	//---------------------------------------------------------------------
	//관리자 상품카테고리 리스트
	public List<AdminCategoryGoodsVO> getCategory3List(){
		return sqlSession.selectList("AdminDAO.getCategory3List");
	}
	public List<AdminCategorySubVO> getCategoryType(AdminCategoryGoodsVO category3){
		return sqlSession.selectList("AdminDAO.getCategoryType",category3);
	}
	public int insertCategory3(AdminCategoryGoodsVO category3) {
		return sqlSession.insert("AdminDAO.insertCategory3",category3);
	}
	public AdminCategoryGoodsVO getCategory3(AdminCategoryGoodsVO category3) {
		return sqlSession.selectOne("AdminDAO.getCategory3",category3);
	}
	public int deleteCategory3(AdminCategoryGoodsVO category3) {
		return sqlSession.delete("AdminDAO.deleteCategory3",category3);
	}
	public int updateCategory3(AdminCategoryGoodsVO category3) {
		return sqlSession.update("AdminDAO.updateCategory3",category3);
	}
	public List<AdminCategorySubVO> getCategory2Name(){
		return sqlSession.selectList("AdminDAO.getCategory2Name");
	}
	public int insertCategory3Detail(AdminCategoryGoodsVO category3) {
		return sqlSession.insert("AdminDAO.insertCategory3Detail",category3);
	}
	
}
