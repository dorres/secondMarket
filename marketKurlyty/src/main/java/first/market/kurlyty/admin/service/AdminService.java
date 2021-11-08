package first.market.kurlyty.admin.service;

import java.util.List;

import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.admin.vo.AdminFAQVO;

import first.market.kurlyty.admin.vo.AdminNoticeVO;
import first.market.kurlyty.admin.vo.AdminQnaVO;
import first.market.kurlyty.admin.vo.AdminTermsAgreementVO;
import first.market.kurlyty.admin.vo.AdminUserVO;
import first.market.kurlyty.admin.vo.AdminVO;

public interface AdminService {

	boolean idCheck(AdminVO admin);

	int joinProc(AdminVO admin);

	AdminVO loginGetUser(AdminVO admin);

	List<AdminVO> adminList(AdminVO admin);

	List<AdminUserVO> userList(AdminUserVO adminUser);

	void logout(SessionStatus sessionStatus);

	int updateManager(AdminVO admin);

	int deleteManager(AdminVO admin);
	
	//ȸ�� ���� ���
	AdminUserVO getUser(AdminUserVO user);
	//ȸ�� ����
	public int updateUser(AdminUserVO user);
	//ȸ�� ����
	public int deleteUser(AdminUserVO user);
	//�������
	public List<AdminTermsAgreementVO> getTermsAgree(AdminTermsAgreementVO agree);
	//------------------------------------------------
	//�������� ����Ʈ
	List<AdminNoticeVO> getNoticeList(AdminNoticeVO notice);
	
	//�������� ���λ���
	AdminNoticeVO getNotice(AdminNoticeVO notice);
	
	//�������� ����
	int updateNotice(AdminNoticeVO notice);
	
	//�������� ����
	int deleteNotice(AdminNoticeVO notice);
	
	//�������� ���
	int insertNotice(AdminNoticeVO notice);

	//--------------------------------------------
	//�����ϴ� ���� ����Ʈ
	List<AdminFAQVO> getFAQList(AdminFAQVO faq);
	
	//�����ϴ� ���� ���λ���
	AdminFAQVO getFAQ(AdminFAQVO faq);
	
	//�����ϴ� ���� ����
	int updateFAQ(AdminFAQVO faq);
	
	//�����ϴ� ���� ����
	int deleteFAQ(AdminFAQVO faq);
	
	//�����ϴ� ���� ���
	int insertFAQ(AdminFAQVO faq);
	
	//--------------------------------------------------
	//1:1���� �亯��� ����Ʈ
	List<AdminQnaVO> getPersonalQnaWaitList();
	
	//1:1���� �亯��� ���λ���
	AdminQnaVO getPersonalQnaWait(AdminQnaVO qna);
	
	//1:1���� �亯��� �亯 ���
	int updateQnaWait(AdminQnaVO qna);
	
	//1:1���� �亯��� ����
	int deleteQnaWait(AdminQnaVO qna);
	
	
	//====================================================
	//1:1���� �亯�Ϸ� ����Ʈ
	List<AdminQnaVO> getPersonalQnaFinishList();
	
	//1:1���� �亯�Ϸ� ���λ���
	AdminQnaVO getPersonalQnaFinish(AdminQnaVO qna);
	
	//1:1���� �亯�Ϸ� �亯 ����
	int updateQnaFinish(AdminQnaVO qna);
	
	//1:1���� �亯��� ����
	int deleteQnaFinish(AdminQnaVO qna);
	
}