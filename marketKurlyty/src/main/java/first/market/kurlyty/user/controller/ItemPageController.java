package first.market.kurlyty.user.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.user.service.ItemPageService;
import first.market.kurlyty.user.vo.ItemPageVO;

 
@Controller
public class ItemPageController {
	@Autowired
	private ItemPageService itempageService;
	
	@RequestMapping("/itemPage.do")
		public String getItemPage(ItemPageVO vo, Model model) {
		ItemPageVO getItemPage = itempageService.getItemPage(vo);
		List<ItemPageVO> getCategoryItemPage = itempageService.getCategoryItemPage(vo);
		model.addAttribute("getCategoryItemPage", getCategoryItemPage);
		model.addAttribute("getItemPage", getItemPage);
		
		return "/ItemPage/itemPage";
	}

}
 