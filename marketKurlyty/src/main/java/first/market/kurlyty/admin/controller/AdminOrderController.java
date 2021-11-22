package first.market.kurlyty.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.AdminOrderVO;
import first.market.kurlyty.admin.vo.AdminShippingInfoVO;

@Controller
public class AdminOrderController {

		@Autowired
		private AdminService adminService;
		
		//�ֹ����� �����Ϸ� ����Ʈ
		@RequestMapping("admin_orderWaitList.mdo")
		public String orderWaitList(Model model) {
			model.addAttribute("orderWaitList",adminService.getOrderWaitList());
			return "order/admin_orderWaitList";
		}
		//�ֹ����� �����Ϸ� ���λ���
		@RequestMapping("admin_orderWait.mdo")
		public String orderWait(Model model, AdminOrderVO order) {
			model.addAttribute("orderWait",adminService.getOrderWait(order));
			model.addAttribute("orderWaitDetail", adminService.getOrderWaitDetail(order));
			model.addAttribute("shippingInfo",adminService.getShippingInfo(order));

			return "order/admin_orderWait";
		}
		//�ֹ����� �����Ϸ�(�޴»��) ����
		@ResponseBody
		@RequestMapping("admin_shippingInfoUpdate.mdo")
		public int shippingInfoUpdate(AdminShippingInfoVO shipping) {
			int success = 0;
			success =adminService.updateShippingInfo(shipping);
			return success;	
		}
		
		//�ֹ����� �����Ϸ�(����غ���,�����, ��ۿϷ� ���� ����)Update
		@ResponseBody
		@RequestMapping("admin_orderWaitUpdate.mdo")
		public int orderWaitUpdate(AdminOrderVO order) {
			int success = 0;
			System.out.println(order.getOrder_merchant_serial());
			System.out.println(order.getOrder_delivery_status());
			success =adminService.updateOrderWait(order);
			return success;
		}
		
		
		//�ֹ����� ���ſϷ� ����Ʈ
		@RequestMapping("admin_orderFinishList.mdo")
		public String orderFinishList(Model model) {
			return "order/admin_orderFinishList";
		}		
		//�ֹ����� ���ſϷ� ���λ���
		//�ֹ����� ���ſϷ� ����
		//�ֹ����� ���ſϷ� ����
}
