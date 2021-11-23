package first.market.kurlyty.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.user.service.GoodsQnaService;
import first.market.kurlyty.user.vo.GoodsQnaVO;
import first.market.kurlyty.user.vo.UserVO;


@Controller
public class GoodsQnaController {
	
	@Autowired
	private  GoodsQnaService goodsqnaService;
	
	//카테고리상품의 serial로 해당 serial의 qna를 리스트로 가져온다.
	@RequestMapping("/goodsQnaList.do")
		public String getGoodsQnaList(HttpServletRequest request, GoodsQnaVO vo, Model model) {
		HttpSession session = request.getSession();
		vo.setCategory_goods_serial((int)session.getAttribute("categoryGoodsSerial"));
		List<GoodsQnaVO> GoodsQnaList = goodsqnaService.getGoodsQnaList(vo);
		
		model.addAttribute("goodsqnalist", GoodsQnaList);
		
		return "ItemPage.itemPage";
	}
	
	
	//상품문의 작성에 필요한 고객 정보 = userid, name을 위해 user id contr
	@GetMapping("/goodsQnaWrite.do")
		public String getUser(HttpServletRequest request, UserVO vo, Model model) {
		HttpSession session = request.getSession();
		vo.setUser_id((String)session.getAttribute("userId"));
		
		model.addAttribute("UserData", goodsqnaService.getUser(vo));
		
		return "customerCenter/goodsQnaWrite";
	}
	
	@PostMapping("/insertGoodsQna.do")
	public String insertGoodsQna(GoodsQnaVO vo) {
		int success = 0; 
		success = goodsqnaService.insertGoodsQna(vo);
		if(success != 0) {
			return "redirect:itemPage.do";
		}else {
			return "customerCenter/goodsQnaWrite";
	}
}
	
	@RequestMapping("/deleteGoodQna.do")
	public String deleteGoodsQna(GoodsQnaVO vo) {
			int success = 0; 
			success = goodsqnaService.deleteGoodsQna(vo);
			if(success != 0) {
				return "redirect:itemPage.do";
			}else {
				return "customerCenter/itemPage";
		}
	}
	
			
	@PostMapping("/updateGoodsQna.do")
	public String updateGoodsQna(GoodsQnaVO vo) {
		int success = 0;
		success = goodsqnaService.updateGoodsQna(vo);
		if(success !=0) {
			return "redirect:itemPage.do";
		}else {
			return "customerCenter/goodsQnaWrite";
		}
	}
		
	//업데이트를 위해 씌여진 글 받아오기 
	@GetMapping("/updateGoodsQna.do")
	public String updateGoodsQnaContent(GoodsQnaVO vo, Model model){
		GoodsQnaVO getGoodsQna = goodsqnaService.getGoodsQnaContent(vo);
	
		//모델에 담아준다.
		model.addAttribute("getGoodsQna", getGoodsQna);
	
		//받아온 후 글쓰기로 간다.
		return "customerCenter/goodsQnaWrite"; 
	}
}

	

