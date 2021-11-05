package first.market.kurlyty.user.service;

import first.market.kurlyty.user.vo.UserVO;

public interface InfoModifyService {
	 UserVO getUserData(UserVO user);
	 void updateUser(UserVO user);
}