package first.market.kurlyty.user.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import first.market.kurlyty.user.service.Board_noticeService;
import first.market.kurlyty.user.vo.Board_Pagination;
import first.market.kurlyty.user.vo.Board_noticeVO;
import first.market.kurlyty.user.vo.faqVO;


@Controller
public class Board_noticeController {
	@Autowired
	private Board_noticeService board_noticeService;
			
	@GetMapping("/notice.do")
	public String customerCenter1(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			) throws Exception {
		
		int listCnt = board_noticeService.getBoardListCnt();
		
		Board_Pagination pagination = new Board_Pagination();
	    
		pagination.pageInfo(page, range, listCnt);				
		
		model.addAttribute("pagination", pagination);
		
		model.addAttribute("board",board_noticeService.getBoard_noticeList(pagination));
		return "customerCenter/notice"; 

		
	}
	@GetMapping("/notice_detail.do")
	public String customerCenter2(HttpServletRequest request,Board_noticeVO vo ,Model model) throws Exception {
		//board_noticeService.getBoard_noticeList(vo);
		
		String ff = request.getParameter("notice_serial");
		board_noticeService.UpdateHit(Integer.parseInt(ff));
//		if(ff == null) {
//			ff="1";
//		}
		//System.out.println(ff);		
//		Board_noticeVO vo = board_noticeService.getBoard(Integer.parseInt(ff));
//		board_noticeService.UpdateHit(Integer.parseInt(ff));
		model.addAttribute("board",board_noticeService.getBoard(vo));
		return "customerCenter/notice_detail"; 
	}
}
