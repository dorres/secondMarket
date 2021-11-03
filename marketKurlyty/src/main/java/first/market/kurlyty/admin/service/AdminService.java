package first.market.kurlyty.admin.service;

import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.vo.AdminVO;

public interface AdminService {

	boolean idCheck(AdminVO admin);

	int joinProc(AdminVO admin);

	AdminVO loginGetUser(AdminVO admin);
	
	void logout(SessionStatus sessionStatus);

}