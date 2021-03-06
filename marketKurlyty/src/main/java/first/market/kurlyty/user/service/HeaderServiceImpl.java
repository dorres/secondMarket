package first.market.kurlyty.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.HeaderDAO;
import first.market.kurlyty.vo.BannerVO;
import first.market.kurlyty.vo.CategoryMainVO;
import first.market.kurlyty.vo.ProductVO;

@Service
public class HeaderServiceImpl implements HeaderService {
	@Autowired
	private HeaderDAO headerDao;
	
	@Override
	public List<ProductVO> getCategoryProduct(ProductVO product){
		return headerDao.getProduct(product);
	}

	@Override
	public List<CategoryMainVO> getCategoryMain() {
		return headerDao.getCategoryMain();
	}

	@Override
	public List<BannerVO> getBanner() {
		return headerDao.getBanner();
	}

	@Override
	public List<ProductVO> getHotDealProduct() {
		return headerDao.getHotDeal();
	}

	@Override
	public List<ProductVO> getNewGoods() {
		return headerDao.getNewGoods();
	}
	@Override
	public List<ProductVO> getNewGoodsPage(String sort) {
		return headerDao.getNewGoodsPage(sort);
	}
	@Override
	public List<ProductVO> getSearchGoods(String searchKeyword) {
		return headerDao.getSearch(searchKeyword);
	}

	@Override
	public List<ProductVO> getAltlePage(String sort) {
		return headerDao.getAltlePage(sort);
	}

	@Override
	public List<ProductVO> getBestPage(String sort) {
		return headerDao.getBestPage(sort);
	}

	
}
