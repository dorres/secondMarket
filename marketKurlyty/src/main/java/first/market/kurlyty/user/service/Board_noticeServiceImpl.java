package first.market.kurlyty.user.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.Board_noticeDAO;
import first.market.kurlyty.user.vo.Board_Pagination;
import first.market.kurlyty.user.vo.Board_noticeVO;
@Service("Board_noticeService")
public class Board_noticeServiceImpl implements Board_noticeService{
	@Autowired
	private Board_noticeDAO Board_noticeDAO;

	@Override
	public List<Board_noticeVO> getBoard_noticeList(Board_Pagination pagination) {
		return Board_noticeDAO.getBoard_noticeList(pagination);
	}

	@Override
	public Board_noticeVO getBoard(int notice_serial) throws Exception {
		
		return Board_noticeDAO.getBoard(notice_serial);
	}

	@Override
	public void UpdateHit(int notice_serial) {
		Board_noticeDAO.updateHit(notice_serial);
		
	}

	@Override
	public int getBoardListCnt() throws Exception {
		return Board_noticeDAO.getBoardListCnt();

	}



}
