package first.market.kurlyty.user.controller;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import first.market.kurlyty.user.service.InfoModifyService;
import first.market.kurlyty.user.vo.UserVO;

@Controller
@SessionAttributes("userId")
public class InfoModifyController {
	
	@Autowired
	private InfoModifyService infoModifyService;
	
	@RequestMapping("/infoModify1.do")
	public String modifyPage() {
			return "mykurly/infoModify1";
		}
	
	// ��й�ȣ Ȯ�� �� ������ �ѱ��
	@RequestMapping("/infoModify2.do")
	public String modifyUser(UserVO user, Model model) {

		// 1. DB���� ����� ������ ������ �´�.
		UserVO userVo = infoModifyService.getUserData(user);
		
		// ������� ¥����
		userVo.setUser_year(userVo.getUser_birth().substring(0, 4)); // 0�� ~ 3������ �ڸ���
		userVo.setUser_month(userVo.getUser_birth().substring(4, 6));
		userVo.setUser_day(userVo.getUser_birth().substring(6)); // 6������ ������
		
		String securityPw = null;
		String dbPw = userVo.getUser_pw();
		// 2. �Է��� ��й�ȣ�� ��ȣȭ
		try {
			securityPw = SecurityUtil.sha256(user.getUser_pw());
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		// 3. DB�� ��ȣȭ�� ��й�ȣ�� ���Ѵ�.
		if(dbPw.equals(securityPw)) {
			model.addAttribute("userData", userVo);
			return "mykurly/infoModify2";
		}
		// 4. ����ó��
		else {
			return "mykurly/infoModify1";
		}
	}
	
	// ȸ������ ����
	@RequestMapping("/updateProc.do")
	public String updateProc(UserVO user, Model model) {
		// ��й�ȣ ��ȣȭ
		try {
			user.setUser_pw(SecurityUtil.sha256(user.getUser_new_pw()));
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace();
		}
		// ������ ����
		infoModifyService.updateUser(user);
		return "redirect:index.do";
	}
}