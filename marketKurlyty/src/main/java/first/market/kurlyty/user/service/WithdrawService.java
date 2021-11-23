package first.market.kurlyty.user.service;

import first.market.kurlyty.user.vo.UserVO;
import first.market.kurlyty.user.vo.WithdrawInfoVO;

public interface WithdrawService {

	public UserVO getUser(UserVO vo);
	UserVO getUserData(UserVO user);
	
	public int insertWithdraw(WithdrawInfoVO vo);
	
	public int updateWithdraw(String user_id);
	
	public int deleteWithdrawCart(String user_id);
	
	public int deleteWithdrawQnaGoods(String user_id);
	
	public int deleteWithdrawQnaPersonal(String user_id);
	
	public int deleteWithdrawAddressList(String user_id);
}
