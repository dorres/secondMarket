package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.vo.AdminBannerVO;
import first.market.kurlyty.admin.vo.AdminCategoryMainVO;
import first.market.kurlyty.admin.vo.AdminCategorySubVO;
import first.market.kurlyty.admin.vo.AdminFAQVO;

import first.market.kurlyty.admin.vo.AdminNoticeVO;
import first.market.kurlyty.admin.vo.AdminQnaVO;
import first.market.kurlyty.admin.vo.AdminRegistVO;
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
	
	//ȸ�� ���� ���
	AdminUserVO getUser(AdminUserVO user);
	//ȸ�� ����
	public int updateUser(AdminUserVO user);
	//ȸ�� ����
	public int deleteUser(AdminUserVO user);
	//�������
	public List<AdminTermsAgreementVO> getTermsAgree(AdminTermsAgreementVO agree);
	//��� ���
	int insertTerms(AdminTermsAgreementVO agree);
	//��� ����
	public int updateTerms(AdminTermsAgreementVO agree);
	
	//��� ����
	public AdminTermsAgreementVO getTerms(AdminTermsAgreementVO agree);
	
	//��� ����
	public int deleteTerms(AdminTermsAgreementVO agree);
	
	//��ǰ ���
	public int inserGoods(AdminRegistVO regist);
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
	
	int getCategory1Column();
	
	int insertCategory1(AdminCategoryMainVO category1);
	
	int getIconBlack(String black);
	
	int getIconColor(String color);
	
	int deleteCategory1(AdminCategoryMainVO category1);
	
	AdminCategoryMainVO getCategory1(AdminCategoryMainVO category1);
	
	int updateCategory1(AdminCategoryMainVO category1);
	//------------------------------------------------------------------
	//������ 2��ī�װ� ����Ʈ
	List<AdminCategorySubVO> getCategory2List();
	
	int getCategory2Column();
	
	int insertCategory2(AdminCategorySubVO category2);
	
	AdminCategorySubVO getCategory2(AdminCategorySubVO category2);
	
	int updateCategory2(AdminCategorySubVO category2);
	
	
}