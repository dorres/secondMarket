package first.market.kurlyty.user.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.user.service.GoodsQnaService;
import first.market.kurlyty.user.service.ItemPageService;
import first.market.kurlyty.user.service.MembershipService;
import first.market.kurlyty.user.vo.GoodsQnaVO;
import first.market.kurlyty.user.vo.ItemPageVO;
import first.market.kurlyty.user.vo.MembershipVO;

 
@Controller
public class ItemPageController {
	@Autowired
	private ItemPageService itempageService;
	@Autowired
	private MembershipService membershipService;

	@Autowired
	private GoodsQnaService goodsqnaService;
	
	@RequestMapping("/itemPage.do")
		public String getItemPage(ItemPageVO vo, GoodsQnaVO goodsqnavo, Model model, HttpSession session) {

		ItemPageVO getItemInfo = itempageService.getItemPage(vo);
		String userId = (String) session.getAttribute("userId");
		
		List<ItemPageVO> getCategoryItemPage = itempageService.getCategoryItemPage(vo);
		List<GoodsQnaVO> GoodsQnaList = goodsqnaService.getGoodsQnaList(goodsqnavo);	

		if(userId!=null) {
			String membership = membershipService.getMembershipOfUser(userId);
			MembershipVO membershipData = membershipService.getMembershipData(membership);
			model.addAttribute("membership",membershipData);
		}
		model.addAttribute("getCategoryItemPage", getCategoryItemPage);
		model.addAttribute("getItemPage", getItemInfo);
		model.addAttribute("goodsqnalist", GoodsQnaList);
		
		return "/ItemPage/itemPage";
	}
	
}
 