package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.dao.AdminDAO;
<<<<<<< HEAD
=======
import first.market.kurlyty.admin.vo.AdminFAQVO;
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
import first.market.kurlyty.admin.vo.AdminNoticeVO;
import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;
import first.market.kurlyty.user.vo.Board_noticeVO;

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
	public List<AdminVO> adminList(AdminVO admin){
		return  adminDao.getAdminList(admin);
	}
	

	@Override
	public List<AdminUserVO> userList(AdminUserVO adminUser){
		return  adminDao.getUserList(adminUser);
	}
	

	@Override
	public void logout(SessionStatus sessionStatus){
		sessionStatus.setComplete();
	}
<<<<<<< HEAD
	
	//������-�������׸���Ʈ
=======
//	@Override
//	public AdminUserVO getAdminUser(AdminUserVO adminuserVO) {
//		return adminDao.getUser(adminuserVO);
//	}
	@Override
	public int updateManager(AdminVO admin) {
		return adminDao.updateManager(admin);
	}
	
	@Override
	public int deleteManager(AdminVO admin) {
		return adminDao.deleteManager(admin);
	}
	@Override
	public int updateUser1(AdminUserVO user) {
		return adminDao.updateUser1(user);
	}
	
	@Override
	public int updateUser2(AdminUserVO user) {
		return adminDao.updateUser2(user);
	}
	
	@Override
	public int deleteUser1(AdminUserVO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUser2(AdminUserVO user) {
		// TODO Auto-generated method stub
		return 0;
	}

	//----------------------------------------------------------------
	//������-�������׸���Ʈ

>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
	@Override
	public List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice) {
		return adminDao.getNoticeList(notice);
	}
	
<<<<<<< HEAD
	//������-��������
=======
	//������-�������� ���λ���
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
	@Override
	public AdminNoticeVO getNotice(AdminNoticeVO notice) {
		return adminDao.getNotice(notice);
	}
	
<<<<<<< HEAD
	//������-�������׼����ϱ�
=======
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
	public int updateNotice(AdminNoticeVO notice) {
		return adminDao.updateNotice(notice);
	}

<<<<<<< HEAD
	//������-�������׻����ϱ�
=======
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
	@Override
	public int deleteNotice(AdminNoticeVO notice) {
		return adminDao.deleteNotice(notice);
	}
	
<<<<<<< HEAD
	//������ -�������׵���ϱ�
=======
>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
	@Override
	public int insertNotice(AdminNoticeVO notice) {
		return adminDao.insertNotice(notice);
	}
<<<<<<< HEAD
=======
	
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
	

>>>>>>> 4ba841d2c794a759a2262292794e3562a7fa4f09
}
	
	
	
