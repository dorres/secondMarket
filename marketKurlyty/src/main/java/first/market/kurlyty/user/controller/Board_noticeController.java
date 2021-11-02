package first.market.kurlyty.user.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.user.service.Board_noticeService;
import first.market.kurlyty.user.vo.Board_noticeVO;


@Controller
public class Board_noticeController {
	@Autowired
	private Board_noticeService board_noticeService;
	
	@RequestMapping("/notice.do")
	public String customerCenter1(Board_noticeVO vo,Model model) {
		//board_noticeService.getBoard_noticeList(vo);
		model.addAttribute("board",board_noticeService.getBoard_noticeList(vo));
		return "customerCenter/notice"; 
	}
	@RequestMapping("/notice_detail.do")
	public String customerCenter2(Board_noticeVO vo,Model model) {
		//board_noticeService.getBoard_noticeList(vo);
		model.addAttribute("board",board_noticeService.getBoard_noticeList(vo).get(0));
		return "customerCenter/notice_detail"; 
	}
}
