package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.ItemPageVO;

@Repository
public class ItemPageDAO {
	
	 @Autowired
	 private SqlSessionTemplate sqlSession;
		
	 //GetOne 
	 public ItemPageVO getItemPage(ItemPageVO vo) {
	 	return sqlSession.selectOne("ItemPageDAO.getItemPage", vo);   
	 }
	 
	 //recommend item in same Cartegory
	 
	 public List<ItemPageVO> getCategoryItemPage(ItemPageVO vo) {
		 	return sqlSession.selectList("ItemPageDAO.getCategoryItemPage", vo);   
		 }
		 
	 

} 