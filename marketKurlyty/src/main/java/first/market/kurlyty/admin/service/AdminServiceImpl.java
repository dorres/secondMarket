package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.dao.AdminDAO;
import first.market.kurlyty.admin.vo.AdminBannerVO;
import first.market.kurlyty.admin.vo.AdminFAQVO;
import first.market.kurlyty.admin.vo.AdminNoticeVO;
import first.market.kurlyty.admin.vo.AdminQnaVO;
import first.market.kurlyty.admin.vo.AdminTermsAgreementVO;
import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;


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
	public int updateUser(AdminUserVO user) {
		return adminDao.updateUser(user);
	}
	
	//회원 삭제
	public int deleteUser(AdminUserVO user) {
		return adminDao.deleteUser(user);
	}
	//약관동의 리스트
	public List<AdminTermsAgreementVO> getTermsAgree(AdminTermsAgreementVO agree){
		return adminDao.getTermsAgree(agree);
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

	@Override
	public int insertBanner(AdminBannerVO banner) {
		return adminDao.insertBanner(banner);
	}

	@Override
	public List<AdminBannerVO> getBannerList() {
		return adminDao.getBannerList();
	}

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
	
	



}
	
	
	
