package first.market.kurlyty.user.vo;

import lombok.Data;

@Data
public class user_address_listVO {
	private int address_serial;
	private String user_address1;
	private String user_address2;
	private String user_zipcode;
	private String user_id;
	private String user_name;
	private String user_phone;
	private boolean address_default;
	
	
	
}
