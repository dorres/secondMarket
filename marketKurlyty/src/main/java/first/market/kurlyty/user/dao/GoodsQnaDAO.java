package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.UserVO;
import first.market.kurlyty.user.vo.ItemPageVO;
import first.market.kurlyty.user.vo.GoodsQnaVO;


@Repository
public class GoodsQnaDAO {
	
	@Autowired
		private SqlSessionTemplate sqlSession;
		
	/*
		 * 
		 * // 가져와 글쓴이의 정보 String User_id public UserVO getUser(UserVO vo) { return
		 * sqlSession.selectOne("ItemPageDAO.getUser", vo); }
		 */
	
	// 중요 ! 가져와 상품의 정보 int category_goods_serial, 상품이름, 섬네일까지
	public ItemPageVO getItemPage(ItemPageVO vo) {
		return sqlSession.selectOne("GoodsQnaDAO.getItemPage", vo);
	}
	
	//게시판 리스트 
	public List<GoodsQnaVO> getGoodsQnaList(GoodsQnaVO vo){
		return sqlSession.selectList("GoodsQnaDAO.getGoodsQnaList", vo);
	}		
	
	//문의 글쓰기, 수정하기, 삭제하기
	public int insertGoodsQna(GoodsQnaVO vo) {
		return sqlSession.insert("GoodsQnaDAO.insertGoodsQna", vo);
	}
	
	public int updateGoodsQna(GoodsQnaVO vo) {
		return sqlSession.update("GoodsQnaDAO.updateGoodsQna", vo);
	}			
	
	public int deleteGoodsQna(GoodsQnaVO vo) {
		return sqlSession.delete("GoodsQnaDAO.deleteGoodsQna", vo);
	}
	
	//수정용
	public GoodsQnaVO getGoodsQnaContent(GoodsQnaVO vo) {
		return sqlSession.selectOne("GoodsQnaDAO.getGoodsQnaContent", vo);
	}

}
