package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.Board_noticeVO;
@Repository
public class Board_noticeDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Board_noticeVO> getBoard_noticeList(Board_noticeVO vo) {
		return sqlSession.selectList("Board_noticeDAO.getBoard_noticeList", vo);
		}
}
