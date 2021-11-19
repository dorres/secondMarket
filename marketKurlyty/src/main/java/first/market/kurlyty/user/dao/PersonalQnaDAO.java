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

	// LIST
	public List<PersonalQnaVO> PersonalQnaList(PersonalQnaVO vo) {
		return sqlSession.selectList("PersonalQnaDAO.getPersonalQnaList", vo);
	}

	public UserVO getUser(UserVO vo) {
		return sqlSession.selectOne("UserDAO.getUser", vo);
	}

	public int insertPersonalQna(PersonalQnaVO vo) {
		return sqlSession.insert("PersonalQnaDAO.insertPersonalQna", vo);
	}
	
	public int updatePersonalQna(PersonalQnaVO vo) { 
		return sqlSession.update("PersonalQnaDAO.updatePersonalQna", vo); 
	}
	 
	public int deletePersonalQna(PersonalQnaVO vo) {
		return sqlSession.delete("PersonalQnaDAO.deletePersonalQna", vo);
	}

	public PersonalQnaVO getPersonalQna(PersonalQnaVO vo) {
		return sqlSession.selectOne("PersonalQnaDAO.getPersonalQna", vo);
	}

}