package first.market.kurlyty.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import first.market.kurlyty.user.service.CartService;
import first.market.kurlyty.user.service.MembershipService;
import first.market.kurlyty.user.service.OrderService;
import first.market.kurlyty.user.service.UserService;
import first.market.kurlyty.user.vo.CartVO;
import first.market.kurlyty.user.vo.MembershipVO;
import first.market.kurlyty.user.vo.UserVO;
import first.market.kurlyty.vo.OrderVO;
import first.market.kurlyty.vo.ProductVO;

@Controller
public class PaymentController {
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private MembershipService membershipService;
	
	private IamportClient api;
	
	public PaymentController() {
		this.api=new IamportClient("2480500976074823",
				"3fa08672e435742e0be18acb31c3c1624cb054d55c8359c12688d9551b4f09bbbd06b78b2efe9881");
	}
	
	@ResponseBody
	@RequestMapping("/iamport.do")
	public IamportResponse<Payment> paymentByImUid(Model model, Locale locale, HttpSession session,
			@RequestParam(value="imp_uid")String imp_uid) throws IamportResponseException, IOException{
		System.out.println(imp_uid);
		System.out.println(api.paymentByImpUid(imp_uid));
		Map<String,String> payMap = new HashMap<String,String>();
		payMap.put("Uid", api.paymentByImpUid(imp_uid).getResponse().getMerchantUid());
		payMap.put("amount",api.paymentByImpUid(imp_uid).getResponse().getAmount().toString());
		payMap.put("payType", api.paymentByImpUid(imp_uid).getResponse().getPayMethod());
		payMap.put("payStatus", api.paymentByImpUid(imp_uid).getResponse().getStatus());
		return api.paymentByImpUid(imp_uid);
//		System.out.println(new Gson().toJson(payMap));
//		
//		return new Gson().toJson(payMap);
	}
	
	@RequestMapping("/paymentPage.do")
	public String paymentPage(int totalPrice,int dcPrice, Model model, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		UserVO userVO = new UserVO();
		userVO.setUser_id(userId);
		List<CartVO> purchaseGoods = cartService.getPurchaseGoods(userId);
		List<ProductVO> purchaseList = new ArrayList<ProductVO>();
		
		UserVO userInfo = userService.getUser(userVO);
		String membership = membershipService.getMembershipOfUser(userId);
		System.out.println(membership);
		MembershipVO membershipInfo = membershipService.getMembershipData(membership);
		for(CartVO goods:purchaseGoods) {
			ProductVO product = cartService.getCartItem(goods);
			product.setGoods_cart_count(goods.getGoods_cart_count());
			purchaseList.add(product);
		}
		model.addAttribute("orderPrice", dcPrice);
		model.addAttribute("goodsPrice",totalPrice);
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("userInfo",userInfo);
		model.addAttribute("membershipInfo",membershipInfo);
		return "cart_and_payment/payment";
	}
	
	@RequestMapping("/paymentSuccess.do")
	@ResponseBody
	public String paymentSuccess(OrderVO order) {
		System.out.println(order.getUser_id());
		order.setOrder_delivery_status("결제완료");
		orderService.insertOrder(order);
		List<CartVO> purchaseGoods = cartService.getPurchaseGoods(order.getUser_id());
		for(CartVO cartItem : purchaseGoods) {
			ProductVO productInfo = cartService.getCartItem(cartItem);
			int goods_price = cartItem.getGoods_cart_count()*productInfo.getGoods_last_price();
			order.setGoods_count(cartItem.getGoods_cart_count());
			order.setGoods_price(goods_price);
			order.setCategory_goods_serial(cartItem.getCategory_goods_serial());
			orderService.insertOrderDetails(order);
			cartService.deleteCartItem(cartItem);
		}
		return "index.do";
	}
	
	@RequestMapping("/shippingInfo.do")
	public String shippingInfo(String userName, String phone, Model model) {
		model.addAttribute("userName",userName);
		model.addAttribute("phone",phone);
		return "cart_and_payment/shippingInfo";
	}
}
