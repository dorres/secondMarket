package first.market.kurlyty.user.vo;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsStockVO {
	private int goods_stock_serial;
	private int category_goods_serial;
	private Date goods_stock_receiving_date;
	private int goods_stock_receiving_quantity;
	private int goods_stock_stock_quantity;
	private Date goods_stock_exp_date;
}
