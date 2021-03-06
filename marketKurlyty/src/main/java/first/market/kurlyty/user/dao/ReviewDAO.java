package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.GoodsQnaVO;
import first.market.kurlyty.user.vo.ReviewVO;
import first.market.kurlyty.user.vo.User_order_listVO;

@Repository
public class ReviewDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<User_order_listVO> reviewList(String user_id){
		return sqlSession.selectList("reviewDAO.reviewList",user_id);
	}
	
	public Integer count(String user_id) {
		return sqlSession.selectOne("reviewDAO.count",user_id);
	}
	
	public User_order_listVO reviewWrite(Integer order_details_serial) {
		return sqlSession.selectOne("reviewDAO.reviewWrite", order_details_serial);
	}
	public int insertReview(ReviewVO vo) {
		return sqlSession.insert("reviewDAO.reviewInsert",vo);
	}
	
	public List<ReviewVO> reviewAfterList(String user_id){
		return sqlSession.selectList("reviewDAO.reviewAfterList", user_id);
	}
	public ReviewVO updateDate(ReviewVO vo) {
		return sqlSession.selectOne("reviewDAO.updateDate", vo);
	}
	public Integer updateReview(ReviewVO vo) {
		return sqlSession.update("reviewDAO.reviewUpdate",vo);
	}
	public Integer reviewCount(String user_id) {
		return sqlSession.selectOne("reviewDAO.reviewCount", user_id);
	}
	public int deleteReview(int review_serial) {
		return sqlSession.delete("reviewDAO.reviewDelete", review_serial);
	}
	public List<ReviewVO> getGoodsReview(GoodsQnaVO vo){
		return sqlSession.selectList("reviewDAO.getGoodsReview", vo);
	}
	public String getReviewCount(int goodsSerial) {
		return sqlSession.selectOne("reviewDAO.getReviewCount",goodsSerial);
	}
}
