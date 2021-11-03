package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;
import first.market.kurlyty.user.vo.UserVO;

public interface AdminService {

	boolean idCheck(AdminVO admin);

	int joinProc(AdminVO admin);

	AdminVO loginGetUser(AdminVO admin);

	List<AdminVO> memberAdmin(AdminVO admin);

	List<UserVO> userList(UserVO user);

	List<AdminUserVO> adminuserList(AdminUserVO adminuser);

	void logout(SessionStatus sessionStatus);
}