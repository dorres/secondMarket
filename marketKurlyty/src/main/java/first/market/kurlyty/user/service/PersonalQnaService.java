package first.market.kurlyty.user.service; 

import java.util.List;

import first.market.kurlyty.user.vo.PersonalQnaVO;
import first.market.kurlyty.user.vo.UserVO;
import first.market.kurlyty.user.vo.User_order_listVO;


public interface PersonalQnaService {
	
	List<PersonalQnaVO> getPersonalQnaList(PersonalQnaVO vo);
 
	public UserVO getUser(UserVO vo);
	
	public int insertPersonalQna(PersonalQnaVO vo);

	public int updatePersonalQna(PersonalQnaVO vo);
	
	public int deletePersonalQna(PersonalQnaVO vo);
	 
	public PersonalQnaVO getPersonalQna(PersonalQnaVO vo);
	
	public User_order_listVO getMerchantSerial(User_order_listVO vo);
	
	public List<User_order_listVO> getOrderSearch(UserVO vo);
	
	//Controller >> service >> DAO

}