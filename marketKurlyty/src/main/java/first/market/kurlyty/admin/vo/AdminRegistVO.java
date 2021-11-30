package first.market.kurlyty.admin.vo;

import lombok.Data;

@Data
public class AdminRegistVO {
	private int rownum;
	private int goods_detail_serial;
	private String category_main_serial;
	private String category_main_name;	
	private String category_sub_serial;
	private String category_sub_name;
	private int category_goods_serial;
	private String category_goods_name;
	private int goods_detail_price;
	private int goods_detail_stock_quantity;
	private int goods_detail_stock_notification;
	private int goods_detail_promotion_serial;
	private int goods_detail_status;
	private int goods_detail_dicountrate;
	private int goods_stock_stock_quantity;
	private int goods_stock_receiving_quantity;
}
