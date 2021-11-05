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
	
	//������-�������׸���Ʈ
	@Override
	public List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice) {
		return adminDao.getNoticeList(notice);
	}
	
	//������-��������
	@Override
	public AdminNoticeVO getNotice(AdminNoticeVO notice) {
		return adminDao.getNotice(notice);
	}
	
	//������-�������׼����ϱ�
	public int updateNotice(AdminNoticeVO notice) {
		return adminDao.updateNotice(notice);
	}

	//������-�������׻����ϱ�
	@Override
	public int deleteNotice(AdminNoticeVO notice) {
		return adminDao.deleteNotice(notice);
	}
	
	//������ -�������׵���ϱ�
	@Override
	public int insertNotice(AdminNoticeVO notice) {
		return adminDao.insertNotice(notice);
	}
}
	
	
	
