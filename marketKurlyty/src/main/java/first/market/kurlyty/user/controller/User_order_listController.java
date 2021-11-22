package first.market.kurlyty.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import first.market.kurlyty.user.service.User_order_listService;
import first.market.kurlyty.user.vo.Board_Pagination;
import first.market.kurlyty.user.vo.ShippingVO;
import first.market.kurlyty.user.vo.User_order_listVO;

@Controller
public class User_order_listController {
	@Autowired
	private User_order_listService user_order_listService;
	@RequestMapping("/order.do")
	public String order(HttpSession session, User_order_listVO vo, Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			) throws Exception {
		String user_id=(String)session.getAttribute("userId");	
		int listCnt = user_order_listService.getBoardListCnt();
		
		Board_Pagination pagination = new Board_Pagination();
	    
		pagination.pageInfo(page, range, listCnt);	
				
		model.addAttribute("pagination", pagination);
		model.addAttribute("order",user_order_listService.getBoard(user_id,pagination));
		return "mykurly/order";
	}
	@RequestMapping("/order_detail.do")
	public String odrer2(HttpServletRequest request,ShippingVO svo,User_order_listVO vo, Model model) throws Exception {
		
		
		model.addAttribute("shipping", user_order_listService.getShipping(svo));
		model.addAttribute("detail",user_order_listService.getDetail(vo));		
		model.addAttribute("dp", user_order_listService.dcPrice(svo.getOrder_merchant_serial()));
		model.addAttribute("op", user_order_listService.oldPrice(svo.getOrder_merchant_serial()));
		model.addAttribute("point",user_order_listService.point(svo.getOrder_merchant_serial()));
		 
		
		return "mykurly/order_detail";
	}
}
