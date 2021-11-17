package first.market.kurlyty.user.dao;



import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.user_address_listVO;

@Repository
public class user_address_listDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
public List<user_address_listVO> getBoard(String user_id) throws Exception {
				
		return sqlSession.selectList("user_address_listDAO.getAddress", user_id);
	}
	
public void insertBoard(user_address_listVO vo) {
	sqlSession.insert("user_address_listDAO.address_new", vo);
}
public void update(user_address_listVO vo) {
	
	sqlSession.update("user_address_listDAO.address_update", vo);
}

}
