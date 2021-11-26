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
	
	//��ǰ���� ����Ʈ(�亯���)
	@RequestMapping("gqnaList.mdo")
	public String gqnaList(GoodsQnaVO gqna, Model model) {
		model.addAttribute("gqnaList", adminService.gqnaList(gqna));
		return "goodsqna/goodsQna";
	}
	
	// ��ǰ���� ����Ʈ ����
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
	
	//��ǰ���� �亯���� 
	@RequestMapping("toAnswer.mdo")
	public String toAnanswer(GoodsQnaVO gqna, Model model) {
		model.addAttribute("qnaone", adminService.gqnaOne(gqna));
		return "goodsqna/answerGoodsQna";
	}
	
	//��ǰ���� �亯
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
	
	//��ǰ���� ����Ʈ(�亯�Ϸ�)
		@RequestMapping("gqnaListSuc.mdo")
		public String gqnaListSuc(GoodsQnaVO gqna, Model model) {
			model.addAttribute("gqnaListSuc", adminService.gqnaListSuc(gqna));
			return "goodsqna/sucGoodsQna";
		}
	
	//��ǰ���� �亯 Ȯ��
		@RequestMapping("checkAnswer.mdo")
		public String checkAnswer(GoodsQnaVO gqna, Model model) {
			model.addAttribute("qnaone", adminService.gqnaOne(gqna));
			return "goodsqna/checkAnswerGoodsQna";
		}
		
	//��ǰ���� �亯 ����
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
	
	// ��ǰ���� ����(�亯�Ϸ�)
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
	