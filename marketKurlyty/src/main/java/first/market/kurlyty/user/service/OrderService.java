package first.market.kurlyty.user.service;

import first.market.kurlyty.vo.OrderVO;

public interface OrderService {

	void insertOrder(OrderVO order);

	void insertOrderDetails(OrderVO order);

}