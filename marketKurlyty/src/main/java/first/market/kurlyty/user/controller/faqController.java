package first.market.kurlyty.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import first.market.kurlyty.user.service.faqService;
import first.market.kurlyty.user.vo.Board_Pagination;


@Controller
public class faqController {
	@Autowired
	private faqService faqService;
	
	@GetMapping("/faq.do")
	public String customerCenter1(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			) throws Exception {
		
		int listCnt = faqService.getBoardListCnt();
		
		Board_Pagination pagination = new Board_Pagination();
	    
		pagination.pageInfo(page, range, listCnt);				
		
		model.addAttribute("pagination", pagination);
		
		model.addAttribute("board",faqService.getBoard_faqList(pagination));
		return "customerCenter/regularQuestion"; 
		

	}
	
}
