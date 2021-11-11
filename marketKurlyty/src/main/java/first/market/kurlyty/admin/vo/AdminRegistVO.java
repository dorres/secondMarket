package first.market.kurlyty.admin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminRegistVO {
	private int goods_sell_serial;
	private int category_main_serial;
	private int category_sub_serial;
	private int category_goods_serial;
	private int goods_sell_price;
	private Date goods_sell_receiving_date;
	private int goods_sell_receiving_quantity;
	private int goods_sell_stock_quantity;
	private Date goods_sell_exp_date;
	private int goods_sell_promotion_serial;
	private int goods_sell_status;
	private int goods_sell_discountrate;
}
