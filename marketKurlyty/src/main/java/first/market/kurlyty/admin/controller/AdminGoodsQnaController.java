package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.GoodsQnaVO;

@Controller
public class AdminGoodsQnaController {
	
	@Autowired 
	private AdminService adminService;
	
	//상품문의 리스트(답변대기)
	@RequestMapping("gqnaList.mdo")
	public String gqnaList(GoodsQnaVO gqna, Model model) {
		model.addAttribute("gqnaList", adminService.gqnaList(gqna));
		return "goodsqna/goodsQna";
	}
	
	// 상품문의 리스트 삭제
	@RequestMapping("deleteGqna.mdo")
	public String deleteGqna(GoodsQnaVO gqna) {
		gqna.getCategory_goods_name();
		int delete = 0;
		delete = adminService.deleteGqna(gqna);
		if(delete != 0 ) {
			return "redirect:gqnaList.mdo";
		}else {
			return "redirect:gqnaList.mdo";
		}
	}
	
	//상품문의 답변으로 
	@RequestMapping("toAnswer.mdo")
	public String toAnanswer(GoodsQnaVO gqna, Model model) {
		model.addAttribute("qnaone", adminService.gqnaOne(gqna));
		return "goodsqna/answerGoodsQna";
	}
	
	//상품문의 답변
	@RequestMapping("updqteGqna.mdo")
	public String updateGqna(GoodsQnaVO gqna) {
		int update = 0;
		update = adminService.updateGqna(gqna);
		if(update != 0 ) {
			return "redirect:gqnaList.mdo";
		}else {
			return "redirect:toAnswer.mdo";
		}
	}
	
	//상품문의 리스트(답변완료)
		@RequestMapping("gqnaListSuc.mdo")
		public String gqnaListSuc(GoodsQnaVO gqna, Model model) {
			model.addAttribute("gqnaListSuc", adminService.gqnaListSuc(gqna));
			return "goodsqna/sucGoodsQna";
		}
	
	//상품문의 답변 확인
		@RequestMapping("checkAnswer.mdo")
		public String checkAnswer(GoodsQnaVO gqna, Model model) {
			model.addAttribute("qnaone", adminService.gqnaOne(gqna));
			return "goodsqna/checkAnswerGoodsQna";
		}
		
	//상품문의 답변 수정
	@RequestMapping("updqteGqnaSuc.mdo")
	public String updateGqnaSuc(GoodsQnaVO gqna) {
		int update = 0;
		update = adminService.updateGqna(gqna);
		if(update != 0 ) {
			return "redirect:gqnaListSuc.mdo";
		}else {
			return "redirect:checkAnswer.mdo";
		}
	}
	
	// 상품문의 삭제(답변완료)
	@RequestMapping("deleteGqnaSuc.mdo")
	public String deleteGqnaSuc(GoodsQnaVO gqna) {
		gqna.getCategory_goods_name();
		int delete = 0;
		delete = adminService.deleteGqna(gqna);
		if(delete != 0 ) {
			return "redirect:gqnaListSuc.mdo";
		}else {
			return "redirect:gqnaListSuc.mdo";
		}
	}
		
}
	