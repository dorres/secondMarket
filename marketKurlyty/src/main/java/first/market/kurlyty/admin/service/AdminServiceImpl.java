package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.dao.AdminDAO;
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
	
	//��ǰ ���
	@Override
	public int inserGoods(AdminRegistVO regist) {
		return adminDao.insertGoods(regist);
	}
	
	//��ǰ��ȸ
	@Override
	public List<AdminRegistVO> getGoods(AdminRegistVO regist) {
		return adminDao.getGoods(regist);
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
	public int getCategory1Column() {
		return adminDao.getCategory1Column();
	}

	@Override
	public int getIconBlack(String black) {
		return adminDao.getIconBlack(black);
	}
	@Override
	public int getIconColor(String color) {
		return adminDao.getIconColor(color);
	}

	@Override
	public int deleteCategory1(AdminCategoryMainVO category1) {
		return adminDao.deleteCategory1(category1);
	}

	@Override
	public AdminCategoryMainVO getCategory1(AdminCategoryMainVO category1) {
		return adminDao.getCategory1(category1);
	}
	//-------------------------------------------------------------
	//������ 2�� ī�װ�
	@Override
	public List<AdminCategorySubVO> getCategory2List() {
		return adminDao.getCategory2List();
	}
	

}
	
	
	
