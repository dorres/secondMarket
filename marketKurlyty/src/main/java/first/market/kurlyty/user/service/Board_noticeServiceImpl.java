package first.market.kurlyty.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.Board_noticeDAO;
import first.market.kurlyty.user.vo.Board_noticeVO;
@Service("Board_noticeService")
public class Board_noticeServiceImpl implements Board_noticeService{
	@Autowired
	private Board_noticeDAO Board_noticeDAO;

	@Override
	public List<Board_noticeVO> getBoard_noticeList(Board_noticeVO vo) {
		return Board_noticeDAO.getBoard_noticeList(vo);
	}

}
