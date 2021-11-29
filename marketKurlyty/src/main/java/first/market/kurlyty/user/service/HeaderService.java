package first.market.kurlyty.user.service;

import java.util.List;

import first.market.kurlyty.vo.BannerVO;
import first.market.kurlyty.vo.CategoryMainVO;
import first.market.kurlyty.vo.ProductVO;

public interface HeaderService {

	List<ProductVO> getCategoryProduct(ProductVO product);
	List<CategoryMainVO> getCategoryMain();
	List<BannerVO> getBanner();
	List<ProductVO> getHotDealProduct();
	List<ProductVO> getAltlePage(String sort);
	List<ProductVO> getNewGoods();
	List<ProductVO> getNewGoodsPage(String sort);
	List<ProductVO> getBestPage(String sort);
	List<ProductVO> getSearchGoods(String searchKeyword);
}