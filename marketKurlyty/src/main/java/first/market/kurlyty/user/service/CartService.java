package first.market.kurlyty.user.service;

import java.util.List;

import first.market.kurlyty.user.vo.CartVO;
import first.market.kurlyty.user.vo.user_address_listVO;
import first.market.kurlyty.vo.ProductVO;

public interface CartService {

	List<CartVO> getCartList(String userId);
	ProductVO getCartItem(CartVO cartVO);
	void insertCartItem(CartVO cartVO);
	void updateCartItem(CartVO cartVO);
	void deleteCartItem(CartVO cartVO);
	boolean overlapCartItem(List<CartVO> cartList, CartVO cartVO)throws IllegalArgumentException ; 
	user_address_listVO getDefaultAddress(String userId);
	void allCheckItem(CartVO cartVO);
	void updateCheckStatus(CartVO cartVO);
	List<CartVO> getPurchaseGoods(String userId);
	Boolean isStock(CartVO cartVO);
}