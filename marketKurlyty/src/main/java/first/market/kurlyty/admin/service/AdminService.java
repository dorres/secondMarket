package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.vo.AdminBannerVO;
import first.market.kurlyty.admin.vo.AdminCategoryGoodsVO;
import first.market.kurlyty.admin.vo.AdminCategoryMainVO;
import first.market.kurlyty.admin.vo.AdminCategorySubVO;
import first.market.kurlyty.admin.vo.AdminFAQVO;
import first.market.kurlyty.admin.vo.AdminMembershipVO;
import first.market.kurlyty.admin.vo.AdminNoticeVO;
import first.market.kurlyty.admin.vo.AdminOrderVO;
import first.market.kurlyty.admin.vo.AdminQnaVO;
import first.market.kurlyty.admin.vo.AdminRegistVO;
import first.market.kurlyty.admin.vo.AdminReviewVO;
import first.market.kurlyty.admin.vo.AdminSalesVO;
import first.market.kurlyty.admin.vo.AdminShippingInfoVO;
import first.market.kurlyty.admin.vo.AdminStockStockVO;
import first.market.kurlyty.admin.vo.AdminStockVO;
import first.market.kurlyty.admin.vo.AdminTermsAgreementVO;
import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;
import first.market.kurlyty.admin.vo.GoodsQnaVO;

public interface AdminService {

	boolean idCheck(AdminVO admin);

	int joinProc(AdminVO admin);

	AdminVO loginGetUser(AdminVO admin);

	List<AdminVO> adminList(AdminVO admin);

	List<AdminUserVO> userList(AdminUserVO adminUser);

	void logout(SessionStatus sessionStatus);

	int updateManager(AdminVO admin);

	int deleteManager(AdminVO admin);
	
	//ȸ�� ���� ���
	AdminUserVO getUser(AdminUserVO user);
	//ȸ�� ����
	int updateUser(AdminUserVO user);
	//ȸ�� ����
	 int deleteUser(AdminUserVO user);
	//�������
	 List<AdminTermsAgreementVO> getTermsAgree(AdminTermsAgreementVO agree);
	//��� ���
	int insertTerms(AdminTermsAgreementVO agree);
	//��� ����
	 int updateTerms(AdminTermsAgreementVO agree);
	
	//��� ����
	 AdminTermsAgreementVO getTerms(AdminTermsAgreementVO agree);
	
	//��� ����
	 int deleteTerms(AdminTermsAgreementVO agree);
	
	//��ǰ ���
	 int inserGoods(AdminRegistVO regist);
	
	//��ǰ��ȸ����Ʈ
	 List<AdminRegistVO> goodsList(AdminRegistVO regist);
	
	//��ǰ��ȸ
	 AdminRegistVO getGoods(AdminRegistVO regist);
	
	//��ǰ ����
	 int updateGoods(AdminRegistVO regist);
	
	//��ǰ ����
	 int deleteGoods(AdminRegistVO regist);
		
	//��� ��ȸ
	 List<AdminStockVO> getStockList(AdminStockVO stock);
	
	//�԰� ����
	int updateStock (AdminStockVO stock);
	
	//��� �հ�
	AdminStockVO sumStock(AdminStockVO stock);
	
	//�Ǹ� ���
	AdminStockVO getStock(int serial);
	int insertStock(AdminStockVO stock);
	
	// ����Ʈ�� ��� ���
	int stockstock(AdminStockStockVO stockstock);
	
	//----------------------------------------------------------------
	
		//���� ����Ʈ
	List<AdminReviewVO> getReviewList(AdminReviewVO review);
	//���� ����
	int deleteReview(AdminReviewVO review); 
	//=================================================================
	
	// ��ǰ���� ����Ʈ (�亯���)
	List<GoodsQnaVO> gqnaList(GoodsQnaVO gqna);
	
	// ��ǰ���� ����Ʈ ����(�亯���)
	int deleteGqna(GoodsQnaVO gqna);
	
	//��ǰ���� �亯 �� 
	GoodsQnaVO gqnaOne(GoodsQnaVO gqna);
	
	//��ǰ �亯
	int updateGqna(GoodsQnaVO gqna);
	
	// ��ǰ���� ����Ʈ (�亯�Ϸ�)
	List<GoodsQnaVO> gqnaListSuc(GoodsQnaVO gqna);
	
	//��ǰ �亯 ����
	int updateGqnaSuc(GoodsQnaVO gqna);
	//=================================================================
	
	//���� ��¥ 
	List<AdminSalesVO> getDate(AdminSalesVO sales);
	
	//=================================================================

