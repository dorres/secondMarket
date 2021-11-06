package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.PersonalQnaVO;
import first.market.kurlyty.user.vo.UserVO;


@Repository
public class PersonalQnaDAO {
	

	@Autowired
		private SqlSessionTemplate sqlSession;
	
	//string statement, object parameter
	/*	public void insertPersonalQna <PersonalQnaVO vo>() {
			sqlSession.insert("PersonalQnaDAO.insertPersonalQna", vo);*/

	//user에서 이메일과 전화번호 입력하기
	public UserVO getUser(UserVO vo) {
		return sqlSession.selectOne("UserDAO.getUser", vo);
	}
	
	//입력된 정보를 db로 전달하기
	public int insertPersonalQna(PersonalQnaVO vo) {
		return sqlSession.insert("PersonalQnaDAO.insertPersonalQna", vo);
	}
	
	public void updatePersonalQna(PersonalQnaVO vo) {
		sqlSession.update("PersonalQnaDAO.updatePersonalQna", vo);
	}
	
	public void deletePersonalQna(PersonalQnaVO vo) {
		sqlSession.delete("PersonalQnaDAO.deletePersonalQna", vo);
	}
	
// 글읽어오기
	public PersonalQnaVO getPersonalQna(PersonalQnaVO vo) {
		return sqlSession.selectOne("PersonalQnaDAO.getPersonalQna", vo);
	}

// LIST 
	public List<PersonalQnaVO> PersonalQnaList(PersonalQnaVO vo){
		return sqlSession.selectList("PersonalQnaDAO.getPersonalQnaList", vo);
	}
}