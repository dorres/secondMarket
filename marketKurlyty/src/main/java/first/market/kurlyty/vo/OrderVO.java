package first.market.kurlyty.vo;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	//mk_order
	private int order_serial;
	private Date order_date;
	private String user_id;
	private String user_name;
	private String user_email;
	private String user_phone;
	private String user_address1;
	private String user_address2;
	private String user_zipcode;
	private int order_goods_count;
	private int order_goods_price;
	private int order_coupon_serial;
	private String order_delivery_status;
	private String order_merchant_serial;
	private int master_goods_serial;
	private int order_point;
	
	//mk_order_details
	private int order_details_serial;
	private int category_goods_serial;
	private int order_goods_old_price;

	//user_details
	private int user_point;
	
	//mk_order_details의 각 제품의 수량과 가격
	private int goods_count;
	private int goods_price;
}
