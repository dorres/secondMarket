package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.vo.BannerVO;
import first.market.kurlyty.vo.CategoryMainVO;
import first.market.kurlyty.vo.ProductVO;

@Repository
public class HeaderDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<ProductVO> getProduct(ProductVO product) {
		return sqlSession.selectList("CategoryDAO.getCategoryProductList",product);
	}
	public List<CategoryMainVO> getCategoryMain(){
		return sqlSession.selectList("CategoryDAO.getCategoryMain");
	}
	public List<BannerVO> getBanner(){
		return sqlSession.selectList("CategoryDAO.getBanner");
	}
}
