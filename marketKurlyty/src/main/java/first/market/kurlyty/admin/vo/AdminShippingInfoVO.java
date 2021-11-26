package first.market.kurlyty.admin.vo;

import lombok.Data;

@Data
public class AdminShippingInfoVO {
	
	private int shipping_serial;
	private String shipping_address1;
	private String shipping_address2;
	private String shipping_zipcode;
	private String shipping_recipient_name;
	private String shipping_recipient_phone;
	private String shipping_pickup_type;
	private String shipping_pickup_detail;
	private String shipping_message_time;
	private String shipping_door_password;
	private String shipping_sender_name;
	private String shipping_sender_phone;
	private String order_merchant_serial;
	
}
