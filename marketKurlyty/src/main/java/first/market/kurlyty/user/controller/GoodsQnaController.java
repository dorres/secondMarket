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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import first.market.kurlyty.user.service.GoodsQnaService;
import first.market.kurlyty.user.vo.GoodsQnaVO;


@Controller
public class GoodsQnaController {
	
	@Autowired
	private  GoodsQnaService goodsqnaService;
	
	//카테고리상품의 serial로 해당 serial의 qna를 리스트로 가져온다.
	/*
	 * @RequestMapping("/goodsQnaList.do") public String
	 * getGoodsQnaList(HttpServletRequest request, GoodsQnaVO vo, Model model) {
	 * HttpSession session = request.getSession();
	 * vo.setCategory_goods_serial((int)session.getAttribute("categoryGoodsSerial"))
	 * ; List<GoodsQnaVO> GoodsQnaList = goodsqnaService.getGoodsQnaList(vo);
	 * if(GoodsQnaList.size() > 0) { model.addAttribute("goodsqnalist", GoodsQnaList); }
	 * 
	 * return "ItemPage.itemPage"; } */
	 
	
	//상품문의 작성에 필요한 고객 정보 = userid, name을 위해 

	 @GetMapping("/goodsQna.do") 
	 public String getList(HttpServletRequest request, GoodsQnaVO vo, Model model) { 

	    HttpSession session = request.getSession();
		vo.setUser_id((String)session.getAttribute("userId"));
		List<GoodsQnaVO> boardList = goodsqnaService.getGoodsQnaUserList(vo);
		for(GoodsQnaVO qna:boardList) {
			qna.setQna_goods_content(qna.getQna_goods_content().replaceAll("\r\n", "ln"));
		}
		model.addAttribute("goodsqnaboard", boardList);
		return "mykurly/goodsQna"; 
	 }
	
		
	//11.24
	@PostMapping("/insertGoodsQna.do")
	public String insertGoodsQna(GoodsQnaVO vo, RedirectAttributes redirect) {
		int success = 0; 
		success = goodsqnaService.insertGoodsQna(vo);
		if(success != 0) {
			redirect.addAttribute("Category_goods_serial", vo.getCategory_goods_serial());
			return "redirect:itemPage.do";
		}else {
			redirect.addAttribute("Category_goods_serial", vo.getCategory_goods_serial());
			return "redirect:itemPage.do";
		}
	}
	
	//11.24
	@RequestMapping("/deleteGoodsQna.do")
	public String deleteGoodsQna(GoodsQnaVO vo, RedirectAttributes redirect) {	
			int success = 0; 
			success = goodsqnaService.deleteGoodsQna(vo);
			
			if(success != 0) {
				if(vo.getCategory_goods_serial()!=0) {
					redirect.addAttribute("category_goods_serial", vo.getCategory_goods_serial());
					return "redirect:itemPage.do";
				}else {
					return "redirect:goodsQna.do";
				}
			}else {	
				if(vo.getCategory_goods_serial()!=0) {
					redirect.addAttribute("category_goods_serial", vo.getCategory_goods_serial());
					return "redirect:itemPage.do";
				}else {
					return "redirect:goodsQna.do";
				}
		}
	}
			                                       
	@PostMapping("/updateGoodsQna.do")
	public String updateGoodsQna(GoodsQnaVO vo,RedirectAttributes redirect) {
		int success = 0;
		success = goodsqnaService.updateGoodsQna(vo);
		if(success !=0) {
			if(vo.getCategory_goods_serial()!=0) {
				redirect.addAttribute("category_goods_serial", vo.getCategory_goods_serial());
				return "redirect:itemPage.do";
			}else {
				return "redirect:goodsQna.do";
			}
		}else {
			if(vo.getCategory_goods_serial()!=0) {
				redirect.addAttribute("category_goods_serial", vo.getCategory_goods_serial());
				return "redirect:itemPage.do";
			}else {
				return "redirect:goodsQna.do";
			}
		}
	}

	//업데이트를 위해 씌여진 글 받아오기 
//	@GetMapping("/updateGoodsQna.do")
//	public String updateGoodsQnaContent(GoodsQnaVO vo, Model model, RedirectAttributes redirect){
//		GoodsQnaVO getGoodsQnaContent = goodsqnaService.getGoodsQnaContent(vo);
//	
//		//모델에 담아준다.
//		model.addAttribute("getGoodsQnaContent", getGoodsQnaContent);
//		
//		//받아온 후 글쓰기로 간다.
//		redirect.addAttribute("qna_goods_serial", vo.getQna_goods_serial());
//		return "redirect:itemPage.do";
//	}

}

	

