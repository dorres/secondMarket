package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.dao.AdminDAO;
import first.market.kurlyty.admin.vo.AdminFAQVO;
import first.market.kurlyty.admin.vo.AdminNoticeVO;
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
	//----------------------------------------------------------------
	//������-�������׸���Ʈ
	@Override
	public List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice) {
		return adminDao.getNoticeList(notice);
	}
	
	//������-�������� ���λ���
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
	
	//---------------------------------------------------------------
	//������  -�����ϴ� ���� ����Ʈ
	@Override
	public List<AdminFAQVO> getFAQList(AdminFAQVO faq) {
		return adminDao.getFAQList(faq);
	}
	
	//������-�����ϴ����� ���λ���
	@Override
	public AdminFAQVO getFAQ(AdminFAQVO faq) {
		return adminDao.getFAQ(faq);
	}
	
	//������-�����ϴ� ���� ����
	@Override
	public int updateFAQ(AdminFAQVO faq) {
		return adminDao.updateFAQ(faq);
	}
	
	//������-�����ϴ� ���� ����
	@Override
	public int deleteFAQ(AdminFAQVO faq) {
		return adminDao.deleteFAQ(faq);
	}
	
	//������-�����ϴ� ���� ���
	@Override
	public int insertFAQ(AdminFAQVO faq) {
		return adminDao.insertFAQ(faq);
	}
	
}
	
	
	
