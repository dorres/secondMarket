package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.GoodsStockVO;
import first.market.kurlyty.user.vo.ShippingVO;
import first.market.kurlyty.user.vo.UserDetailsVO;
import first.market.kurlyty.vo.OrderVO;
import first.market.kurlyty.vo.ProductVO;

@Repository
public class OrderDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertOrder(OrderVO order) {
		sqlSession.insert("orderDAO.insertOrder",order);
	}
	public void insertOrderDetails(OrderVO order) {
		sqlSession.insert("orderDAO.insertOrderDetail", order);
	}
	public void updateUserPurchase(UserDetailsVO userDetail) {
		sqlSession.update("orderDAO.updateUserPurchase", userDetail);
	}
	public UserDetailsVO getUserDetails(String user_id) {
		return sqlSession.selectOne("orderDAO.getUserDetails", user_id);
	}
	public void insertShippingInfo(ShippingVO shipping) {
		sqlSession.insert("orderDAO.insertShippingInfo",shipping);
	}
	public List<GoodsStockVO> getGoodsStocks(int goodsSerial){
		return sqlSession.selectList("orderDAO.getGoodsStocks",goodsSerial);
	}
	public void reduceDetailStock(ProductVO goodsStock) {
		sqlSession.update("orderDAO.reduceDetailStock", goodsStock);
	}
	public void reduceStock(GoodsStockVO goodsStock) {
		sqlSession.update("orderDAO.reduceStock", goodsStock);
	}
}
