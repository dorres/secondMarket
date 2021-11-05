package first.market.kurlyty.user.controller;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import first.market.kurlyty.user.service.UserService;
import first.market.kurlyty.user.vo.UserVO;

@Controller
@SessionAttributes({"userId","userName"})
public class UserLoginController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/login.do")
	public String login() {
		return "login_and_join/login";
	}
	
	//로그인 처리
	@PostMapping("/login.do")
	public String login(UserVO user, Model model, RedirectAttributes redirect) {
		String securityPw = null;
		//db에 등록된 회원 비밀번호를 가지고옴
		// 이때 가지고온 비밀번호는 암호화임
		UserVO userInfo = userService.loginGetUser(user);
		if(userInfo==null) {
			redirect.addFlashAttribute("FailMessage","존재하지 않는 회원정보입니다. 다시 입력해주세요");
			return "redirect:login.do";
		}
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
			model.addAttribute("userName", userInfo.getUser_name());
			return "mainPage/index";
		}else {
			redirect.addFlashAttribute("FailMessage", "비밀번호가 틀렸습니다. 다시 입력해주세요.");
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

