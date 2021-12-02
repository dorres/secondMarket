package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.dao.AdminDAO;
import first.market.kurlyty.admin.vo.AdminBannerVO;
import first.market.kurlyty.admin.vo.AdminBestGoodsVO;
import first.market.kurlyty.admin.vo.AdminCategoryGoodsVO;
import first.market.kurlyty.admin.vo.AdminCategoryMainVO;
import first.market.kurlyty.admin.vo.AdminCategorySubVO;
import first.market.kurlyty.admin.vo.AdminCouponVO;
import first.market.kurlyty.admin.vo.AdminFAQVO;
import first.market.kurlyty.admin.vo.AdminMemberChartVO;
import first.market.kurlyty.admin.vo.AdminMembershipVO;
import first.market.kurlyty.admin.vo.AdminNoticeVO;
import first.market.kurlyty.admin.vo.AdminOrderVO;
import first.market.kurlyty.admin.vo.AdminQnaVO;
import first.market.kurlyty.admin.vo.AdminRegistVO;
import first.market.kurlyty.admin.vo.AdminShippingInfoVO;
import first.market.kurlyty.admin.vo.AdminReviewVO;
import first.market.kurlyty.admin.vo.AdminSales2VO;
import first.market.kurlyty.admin.vo.AdminSalesVO;
import first.market.kurlyty.admin.vo.AdminStockStockVO;
import first.market.kurlyty.admin.vo.AdminStockVO;
import first.market.kurlyty.admin.vo.AdminTermsAgreementVO;
import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;
import first.market.kurlyty.admin.vo.GoodsQnaVO;

@Repository
@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDao;
	
	@Override
	public boolean idCheck(AdminVO admin) {
		AdminVO adminData = adminDao.getAdmin(admin);
		if(adminData ==null)
			return true;
		else
			return false;
	}

	@Override
	public int joinProc(AdminVO admin) {
		int success = 0;
		success = adminDao.insertAdmin(admin);
		return success;
	}
	
	
	@Override
	public AdminVO loginGetUser(AdminVO admin) {
		return adminDao.getAdmin(admin);
	}
	

	@Override
	public List<AdminVO> adminList(AdminVO admin){
		return  adminDao.getAdminList(admin);
	}
	

	@Override
	public List<AdminUserVO> userList(AdminUserVO adminUser){
		return  adminDao.getUserList(adminUser);
	}
	

	@Override
	public void logout(SessionStatus sessionStatus){
		sessionStatus.setComplete();
	}

	@Override
	public int updateManager(AdminVO admin) {
		return adminDao.updateManager(admin);
	}
	
	@Override
	public int deleteManager(AdminVO admin) {
		return adminDao.deleteManager(admin);
	}
	
	@Override
	//회원 수정 출력
	public AdminUserVO getUser(AdminUserVO user) {
		return adminDao.getUser(user);
	}
	//회원 수정
	@Override
	public int updateUser(AdminUserVO user) {
		return adminDao.updateUser(user);
	}
	
	//회원 삭제
	@Override
	public int deleteUser(AdminUserVO user) {
		return adminDao.deleteUser(user);
	}
	//약관관리 리스트
	@Override
	public List<AdminTermsAgreementVO> getTermsAgree(AdminTermsAgreementVO agree){
		return adminDao.getTermsAgreeList(agree);
	}
	//약관 등록
	@Override
	public int insertTerms(AdminTermsAgreementVO agree) {
		return adminDao.insertTerms(agree);
	}
	
	//약관 수정
	@Override
	public int updateTerms(AdminTermsAgreementVO agree) {
		return adminDao.updateTerms(agree);
	}
	
	//약관 정보
	@Override
	public AdminTermsAgreementVO getTerms(AdminTermsAgreementVO agree) {
		return adminDao.getTerms(agree);
	}
	
	//약관 삭제
	@Override
	public int deleteTerms(AdminTermsAgreementVO agree) {
		return adminDao.deleteTerms(agree);
	}
	
