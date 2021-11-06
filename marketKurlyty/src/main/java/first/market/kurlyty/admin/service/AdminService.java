package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.web.bind.support.SessionStatus;

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

	int updateManager(AdminVO admin);

	int deleteManager(AdminVO admin);
	
	List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice);
	
	AdminNoticeVO getNotice(AdminNoticeVO notice);
	
	int updateNotice(AdminNoticeVO notice);
	
	int deleteNotice(AdminNoticeVO notice);
	
	int insertNotice(AdminNoticeVO notice);

	int deleteUser1(AdminUserVO user);

	int deleteUser2(AdminUserVO user);

	int updateUser1(AdminUserVO user);

	int updateUser2(AdminUserVO user);
	
	AdminUserVO getAdminUser(AdminUserVO adminuserVo);
}