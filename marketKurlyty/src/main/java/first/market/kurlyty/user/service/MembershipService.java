package first.market.kurlyty.user.service;

import first.market.kurlyty.user.vo.MembershipVO;

public interface MembershipService {

	MembershipVO getMembershipData(String user_membership_name);
	String getMembershipOfUser(String user_id);
}