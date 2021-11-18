package first.market.kurlyty.admin.vo;

import java.util.Date;

import lombok.Data;
@Data
public class AdminGoodsStockVO {
	private int goods_detail_serial;
	private String category_main_serial;
	private String category_sub_serial;
	private int category_goods_serial;
	private int goods_detail_price;
	private int goods_detail_stock_quantity;
	private int goods_detail_stock_notification;
	private int goods_detail_promotion_serial;
	private int goods_detail_status;
	private int goods_detail_dicountrate;
	private int goods_stock_serial;
	private Date goods_stock_receiving_date;
	private int goods_stock_receiving_quantity;
	private int goods_stock_stock_quantity;
	private Date goods_stock_exp_date;
}
