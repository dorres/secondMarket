package first.market.kurlyty.vo;

import lombok.Data;

@Data
public class ProductVO {
	//category_goods
	private String category_main_serial;
	private String category_sub_serial;
	private int category_goods_serial;
	private String category_goods_name;
	private String category_goods_name_subtext;
	private String category_goods_unit;
	private String category_goods_weight;
	private String category_goods_origin;
	private String category_goods_packaging_type;
	private String category_goods_delivery_type;
	private String category_goods_exp_date;
	private String category_goods_info;
	private String category_goods_ref;
	private String category_goods_image_main;
	private String category_goods_image_thumb;
	private String category_goods_image_contents_detail;
	
	//goods_detail
	private int goods_detail_serial;
	private int goods_detail_price;
	private int goods_detail_stock_quantity;
	private int goods_detail_stock_notification;
	private int goods_detail_promotion_serial;
	private int goods_detail_status;
	private int goods_detail_dicountrate;
	
	//cartVO
	private int goods_cart_count;

	//notDB
	private int goods_last_price;
	private boolean okStock;
	
	//Á¤·Ä¼ø
	private String sort;
}
