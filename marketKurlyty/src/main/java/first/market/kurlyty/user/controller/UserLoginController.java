package first.market.kurlyty.user.controller;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import first.market.kurlyty.user.service.UserService;
import first.market.kurlyty.user.vo.UserVO;

@Controller
@SessionAttributes("userId")
public class UserLoginController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/login.do")
	public String login() {
		return "login_and_join/login";
	}
	
	//로그인 처리
	@RequestMapping("/loginProc.do")
	public String login(HttpSession session, UserVO user, Model model) {
		String securityPw = null;
		//db에 등록된 회원 비밀번호를 가지고옴
		// 이때 가지고온 비밀번호는 암호화임
		UserVO userInfo = userService.loginGetUser(user);
		String dbPw = userInfo.getUser_pw();
		
		//유저가 입력한 비밀번호를 암호화 시킴
		try {
			securityPw = SecurityUtil.sha256(user.getUser_pw());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		if(dbPw.equals(securityPw)) {
			//session.setAttribute("userId",user.getUser_id());
			model.addAttribute("userId",user.getUser_id());
			return "mainPage/index";	
		}else {
			return "redirect:login.do";
		}
	}
	
	//로그아웃 처리
	@RequestMapping("/logoutProc.do")
	public String logout(SessionStatus sessionStatus) {
		userService.logout(sessionStatus);
		return "redirect:index.do";
	}

}

