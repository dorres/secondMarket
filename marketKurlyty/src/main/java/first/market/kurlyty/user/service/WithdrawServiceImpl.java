package first.market.kurlyty.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.UserDAO;
import first.market.kurlyty.user.dao.WithdrawDAO;
import first.market.kurlyty.user.vo.UserVO;
import first.market.kurlyty.user.vo.WithdrawInfoVO; 
  
@Service  
public class WithdrawServiceImpl implements WithdrawService { 
	
	@Autowired   
	private WithdrawDAO withdrawDAO; 
	
		@Override
		public UserVO getUser(UserVO vo) {
			return withdrawDAO.getUser(vo);
		}
		
		@Override
		public UserVO getUserData(UserVO user) {
			return withdrawDAO.getUser(user);
			}
		
		@Override
		public int insertWithdraw(WithdrawInfoVO vo) {
			return withdrawDAO.insertWithdraw(vo);
		}

		@Override
		public int updateWithdraw(String user_id) {
			return withdrawDAO.updateWithdraw(user_id);
		}
		
		@Override
		public int deleteWithdrawCart(String user_id) {
			return withdrawDAO.deleteWithdrawCart(user_id);
		}

		@Override
		public int deleteWithdrawQnaGoods(String user_id) {
			return withdrawDAO.deleteWithdrawQnaGoods(user_id);
		}

		@Override
		public int deleteWithdrawQnaPersonal(String user_id) {
			return withdrawDAO.deleteWithdrawQnaPersonal(user_id);
		}

		@Override
		public int deleteWithdrawAddressList(String user_id) {
			return withdrawDAO.deleteWithdrawAddressList(user_id);
		}

		
}

