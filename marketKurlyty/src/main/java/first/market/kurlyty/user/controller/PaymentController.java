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

import com.google.gson.Gson;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;

import first.market.kurlyty.user.service.CartService;
import first.market.kurlyty.user.service.UserService;
import first.market.kurlyty.user.vo.CartVO;
import first.market.kurlyty.user.vo.UserVO;
import first.market.kurlyty.vo.OrderVO;
import first.market.kurlyty.vo.ProductVO;

@Controller
public class PaymentController {
	@Autowired
	private CartService cartService;
	@Autowired
	private UserService userService;
	
	private IamportClient api;
	
	public PaymentController() {
		this.api=new IamportClient("2480500976074823",
				"3fa08672e435742e0be18acb31c3c1624cb054d55c8359c12688d9551b4f09bbbd06b78b2efe9881");
	}
	
	@ResponseBody
	@RequestMapping("/iamport.do")
	public String paymentByImUid(Model model, Locale locale, HttpSession session,
			@RequestParam(value="imp_uid")String imp_uid) throws IamportResponseException, IOException{
		System.out.println(imp_uid);
		System.out.println(api.paymentByImpUid(imp_uid));
		Map<String,String> payMap = new HashMap<String,String>();
		payMap.put("Uid", api.paymentByImpUid(imp_uid).getResponse().getMerchantUid());
		payMap.put("amount",api.paymentByImpUid(imp_uid).getResponse().getAmount().toString());
		payMap.put("payType", api.paymentByImpUid(imp_uid).getResponse().getPayMethod());
		payMap.put("payStatus", api.paymentByImpUid(imp_uid).getResponse().getStatus());
		//return api.paymentByImpUid(imp_uid);
		System.out.println(new Gson().toJson(payMap));
		return new Gson().toJson(payMap);
	}
	
	@RequestMapping("/paymentPage.do")
	public String paymentPage(int totalPrice,int dcPrice, Model model, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		UserVO userVO = new UserVO();
		userVO.setUser_id(userId);
		List<CartVO> purchaseGoods = cartService.getPurchaseGoods(userId);
		List<ProductVO> purchaseList = new ArrayList<ProductVO>();
		for(CartVO goods:purchaseGoods) {
			ProductVO product = cartService.getCartItem(goods);
			product.setGoods_cart_count(goods.getGoods_cart_count());
			purchaseList.add(product);
		}
		model.addAttribute("orderPrice", dcPrice);
		model.addAttribute("goodsPrice",totalPrice);
		model.addAttribute("purchaseList", purchaseList);
		model.addAttribute("userInfo",userService.getUser(userVO));
		return "cart_and_payment/payment";
	}
	
	@RequestMapping("/paymentSuccess.do")
	@ResponseBody
	public String paymentSuccess(OrderVO order) {
		System.out.println(order.getUser_id());
		System.out.println(order.getUser_name());
		System.out.println(order.getUser_email());
		System.out.println(order.getUser_phone());
		System.out.println(order.getUser_address1());
		System.out.println(order.getUser_address2());
		System.out.println(order.getUser_zipcode());
		
		return "redirect:index.do";
	}
}
