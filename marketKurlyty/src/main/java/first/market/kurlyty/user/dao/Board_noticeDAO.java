package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.Board_Pagination;
import first.market.kurlyty.user.vo.Board_noticeVO;
@Repository
public class Board_noticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Board_noticeVO getBoard(int notice_serial) throws Exception {
		
		return sqlSession.selectOne("Board_noticeDAO.getBoard", notice_serial);
	}
	public List<Board_noticeVO> getBoard_noticeList(Board_Pagination pagination) {
		return sqlSession.selectList("Board_noticeDAO.getBoard_noticeList", pagination);
		}
	public void updateHit(int notice_serial) {
		sqlSession.update("Board_noticeDAO.notice_hitUp", notice_serial);
	}
	public int getBoardListCnt() throws Exception {
		return sqlSession.selectOne("Board_noticeDAO.getBoardListCnt");
	}
	
	
}
