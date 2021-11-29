package first.market.kurlyty.admin.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<AdminRegistVO> goodsList(AdminRegistVO regist){
		return sqlSession.selectList("RegistDAO.getGoodsList", regist);
	}
	
	//��ǰ ��ȸ
	public AdminRegistVO getGoods(AdminRegistVO regist) {
		return sqlSession.selectOne("RegistDAO.getGoods", regist);
	}
	
	//��ǰ ����
	public int updateGoods(AdminRegistVO regist) {
		return sqlSession.update("RegistDAO.updateGoods", regist);
	}
	
	//��ǰ ����
	public int deleteGoods(AdminRegistVO regist) {
		return sqlSession.delete("RegistDAO.deleteGoods", regist);
	}
	
	//��� ��ȸ
	public AdminStockVO getStock(AdminStockVO stock) {
		return sqlSession.selectOne("RegistDAO.getStock", stock);
	}
	//�԰� ��ȸ
	public List<AdminStockVO> getStockList(AdminStockVO stock) {
		return sqlSession.selectList("RegistDAO.stockList", stock);
	}
	//�԰� ����
	public int updateStock(AdminStockVO stock) {
		return sqlSession.update("RegistDAO.updateStock", stock);
	}
	
	//���� �հ�
	public AdminStockVO sumStock(AdminStockVO stock) {
		return sqlSession.selectOne("RegistDAO.stockSum", stock);
	}
	//�Ǹŵ��
	public AdminStockVO getStock(int serial) {
		return sqlSession.selectOne("RegistDAO.getStock",  serial);
	}
	
	public int insertStock(AdminStockVO stock) {
		return sqlSession.insert("RegistDAO.insertStock",stock);
	}
	
	// ����Ʈ�� ��� ���
	public int stockstock(AdminStockStockVO stockstock) {
		return sqlSession.update("RegistDAO.stockstcok", stockstock);
	}
	//================================================================
	
	//���� ����Ʈ
	public List<AdminReviewVO> getReviewList(AdminReviewVO review){
		return sqlSession.selectList("adminReviewDAO.reviewList", review);
	}
	
	//���� ����
	public int deleteReview(AdminReviewVO review) {
		return sqlSession.delete("adminReviewDAO.deleteReview", review);
	}
	//===============================================================
	
	//��ǰ���� ����Ʈ(�亯 ���)
	public List<GoodsQnaVO> gqnaList(GoodsQnaVO gqna){
		return sqlSession.selectList("gqnaDAO.gqnaList", gqna);
	}
	
	//��ǰ���� ����(�亯���)
	public int deleteGqna(GoodsQnaVO qgna) {
		return sqlSession.delete("gqnaDAO.deleteGqna",qgna);
	}
	
	//��ǰ���� �亯 �ϱ� ��
	public GoodsQnaVO gqnaOne(GoodsQnaVO gqna) {
		return sqlSession.selectOne("gqnaDAO.gqnaOne", gqna);
	}
	
	//��ǰ���� �亯
	public int updateGqna(GoodsQnaVO gqna) {
		return sqlSession.update("gqnaDAO.updateGqna",gqna);
	}
	
	//��ǰ���� ����Ʈ(�亯 �Ϸ�)
	public List<GoodsQnaVO> gqnaListSuc(GoodsQnaVO gqna){
		return sqlSession.selectList("gqnaDAO.gqnaListSuc", gqna);
		}
	
	//��ǰ���� �亯 ����
	public int updateGqnaSuc(GoodsQnaVO gqna) {
		return sqlSession.update("gqnaDAO.updateGqna",gqna);
	}
	
	//================================================================
	
	//������Ʈ �Ϻ� 
	public List<AdminSalesVO> getDate (AdminSalesVO sales){
		return sqlSession.selectList("SalesDAO.getDay", sales);
	}
	
	//������Ʈ ����
	public List<AdminSales2VO> getMonth(AdminSales2VO sales){
		return sqlSession.selectList("SalesDAO.getMonth", sales);
	}
	
	//������ ��Ʈ
	public List<AdminMemberChartVO> getMemChart(AdminMemberChartVO memch){
		return sqlSession.selectList("SalesDAO.getmemch", memch);
	}
	//================================================================
	
	//����Ʈ ��ǰ
	public List<AdminBestGoodsVO> bestList(AdminBestGoodsVO best){
		return sqlSession.selectList("bestGoodsDAO.bestList", best);
	}
	//================================================================

	//�������� ���	

	public List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice){
		return sqlSession.selectList("noticeDAO.getNoticeList",notice);
	}

	//�������� ���λ���
	public AdminNoticeVO getNotice(AdminNoticeVO notice) {
		return sqlSession.selectOne("noticeDAO.getNotice",notice);
	}
	//�������� ����
	public int updateNotice(AdminNoticeVO notice) {
		return sqlSession.update("noticeDAO.updateNotice",notice);
	}
	
	//�������� ����
	public int deleteNotice(AdminNoticeVO notice){
		return sqlSession.delete("noticeDAO.deleteNotice",notice);
	}
	
	//�������� ���
	public int insertNotice(AdminNoticeVO notice) {
		return sqlSession.insert("noticeDAO.insertNotice",notice);
	}
	
	//================================================================
	//�����ϴ����� ���
	public List<AdminFAQVO> getFAQList(AdminFAQVO faq){
		return sqlSession.selectList("faqDAO.getFAQList",faq);
	}
	
	//�����ϴ����� ���� ����
	public AdminFAQVO getFAQ(AdminFAQVO faq) {
		return sqlSession.selectOne("faqDAO.getFAQ",faq);
	}
	
	//�����ϴ����� ����
	public int updateFAQ(AdminFAQVO faq) {
		return sqlSession.update("faqDAO.updateFAQ",faq);
	}
	
	//�����ϴ����� ����
	public int deleteFAQ(AdminFAQVO faq){
		return sqlSession.delete("faqDAO.deleteFAQ",faq);
	}
	
	//�����ϴ����� ���
	public int insertFAQ(AdminFAQVO faq) {
		return sqlSession.insert("faqDAO.insertFAQ",faq);
	}
	
	//================================================================
	//1:1���� �亯 ���	����Ʈ
	public List<AdminQnaVO> getPersonalQnaWaitList(){
		return sqlSession.selectList("qnaDAO.getPersonalQnaWaitList");
	}
	
	//1:1���� �亯 ��� ���λ���
	public AdminQnaVO getPersonalQnaWait(AdminQnaVO qna){
		return sqlSession.selectOne("qnaDAO.getPersonalQnaWait", qna);
	}
	
	//1:1���� �亯 ���
	public int updateQnaWait(AdminQnaVO qna){
		return sqlSession.update("qnaDAO.updateQnaWait", qna);
	}
	
	//1:1���� �亯 ����
	public int deleteQnaWait(AdminQnaVO qna){
		return sqlSession.delete("qnaDAO.deleteQnaWait", qna);
	}
	//-------------------------------------------------------------------
	// 1:1���� �亯 �Ϸ� ����Ʈ
	public List<AdminQnaVO> getPersonalQnaFinishList(){
		return sqlSession.selectList("qnaDAO.getPersonalQnaFinishList");
	}
	
	//1:1���� �亯 �Ϸ� ���λ���
	public AdminQnaVO getPersonalQnaFinish(AdminQnaVO qna){
		return sqlSession.selectOne("qnaDAO.getPersonalQnaFinish", qna);
	}
	
	//1:1���� �亯 �Ϸ� ����
	public int updateQnaFinish(AdminQnaVO qna){
		return sqlSession.update("qnaDAO.updateQnaFinish", qna);
	}
	
	//1:1���� �亯 ����
	public int deleteQnaFinish(AdminQnaVO qna){
		return sqlSession.delete("qnaDAO.deleteQnaFinish", qna);
	}
	
	//==================================================================
	//������ ��ʵ��
	public int insertBanner(AdminBannerVO banner) {
		return sqlSession.insert("bannerDAO.insertBanner",banner);
	}
	
	//������ ��ʸ���Ʈ
	public List<AdminBannerVO> getBannerList(){
		return sqlSession.selectList("bannerDAO.getBannerList");
	}
	
	//������ ��ʼ��λ���
	public AdminBannerVO getBanner(AdminBannerVO banner) {
		return sqlSession.selectOne("bannerDAO.getBanner",banner);
	}
	
	public int updateBanner1(AdminBannerVO banner) {
		return sqlSession.update("bannerDAO.updateBanner1",banner);
	}
	
	public int updateBanner2(AdminBannerVO banner) {
		return sqlSession.update("bannerDAO.updateBanner2",banner);
	}
	
	public int deleteBanner(AdminBannerVO banner) {
		return sqlSession.delete("bannerDAO.deleteBanner",banner);
	}
	
	//================================================================
	//������ ����ī�װ� ����Ʈ
	public List<AdminCategoryMainVO> getCategory1List(){
		return sqlSession.selectList("categoryDAO.getCategory1List");
	}
	
	public int insertCategory1(AdminCategoryMainVO category1) {
		return sqlSession.insert("categoryDAO.insertCategory1",category1);
	}
	
	public String getCategory1Column() {
		return sqlSession.selectOne("categoryDAO.getCategory1Column");
	}
	
	public int deleteCategory1(AdminCategoryMainVO category1) {
		return sqlSession.delete("categoryDAO.deleteCategory1",category1);
	}
	public AdminCategoryMainVO getCategory1(AdminCategoryMainVO category1) {
		return sqlSession.selectOne("categoryDAO.getCategory1",category1);
	}
	public int updateCategory1(AdminCategoryMainVO category1) {
		return sqlSession.update("categoryDAO.updateCategory1",category1);
	}
	//----------------------------------------------------------------
	//������ ����ī�װ� ����Ʈ
	public List<AdminCategorySubVO> getCategory2List(){
		return sqlSession.selectList("categoryDAO.getCategory2List");
	}
	public int insertCategory2(AdminCategorySubVO category2) {
		return sqlSession.insert("categoryDAO.insertCategory2",category2);
	}
	public String getCategory2Column() {
		return sqlSession.selectOne("categoryDAO.getCategory2Column");
	}
	public AdminCategorySubVO getCategory2(AdminCategorySubVO category2) {
		return sqlSession.selectOne("categoryDAO.getCategory2",category2);

	}
	public int updateCategory2(AdminCategorySubVO category2) {
		return sqlSession.update("categoryDAO.updateCategory2",category2);
	}
	public int deleteCategory2(AdminCategorySubVO category2) {
		return sqlSession.delete("categoryDAO.deleteCategory2",category2);
	}
	//---------------------------------------------------------------------
	//������ ��ǰī�װ� ����Ʈ
	public List<AdminCategoryGoodsVO> getCategory3List(){
		return sqlSession.selectList("categoryDAO.getCategory3List");
	}
	public List<AdminCategorySubVO> getCategoryType(AdminCategoryGoodsVO category3){
		return sqlSession.selectList("categoryDAO.getCategoryType",category3);
	}
	public int insertCategory3(AdminCategoryGoodsVO category3) {
		return sqlSession.insert("categoryDAO.insertCategory3",category3);
	}
	public AdminCategoryGoodsVO getCategory3(AdminCategoryGoodsVO category3) {
		return sqlSession.selectOne("categoryDAO.getCategory3",category3);
	}
	public int deleteCategory3(AdminCategoryGoodsVO category3) {
		return sqlSession.delete("categoryDAO.deleteCategory3",category3);
	}
	public int updateCategory3(AdminCategoryGoodsVO category3) {
		return sqlSession.update("categoryDAO.updateCategory3",category3);
	}
	public List<AdminCategorySubVO> getCategory2Name(){
		return sqlSession.selectList("categoryDAO.getCategory2Name");
	}
	public int insertCategory3Detail(AdminCategoryGoodsVO category3) {
		return sqlSession.insert("categoryDAO.insertCategory3Detail",category3);
	}
	//================================================================
	// �ɹ��� ����Ʈ
	public List<AdminMembershipVO> getMembershipList(){
		return sqlSession.selectList("membershipDAO.getMembershipList");
	}
	
	public AdminMembershipVO getMembership(AdminMembershipVO membership) {
		return sqlSession.selectOne("membershipDAO.getMembership",membership);
	}
	public int updateMembership(AdminMembershipVO membership) {
		return sqlSession.update("membershipDAO.updateMembership",membership);
	}
	public int insertMembership(AdminMembershipVO membership) {
		return sqlSession.insert("membershipDAO.insertMembership",membership);
	}
	public int deleteMembership(AdminMembershipVO membership) {
		return sqlSession.delete("membershipDAO.deleteMembership",membership);
	}
	//----------------------------------------------------------------------
	//�ֹ����� �����Ϸ�
	public List<AdminOrderVO> getOrderWaitList(){
		return sqlSession.selectList("adminOrderDAO.getOrderWaitList");
	}
	public AdminOrderVO getOrderWait(AdminOrderVO order) {
		return sqlSession.selectOne("adminOrderDAO.getOrderWait",order);
	}
	public AdminShippingInfoVO getShippingInfo(AdminOrderVO order) {
		return sqlSession.selectOne("adminOrderDAO.getShippingInfo",order);
	}
	public List<AdminOrderVO> getOrderWaitDetail(AdminOrderVO order) {
		return sqlSession.selectList("adminOrderDAO.getOrderWaitDetail",order);
	}
	public int updateShippingInfo(AdminShippingInfoVO shipping) {
		return sqlSession.update("adminOrderDAO.updateShippingInfo",shipping);
	}
	public int updateOrderWait(AdminOrderVO order) {
		return sqlSession.update("adminOrderDAO.updateOrderWait",order);
	}
	public int updateOrderWait1(List<String> merchantList) {
		return sqlSession.update("adminOrderDAO.updateOrderWait1",merchantList);
	}
	public List<AdminShippingInfoVO> getShippingInfoList(List<String> merchantList) {
		return sqlSession.selectList("adminOrderDAO.getShippingInfoList",merchantList);
	}
	public int updateStatus(List<String> merchantList) {
		return sqlSession.update("adminOrderDAO.updateStatus",merchantList);
	}
	public List<AdminOrderVO> getOrderDeliveryList(){
		return sqlSession.selectList("adminOrderDAO.getOrderDeliveryList");
	}
	public List<AdminOrderVO> getOrderFinishList(){
		return sqlSession.selectList("adminOrderDAO.getOrderFinishList");
	}
	
	//ȯ�Ұ���
	public List<AdminOrderVO> getOrderRefundList(){
		return sqlSession.selectList("adminOrderDAO.getOrderRefundList");
	}
	public int updateRefundWait(AdminQnaVO qna) {
		return sqlSession.update("adminOrderDAO.updateRefundWait",qna);
	}
	//��ǰ����
	public List<AdminOrderVO> getOrderReturnList(){
		return sqlSession.selectList("adminOrderDAO.getOrderReturnList");
	}
	public int updateReturnWait(AdminQnaVO qna) {
		return sqlSession.update("adminOrderDAO.updateReturnWait",qna);
	}
	//��Ұ���
	public List<AdminOrderVO> getOrderCancleList(){
		return sqlSession.selectList("adminOrderDAO.getOrderCancleList");
	}
	public int updateCancleWait(AdminQnaVO qna) {
		return sqlSession.update("adminOrderDAO.updateCancleWait",qna);
	}
	//----------------------------------------------------
	//���� ���� ���
	public List<AdminCouponVO> getCouponList(){
		return sqlSession.selectList("couponDAO.getCouponList");
	}
	
	public AdminCouponVO getCoupon(AdminCouponVO coupon) {
		return sqlSession.selectOne("couponDAO.getCoupon",coupon);
	}
	public int updateCoupon(AdminCouponVO coupon) {
		return sqlSession.update("couponDAO.updateCoupon",coupon);
	}
	public int insertCoupon(AdminCouponVO coupon) {
		return sqlSession.insert("couponDAO.insertCoupon",coupon);
	}
	public int deleteCoupon(AdminCouponVO coupon) {
		return sqlSession.delete("couponDAO.deleteCoupon",coupon);
	}
	//----------------------------------------------------
	//���� �����Ȳ
	public List<AdminCouponVO> getCouponUseList(){
		return sqlSession.selectList("couponDAO.getCouponUseList");
	}
	
	public AdminCouponVO getCouponUse(AdminCouponVO coupon) {
		return sqlSession.selectOne("couponDAO.getCouponUse",coupon);
	}
	public int updateCouponUse(AdminCouponVO coupon) {
		return sqlSession.update("couponDAO.updateCouponUse",coupon);
	}
	public int insertCouponUse(AdminCouponVO coupon) {
		return sqlSession.insert("couponDAO.insertCouponUse",coupon);
	}
	public int deleteCouponUse(AdminCouponVO coupon) {
		return sqlSession.delete("couponDAO.deleteCouponUse",coupon);
	}
	public List<AdminCouponVO> getUserId(AdminCouponVO coupon){
		return sqlSession.selectList("couponDAO.getUserId",coupon);
	}
	//���� ��ȿ�Ⱓ(����? )�̿��غ���
	public List<AdminCouponVO> getCouponDate(){
		return sqlSession.selectList("couponDAO.getCouponDate");
	}
	public int updateCouponDate(AdminCouponVO coupon) {
		return sqlSession.update("couponDAO.updateCouponDate",coupon);
	}
	
}
