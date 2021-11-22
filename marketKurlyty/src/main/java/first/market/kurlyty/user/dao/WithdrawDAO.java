package first.market.kurlyty.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.UserVO;
import first.market.kurlyty.user.vo.WithdrawInfoVO;

@Repository
public class WithdrawDAO {

	/* mk_user(select), 
	mk_user_detail(update), 
	mk_user_address_list(delete), 
	mk_user_withdraw_info(insert) */	

	
	@Autowired
		private SqlSessionTemplate sqlSession;
	
	public UserVO getUser(UserVO vo) {
		return sqlSession.selectOne("UserDAO.getUser", vo);
		}
	
	public int insertWithdraw(WithdrawInfoVO vo) {
		return sqlSession.insert("WithdrawDAO.insertWithdraw", vo);
		}

	public int updateWithdraw(String user_id) {
		return sqlSession.update("WithdrawDAO.updateWithdraw", user_id);
		}
	
	
	public int deleteWithdrawCart(String user_id) { 
		return sqlSession.delete("WithdrawDAO.deleteWithdrawCart", user_id); 
		}
	
	public int deleteWithdrawQnaGoods(String user_id) { 
		return sqlSession.delete("WithdrawDAO.deleteWithdrawQnaGoods", user_id); 
		}
	
	public int deleteWithdrawQnaPersonal(String user_id) { 
		return sqlSession.delete("WithdrawDAO.deleteWithdrawQnaPersonal", user_id); 
		}
	
	public int deleteWithdrawAddressList(String user_id) { 
		return sqlSession.delete("WithdrawDAO.deleteWithdrawAddressList", user_id); 
		}
	
}
 