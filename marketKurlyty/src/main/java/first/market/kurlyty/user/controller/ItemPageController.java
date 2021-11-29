package first.market.kurlyty.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.user.service.GoodsQnaService;
import first.market.kurlyty.user.service.ItemPageService;
import first.market.kurlyty.user.service.MembershipService;
import first.market.kurlyty.user.service.ReviewService;
import first.market.kurlyty.user.vo.GoodsQnaVO;
import first.market.kurlyty.user.vo.ItemPageVO;
import first.market.kurlyty.user.vo.MembershipVO;
import first.market.kurlyty.user.vo.ReviewVO;

 
@Controller
public class ItemPageController {
	@Autowired
	private ItemPageService itempageService;
	@Autowired
	private MembershipService membershipService;

	@Autowired
	private GoodsQnaService goodsqnaService;
	@Autowired
	private ReviewService reviewService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/itemPage.do")
	public String getItemPage(ItemPageVO vo, GoodsQnaVO goodsqnavo, String anaPage, String reviewPage,Model model, HttpSession session) {
		boolean isPaging=false;
		boolean isReviewPaging=false;
		ItemPageVO getItemInfo = itempageService.getItemPage(vo);
		String userId = (String) session.getAttribute("userId");
		int currentPage=0;
		int reviewCuPage=0;
		//qna ∆‰¿Ã¬°√≥∏Æ
		if(anaPage==null || anaPage=="") {
			currentPage=0;
			isPaging=false;
		}
		else {
			currentPage=Integer.valueOf(anaPage);
			isPaging=true;
		}
		
		if(reviewPage==null || reviewPage=="") {
			reviewCuPage=0;
			isReviewPaging=false;
		}
		else {
			reviewCuPage=Integer.valueOf(reviewPage);
			isReviewPaging=true;
		}
		
		
		goodsqnavo.setStart(5*currentPage);
		int qnaCount = Integer.valueOf(goodsqnaService.getQnaCount(vo.getCategory_goods_serial()));
		int reviewCount=Integer.valueOf(reviewService.getReviewCount(vo.getCategory_goods_serial()));
		
		List<ItemPageVO> getCategoryItemPage = itempageService.getCategoryItemPage(vo);
		List<GoodsQnaVO> GoodsQnaList = goodsqnaService.getGoodsQnaList(goodsqnavo);
		
		GoodsQnaVO reviewVO = new GoodsQnaVO();
		reviewVO.setCategory_goods_serial(vo.getCategory_goods_serial());
		reviewVO.setStart(5*reviewCuPage);
		List<ReviewVO> goodsReview=reviewService.getGoodsReview(reviewVO);
		
		if(userId!=null) {
			String membership = membershipService.getMembershipOfUser(userId);
			MembershipVO membershipData = membershipService.getMembershipData(membership);
			model.addAttribute("membership",membershipData);
		}
		if(session.getAttribute("recentList")==null) {
			session.setAttribute("recentList", new ArrayList<ItemPageVO>());
		}
		List<ItemPageVO> recentList=(List<ItemPageVO>)session.getAttribute("recentList");
		for(ItemPageVO item:recentList) {
			if(item.getCategory_goods_serial() == vo.getCategory_goods_serial()) {
				recentList.remove(item);
				break;
			}
		}
		
		recentList.add(0,getItemInfo);
		if(recentList.size()==4)
			recentList.remove(3);
		model.addAttribute("getCategoryItemPage", getCategoryItemPage);
		model.addAttribute("getItemPage", getItemInfo);
		for(GoodsQnaVO qna:GoodsQnaList) {
			qna.setQna_goods_content(qna.getQna_goods_content().replace("\r\n", "ln"));
		}
		model.addAttribute("goodsqnalist", GoodsQnaList);
		qnaCount=(qnaCount/5)+(qnaCount%5==0?0:1);
		model.addAttribute("qnaPaging", qnaCount);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("isQnaPaging",isPaging);
		
		for(ReviewVO review:goodsReview) {
			review.setReview_content(review.getReview_content().replace("\r\n", "ln"));
		}
		model.addAttribute("reviews", goodsReview);
		model.addAttribute("reviewPaging", reviewCount);
		model.addAttribute("reviewCuPage",reviewCuPage);
		model.addAttribute("isReviewPaging",isReviewPaging);
		
		return "ItemPage/itemPage";
	}
	
}
 