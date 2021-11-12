package first.market.kurlyty.user.service;

import java.util.List;

import first.market.kurlyty.user.vo.Board_Pagination;
import first.market.kurlyty.user.vo.faqVO;


public interface faqService {
	List<faqVO> getBoard_faqList(Board_Pagination pagination);
	public int getBoardListCnt() throws Exception;
}
