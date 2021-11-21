package first.market.kurlyty.admin.vo;

import lombok.Data;

@Data
public class AdminMembershipVO {
	private int rownum;
	private String user_membership_name;
	private int user_membership_point_rate;
	private int user_membership_performance;
}
