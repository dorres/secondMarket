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
		 * // ������ �۾����� ���� String User_id public UserVO getUser(UserVO vo) { return
		 * sqlSession.selectOne("ItemPageDAO.getUser", vo); }
		 */
	
	// �߿� ! ������ ��ǰ�� ���� int category_goods_serial, ��ǰ�̸�, �����ϱ���
	public ItemPageVO getItemPage(ItemPageVO vo) {
		return sqlSession.selectOne("GoodsQnaDAO.getItemPage", vo);
	}
	
	//�Խ��� ����Ʈ 
	public List<GoodsQnaVO> getGoodsQnaList(GoodsQnaVO vo){
		return sqlSession.selectList("GoodsQnaDAO.getGoodsQnaList", vo);
	}		
	
	//���� �۾���, �����ϱ�, �����ϱ�
	public int insertGoodsQna(GoodsQnaVO vo) {
		return sqlSession.insert("GoodsQnaDAO.insertGoodsQna", vo);
	}
	
	public int updateGoodsQna(GoodsQnaVO vo) {
		return sqlSession.update("GoodsQnaDAO.updateGoodsQna", vo);
	}			
	
	public int deleteGoodsQna(GoodsQnaVO vo) {
		return sqlSession.delete("GoodsQnaDAO.deleteGoodsQna", vo);
	}
	
	//������
	public GoodsQnaVO getGoodsQnaContent(GoodsQnaVO vo) {
		return sqlSession.selectOne("GoodsQnaDAO.getGoodsQnaContent", vo);
	}

}
