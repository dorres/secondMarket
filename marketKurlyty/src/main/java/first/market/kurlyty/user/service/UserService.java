package first.market.kurlyty.user.service;

import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.emailsend.EmailSendVO;
import first.market.kurlyty.user.vo.UserDetailsVO;
import first.market.kurlyty.user.vo.UserVO;

public interface UserService {
	boolean idCheck(UserVO user);
	boolean emailCheck(UserVO user);
	int joinProc(UserVO user);
	void initUserDetails(UserVO user);
	void initUserAddressList(UserVO user);
	UserVO loginGetUser(UserVO user);
	//void logout(HttpSession session);
	void logout(SessionStatus sessionStatus);
	UserVO getUser(UserVO user);
	String idFind(UserVO user);
	UserDetailsVO getUserStatus(String userId);
	String pwFind(UserVO user);
	EmailSendVO getSendEmailKey();
	void newPw(UserVO user);
}