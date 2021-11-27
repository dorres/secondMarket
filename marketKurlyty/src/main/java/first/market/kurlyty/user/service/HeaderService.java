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
	List<ProductVO> getNewGoods();
	List<ProductVO> getSearchGoods(String searchKeyword);
}