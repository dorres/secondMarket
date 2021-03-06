package first.market.kurlyty.user.service; 

import java.util.List;

import first.market.kurlyty.user.vo.GoodsQnaVO;
import first.market.kurlyty.user.vo.ItemPageVO;
import first.market.kurlyty.user.vo.UserVO;

public interface GoodsQnaService {

	List<GoodsQnaVO> getGoodsQnaUserList(GoodsQnaVO vo);
	
	public UserVO getUser(UserVO vo);
	
	// 중요 ! 가져와 상품의 정보 int category_goods_serial, 상품이름, 섬네일까지
	public ItemPageVO getItemPage(ItemPageVO vo);
	
	//게시판 리스트 
	List<GoodsQnaVO> getGoodsQnaList(GoodsQnaVO vo);

	//문의 글쓰기, 수정하기, 삭제하기
	public int insertGoodsQna(GoodsQnaVO vo);

	public int updateGoodsQna(GoodsQnaVO vo);
	
	public int deleteGoodsQna(GoodsQnaVO vo);
	 
	//수정용
	public GoodsQnaVO getGoodsQnaContent(GoodsQnaVO vo); 
	
	//Controller >> service >> DAO
	//페이징 용 문의 수량 들고오기
	public String getQnaCount(int serial);

}