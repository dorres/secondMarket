package first.market.kurlyty.user.service;

import java.util.List;

import first.market.kurlyty.user.vo.Board_noticeVO;

public interface Board_noticeService {
	List<Board_noticeVO> getBoard_noticeList(Board_noticeVO vo);
}
