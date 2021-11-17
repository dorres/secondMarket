package first.market.kurlyty.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.CartDAO;
import first.market.kurlyty.user.vo.CartVO;
import first.market.kurlyty.user.vo.user_address_listVO;
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
	@Override
	public void updateCartItem(CartVO cartVO) {
		cartDao.updateCartItem(cartVO);
	}
	@Override
	public boolean overlapCartItem(List<CartVO> cartList, CartVO cartVO) {
		CartVO item = new CartVO();
		for(CartVO cartItem:cartList) {
			if(cartItem.getCategory_goods_serial()==cartVO.getCategory_goods_serial()) {
				item=cartItem;
				item.setGoods_cart_count(cartItem.getGoods_cart_count()+cartVO.getGoods_cart_count());
				cartDao.updateCartItem(item);
				return true;
			}
		}
		return false;
	}
	@Override
	public void deleteCartItem(CartVO cartVO) {
		cartDao.deleteCartItem(cartVO);
	}
	@Override
	public user_address_listVO getDefaultAddress(String userId) {
		return cartDao.getDefaultAddress(userId);
	}
	@Override
	public void allCheckItem(CartVO cartVO) {
		cartDao.allCheckItem(cartVO);
	}
	@Override
	public void updateCheckStatus(CartVO cartVO) {
		cartDao.updateCheckStatus(cartVO);
	}
	@Override
	public List<CartVO> getPurchaseGoods(String userId) {
		return cartDao.getPurchaseGoods(userId);
	}
}
