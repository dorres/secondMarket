package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.dao.AdminDAO;
import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDao;
	
	//���̵� üũ
	@Override
	public boolean idCheck(AdminVO admin) {
		AdminVO adminData = adminDao.getAdmin(admin);
		if(adminData ==null)
			return true;
		else
			return false;
	}
	
	//ȸ������ó��
	@Override
	public int joinProc(AdminVO admin) {
		int success = 0;
		success = adminDao.insertAdmin(admin);
		return success;
	}
	
	//���̵� üũ
	@Override
	public AdminVO loginGetUser(AdminVO admin) {
		return adminDao.getAdmin(admin);
	}
	
	//������-�����ڸ���Ʈ
	@Override
	public List<AdminVO> adminList(AdminVO admin){
		return  adminDao.getAdminList(admin);
	}
	
	//������-��������Ʈ
	@Override
	public List<AdminUserVO> userList(AdminUserVO adminUser){
		return  adminDao.getUserList(adminUser);
	}
	
	//������ �α׾ƿ�
	@Override
	public void logout(SessionStatus sessionStatus){
		sessionStatus.setComplete();
	}
	
//	�Ŵ��� ����
	@Override
	public int updateManager(AdminVO admin) {
		int success = 0;
		success = adminDao.updateManager(admin);
		return success;
	}
	
	//�Ŵ��� ����
	@Override
	public int deleteManager(AdminVO admin) {
		int success = 0;
		success = adminDao.deleteManager(admin);
		return success;
	}
}
	
	
	
