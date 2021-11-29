package first.market.kurlyty.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.user.service.MyKurlytyServe;
import first.market.kurlyty.user.vo.UserDetailsVO;

@Controller
public class MykulryController {
	@Autowired
	private MyKurlytyServe myService;

	@RequestMapping(value="getMyInfo.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public UserDetailsVO getMyInfo(HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		return myService.getMyInfo(userId);
	}
}
