package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.PersonalQnaVO;


@Repository
public class PersonalQnaDAO {
	
//의존 객체의 타입에 해당하는 빈을 찾아서 주입한다.
//SqlSessionFactoryBean을 생략한 것이 맞는지? 확인하기 - 어노테이션 안쓰고 application-context를 이용할때
	
	@Autowired
		private SqlSessionTemplate sqlSession;
	
	//string statement, object parameter
	/*	public void insertPersonalQna <PersonalQnaVO vo>() {
			sqlSession.insert("PersonalQnaDAO.insertPersonalQna", vo);*/
	
	public void insertPersonalQna(PersonalQnaVO vo) {
		sqlSession.insert("PersonalQnaDAO.insertPersonalQna", vo);
	}
	
	public void updatePersonalQna(PersonalQnaVO vo) {
		sqlSession.update("PersonalQnaDAO.updatePersonalQna", vo);
	}
	
	public void deletePersonalQna(PersonalQnaVO vo) {
		sqlSession.delete("PersonalQnaDAO.deletePersonalQna", vo);
	}
	
//상세보기 
	public PersonalQnaVO getPersonalQna(PersonalQnaVO vo) {
		return (PersonalQnaVO) sqlSession.selectOne("PersonalQnaDAO.getPersonalQna", vo);
	}

// LIST 
	public List<PersonalQnaVO> PersonalQnaList(PersonalQnaVO vo){
		return sqlSession.selectList("PersonalQnaDAO.getPersonalQnaList", vo);
	}
}

