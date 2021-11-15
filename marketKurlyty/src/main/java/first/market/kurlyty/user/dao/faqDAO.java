package first.market.kurlyty.user.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import first.market.kurlyty.user.vo.Board_Pagination;
import first.market.kurlyty.user.vo.faqVO;
@Repository
public class faqDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<faqVO> getBoard_faqList(Board_Pagination pagination) {
		return sqlSession.selectList("faqDAO.getBoard_faqList", pagination);
		}
	public int getBoardListCnt() throws Exception {
		return sqlSession.selectOne("faqDAO.getBoardListCnt");
	}
	
}
