package first.market.kurlyty.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.ReviewDAO;
import first.market.kurlyty.user.vo.GoodsQnaVO;
import first.market.kurlyty.user.vo.ReviewVO;
import first.market.kurlyty.user.vo.User_order_listVO;

@Service("ReviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO reviewDAO;	

	@Override
	public List<User_order_listVO> reviewList(String user_id) {
		return reviewDAO.reviewList(user_id);
	}

	@Override
	public Integer count(String user_id) {
		return reviewDAO.count(user_id);
	}

	@Override
	public User_order_listVO reviewWrite(Integer order_detials_serial) {
		return reviewDAO.reviewWrite(order_detials_serial);
	}

	@Override
	public int insertReview(ReviewVO vo) {
		return reviewDAO.insertReview(vo);
	}

	@Override
	public ReviewVO updateDate(ReviewVO vo) {
		return reviewDAO.updateDate(vo);
	}

	@Override
	public Integer updateReview(ReviewVO vo) {
		return reviewDAO.updateReview(vo);
	}

	@Override
	public List<ReviewVO> reviewAfterList(String user_id) {
		return reviewDAO.reviewAfterList(user_id);
	}

	@Override
	public Integer reviewCount(String user_id) {
		return reviewDAO.reviewCount(user_id);
	}

	@Override
	public int deleteReview(int review_serial) {
		return reviewDAO.deleteReview(review_serial);
	}

	@Override
	public List<ReviewVO> getGoodsReview(GoodsQnaVO vo) {
		return reviewDAO.getGoodsReview(vo);
	}

	@Override
	public String getReviewCount(int goodsSerial) {
		return reviewDAO.getReviewCount(goodsSerial);
	}

}
