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
import first.market.kurlyty.admin.vo.AdminShippingInfoVO;
import first.market.kurlyty.admin.vo.AdminStockVO;
import first.market.kurlyty.admin.vo.AdminTermsAgreementVO;
import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;

public interface AdminService {

	boolean idCheck(AdminVO admin);

	int joinProc(AdminVO admin);

	AdminVO loginGetUser(AdminVO admin);

	List<AdminVO> adminList(AdminVO admin);

	List<AdminUserVO> userList(AdminUserVO adminUser);

	void logout(SessionStatus sessionStatus);

	int updateManager(AdminVO admin);

	int deleteManager(AdminVO admin);
	
	//회원 수정 출력
	AdminUserVO getUser(AdminUserVO user);
	//회원 수정
	public int updateUser(AdminUserVO user);
	//회원 삭제
	public int deleteUser(AdminUserVO user);
	//약관관리
	public List<AdminTermsAgreementVO> getTermsAgree(AdminTermsAgreementVO agree);
	//약관 등록
	int insertTerms(AdminTermsAgreementVO agree);
	//약관 수정
	public int updateTerms(AdminTermsAgreementVO agree);
	
	//약관 정보
	public AdminTermsAgreementVO getTerms(AdminTermsAgreementVO agree);
	
	//약관 삭제
	public int deleteTerms(AdminTermsAgreementVO agree);
	
	//상품 등록
	public int inserGoods(AdminRegistVO regist);
	
	//상품조회리스트
	public List<AdminRegistVO> goodsList(AdminRegistVO regist);
	
	//상품조회
	public AdminRegistVO getGoods(AdminRegistVO regist);
	
	//상품 수정
	public int updateGoods(AdminRegistVO regist);
	
	//상품 삭제
	public int deleteGoods(AdminRegistVO regist);
		
	//재고 조회
	public AdminStockVO getStock(AdminStockVO stock);
	
	//입고 수정
	public int updateStock (AdminStockVO stock);
	
	//재고 합계
	public AdminStockVO sumStock(AdminStockVO stock);
	//=================================================================

	//공지사항 리스트
	List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice);
	
	//공지사항 세부사항
	AdminNoticeVO getNotice(AdminNoticeVO notice);
	
	//공지사항 수정
	int updateNotice(AdminNoticeVO notice);
	
	//공지사항 삭제
	int deleteNotice(AdminNoticeVO notice);
	
	//공지사항 등록
	int insertNotice(AdminNoticeVO notice);

	//=================================================================
	//자주하는 질문 리스트
	List<AdminFAQVO> getFAQList(AdminFAQVO faq);
	
	//자주하는 질문 세부사항
	AdminFAQVO getFAQ(AdminFAQVO faq);
	
	//자주하는 질문 수정
	int updateFAQ(AdminFAQVO faq);
	
	//자주하는 질문 삭제
	int deleteFAQ(AdminFAQVO faq);
	
	//자주하는 질문 등록
	int insertFAQ(AdminFAQVO faq);
	
	//=================================================================
	//1:1문의 답변대기 리스트
	List<AdminQnaVO> getPersonalQnaWaitList();
	
	//1:1문의 답변대기 세부사항
	AdminQnaVO getPersonalQnaWait(AdminQnaVO qna);
	
	//1:1문의 답변대기 답변 등록
	int updateQnaWait(AdminQnaVO qna);
	
	//1:1문의 답변대기 삭제
	int deleteQnaWait(AdminQnaVO qna);
	//-----------------------------------------------------------------
	//1:1문의 답변완료 리스트
	List<AdminQnaVO> getPersonalQnaFinishList();
	
	//1:1문의 답변완료 세부사항
	AdminQnaVO getPersonalQnaFinish(AdminQnaVO qna);
	
	//1:1문의 답변완료 답변 수정
	int updateQnaFinish(AdminQnaVO qna);
	
	//1:1문의 답변대기 삭제
	int deleteQnaFinish(AdminQnaVO qna);

	//=================================================================
	//관리자 배너등록
	int insertBanner(AdminBannerVO banner);
	
	//관리자 배너 리스트
	List<AdminBannerVO> getBannerList();
	
	//관리자 배너 세부사항
	AdminBannerVO getBanner(AdminBannerVO banner);
	
	int updateBanner1(AdminBannerVO banner);
	
	int updateBanner2(AdminBannerVO banner);
	
	int deleteBanner(AdminBannerVO banner);
	
	//=================================================================
	//관리자 1차카테고리 리스트
	List<AdminCategoryMainVO> getCategory1List();
	
	String getCategory1Column();
	
	int insertCategory1(AdminCategoryMainVO category1);
	
	int deleteCategory1(AdminCategoryMainVO category1);
	
	AdminCategoryMainVO getCategory1(AdminCategoryMainVO category1);
	
	int updateCategory1(AdminCategoryMainVO category1);
	//------------------------------------------------------------------
	//관리자 2차카테고리 리스트
	List<AdminCategorySubVO> getCategory2List();
	
	String getCategory2Column();
	
	int insertCategory2(AdminCategorySubVO category2);
	
	AdminCategorySubVO getCategory2(AdminCategorySubVO category2);
	
	int updateCategory2(AdminCategorySubVO category2);
	
	int deleteCategory2(AdminCategorySubVO category2);
	//---------------------------------------------------------------------
	//관리자 3차카테고리 리스트
	List<AdminCategoryGoodsVO> getCategory3List();
	
	List<AdminCategorySubVO> getCategoryType(AdminCategoryGoodsVO category3);
	
	int insertCategory3(AdminCategoryGoodsVO category3);
	
	int insertCategory3Detail(AdminCategoryGoodsVO category3);
	
	AdminCategoryGoodsVO getCategory3(AdminCategoryGoodsVO category3);
	
	int deleteCategory3(AdminCategoryGoodsVO category3);
	
	int updateCategory3(AdminCategoryGoodsVO category);
	
	List<AdminCategorySubVO> getCategory2Name();
	
	//===========================================================================
	//적립금
	List<AdminMembershipVO> getMembershipList();
	
	AdminMembershipVO getMembership(AdminMembershipVO membership);
	
	int updateMembership(AdminMembershipVO membership);
	
	int insertMembership(AdminMembershipVO membership);
	
	int deleteMembership(AdminMembershipVO membership);
	
	//===========================================================================
	//주문관리 (결제완료)
	List<AdminOrderVO> getOrderWaitList();
	
	AdminOrderVO getOrderWait(AdminOrderVO order);
	
	AdminShippingInfoVO getShippingInfo(AdminOrderVO order);
	
}