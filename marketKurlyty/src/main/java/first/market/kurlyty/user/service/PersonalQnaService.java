package first.market.kurlyty.user.service;

import java.util.List;

import first.market.kurlyty.user.vo.PersonalQnaVO;


public interface PersonalQnaService {
	List<PersonalQnaVO> getPersonalQnaList(PersonalQnaVO vo);

	// ��Ʈ�ѷ� - DAO���� ���� ������ ���� �ʰ� �������̽��� Ȱ���Ѵ�. 
	//��Ʈ�ѷ� >> service >> DAO

}
