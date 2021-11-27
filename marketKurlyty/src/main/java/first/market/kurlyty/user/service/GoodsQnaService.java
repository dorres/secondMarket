package first.market.kurlyty.user.service; 

import java.util.List;

import first.market.kurlyty.user.vo.GoodsQnaVO;
import first.market.kurlyty.user.vo.ItemPageVO;
import first.market.kurlyty.user.vo.UserVO;

public interface GoodsQnaService {

	List<GoodsQnaVO> getGoodsQnaUserList(GoodsQnaVO vo);
	
	public UserVO getUser(UserVO vo);
	
	// �߿� ! ������ ��ǰ�� ���� int category_goods_serial, ��ǰ�̸�, �����ϱ���
	public ItemPageVO getItemPage(ItemPageVO vo);
	
	//�Խ��� ����Ʈ 
	List<GoodsQnaVO> getGoodsQnaList(GoodsQnaVO vo);

	//���� �۾���, �����ϱ�, �����ϱ�
	public int insertGoodsQna(GoodsQnaVO vo);

	public int updateGoodsQna(GoodsQnaVO vo);
	
	public int deleteGoodsQna(GoodsQnaVO vo);
	 
	//������
	public GoodsQnaVO getGoodsQnaContent(GoodsQnaVO vo); 
	
	//Controller >> service >> DAO

}