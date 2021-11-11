package first.market.kurlyty.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
		if(session.getAttribute("userId")==null) {
			System.out.println("1ck");
			if(session.getAttribute("cartList")!=null) {
				System.out.println("2ck");
				ArrayList<CartVO> cartList = (ArrayList<CartVO>)session.getAttribute("cartList");
				//List<ProductVO> productList = new ArrayList<ProductVO>();
				List<ProductVO> coldList = new ArrayList<ProductVO>();
				List<ProductVO> frozenList = new ArrayList<ProductVO>();
				List<ProductVO> roomList = new ArrayList<ProductVO>();
				for(CartVO cartItem : cartList) {
					ProductVO product = cartService.getCartItem(cartItem);
					//productList.add(product);
					if(product.getCategory_goods_packaging_type().equals("냉장")) {
						product.setGoods_cart_count(cartItem.getGoods_cart_count());
						coldList.add(product);
					}else if(product.getCategory_goods_packaging_type().equals("냉동")) {
						product.setGoods_cart_count(cartItem.getGoods_cart_count());
						frozenList.add(product);
					}else if(product.getCategory_goods_packaging_type().equals("실온")) {
						product.setGoods_cart_count(cartItem.getGoods_cart_count());
						roomList.add(product);
					}
				}
				if(frozenList.size()>0)model.addAttribute("frozenList",frozenList);
				if(coldList.size()>0)model.addAttribute("coldList",coldList);
				if(roomList.size()>0)model.addAttribute("roomList",roomList);
			}
		}else {
			List<CartVO> cartList = cartService.getCartList((String)session.getAttribute("userId"));
			List<ProductVO> productList = new ArrayList<ProductVO>();
			for(CartVO cartItem : cartList) {
				ProductVO product = cartService.getCartItem(cartItem);
				productList.add(product);
			}
			model.addAttribute("myCartList", productList);
			model.addAttribute("cartCount",cartList);
		}
		return "cart_and_payment/cart";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/cartInput.do")
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
			CartVO item = cartVO;
			item.setUser_id((String)session.getAttribute("userId"));
			cartService.insertCartItem(item);
		}
		/*
		 * ArrayList<CartVO> cart = (ArrayList<CartVO>)session.getAttribute("cartList");
		 * for(CartVO list : cart) {
		 * System.out.println(list.getCategory_goods_serial());
		 * System.out.println(list.getGoods_cart_count()); }
		 */
		return "redirect:index.do";
	}
}

