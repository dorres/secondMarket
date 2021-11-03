package first.market.kurlyty.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import first.market.kurlyty.user.dao.PersonalQnaDAO;
import first.market.kurlyty.user.vo.PersonalQnaVO;

//컨트롤러  - service - DAO 

public class PersonalQnaServiceImpl implements PersonalQnaService {
	@Autowired
	private PersonalQnaDAO personalqnaDAO;

		@Override
		public List<PersonalQnaVO> getPersonalQnaList(PersonalQnaVO vo) {
		return personalQnaDAO.PersonalQnaList(vo);
	}

}
