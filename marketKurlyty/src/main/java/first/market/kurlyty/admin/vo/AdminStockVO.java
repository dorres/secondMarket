package first.market.kurlyty.admin.vo;

import java.util.Date;

<<<<<<< HEAD
=======
import org.springframework.format.annotation.DateTimeFormat;

>>>>>>> Ben
import lombok.Data;
@Data
public class AdminStockVO {
	private int goods_stock_serial;
	private int category_goods_serial;
<<<<<<< HEAD
	private Date goods_stock_receiving_date;
	private int goods_stock_receiving_quantity;
	private int goods_stock_total_quantity;
	private int goods_stock_stock_quantity;
=======
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date goods_stock_receiving_date;
	private int goods_stock_receiving_quantity;
	private int goods_stock_stock_quantity;
	@DateTimeFormat(pattern="yyyy-MM-dd")
>>>>>>> Ben
	private Date goods_stock_exp_date;
}
