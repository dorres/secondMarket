package first.market.kurlyty.user.vo;

import java.util.Date;

import lombok.Data;
@Data
public class User_order_listVO {
	private int order_serial;
	private Date order_date;
	private String user_id;
	private String user_name;
	private String user_mail;
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
	private String category_goods_image_thumb;
	private String category_goods_name;
	private Board_Pagination pagination;
	private String category_goods_detail_name1;
	private String category_goods_detail_name2;
	private String goods_detail_price;
	private String order_goods_old_price;
	
	
	
	

}
