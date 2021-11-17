package first.market.kurlyty.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.vo.OrderVO;

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
	public void updateUserPurchase(OrderVO order) {
		sqlSession.update("orderDAO.updateUserPurchase", order);
	}
}
