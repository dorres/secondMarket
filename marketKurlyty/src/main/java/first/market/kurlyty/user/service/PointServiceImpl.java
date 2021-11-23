package first.market.kurlyty.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.PointDAO;
import first.market.kurlyty.user.vo.User_order_listVO;

@Service("PointService")
public class PointServiceImpl implements PointService{
	
	@Autowired
	private PointDAO pointDAO;

	@Override
	public List<User_order_listVO> pointList(String user_id) {
		return pointDAO.pointList(user_id);
	}

	@Override
	public Integer totalPoint(String user_id) {
		return pointDAO.totalPoint(user_id);
	}

}
