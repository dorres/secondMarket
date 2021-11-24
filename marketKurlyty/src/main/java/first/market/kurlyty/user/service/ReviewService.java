package first.market.kurlyty.user.service;

import java.util.List;

import first.market.kurlyty.user.vo.ReviewVO;
import first.market.kurlyty.user.vo.User_order_listVO;

public interface ReviewService {
	List<User_order_listVO> reviewList(String user_id);
	public Integer count(String user_id);
	public User_order_listVO reviewWrite(Integer order_details_serial);
	public int insertReview(ReviewVO vo);
}
