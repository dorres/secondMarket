package first.market.kurlyty.user.service; 

import java.util.List;

import first.market.kurlyty.user.vo.ItemPageVO;

public interface ItemPageService {
	
	public ItemPageVO getItemPage(ItemPageVO vo);
	
	List<ItemPageVO> getCategoryItemPage(ItemPageVO vo);
	
	// CONNECT CONTROLLER' BETWEEN DAO' USING INTERFACE 
	//CONTROLLER >> service >> DAO

}