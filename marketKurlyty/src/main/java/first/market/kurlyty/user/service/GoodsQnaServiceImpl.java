package first.market.kurlyty.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.GoodsQnaDAO;
import first.market.kurlyty.user.vo.GoodsQnaVO;
import first.market.kurlyty.user.vo.ItemPageVO;
import first.market.kurlyty.user.vo.UserVO;


//CONTROLLER - service - DAO 

@Service
public class GoodsQnaServiceImpl implements GoodsQnaService {

@Autowired  
private GoodsQnaDAO goodsqnaDao;

	@Override
	public List<GoodsQnaVO> getGoodsQnaUserList(GoodsQnaVO vo) {
		List<GoodsQnaVO> qnaList=goodsqnaDao.GoodsQnaUserList(vo);
		for(GoodsQnaVO qna: qnaList) {
			System.out.println(qna.getCategory_goods_serial());
			String image = goodsqnaDao.getGoodsImage(qna.getCategory_goods_serial());
			qna.setCategory_goods_image_thumb(image);
		}
		return qnaList;
	}

	@Override 
	public UserVO getUser(UserVO vo) { 
		return goodsqnaDao.getUser(vo);
	}
	
	@Override
	public ItemPageVO getItemPage(ItemPageVO vo) {
		return goodsqnaDao.getItemPage(vo);
	}

	@Override
	public List<GoodsQnaVO> getGoodsQnaList(GoodsQnaVO vo) {
		return goodsqnaDao.getGoodsQnaList(vo);
	}

	@Override
	public int insertGoodsQna(GoodsQnaVO vo) {
		return goodsqnaDao.insertGoodsQna(vo);
	}

	@Override
	public int updateGoodsQna(GoodsQnaVO vo) {
		return goodsqnaDao.updateGoodsQna(vo);
	}

	@Override
	public int deleteGoodsQna(GoodsQnaVO vo) {
		return goodsqnaDao.deleteGoodsQna(vo);
	}

	@Override
	public GoodsQnaVO getGoodsQnaContent(GoodsQnaVO vo) {
		return goodsqnaDao.getGoodsQnaContent(vo);
	}
	
}