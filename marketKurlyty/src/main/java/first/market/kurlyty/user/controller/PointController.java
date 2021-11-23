package first.market.kurlyty.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.user.service.PointService;
import first.market.kurlyty.user.vo.User_order_listVO;

@Controller
public class PointController {

	@Autowired
	private PointService pointservice;
	HttpSession session;
	
	@RequestMapping("/point.do")
	public String point(HttpSession session,User_order_listVO vo,Model model) {
		String user_id = (String)session.getAttribute("userId");
		Integer tp = (Integer)pointservice.totalPoint(user_id) == null ? 0:pointservice.totalPoint(user_id);
		
		model.addAttribute("point",pointservice.pointList(user_id));
		model.addAttribute("totalPoint", tp);
		return "mykurly/point";
	}

}
