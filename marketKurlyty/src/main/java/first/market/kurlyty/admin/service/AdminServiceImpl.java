package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.dao.AdminDAO;
import first.market.kurlyty.admin.vo.AdminNoticeVO;
import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;
import first.market.kurlyty.user.vo.Board_noticeVO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDao;
	
	//아이디 체크
	@Override
	public boolean idCheck(AdminVO admin) {
		AdminVO adminData = adminDao.getAdmin(admin);
		if(adminData ==null)
			return true;
		else
			return false;
	}
	
	//회원가입처리
	@Override
	public int joinProc(AdminVO admin) {
		int success = 0;
		success = adminDao.insertAdmin(admin);
		return success;
	}
	
	//아이디 체크
	@Override
	public AdminVO loginGetUser(AdminVO admin) {
		return adminDao.getAdmin(admin);
	}
	
	//관리자-관리자리스트
	@Override
	public List<AdminVO> adminList(AdminVO admin){
		return  adminDao.getAdminList(admin);
	}
	
	//관리자-유저리스트
	@Override
	public List<AdminUserVO> userList(AdminUserVO adminUser){
		return  adminDao.getUserList(adminUser);
	}
	
	//관리자 로그아웃
	@Override
	public void logout(SessionStatus sessionStatus){
		sessionStatus.setComplete();
	}
	
	//관리자-공지사항리스트
	@Override
	public List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice) {
		return adminDao.getNoticeList(notice);
	}
	
	//관리자-공지사항
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
}
	
	
	
