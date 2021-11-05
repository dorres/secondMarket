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
	
	//ㅂ
	@RequestMapping("/infoModify2.do")
	public String modifyUser(UserVO user, Model model) {
		String securityPw = null;
		// 1. DB에서 사용자 정보를 가지고 온다.
		UserVO userVo = infoModifyService.getUserData(user);
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
	public String updateProc(UserVO userVo, Model model) {
		// 1. 비밀번호 변경 유무판별 ( NULL로 판별 )
		// 2. 수정이 됐으면 암호화
		// end. 쿼리문 실행
		return "mykurly/index";
	}
}