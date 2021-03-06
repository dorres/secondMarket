package first.market.kurlyty.admin.vo;

import lombok.Data;

@Data
public class AdminUserVO {
	private int rownum;
	private int user_serial;
	private String user_id;
	private String user_name;
	private String user_phone;
	private String user_membership_name;
	private String user_last_login;
	private String user_point;
	private int user_total_purchase;
	private int user_status;
}
