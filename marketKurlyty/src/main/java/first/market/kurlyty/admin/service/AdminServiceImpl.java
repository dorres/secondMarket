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
	//ȸ�� ���� ���
	public AdminUserVO getUser(AdminUserVO user) {
		return adminDao.getUser(user);
	}
	//ȸ�� ����
	@Override
	public int updateUser(AdminUserVO user) {
		return adminDao.updateUser(user);
	}
	
	//ȸ�� ����
	@Override
	public int deleteUser(AdminUserVO user) {
		return adminDao.deleteUser(user);
	}
	//������� ����Ʈ
	@Override
	public List<AdminTermsAgreementVO> getTermsAgree(AdminTermsAgreementVO agree){
		return adminDao.getTermsAgreeList(agree);
	}
	//��� ���
	@Override
	public int insertTerms(AdminTermsAgreementVO agree) {
		return adminDao.insertTerms(agree);
	}
	
	//��� ����
	@Override
	public int updateTerms(AdminTermsAgreementVO agree) {
		return adminDao.updateTerms(agree);
	}
	
	//��� ����
	@Override
	public AdminTermsAgreementVO getTerms(AdminTermsAgreementVO agree) {
		return adminDao.getTerms(agree);
	}
	
	//��� ����
	@Override
	public int deleteTerms(AdminTermsAgreementVO agree) {
		return adminDao.deleteTerms(agree);
	}
	
//	//��ǰ ���
//	@Override
//	public int inserGoods(AdminRegistVO regist) {
//		return adminDao.insertGoods(regist);
//	}
	
	//��ǰ��ȸ����Ʈ
	@Override
	public List<AdminRegistVO> goodsList(){
		return adminDao.goodsList();
	}
	//��ǰ ����..
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
	//�԰� ��ȸ
	@Override
	public List<AdminStockVO> getStockList(AdminStockVO stock) {
		return adminDao.getStockList(stock);
	}
	
	
//	//��ǰ��ȸ
//	@Override
//	public AdminRegistVO getGoods(AdminRegistVO regist) {
//		return adminDao.getGoods(regist);
//	}
//	
//	//��ǰ ����
//	@Override
//	public int deleteGoods(AdminRegistVO regist) {
//		return adminDao.deleteGoods(regist);
//	}

//	//��� ��ȸ
//	public AdminStockVO getStock(AdminStockVO stock) {
//		return adminDao.getStock(stock);
//	}
	

//	
//	//�԰� ����
//	@Override
//	public int updateStock (AdminStockVO stock) {
//		return adminDao.updateStock(stock);
//	}
//	
//	//��� �հ�
//	@Override
//	public AdminStockVO sumStock(AdminStockVO stock) {
//		return adminDao.sumStock(stock);
//	}
//	
//	//�Ǹ� ���
//	@Override
//	public AdminStockVO getStock(int serial) {
//		return adminDao.getStock(serial);
//	}
//	

