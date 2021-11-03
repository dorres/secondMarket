package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.PersonalQnaVO;


@Repository
public class PersonalQnaDAO {
	
//���� ��ü�� Ÿ�Կ� �ش��ϴ� ���� ã�Ƽ� �����Ѵ�.
//SqlSessionFactoryBean�� ������ ���� �´���? Ȯ���ϱ� - ������̼� �Ⱦ��� application-context�� �̿��Ҷ�
	
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
	
//�󼼺��� 
	public PersonalQnaVO getPersonalQna(PersonalQnaVO vo) {
		return (PersonalQnaVO) sqlSession.selectOne("PersonalQnaDAO.getPersonalQna", vo);
	}

// LIST 
	public List<PersonalQnaVO> PersonalQnaList(PersonalQnaVO vo){
		return sqlSession.selectList("PersonalQnaDAO.getPersonalQnaList", vo);
	}
}

