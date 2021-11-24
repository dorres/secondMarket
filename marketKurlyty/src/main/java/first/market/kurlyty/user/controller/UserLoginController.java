package first.market.kurlyty.user.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
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

import first.market.kurlyty.emailsend.EmailSend;
import first.market.kurlyty.emailsend.EmailSendVO;
import first.market.kurlyty.user.service.CartService;
import first.market.kurlyty.user.service.UserService;
import first.market.kurlyty.user.vo.CartVO;
import first.market.kurlyty.user.vo.UserDetailsVO;
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
	
	//로그인 처리
	@PostMapping("/login.do")
	public String login(UserVO user, Model model, RedirectAttributes redirect, HttpServletRequest request) {
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
			return "redirect:index.do";
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
	
	@GetMapping("/idFind.do")
	public String findIdPage(Model model) {
		model.addAttribute("type","get");
		return "login_and_join/idFind";
	}
	@PostMapping("/idFind.do")
	public String findIdProc(UserVO user, Model model) {
		String id=userService.idFind(user);
		model.addAttribute("findId",id);
		model.addAttribute("type","post");
		return "login_and_join/idFind";
	}
	@GetMapping("/pwFind.do")
	public String pwFindPage(Model model) {
		model.addAttribute("type","get");
		return "login_and_join/pwFind";
	}
	@PostMapping("/pwFind.do")
	public String pwFindProc(UserVO user,Model model) {
		String email=userService.pwFind(user);
		
		if(email!=null) {
			UserDetailsVO userDetail = userService.getUserStatus(user.getUser_id());
			if(userDetail==null) {
				model.addAttribute("sendPassword",false);
				model.addAttribute("type","post");
				return "login_and_join/pwFind";
			}
			System.out.println(userDetail.getUser_status());
			if(userDetail.getUser_status()==1) {
				EmailSendVO emailKey = userService.getSendEmailKey();
				SecretKey decodingKey = new SecretKeySpec(emailKey.getKey().getBytes(),"AES");
				IvParameterSpec decodingIv = new IvParameterSpec(emailKey.getIv().getBytes());
				
				try {
					String FromEmail = SecurityUtil.decrypt("AES/CBC/PKCS5Padding",
							decodingKey, decodingIv,
							emailKey.getEmail());
					String password = SecurityUtil.decrypt("AES/CBC/PKCS5Padding",
							decodingKey, decodingIv,
							  emailKey.getPassword());
					
					int random = (int) (Math.random()*10000);
					String newPassword = SecurityUtil.encrypt("AES/CBC/PKCS5Padding",
							decodingKey, decodingIv, String.valueOf(random));
					
					UserVO userVO = new UserVO();
					userVO.setUser_id(user.getUser_id());
					
					emailKey.setSendEmail(user.getUser_email());
					emailKey.setSubject("마켓컬리티 새 비밀번호 발급");
					emailKey.setContent("새 비밀번호는 "+newPassword.substring(0,8)+"입니다.");
					EmailSend.gmailSend(FromEmail, password, emailKey);
					model.addAttribute("sendEmailSuccess", true);
					
					userVO.setUser_pw(SecurityUtil.sha256(newPassword.substring(0,8)));
					userService.newPw(userVO);
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("sendEmailSuccess", false);
					model.addAttribute("sendPassword",true);
					model.addAttribute("type","post");
					return "login_and_join/pwFind";
				}
				model.addAttribute("userEmail", user.getUser_email());
				model.addAttribute("sendPassword",true);
			}else {
				model.addAttribute("sendPassword",false);
			}
		}else {
			model.addAttribute("sendPassword",false);
		}
		model.addAttribute("type","post");
		return "login_and_join/pwFind";
	}
}

