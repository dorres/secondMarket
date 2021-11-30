package first.market.kurlyty.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.user.service.CartService;
import first.market.kurlyty.user.service.user_address_listService;
import first.market.kurlyty.user.vo.CartVO;
import first.market.kurlyty.user.vo.user_address_listVO;
import first.market.kurlyty.vo.ProductVO;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private user_address_listService addressService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/cartPage.do")
	public String cartPage(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		int totalPrice  = 0;
		int dcPrice = 0;
		if(session.getAttribute("userId")==null) {
			if(session.getAttribute("cartList")!=null) {
				ArrayList<CartVO> cartList = (ArrayList<CartVO>)session.getAttribute("cartList");
				//List<ProductVO> productList = new ArrayList<ProductVO>();
				List<ProductVO> coldList = new ArrayList<ProductVO>();
				List<ProductVO> frozenList = new ArrayList<ProductVO>();
				List<ProductVO> roomList = new ArrayList<ProductVO>();
				
				for(CartVO cartItem : cartList) {
					ProductVO product = cartService.getCartItem(cartItem);
					if(cartItem.getGoods_cart_count()>product.getGoods_detail_stock_quantity())
						product.setOkStock(false);
					else product.setOkStock(true);
					//productList.add(product);
					if(product.getCategory_goods_packaging_type().contains("냉장")) {
						product.setGoods_cart_count(cartItem.getGoods_cart_count());
						coldList.add(product);
					}else if(product.getCategory_goods_packaging_type().contains("냉동")) {
						product.setGoods_cart_count(cartItem.getGoods_cart_count());
						frozenList.add(product);
					}else if(product.getCategory_goods_packaging_type().contains("상온")) {
						product.setGoods_cart_count(cartItem.getGoods_cart_count());
						roomList.add(product);
					}
					totalPrice=totalPrice+product.getGoods_cart_count()*product.getGoods_detail_price();
					dcPrice=dcPrice+product.getGoods_cart_count()*product.getGoods_last_price();
				}
				if(frozenList.size()>0)model.addAttribute("frozenList",frozenList);
				if(coldList.size()>0)model.addAttribute("coldList",coldList);
				if(roomList.size()>0)model.addAttribute("roomList",roomList);
				model.addAttribute("totalPrice",totalPrice);
				model.addAttribute("dcPrice",dcPrice);
				model.addAttribute("listSize",cartList.size());
			}
		}else {
			String userId = (String)session.getAttribute("userId");
			CartVO cartVO = new CartVO();
			cartVO.setUser_id(userId);
			cartVO.setGoods_cart_status(true);
			cartService.allCheckItem(cartVO);
			List<CartVO> cartList = cartService.getCartList(userId);
			//List<ProductVO> productList = new ArrayList<ProductVO>();
			List<ProductVO> coldList = new ArrayList<ProductVO>();
			List<ProductVO> frozenList = new ArrayList<ProductVO>();
			List<ProductVO> roomList = new ArrayList<ProductVO>();
			for(CartVO cartItem : cartList) {
				ProductVO product = cartService.getCartItem(cartItem);
				//productList.add(product);
				if(product!=null) {
					if(cartItem.getGoods_cart_count()>product.getGoods_detail_stock_quantity())
						product.setOkStock(false);
					else product.setOkStock(true);
					if(product.getCategory_goods_packaging_type().contains("냉장")) {
						product.setGoods_cart_count(cartItem.getGoods_cart_count());
						coldList.add(product);
					}else if(product.getCategory_goods_packaging_type().contains("냉동")) {
						product.setGoods_cart_count(cartItem.getGoods_cart_count());
						frozenList.add(product);
					}else if(product.getCategory_goods_packaging_type().contains("상온")) {
						product.setGoods_cart_count(cartItem.getGoods_cart_count());
						roomList.add(product);
					}
					
					totalPrice+=product.getGoods_cart_count()*product.getGoods_detail_price();
					dcPrice+=product.getGoods_cart_count()*product.getGoods_last_price();
				}
			}
			if(frozenList.size()>0)model.addAttribute("frozenList",frozenList);
			if(coldList.size()>0)model.addAttribute("coldList",coldList);
			if(roomList.size()>0)model.addAttribute("roomList",roomList);
			model.addAttribute("totalPrice",totalPrice);
			model.addAttribute("dcPrice",dcPrice);
			model.addAttribute("listSize",cartList.size());
			model.addAttribute("defaultAddress", cartService.getDefaultAddress((String)session.getAttribute("userId")));
			model.addAttribute("userId",session.getAttribute("userId"));
		}
		return "cart_and_payment/cart";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/cartInput.do",produces="html/text; charset=utf-8")
	@ResponseBody
	public String cartInput(HttpServletRequest request,CartVO cartVO) {
		HttpSession session = request.getSession();
		boolean overlap=false;
		
		if(!cartService.isStock(cartVO))
			return "재고가 부족합니다.";
		
		if(session.getAttribute("userId")==null) {
			if(session.getAttribute("cartList")==null) {
				session.setAttribute("cartList",new ArrayList<CartVO>());
			}
			ArrayList<CartVO> cartList = (ArrayList<CartVO>)session.getAttribute("cartList");
			for(CartVO cartItem:cartList) {
				if(cartItem.getCategory_goods_serial()==cartVO.getCategory_goods_serial()) {
					CartVO checkStock = new CartVO();
					checkStock.setCategory_goods_serial(cartItem.getCategory_goods_serial());
					checkStock.setGoods_cart_count(cartItem.getGoods_cart_count()+cartVO.getGoods_cart_count());
					
					if(!cartService.isStock(checkStock)) {
						return "재고가 부족합니다.";
					}
					
					cartItem.setGoods_cart_count(cartItem.getGoods_cart_count()+cartVO.getGoods_cart_count());
					overlap=true;
					break;
				}
			}
			if(!overlap)cartList.add(cartVO);
			session.setAttribute("cartList", cartList);
		}else {
			CartVO item = new CartVO();
			List<CartVO> cartList = cartService.getCartList((String)session.getAttribute("userId"));
			try {
				overlap=cartService.overlapCartItem(cartList, cartVO);
			} catch (IllegalArgumentException e) {
				return "재고가 부족합니다.";
			}
			if(!overlap){
				item=cartVO;
				item.setUser_id((String)session.getAttribute("userId"));
				cartService.insertCartItem(item);
			}
		}
		/*
		 * ArrayList<CartVO> cart = (ArrayList<CartVO>)session.getAttribute("cartList");
		 * for(CartVO list : cart) {
		 * System.out.println(list.getCategory_goods_serial());
		 * System.out.println(list.getGoods_cart_count()); }
		 */
		return "good";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/cartUpdateCount.do",produces="html/text; charset=utf-8")
	@ResponseBody
	public String updateCount(CartVO cartVO, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("userId")==null) {
			ArrayList<CartVO> cartList = (ArrayList<CartVO>)session.getAttribute("cartList");
			for(CartVO cartItem:cartList) {
				if(cartItem.getCategory_goods_serial()==cartVO.getCategory_goods_serial()) {
					cartItem.setGoods_cart_count(cartVO.getGoods_cart_count());
					return String.valueOf(cartVO.getGoods_cart_count());
				}
			}
		}else {
			cartService.updateCartItem(cartVO);
		}
		return String.valueOf(cartVO.getGoods_cart_count());
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/cartDelete.do",produces="html/text; charset=utf-8")
	@ResponseBody
	public String deleteCount(@RequestParam(value="category_goods_serial")List<Integer> category_goods_serial, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int returnSerial = 0;
		for(int serial:category_goods_serial) {
			System.out.println(serial);
			CartVO cartVO = new CartVO();
			cartVO.setCategory_goods_serial(serial);
			if(session.getAttribute("userId")==null) {
				ArrayList<CartVO> cartList = (ArrayList<CartVO>)session.getAttribute("cartList");
				for(CartVO cartItem:cartList) {
					if(cartItem.getCategory_goods_serial()==cartVO.getCategory_goods_serial()) {
						cartList.remove(cartItem);
						break;
					}
				}
			}else {
				
				cartService.deleteCartItem(cartVO);
			}
			returnSerial=cartVO.getCategory_goods_serial();
		}
		return String.valueOf(returnSerial);
	}
	
	@RequestMapping(value="/changeStatus.do",produces="html/text; charset=utf-8")
	@ResponseBody
	public String ChangeStatus(boolean multiple, CartVO cartVO,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		cartVO.setUser_id(userId);
		if(multiple) {
			cartService.allCheckItem(cartVO);
		}else {
			cartService.updateCheckStatus(cartVO);
		}
		return "";
	}
	
	@RequestMapping("/shippingAddressPage.do")
	public String ShippingAddressPage(String user_id, int addressSerial, Model model) {
		try {
			List<user_address_listVO> addressList = addressService.getBoard(user_id);
			model.addAttribute("addressList",addressList);
			model.addAttribute("addressSerial",addressSerial);
			model.addAttribute("user_id",user_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "cart_and_payment/shippingChange";
	}
}

