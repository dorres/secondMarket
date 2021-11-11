package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.CartVO;
import first.market.kurlyty.vo.ProductVO;

@Repository
public class CartDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<CartVO> getCartList(String userId){
		return sqlSession.selectList("CategoryDAO.getCartList",userId);
	}
	public ProductVO getCartItem(CartVO cartVO) {
		return sqlSession.selectOne("CategoryDAO.getCartItem",cartVO);
	}
	public void insertCartItem(CartVO cartVO) {
		sqlSession.insert("CategoryDAO.insertCartItem",cartVO);
	}
}
