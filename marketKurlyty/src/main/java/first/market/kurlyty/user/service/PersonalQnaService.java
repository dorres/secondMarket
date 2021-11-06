package first.market.kurlyty.user.service;

import java.util.List;

import first.market.kurlyty.user.vo.PersonalQnaVO;
import first.market.kurlyty.user.vo.UserVO;


public interface PersonalQnaService {
	
	List<PersonalQnaVO> getPersonalQnaList(PersonalQnaVO vo);
 
	public UserVO getUser(UserVO vo);
	
	public int insertPersonalQna(PersonalQnaVO vo);
	
	public void updatePersonalQna(PersonalQnaVO vo);
	
	public void deletePersonalQna(PersonalQnaVO vo);
	
	
	// 컨트롤러 - DAO간의 직접 연결을 하지 않고 인터페이스를 활용한다. 
	//컨트롤러 >> service >> DAO

}