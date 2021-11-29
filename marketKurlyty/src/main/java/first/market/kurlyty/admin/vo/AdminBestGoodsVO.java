package first.market.kurlyty.admin.vo;

import lombok.Data;

@Data
public class AdminBestGoodsVO {
	private int order_details_serial;
	private String order_merchant_serial;
	private int category_goods_serial;
	private int order_goods_count;
	private int order_goods_price;
	private String user_id;
	private int order_goods_old_price;
	
	private String category_goods_name;
	
}
