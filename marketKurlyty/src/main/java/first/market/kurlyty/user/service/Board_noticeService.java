package first.market.kurlyty.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import first.market.kurlyty.user.vo.Board_Pagination;
import first.market.kurlyty.user.vo.Board_noticeVO;

public interface Board_noticeService {
	List<Board_noticeVO> getBoard_noticeList(Board_Pagination pagination);
	Board_noticeVO getBoard(Board_noticeVO vo) throws Exception;
	public void UpdateHit(int notice_serial);
	public int getBoardListCnt() throws Exception;

	
}
