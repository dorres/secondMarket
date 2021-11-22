package first.market.kurlyty.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.admin.service.AdminService;
import first.market.kurlyty.admin.vo.GoodsQnaVO;

@Controller
public class GoodsQnaController {
	
	@Autowired 
	private AdminService adminService;
	
	//상품문의 리스트(답변대기)
	@RequestMapping("gqnaList.mdo")
	public String gqnaList(GoodsQnaVO gqna, Model model) {
		model.addAttribute("gqnaList", adminService.gqnaList(gqna));
		return "goodsqna/goodsQna";
	}
	
	// 상품문의 리스트 삭제(답변대기)
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
	public String toAnanswer(GoodsQnaVO gqna) {
		return "goodsqna/answerGoodsQna";
	}
}
	