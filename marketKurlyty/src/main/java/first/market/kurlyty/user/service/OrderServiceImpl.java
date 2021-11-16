package first.market.kurlyty.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.OrderDAO;
import first.market.kurlyty.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDao;
	@Override
	public void insertOrder(OrderVO order) {
		orderDao.insertOrder(order);
	}
	@Override
	public void insertOrderDetails(OrderVO order) {
		orderDao.insertOrderDetails(order);
	}
}