//	//상품 등록
//	@Override
//	public int inserGoods(AdminRegistVO regist) {
//		return adminDao.insertGoods(regist);
//	}
	
	//상품조회리스트
	@Override
	public List<AdminRegistVO> goodsList(){
		return adminDao.goodsList();
	}
	//상품 수정..
	@Override
	public int updateGoods(AdminStockStockVO stockstock) {
		return adminDao.updateGoods(stockstock);
	}
	@Override
	public List<AdminStockStockVO> getCategory3Names(List<Integer> goodsList) {
		return adminDao.getCategory3Names(goodsList);
	}
	@Override
	public int insertStock(AdminStockVO stock) {
		return adminDao.insertStock(stock);
	}
	@Override
	public int updateStockQuantity(AdminStockVO stock) {
		return adminDao.updateStockQuantity(stock);
	}
	//입고 조회
	@Override
	public List<AdminStockVO> getStockList(AdminStockVO stock) {
		return adminDao.getStockList(stock);
	}
	
	
//	//상품조회
//	@Override
//	public AdminRegistVO getGoods(AdminRegistVO regist) {
//		return adminDao.getGoods(regist);
//	}
//	
//	//상품 삭제
//	@Override
//	public int deleteGoods(AdminRegistVO regist) {
//		return adminDao.deleteGoods(regist);
//	}

//	//재고 조회
//	public AdminStockVO getStock(AdminStockVO stock) {
//		return adminDao.getStock(stock);
//	}
	

//	
//	//입고 수정
//	@Override
//	public int updateStock (AdminStockVO stock) {
//		return adminDao.updateStock(stock);
//	}
//	
//	//재고 합계
//	@Override
//	public AdminStockVO sumStock(AdminStockVO stock) {
//		return adminDao.sumStock(stock);
//	}
//	
//	//판매 등록
//	@Override
//	public AdminStockVO getStock(int serial) {
//		return adminDao.getStock(serial);
//	}
//	

