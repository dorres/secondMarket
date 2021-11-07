package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.dao.AdminDAO;

import first.market.kurlyty.admin.vo.AdminFAQVO;
import first.market.kurlyty.admin.vo.AdminNoticeVO;
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
	
	
	public int updateUser(AdminUserVO user) {
		int result = 0;  
			result = adminDao.updateUser1(user); 
		int result2 = 0;
			result2 = adminDao.updateUser2(user);
		if(result + result2 == 2)
			return 1;
		else
			return 0;
	}
//	@Override
//	public int updateUser1(AdminUserVO user) {
//		//return adminDao.updateUser1(user);
//		return
//	}
//	
//	@Override
//	public int updateUser2(AdminUserVO user) {
//		//return adminDao.updateUser2(user);
//	}
	
	@Override
	public int deleteUser1(AdminUserVO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUser2(AdminUserVO user) {
		// TODO Auto-generated method stub
		return 0;
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

}
	
	
	
