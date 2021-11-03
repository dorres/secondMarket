package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.dao.AdminDAO;
import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;
import first.market.kurlyty.user.vo.UserVO;

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
	public List<AdminVO> memberAdmin(AdminVO admin){
		return  adminDao.memberAdmin(admin);
	}
	
	@Override
	public List<UserVO> userList(UserVO user){
		return  adminDao.userList(user);
	}
	
	@Override
	public List<AdminUserVO> adminuserList(AdminUserVO adminuser){
		return  adminDao.adminuserList(adminuser);
	}
	@Override
	public void logout(SessionStatus sessionStatus){
		sessionStatus.setComplete();
	}
}
	
	
	
