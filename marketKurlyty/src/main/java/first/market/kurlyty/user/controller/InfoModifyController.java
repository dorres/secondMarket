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
	
	// 비밀번호 확인 후 페이지 넘기기
	@RequestMapping("/infoModify2.do")
	public String modifyUser(UserVO user, Model model) {

		// 1. DB에서 사용자 정보를 가지고 온다.
		UserVO userVo = infoModifyService.getUserData(user);
		
		// 생년월일 짜르기
		userVo.setUser_year(userVo.getUser_birth().substring(0, 4)); // 0번 ~ 3번까지 자르기
		userVo.setUser_month(userVo.getUser_birth().substring(4, 6));
		userVo.setUser_day(userVo.getUser_birth().substring(6)); // 6번부터 끝까지
		
		String securityPw = null;
		String dbPw = userVo.getUser_pw();
		// 2. 입력한 비밀번호를 암호화
		try {
			securityPw = SecurityUtil.sha256(user.getUser_pw());
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		// 3. DB와 암호화된 비밀번호를 비교한다.
		if(dbPw.equals(securityPw)) {
			model.addAttribute("userData", userVo);
			return "mykurly/infoModify2";
		}
		// 4. 예외처리
		else {
			return "mykurly/infoModify1";
		}
	}
	
	// 회원정보 수정
	@RequestMapping("/updateProc.do")
	public String updateProc(UserVO user, Model model) {
		// 비밀번호 암호화
		try {
			user.setUser_pw(SecurityUtil.sha256(user.getUser_new_pw()));
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace();
		}
		// 쿼리문 실행
		infoModifyService.updateUser(user);
		return "redirect:index.do";
	}
}