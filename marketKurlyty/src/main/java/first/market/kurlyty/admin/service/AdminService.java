package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.web.bind.support.SessionStatus;

<<<<<<< HEAD
=======
import first.market.kurlyty.admin.vo.AdminFAQVO;
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
import first.market.kurlyty.admin.vo.AdminNoticeVO;
import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;

public interface AdminService {

	boolean idCheck(AdminVO admin);

	int joinProc(AdminVO admin);

	AdminVO loginGetUser(AdminVO admin);

	List<AdminVO> adminList(AdminVO admin);

	List<AdminUserVO> userList(AdminUserVO adminUser);

	void logout(SessionStatus sessionStatus);
<<<<<<< HEAD
	
	List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice);
	
	AdminNoticeVO getNotice(AdminNoticeVO notice);
	
	int updateNotice(AdminNoticeVO notice);
	
	int deleteNotice(AdminNoticeVO notice);
	
	int insertNotice(AdminNoticeVO notice);
	
=======

	int updateManager(AdminVO admin);

	int deleteManager(AdminVO admin);
	
	int deleteUser1(AdminUserVO user);

	int deleteUser2(AdminUserVO user);

	int updateUser1(AdminUserVO user);

	int updateUser2(AdminUserVO user);
	
//	AdminUserVO getAdminUser(AdminUserVO adminuserVo);
	
	//------------------------------------------------
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

	//--------------------------------------------
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
	
	
	
	
	



>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
}