package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<ReviewVO> reviewAfter(ReviewVO vo){
		return sqlSession.selectList("reviewDAO.reviewAfter", vo);
	}
	public ReviewVO updateDate(ReviewVO vo) {
		return sqlSession.selectOne("reviewDAO.updateDate", vo);
	}

}
