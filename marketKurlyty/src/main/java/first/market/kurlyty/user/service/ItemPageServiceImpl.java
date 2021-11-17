package first.market.kurlyty.user.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.ItemPageDAO;
import first.market.kurlyty.user.vo.ItemPageVO;

//CONTROLLER' - service - DAO 

@Service 
public class ItemPageServiceImpl implements ItemPageService{
	@Autowired 
	 private ItemPageDAO itempageDAO;

	@Override
	public ItemPageVO getItemPage(ItemPageVO vo) {
		return itempageDAO.getItemPage(vo);
	}	
	
	@Override
	public List<ItemPageVO> getCategoryItemPage(ItemPageVO vo) {
		return itempageDAO.getCategoryItemPage(vo);
	}

}