//	
//	// 리스트에 재고 출력
//	@Override
//	public int stockstock(AdminStockStockVO stockstock) {
//		return adminDao.stockstock(stockstock);
//	}
	//----------------------------------------------------------------
	// 상품문의 리스트 (답변대기)
	@Override
	public List<GoodsQnaVO> gqnaList(GoodsQnaVO gqna){
		return adminDao.gqnaList(gqna);
	}
	
	// 상품문의 리스트 삭제(답변대기)
	@Override 
	public int deleteGqna(GoodsQnaVO gqna) {
		return adminDao.deleteGqna(gqna);
	}
	
	//상품문의 답변 전 
	@Override
	public GoodsQnaVO gqnaOne(GoodsQnaVO gqna) {
		return adminDao.gqnaOne(gqna);
	}
	
	//상품 답변
	public int updateGqna(GoodsQnaVO gqna) {
		return adminDao.updateGqna(gqna);
	}
	
	// 상품문의 리스트 (답변완료)
	@Override
	public List<GoodsQnaVO> gqnaListSuc(GoodsQnaVO gqna){
		return adminDao.gqnaListSuc(gqna);
	}
	
	//상품 답변 수정
	@Override
	public int updateGqnaSuc(GoodsQnaVO gqna) {
		return adminDao.updateGqna(gqna);
		}
	
	//상품문의 카운트
	@Override
	public GoodsQnaVO gqnaCount(GoodsQnaVO gqna) {
		return adminDao.gqnaCount(gqna);
	}
	//----------------------------------------------------------------
	
	//베스트 상품
	@Override
	public List<AdminBestGoodsVO> bestList(AdminBestGoodsVO best){
		return adminDao.bestList(best);
	}
	//----------------------------------------------------------------
	//매출차트 일별
	@Override
	public List<AdminSalesVO> getDate(AdminSalesVO sales){
		return adminDao.getDate(sales);
	}
	
	//매출 차트 월별
	@Override
	public List<AdminSales2VO> getMonth(AdminSales2VO sales){
		return adminDao.getMonth(sales);
	}
	
	//멤버등급 차트
	@Override
	public List<AdminMemberChartVO> getMemChart(AdminMemberChartVO memch){
		return adminDao.getMemChart(memch);
	}
	//----------------------------------------------------------------
	
	//리뷰있는 상품
	@Override
	public List<AdminReviewVO> getReviewGoodsName(AdminReviewVO review){
		return adminDao.getReviewGoodsName(review);
	}
	
	//리뷰 삭제
	@Override
	public int deleteReview(AdminReviewVO review) {
		return adminDao.deleteReview(review);
	}
	
	//리뷰내용
	@Override
	public AdminReviewVO getReviewContent(AdminReviewVO review) {
		return adminDao.getReviewContent(review);
	}
	
	//베스트 리뷰
	@Override
	public int updateReview(AdminReviewVO review) {
		return adminDao.updateReview(review);
	}
	//----------------------------------------------------------------
	//관리자-공지사항리스트
	@Override
	public List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice) {
		return adminDao.getNoticeList(notice);
	}
	//관리자-공지사항 세부사항
	@Override
	public AdminNoticeVO getNotice(AdminNoticeVO notice) {
		return adminDao.getNotice(notice);
	}
	//관리자-공지사항수정하기
	public int updateNotice(AdminNoticeVO notice) {
		return adminDao.updateNotice(notice);
	}
	//관리자-공지사항삭제하기
	@Override
	public int deleteNotice(AdminNoticeVO notice) {
		return adminDao.deleteNotice(notice);
	}
	//관리자 -공지사항등록하기
	@Override
	public int insertNotice(AdminNoticeVO notice) {
		return adminDao.insertNotice(notice);
	}
	//---------------------------------------------------------------
	//관리자  -자주하는 질문 리스트
	@Override
	public List<AdminFAQVO> getFAQList(AdminFAQVO faq) {
		return adminDao.getFAQList(faq);
	}
	
	//관리자-자주하는질문 세부사항
	@Override
	public AdminFAQVO getFAQ(AdminFAQVO faq) {
		return adminDao.getFAQ(faq);
	}
	
	//관리자-자주하는 질문 수정
	@Override
	public int updateFAQ(AdminFAQVO faq) {
		return adminDao.updateFAQ(faq);
	}
	
	//관리자-자주하는 질문 삭제
	@Override
	public int deleteFAQ(AdminFAQVO faq) {
		return adminDao.deleteFAQ(faq);
	}
	
	//관리자-자주하는 질문 등록
	@Override
	public int insertFAQ(AdminFAQVO faq) {
		return adminDao.insertFAQ(faq);
	}
	//-------------------------------------------------------------
	//관리자 -1:1 문의 답변 대기 리스트
	@Override
	public List<AdminQnaVO> getPersonalQnaWaitList() {
		return adminDao.getPersonalQnaWaitList();
	}
	
	//관리자 - 1:1 문의 답변 대기 세부사항
	@Override
	public AdminQnaVO getPersonalQnaWait(AdminQnaVO qna) {
		return adminDao.getPersonalQnaWait(qna);
	}
	
	//관리자 - 1:1 문의 답변 등록 
	@Override
	public int updateQnaWait(AdminQnaVO qna) {
		return adminDao.updateQnaWait(qna);
	}
	
	//관리자 - 1:1 문의 답변 대기 삭제
	@Override
	public int deleteQnaWait(AdminQnaVO qna) {
		return adminDao.deleteQnaWait(qna);
	}
	
	//==============================================================
	//관리자  -1:1문의 답변 완료 리스트
	@Override
	public List<AdminQnaVO> getPersonalQnaFinishList() {
		return adminDao.getPersonalQnaFinishList();
	}
	
	@Override
	public AdminQnaVO getPersonalQnaFinish(AdminQnaVO qna) {
		return adminDao.getPersonalQnaFinish(qna);
	}

	@Override
	public int updateQnaFinish(AdminQnaVO qna) {
		return adminDao.updateQnaFinish(qna);
	}

	@Override
	public int deleteQnaFinish(AdminQnaVO qna) {
		return adminDao.deleteQnaFinish(qna);
	}

	//============================================================
	//관리자 배너 등록
	@Override
	public int insertBanner(AdminBannerVO banner) {
		return adminDao.insertBanner(banner);
	}
	//관리자 배너 리스트
	@Override
	public List<AdminBannerVO> getBannerList() {
		return adminDao.getBannerList();
	}
	//관리자 배너 상세페이지
	@Override
	public AdminBannerVO getBanner(AdminBannerVO banner) {
		return adminDao.getBanner(banner);
	}

	@Override
	public int updateBanner1(AdminBannerVO banner) {
		return adminDao.updateBanner1(banner);
	}
	
	@Override
	public int updateBanner2(AdminBannerVO banner) {
		return adminDao.updateBanner2(banner);
	}

	@Override
	public int deleteBanner(AdminBannerVO banner) {
		return adminDao.deleteBanner(banner);
	}
	
	//===========================================================
	//관리자 1차 카테고리 
	@Override
	public List<AdminCategoryMainVO> getCategory1List() {
		return adminDao.getCategory1List();
	}

	@Override
	public int insertCategory1(AdminCategoryMainVO category1) {
		return adminDao.insertCategory1(category1);
	}

	@Override
	public String getCategory1Column() {
		return adminDao.getCategory1Column();
	}

	@Override
	public int deleteCategory1(AdminCategoryMainVO category1) {
		return adminDao.deleteCategory1(category1);
	}

	@Override
	public AdminCategoryMainVO getCategory1(AdminCategoryMainVO category1) {
		return adminDao.getCategory1(category1);
	}
	@Override
	public int updateCategory1(AdminCategoryMainVO category1) {
		return adminDao.updateCategory1(category1);
	}
	
	//-------------------------------------------------------------
	//관리자 2차 카테고리
	@Override
	public List<AdminCategorySubVO> getCategory2List() {
		return adminDao.getCategory2List();
	}

	@Override
	public int insertCategory2(AdminCategorySubVO category2) {
		return adminDao.insertCategory2(category2);
	}

	@Override
	public String getCategory2Column() {
		return adminDao.getCategory2Column();
	}

	@Override
	public AdminCategorySubVO getCategory2(AdminCategorySubVO category2) {
		return adminDao.getCategory2(category2);
	}
	
	@Override
	public int updateCategory2(AdminCategorySubVO category2) {
		return adminDao.updateCategory2(category2);
	}
	
	@Override
	public int deleteCategory2(AdminCategorySubVO category2) {
		return adminDao.deleteCategory2(category2);
	}
	//--------------------------------------------------------------

	@Override
	public List<AdminCategoryGoodsVO> getCategory3List() {
		return adminDao.getCategory3List();
	}
	@Override
	public List<AdminCategorySubVO> getCategoryType(AdminCategoryGoodsVO category3) {
		return adminDao.getCategoryType(category3);
	}
	@Override
	public int insertCategory3(AdminCategoryGoodsVO category3) {
		return adminDao.insertCategory3(category3);
	}
	@Override
	public AdminCategoryGoodsVO getCategory3(AdminCategoryGoodsVO category3) {
		return adminDao.getCategory3(category3);
	}

	@Override
	public int deleteCategory3(AdminCategoryGoodsVO category3) {
		return adminDao.deleteCategory3(category3);
	}
	@Override
	public int updateCategory3(AdminCategoryGoodsVO category3) {
		return adminDao.updateCategory3(category3);
	}
	@Override
	public List<AdminCategorySubVO> getCategory2Name() {
		return adminDao.getCategory2Name();
	}

	@Override
	public int insertCategory3Detail(AdminCategoryGoodsVO category3) {
		return adminDao.insertCategory3Detail(category3);
	}
	//================================================================
	// 맴버쉽 리스트
	@Override
	public List<AdminMembershipVO> getMembershipList() {
		return adminDao.getMembershipList();
	}
	@Override
	public AdminMembershipVO getMembership(AdminMembershipVO membership) {
		return adminDao.getMembership(membership);
	}
	@Override
	public int updateMembership(AdminMembershipVO membership) {
		return adminDao.updateMembership(membership);
	}
	@Override
	public int insertMembership(AdminMembershipVO membership) {
		return adminDao.insertMembership(membership);
	}
	@Override
	public int deleteMembership(AdminMembershipVO membership) {
		return adminDao.deleteMembership(membership);
	}
	//=====================================================
	@Override
	public List<AdminOrderVO> getOrderWaitList() {
		return adminDao.getOrderWaitList();
	}
	@Override
	public AdminOrderVO getOrderWait(AdminOrderVO order) {
		return adminDao.getOrderWait(order);
	}
	@Override
	public AdminShippingInfoVO getShippingInfo(AdminOrderVO order) {
		return adminDao.getShippingInfo(order);
	}
	@Override
	public List<AdminOrderVO> getOrderWaitDetail(AdminOrderVO order) {
		return adminDao.getOrderWaitDetail(order);
	}

	@Override
	public int updateShippingInfo(AdminShippingInfoVO shipping) {
		return adminDao.updateShippingInfo(shipping);
	}
	@Override
	public int updateOrderWait(AdminOrderVO order) {
		return adminDao.updateOrderWait(order);
	}
	@Override
	public int updateOrderWait1(List<String> merchantList) {
		return adminDao.updateOrderWait1(merchantList);
	}
	
	@Override
	public List<AdminShippingInfoVO> getShippingInfoList(List<String> merchantList) {
		return adminDao.getShippingInfoList(merchantList);
	}
	@Override
	public int updateStatus(List<String> merchantList) {
		return adminDao.updateStatus(merchantList);
	}

	@Override
	public List<AdminOrderVO> getOrderDeliveryList() {
		return adminDao.getOrderDeliveryList();
	}
	@Override
	public List<AdminOrderVO> getOrderFinishList() {
		return adminDao.getOrderFinishList();
	}
	
	//카운트
	@Override
	public AdminOrderVO orderCount(AdminOrderVO order) {
		return adminDao.orderCount(order);
	}
	//======================================================================
	//환불관리
	@Override
	public List<AdminOrderVO> getOrderRefundList() {
		return adminDao.getOrderRefundList();
	}
	@Override
	public int updateRefundWait(AdminQnaVO qna) {
		return adminDao.updateRefundWait(qna);
	}
	//반품관리
	@Override
	public List<AdminOrderVO> getOrderReturnList() {
		return adminDao.getOrderReturnList();
	}
	@Override
	public int updateReturnWait(AdminQnaVO qna) {
		return adminDao.updateReturnWait(qna);
	}
	//취소관리
	@Override
	public List<AdminOrderVO> getOrderCancleList() {
		return adminDao.getOrderCancleList();
	}
	@Override
	public int updateCancleWait(AdminQnaVO qna) {
		return adminDao.updateCancleWait(qna);
	}
	//======================================================
	//쿠폰 종류 등록
	@Override
	public List<AdminCouponVO> getCouponList() {
		return 	adminDao.getCouponList();
	}
	@Override
	public AdminCouponVO getCoupon(AdminCouponVO coupon) {
		return adminDao.getCoupon(coupon);
	}
	
	@Override
	public int updateCoupon(AdminCouponVO coupon) {
		return adminDao.updateCoupon(coupon);
	}
	@Override
	public int insertCoupon(AdminCouponVO coupon) {
		return adminDao.insertCoupon(coupon);
	}
	@Override
	public int deleteCoupon(AdminCouponVO coupon) {
		return adminDao.deleteCoupon(coupon);
	}
	//====================================================
	//쿠폰 사용현황
	@Override
	public List<AdminCouponVO> getCouponUseList() {
		return 	adminDao.getCouponUseList();
	}
	@Override
	public AdminCouponVO getCouponUse(AdminCouponVO coupon) {
		return adminDao.getCouponUse(coupon);
	}
	
	@Override
	public int insertCouponUse(AdminCouponVO coupon) {
		return adminDao.insertCouponUse(coupon);
	}
	@Override
	public int deleteCouponUse(AdminCouponVO coupon) {
		return adminDao.deleteCouponUse(coupon);
	}
	@Override
	public List<AdminCouponVO> getUserId(AdminCouponVO coupon) {
		return adminDao.getUserId(coupon);
	}
	
	

}
	
	
	
