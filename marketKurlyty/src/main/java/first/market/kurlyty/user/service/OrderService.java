package first.market.kurlyty.user.service;

import first.market.kurlyty.user.vo.GoodsStockVO;
import first.market.kurlyty.user.vo.ShippingVO;
import first.market.kurlyty.user.vo.UserDetailsVO;
import first.market.kurlyty.vo.OrderVO;

public interface OrderService {

	void insertOrder(OrderVO order);

	void insertOrderDetails(OrderVO order);
	void updateUserPurchase(UserDetailsVO userDetail);
	UserDetailsVO getUserDetails(String user_id);
	void insertShippingInfo(ShippingVO shipping);
	void reduceGoodsStock(GoodsStockVO stock);
}