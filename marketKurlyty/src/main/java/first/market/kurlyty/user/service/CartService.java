package first.market.kurlyty.user.service;

import java.util.List;

import first.market.kurlyty.user.vo.CartVO;
import first.market.kurlyty.vo.ProductVO;

public interface CartService {

	List<CartVO> getCartList(String userId);
	ProductVO getCartItem(CartVO cartVO);
	void insertCartItem(CartVO cartVO);

}