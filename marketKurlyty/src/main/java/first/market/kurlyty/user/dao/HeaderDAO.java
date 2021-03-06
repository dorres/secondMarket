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
	public List<ProductVO> getHotDeal(){
		return sqlSession.selectList("CategoryDAO.getHotDeal");
	}
	public List<ProductVO> getAltlePage(String sort){
		return sqlSession.selectList("CategoryDAO.getAltlePage", sort);
	}
	public List<ProductVO> getNewGoods(){
		return sqlSession.selectList("CategoryDAO.getNewGoods");
	}
	public List<ProductVO> getNewGoodsPage(String sort){
		return sqlSession.selectList("CategoryDAO.getNewGoodsPage",sort);
	}
	public List<ProductVO> getBestPage(String sort){
		return sqlSession.selectList("CategoryDAO.getBestPage",sort);
	}
	
	public List<ProductVO> getSearch(String searchKeyword){
		return sqlSession.selectList("CategoryDAO.getSearchList",searchKeyword);
	}
}
