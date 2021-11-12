package first.market.kurlyty.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.faqDAO;
import first.market.kurlyty.user.vo.Board_Pagination;
import first.market.kurlyty.user.vo.faqVO;
@Service("faqService")
public class faqServiceImpl implements faqService{
	@Autowired
	private faqDAO faqDAO;

	@Override
	public List<faqVO> getBoard_faqList(Board_Pagination pagination) {
		return faqDAO.getBoard_faqList(pagination);
	}

	@Override
	public int getBoardListCnt() throws Exception {
		return faqDAO.getBoardListCnt();
	}

}
