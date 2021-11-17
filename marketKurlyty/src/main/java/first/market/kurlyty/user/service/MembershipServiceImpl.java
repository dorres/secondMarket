package first.market.kurlyty.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import first.market.kurlyty.user.dao.MembershipDAO;
import first.market.kurlyty.user.vo.MembershipVO;

@Service
public class MembershipServiceImpl implements MembershipService {
	@Autowired
	private MembershipDAO membershipDao;
	@Override
	public MembershipVO getMembershipData(String user_membership_name) {
		return membershipDao.getMembership(user_membership_name);
	}
	@Override
	public String getMembershipOfUser(String user_id) {
		return membershipDao.getMembershipOfUser(user_id);
	}
}
