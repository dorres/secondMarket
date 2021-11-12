package first.market.kurlyty.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.UserDAO;
import first.market.kurlyty.user.vo.UserVO;

@Service
public class InfoModifyServiceImpl implements InfoModifyService {
	@Autowired
	private UserDAO userDao;

	@Override
	public void updateUser(UserVO user) {
		userDao.updateUser(user);
	}

	@Override
	public UserVO getUserData(UserVO user) {
		return userDao.getUser(user);
	}
}