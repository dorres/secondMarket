package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.dao.AdminDAO;
<<<<<<< HEAD
=======
import first.market.kurlyty.admin.vo.AdminFAQVO;
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
import first.market.kurlyty.admin.vo.AdminNoticeVO;
import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;
import first.market.kurlyty.user.vo.Board_noticeVO;

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
<<<<<<< HEAD
	
	//관리자-공지사항리스트
=======
//	@Override
//	public AdminUserVO getAdminUser(AdminUserVO adminuserVO) {
//		return adminDao.getUser(adminuserVO);
//	}
	@Override
	public int updateManager(AdminVO admin) {
		return adminDao.updateManager(admin);
	}
	
	@Override
	public int deleteManager(AdminVO admin) {
		return adminDao.deleteManager(admin);
	}
	@Override
	public int updateUser1(AdminUserVO user) {
		return adminDao.updateUser1(user);
	}
	
	@Override
	public int updateUser2(AdminUserVO user) {
		return adminDao.updateUser2(user);
	}
	
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

>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
	@Override
	public List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice) {
		return adminDao.getNoticeList(notice);
	}
	
<<<<<<< HEAD
	//관리자-공지사항
=======
	//관리자-공지사항 세부사항
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
	@Override
	public AdminNoticeVO getNotice(AdminNoticeVO notice) {
		return adminDao.getNotice(notice);
	}
	
<<<<<<< HEAD
	//관리자-공지사항수정하기
=======
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
	public int updateNotice(AdminNoticeVO notice) {
		return adminDao.updateNotice(notice);
	}

<<<<<<< HEAD
	//관리자-공지사항삭제하기
=======
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
	@Override
	public int deleteNotice(AdminNoticeVO notice) {
		return adminDao.deleteNotice(notice);
	}
	
<<<<<<< HEAD
	//관리자 -공지사항등록하기
=======
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
	@Override
	public int insertNotice(AdminNoticeVO notice) {
		return adminDao.insertNotice(notice);
	}
<<<<<<< HEAD
=======
	
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
	

>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
}
	
	
	
