package first.market.kurlyty.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.CartDAO;
import first.market.kurlyty.user.dao.HeaderDAO;
import first.market.kurlyty.user.vo.CartVO;
import first.market.kurlyty.vo.ProductVO;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDao;
	
	@Override
	public ProductVO getCartItem(CartVO cartVO) {
		ProductVO item = cartDao.getCartItem(cartVO);
		return item;
	}
	@Override
	public void insertCartItem(CartVO cartVO) {
		cartDao.insertCartItem(cartVO);
	}
	@Override
	public List<CartVO> getCartList(String userId) {
		return cartDao.getCartList(userId);
	}
}
