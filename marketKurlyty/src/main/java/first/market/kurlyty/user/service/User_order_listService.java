package first.market.kurlyty.user.service;

import java.util.List;

import first.market.kurlyty.user.vo.Board_Pagination;
import first.market.kurlyty.user.vo.ShippingVO;
import first.market.kurlyty.user.vo.User_order_listVO;

public interface User_order_listService {
	List<User_order_listVO> getBoard(String user_id,Board_Pagination pagination) throws Exception;
	public int getBoardListCnt() throws Exception;
	List<User_order_listVO> getDetail(User_order_listVO vo);
	ShippingVO getShipping(ShippingVO svo);
	public int oldPrice(String order_merchant_serial) throws Exception;
	public int dcPrice(String order_merchant_serial) throws Exception;
	public int point(String order_merchant_serial);
	User_order_listVO getDate(User_order_listVO vo);


}
