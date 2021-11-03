package first.market.kurlyty.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import first.market.kurlyty.user.service.PersonalQnaService;
import first.market.kurlyty.user.vo.PersonalQnaVO;


@Controller
public class PersonalQnaController {
	@Autowired
	private PersonalQnaService personalqnaService;
//	
	@RequestMapping("/personalqnaBoard.do")
		public String customerCenter(Model model) {
			return "customerCenter/personalQnaBoard";
	}
	@RequestMapping("/personalqnaWrite.do")
	public String customerCenter(Model model) {
		return "customerCenter/personalQnaWrite";
	}
}

	



/*	@Autowired
	private Board_noticeService board_noticeService;
	
	@RequestMapping("/personalQna.do")
	public String customerCenter1(Board_noticeVO vo,Model model) {
		board_noticeService.getBoard_noticeList(vo);
		model.addAttribute("board",board_noticeService.getBoard_noticeList(vo));
		return "customerCenter/notice"; 
	*/
}
