package first.market.kurlyty.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import first.market.kurlyty.user.service.CartService;
import first.market.kurlyty.user.vo.CartVO;
import first.market.kurlyty.vo.ProductVO;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
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
					//productList.add(product);
					if(product.getCategory_goods_packaging_type().equals("³ÃÀå")) {
						product.setGoods_cart_count(cartItem.getGoods_cart_count());
						coldList.add(product);
					}else if(product.getCategory_goods_packaging_type().equals("³Ãµ¿")) {
						product.setGoods_cart_count(cartItem.getGoods_cart_count());
						frozenList.add(product);
					}else if(product.getCategory_goods_packaging_type().equals("½Ç¿Â")) {
						product.setGoods_cart_count(cartItem.getGoods_cart_count());
						roomList.add(product);
					}
					totalPrice=totalPrice+product.getGoods_cart_count()*product.getGoods_detail_price();
					dcPrice=dcPrice+product.getGoods_cart_count()*product.getGoods_last_price();
				}
				if(frozenList.size()>0)model.addAttribute("frozenList",frozenList);
				if(coldList.size()>0)model.addAttribute("coldList",coldList);
				if(roomList.size()>0)model.addAttribute("roomList",roomList);
				System.out.println(totalPrice);
				model.addAttribute("totalPrice",totalPrice);
				model.addAttribute("dcPrice",dcPrice);
			}
		}else {
			List<CartVO> cartList = cartService.getCartList((String)session.getAttribute("userId"));
			//List<ProductVO> productList = new ArrayList<ProductVO>();
			List<ProductVO> coldList = new ArrayList<ProductVO>();
			List<ProductVO> frozenList = new ArrayList<ProductVO>();
			List<ProductVO> roomList = new ArrayList<ProductVO>();
			for(CartVO cartItem : cartList) {
				ProductVO product = cartService.getCartItem(cartItem);
				//productList.add(product);
				if(product.getCategory_goods_packaging_type().equals("³ÃÀå")) {
					product.setGoods_cart_count(cartItem.getGoods_cart_count());
					coldList.add(product);
				}else if(product.getCategory_goods_packaging_type().equals("³Ãµ¿")) {
					product.setGoods_cart_count(cartItem.getGoods_cart_count());
					frozenList.add(product);
				}else if(product.getCategory_goods_packaging_type().equals("½Ç¿Â")) {
					product.setGoods_cart_count(cartItem.getGoods_cart_count());
					roomList.add(product);
				}
				totalPrice+=product.getGoods_cart_count()*product.getGoods_detail_price();
				dcPrice+=product.getGoods_cart_count()*product.getGoods_last_price();
			}
			if(frozenList.size()>0)model.addAttribute("frozenList",frozenList);
			if(coldList.size()>0)model.addAttribute("coldList",coldList);
			if(roomList.size()>0)model.addAttribute("roomList",roomList);
			System.out.println(totalPrice);
			model.addAttribute("totalPrice",totalPrice);
			model.addAttribute("dcPrice",dcPrice);
		}
		return "cart_and_payment/cart";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/cartInput.do",produces="html/text; charset=utf-8")
	@ResponseBody
	public String cartInput(HttpServletRequest request,CartVO cartVO) {
		HttpSession session = request.getSession();
		boolean overlap=false;
		if(session.getAttribute("userId")==null) {
			if(session.getAttribute("cartList")==null) {
				session.setAttribute("cartList",new ArrayList<CartVO>());
			}
			ArrayList<CartVO> cartList = (ArrayList<CartVO>)session.getAttribute("cartList");
			for(CartVO cartItem:cartList) {
				if(cartItem.getCategory_goods_serial()==cartVO.getCategory_goods_serial()) {
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
			overlap=cartService.overlapCartItem(cartList, cartVO);
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
	public String deleteCount(CartVO cartVO, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("userId")==null) {
			ArrayList<CartVO> cartList = (ArrayList<CartVO>)session.getAttribute("cartList");
			for(CartVO cartItem:cartList) {
				if(cartItem.getCategory_goods_serial()==cartVO.getCategory_goods_serial()) {
					cartList.remove(cartItem);
					return String.valueOf(cartVO.getCategory_goods_serial());
				}
			}
		}else {
			cartService.deleteCartItem(cartVO);
		}
		return String.valueOf(cartVO.getCategory_goods_serial());
	}
}

