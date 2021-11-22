package first.market.kurlyty.user.controller;

import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import first.market.kurlyty.user.service.WithdrawService;
import first.market.kurlyty.user.vo.UserVO;
import first.market.kurlyty.user.vo.WithdrawInfoVO;

@Controller 
public class WithdrawController {
	
	@Autowired
		private WithdrawService withdrawService;
	
	@GetMapping("/withdraw.do")
		public String getUser(HttpServletRequest Request, UserVO vo, Model model) {
		HttpSession session = Request.getSession();
		vo.setUser_id((String)session.getAttribute("userId"));
		model.addAttribute("UserData", withdrawService.getUser(vo));
		return "mykurly/withdraw";
	}
// update-post(������ ������ �����Ѵ�.) delete-Request insert-Post
	
//���� - 1. ���� ����, �Է� 2. ��й�ȣ�Է� 3. Ż���ϱ��ư ������ 4. insert, update, delete
	@RequestMapping("/checkPwWithdraw.do")
		public String checkPwWithdraw(UserVO user, Model model,WithdrawInfoVO vo, RedirectAttributes redirect) {
		// 1.��й�ȣ�� Ȯ���Ѵ�	
		UserVO userVo = withdrawService.getUserData(user); 
			
			String securityPw = null;
			String dbPw = userVo.getUser_pw();
			
		//2. �Էµ� ��й�ȣ ��ȣȭ 
			try {
				securityPw = SecurityUtil.sha256(user.getUser_pw());
			}catch(NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			// 3. DB(�������� ��ȣȭ�� ��й�ȣ)�� ��ȣȭ�� ��й�ȣ�� ���Ѵ�.
			if(dbPw.equals(securityPw)) {
				redirect.addAttribute("user_withdraw_reason", vo.getUser_withdraw_reason());
				redirect.addAttribute("user_withdraw_reason_detail", vo.getUser_withdraw_reason_detail());
				
				redirect.addAttribute("user_id", user.getUser_id());
				return "redirect:withdrawProc.do";
			}
			else {
					return "mykurly/withdraw";
				}
	}
// Ȯ���� �� - 

	@RequestMapping("/withdrawProc.do")
		public String withdrawProc(HttpServletRequest Request, String user_id, WithdrawInfoVO vo, Model model) {
			int success = 0;
			System.out.println(vo.getUser_withdraw_reason());
			success = withdrawService.insertWithdraw(vo);
			success = withdrawService.updateWithdraw(user_id);
			success = withdrawService.deleteWithdrawAddressList(user_id);
			success = withdrawService.deleteWithdrawCart(user_id);
			success = withdrawService.deleteWithdrawQnaGoods(user_id);
			success = withdrawService.deleteWithdrawQnaPersonal(user_id);
			if(success !=0) {
				return "mykurly/withdraw";
			}
			else {
					return "redirect:index.do";
				}
	}
	
}
	