	//�������� ����Ʈ
	List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice);
	
	//�������� ���λ���
	AdminNoticeVO getNotice(AdminNoticeVO notice);
	
	//�������� ����
	int updateNotice(AdminNoticeVO notice);
	
	//�������� ����
	int deleteNotice(AdminNoticeVO notice);
	
	//�������� ���
	int insertNotice(AdminNoticeVO notice);

	//=================================================================
	//�����ϴ� ���� ����Ʈ
	List<AdminFAQVO> getFAQList(AdminFAQVO faq);
	
	//�����ϴ� ���� ���λ���
	AdminFAQVO getFAQ(AdminFAQVO faq);
	
	//�����ϴ� ���� ����
	int updateFAQ(AdminFAQVO faq);
	
	//�����ϴ� ���� ����
	int deleteFAQ(AdminFAQVO faq);
	
	//�����ϴ� ���� ���
	int insertFAQ(AdminFAQVO faq);
	
	//=================================================================
	//1:1���� �亯��� ����Ʈ
	List<AdminQnaVO> getPersonalQnaWaitList();
	
	//1:1���� �亯��� ���λ���
	AdminQnaVO getPersonalQnaWait(AdminQnaVO qna);
	
	//1:1���� �亯��� �亯 ���
	int updateQnaWait(AdminQnaVO qna);
	
	//1:1���� �亯��� ����
	int deleteQnaWait(AdminQnaVO qna);
	//-----------------------------------------------------------------
	//1:1���� �亯�Ϸ� ����Ʈ
	List<AdminQnaVO> getPersonalQnaFinishList();
	
	//1:1���� �亯�Ϸ� ���λ���
	AdminQnaVO getPersonalQnaFinish(AdminQnaVO qna);
	
	//1:1���� �亯�Ϸ� �亯 ����
	int updateQnaFinish(AdminQnaVO qna);
	
	//1:1���� �亯��� ����
	int deleteQnaFinish(AdminQnaVO qna);

	//=================================================================
	//������ ��ʵ��
	int insertBanner(AdminBannerVO banner);
	
	//������ ��� ����Ʈ
	List<AdminBannerVO> getBannerList();
	
	//������ ��� ���λ���
	AdminBannerVO getBanner(AdminBannerVO banner);
	
	int updateBanner1(AdminBannerVO banner);
	
	int updateBanner2(AdminBannerVO banner);
	
	int deleteBanner(AdminBannerVO banner);
	
	//=================================================================
	//������ 1��ī�װ� ����Ʈ
	List<AdminCategoryMainVO> getCategory1List();
	
	String getCategory1Column();
	
	int insertCategory1(AdminCategoryMainVO category1);
	
	int deleteCategory1(AdminCategoryMainVO category1);
	
	AdminCategoryMainVO getCategory1(AdminCategoryMainVO category1);
	
	int updateCategory1(AdminCategoryMainVO category1);
	//------------------------------------------------------------------
	//������ 2��ī�װ� ����Ʈ
	List<AdminCategorySubVO> getCategory2List();
	
	String getCategory2Column();
	
	int insertCategory2(AdminCategorySubVO category2);
	
	AdminCategorySubVO getCategory2(AdminCategorySubVO category2);
	
	int updateCategory2(AdminCategorySubVO category2);
	
	int deleteCategory2(AdminCategorySubVO category2);
	//---------------------------------------------------------------------
	//������ 3��ī�װ� ����Ʈ
	List<AdminCategoryGoodsVO> getCategory3List();
	
	List<AdminCategorySubVO> getCategoryType(AdminCategoryGoodsVO category3);
	
	int insertCategory3(AdminCategoryGoodsVO category3);
	
	int insertCategory3Detail(AdminCategoryGoodsVO category3);
	
	AdminCategoryGoodsVO getCategory3(AdminCategoryGoodsVO category3);
	
	int deleteCategory3(AdminCategoryGoodsVO category3);
	
	int updateCategory3(AdminCategoryGoodsVO category);
	
	List<AdminCategorySubVO> getCategory2Name();
	
	//===========================================================================
	//������
	List<AdminMembershipVO> getMembershipList();
	
	AdminMembershipVO getMembership(AdminMembershipVO membership);
	
	int updateMembership(AdminMembershipVO membership);
	
	int insertMembership(AdminMembershipVO membership);
	
	int deleteMembership(AdminMembershipVO membership);
	
	//===========================================================================
	//�ֹ����� (�����Ϸ�)
	List<AdminOrderVO> getOrderWaitList();
	
	AdminOrderVO getOrderWait(AdminOrderVO order);
	
	AdminShippingInfoVO getShippingInfo(AdminOrderVO order);

	List<AdminOrderVO> getOrderWaitDetail(AdminOrderVO order);
	
	int updateShippingInfo(AdminShippingInfoVO shipping);
	
	int updateOrderWait(AdminOrderVO order);
	
}