//	
//	// ����Ʈ�� ��� ���
//	@Override
//	public int stockstock(AdminStockStockVO stockstock) {
//		return adminDao.stockstock(stockstock);
//	}
	//----------------------------------------------------------------
	// ��ǰ���� ����Ʈ (�亯���)
	@Override
	public List<GoodsQnaVO> gqnaList(GoodsQnaVO gqna){
		return adminDao.gqnaList(gqna);
	}
	
	// ��ǰ���� ����Ʈ ����(�亯���)
	@Override 
	public int deleteGqna(GoodsQnaVO gqna) {
		return adminDao.deleteGqna(gqna);
	}
	
	//��ǰ���� �亯 �� 
	@Override
	public GoodsQnaVO gqnaOne(GoodsQnaVO gqna) {
		return adminDao.gqnaOne(gqna);
	}
	
	//��ǰ �亯
	public int updateGqna(GoodsQnaVO gqna) {
		return adminDao.updateGqna(gqna);
	}
	
	// ��ǰ���� ����Ʈ (�亯�Ϸ�)
	@Override
	public List<GoodsQnaVO> gqnaListSuc(GoodsQnaVO gqna){
		return adminDao.gqnaListSuc(gqna);
	}
	
	//��ǰ �亯 ����
	@Override
	public int updateGqnaSuc(GoodsQnaVO gqna) {
		return adminDao.updateGqna(gqna);
		}
	
	//��ǰ���� ī��Ʈ
	@Override
	public GoodsQnaVO gqnaCount(GoodsQnaVO gqna) {
		return adminDao.gqnaCount(gqna);
	}
	//----------------------------------------------------------------
	
	//����Ʈ ��ǰ
	@Override
	public List<AdminBestGoodsVO> bestList(AdminBestGoodsVO best){
		return adminDao.bestList(best);
	}
	//----------------------------------------------------------------
	//������Ʈ �Ϻ�
	@Override
	public List<AdminSalesVO> getDate(AdminSalesVO sales){
		return adminDao.getDate(sales);
	}
	
	//���� ��Ʈ ����
	@Override
	public List<AdminSales2VO> getMonth(AdminSales2VO sales){
		return adminDao.getMonth(sales);
	}
	
	//������ ��Ʈ
	@Override
	public List<AdminMemberChartVO> getMemChart(AdminMemberChartVO memch){
		return adminDao.getMemChart(memch);
	}
	//----------------------------------------------------------------
	
	//�����ִ� ��ǰ
	@Override
	public List<AdminReviewVO> getReviewGoodsName(AdminReviewVO review){
		return adminDao.getReviewGoodsName(review);
	}
	
	//���� ����
	@Override
	public int deleteReview(AdminReviewVO review) {
		return adminDao.deleteReview(review);
	}
	
	//���䳻��
	@Override
	public AdminReviewVO getReviewContent(AdminReviewVO review) {
		return adminDao.getReviewContent(review);
	}
	
	//����Ʈ ����
	@Override
	public int updateReview(AdminReviewVO review) {
		return adminDao.updateReview(review);
	}
	//----------------------------------------------------------------
	//������-�������׸���Ʈ
	@Override
	public List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice) {
		return adminDao.getNoticeList(notice);
	}
	//������-�������� ���λ���
	@Override
	public AdminNoticeVO getNotice(AdminNoticeVO notice) {
		return adminDao.getNotice(notice);
	}
	//������-�������׼����ϱ�
	public int updateNotice(AdminNoticeVO notice) {
		return adminDao.updateNotice(notice);
	}
	//������-�������׻����ϱ�
	@Override
	public int deleteNotice(AdminNoticeVO notice) {
		return adminDao.deleteNotice(notice);
	}
	//������ -�������׵���ϱ�
	@Override
	public int insertNotice(AdminNoticeVO notice) {
		return adminDao.insertNotice(notice);
	}
	//---------------------------------------------------------------
	//������  -�����ϴ� ���� ����Ʈ
	@Override
	public List<AdminFAQVO> getFAQList(AdminFAQVO faq) {
		return adminDao.getFAQList(faq);
	}
	
	//������-�����ϴ����� ���λ���
	@Override
	public AdminFAQVO getFAQ(AdminFAQVO faq) {
		return adminDao.getFAQ(faq);
	}
	
	//������-�����ϴ� ���� ����
	@Override
	public int updateFAQ(AdminFAQVO faq) {
		return adminDao.updateFAQ(faq);
	}
	
	//������-�����ϴ� ���� ����
	@Override
	public int deleteFAQ(AdminFAQVO faq) {
		return adminDao.deleteFAQ(faq);
	}
	
	//������-�����ϴ� ���� ���
	@Override
	public int insertFAQ(AdminFAQVO faq) {
		return adminDao.insertFAQ(faq);
	}
	//-------------------------------------------------------------
	//������ -1:1 ���� �亯 ��� ����Ʈ
	@Override
	public List<AdminQnaVO> getPersonalQnaWaitList() {
		return adminDao.getPersonalQnaWaitList();
	}
	
	//������ - 1:1 ���� �亯 ��� ���λ���
	@Override
	public AdminQnaVO getPersonalQnaWait(AdminQnaVO qna) {
		return adminDao.getPersonalQnaWait(qna);
	}
	
	//������ - 1:1 ���� �亯 ��� 
	@Override
	public int updateQnaWait(AdminQnaVO qna) {
		return adminDao.updateQnaWait(qna);
	}
	
	//������ - 1:1 ���� �亯 ��� ����
	@Override
	public int deleteQnaWait(AdminQnaVO qna) {
		return adminDao.deleteQnaWait(qna);
	}
	
	//==============================================================
	//������  -1:1���� �亯 �Ϸ� ����Ʈ
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
	//������ ��� ���
	@Override
	public int insertBanner(AdminBannerVO banner) {
		return adminDao.insertBanner(banner);
	}
	//������ ��� ����Ʈ
	@Override
	public List<AdminBannerVO> getBannerList() {
		return adminDao.getBannerList();
	}
	//������ ��� ��������
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
	//������ 1�� ī�װ� 
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
	//������ 2�� ī�װ�
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
	// �ɹ��� ����Ʈ
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
	
	//ī��Ʈ
	@Override
	public AdminOrderVO orderCount(AdminOrderVO order) {
		return adminDao.orderCount(order);
	}
	//======================================================================
	//ȯ�Ұ���
	@Override
	public List<AdminOrderVO> getOrderRefundList() {
		return adminDao.getOrderRefundList();
	}
	@Override
	public int updateRefundWait(AdminQnaVO qna) {
		return adminDao.updateRefundWait(qna);
	}
	//��ǰ����
	@Override
	public List<AdminOrderVO> getOrderReturnList() {
		return adminDao.getOrderReturnList();
	}
	@Override
	public int updateReturnWait(AdminQnaVO qna) {
		return adminDao.updateReturnWait(qna);
	}
	//��Ұ���
	@Override
	public List<AdminOrderVO> getOrderCancleList() {
		return adminDao.getOrderCancleList();
	}
	@Override
	public int updateCancleWait(AdminQnaVO qna) {
		return adminDao.updateCancleWait(qna);
	}
	//======================================================
	//���� ���� ���
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
	//���� �����Ȳ
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
	
	
	
