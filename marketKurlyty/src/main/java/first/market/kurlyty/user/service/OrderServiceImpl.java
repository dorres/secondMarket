package first.market.kurlyty.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.CartDAO;
import first.market.kurlyty.user.dao.OrderDAO;
import first.market.kurlyty.user.vo.CartVO;
import first.market.kurlyty.user.vo.GoodsStockVO;
import first.market.kurlyty.user.vo.ShippingVO;
import first.market.kurlyty.user.vo.UserDetailsVO;
import first.market.kurlyty.vo.OrderVO;
import first.market.kurlyty.vo.ProductVO;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDAO orderDao;
	@Autowired
	private CartDAO cartDao;
	
	@Override
	public void insertOrder(OrderVO order) {
		orderDao.insertOrder(order);
	}
	@Override
	public void insertOrderDetails(OrderVO order) {
		orderDao.insertOrderDetails(order);
	}
	@Override
	public void updateUserPurchase(UserDetailsVO userDetail) {
		orderDao.updateUserPurchase(userDetail);
	}
	@Override
	public UserDetailsVO getUserDetails(String user_id) {
		return orderDao.getUserDetails(user_id);
	}
	@Override
	public void insertShippingInfo(ShippingVO shipping) {
		orderDao.insertShippingInfo(shipping);
	}
	@Override
	public void reduceGoodsStock(GoodsStockVO stock) {
		List<GoodsStockVO> stockList = orderDao.getGoodsStocks(stock.getCategory_goods_serial());
		GoodsStockVO reduceStock = new GoodsStockVO();
		reduceStock.setGoods_stock_stock_quantity(stock.getGoods_stock_stock_quantity());
		
		for(GoodsStockVO stockItem : stockList) {
			System.out.println(reduceStock.getGoods_stock_stock_quantity());
			if(stockItem.getGoods_stock_stock_quantity()>=reduceStock.getGoods_stock_stock_quantity()) {
				int beforeStock=stockItem.getGoods_stock_stock_quantity();
				int reduceCount = reduceStock.getGoods_stock_stock_quantity();
				reduceStock.setGoods_stock_serial(stockItem.getGoods_stock_serial());
				reduceStock.setGoods_stock_stock_quantity(beforeStock-reduceCount);
				orderDao.reduceStock(reduceStock);
				break;
			}else {
				reduceStock.setGoods_stock_stock_quantity(reduceStock.getGoods_stock_stock_quantity()-stockItem.getGoods_stock_stock_quantity());
				stockItem.setGoods_stock_stock_quantity(0);
				orderDao.reduceStock(stockItem);
				
			}
		}
		CartVO cartGoods = new CartVO();
		cartGoods.setCategory_goods_serial(stock.getCategory_goods_serial());
		ProductVO detailStock = cartDao.getGoodsStock(cartGoods);
		detailStock.setGoods_detail_stock_quantity(detailStock.getGoods_detail_stock_quantity()-stock.getGoods_stock_stock_quantity());
		orderDao.reduceDetailStock(detailStock);
	}
}
