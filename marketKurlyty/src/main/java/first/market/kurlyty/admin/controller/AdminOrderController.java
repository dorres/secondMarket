package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminOrderVO;

@Controller
public class AdminOrderController {

		@Autowired
		private AdminService adminService;
		
		//주문관리 결제완료 리스트
		@RequestMapping("admin_orderWaitList.mdo")
		public String orderWaitList(Model model) {
			model.addAttribute("orderWaitList",adminService.getOrderWaitList());
			return "order/admin_orderWaitList";
		}
		//주문관리 결제완료 세부사항
		@RequestMapping("admin_orderWait.mdo")
		public String orderWait(Model model, AdminOrderVO order) {
			model.addAttribute("shippingInfo",adminService.getShippingInfo(order));
			model.addAttribute("orderWait",adminService.getOrderWait(order));
			return "order/admin_orderWait";
		}
		//주문관리 결제완료 삭제
		//주문관리 결제완료	수정
		
		
		
		//주문관리 구매완료 리스트
		@RequestMapping("admin_orderFinishList.mdo")
		public String orderFinishList(Model model) {
			return "order/admin_orderFinishList";
		}		
		//주문관리 구매완료 세부사항
		//주문관리 구매완료 삭제
		//주문관리 구매완료 수정
}
