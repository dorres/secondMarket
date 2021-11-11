package first.market.kurlyty.user.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import first.market.kurlyty.user.service.CartService;
import first.market.kurlyty.user.service.UserService;
import first.market.kurlyty.user.vo.CartVO;
import first.market.kurlyty.user.vo.UserVO;

@Controller
@SessionAttributes({"userId","userName"})
public class UserLoginController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private CartService cartService;
	
	@GetMapping("/login.do")
	public String login() {
		return "login_and_join/login";
	}
	
	//�α��� ó��
	@PostMapping("/login.do")
	public String login(UserVO user, Model model, RedirectAttributes redirect, HttpServletRequest request) {
		String securityPw = null;
		//db�� ��ϵ� ȸ�� ��й�ȣ�� �������
		// �̶� ������� ��й�ȣ�� ��ȣȭ��
		UserVO userInfo = userService.loginGetUser(user);
		if(userInfo==null) {
			redirect.addFlashAttribute("FailMessage","�������� �ʴ� ȸ�������Դϴ�. �ٽ� �Է����ּ���");
			return "redirect:login.do";
		}
		String dbPw = userInfo.getUser_pw();
		
		//������ �Է��� ��й�ȣ�� ��ȣȭ ��Ŵ
		try {
			securityPw = SecurityUtil.sha256(user.getUser_pw());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		if(dbPw.equals(securityPw)) {
			//session.setAttribute("userId",user.getUser_id());
			HttpSession session = request.getSession();
			@SuppressWarnings("unchecked")
			List<CartVO> tempCartList = (List<CartVO>) session.getAttribute("cartList");
			if(tempCartList!=null) {
				if(tempCartList.size()>0) {
					List<CartVO> myCartList = cartService.getCartList(user.getUser_id());
					
					for(CartVO cartItem : tempCartList) {
						cartItem.setUser_id(user.getUser_id());
						boolean overlap=cartService.overlapCartItem(myCartList, cartItem);
						if(!overlap)cartService.insertCartItem(cartItem);
					}
				}
				session.removeAttribute("cartList");
			}
			model.addAttribute("userId",user.getUser_id());
			model.addAttribute("userName", userInfo.getUser_name());
			return "mainPage/index";
		}else {
			redirect.addFlashAttribute("FailMessage", "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է����ּ���.");
			return "redirect:login.do";
		}
	}
	
	//�α׾ƿ� ó��
	@RequestMapping("/logoutProc.do")
	public String logout(SessionStatus sessionStatus) {
		userService.logout(sessionStatus);
		return "redirect:index.do";
	}
	
	@RequestMapping("/kakaoLogin.do")
	public String KakaoLogin(String kakaoId, String kakaoEmail, String kakaoNickName, Model model) {
		UserVO user = new UserVO();
		user.setUser_id(kakaoId);
		UserVO userInfo = userService.loginGetUser(user);
		if(userInfo==null) {
			model.addAttribute("KakaoJoin",true);
			model.addAttribute("kakaoId",kakaoId);
			model.addAttribute("kakaoEmail",kakaoEmail);
			model.addAttribute("kakaoNickName",kakaoNickName);
			return "login_and_join/join";
		}else {
			model.addAttribute("userId",kakaoId);
			model.addAttribute("userName",userInfo.getUser_name());
			return "redirect:index.do";	
		}
	}
}

