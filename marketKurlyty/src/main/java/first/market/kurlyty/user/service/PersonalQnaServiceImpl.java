package first.market.kurlyty.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.PersonalQnaDAO;
import first.market.kurlyty.user.vo.PersonalQnaVO;
import first.market.kurlyty.user.vo.UserVO;
import first.market.kurlyty.user.vo.User_order_listVO;

//CONTROLLER - service - DAO 

@Service
public class PersonalQnaServiceImpl implements PersonalQnaService {
	@Autowired
	private PersonalQnaDAO personalqnaDAO;

	@Override
	public List<PersonalQnaVO> getPersonalQnaList(PersonalQnaVO vo) {
		return personalqnaDAO.PersonalQnaList(vo);
	}

	@Override
	public UserVO getUser(UserVO vo) {
		return personalqnaDAO.getUser(vo);
	}

	@Override
	public int insertPersonalQna(PersonalQnaVO vo) {
		return personalqnaDAO.insertPersonalQna(vo);
	}


	@Override public int updatePersonalQna(PersonalQnaVO vo) { 
		 return personalqnaDAO.updatePersonalQna(vo); }
	

	@Override
	public int deletePersonalQna(PersonalQnaVO vo) {
		return personalqnaDAO.deletePersonalQna(vo);
	}

	@Override
	public PersonalQnaVO getPersonalQna(PersonalQnaVO vo) {
		return personalqnaDAO.getPersonalQna(vo);
	}

	@Override
	public User_order_listVO getMerchantSerial(User_order_listVO vo) {
		return personalqnaDAO.getMerchantSerial(vo);
	}
	
	@Override
	public List<User_order_listVO> getOrderSearch(UserVO vo) {
		return personalqnaDAO.getOrderSearch(vo);
	}
}