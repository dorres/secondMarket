package first.market.kurlyty.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.PersonalQnaDAO;
import first.market.kurlyty.user.dao.UserDAO;
import first.market.kurlyty.user.vo.PersonalQnaVO;
import first.market.kurlyty.user.vo.UserVO;

//컨트롤러  - service - DAO 

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

	@Override
	public void updatePersonalQna(PersonalQnaVO vo) {
		
	}

	@Override
	public void deletePersonalQna(PersonalQnaVO vo) {
		
	}

}