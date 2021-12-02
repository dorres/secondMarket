package first.market.kurlyty.admin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminSales2VO {
	private Date order_date;
	private int order_goods_price;
	private String order_delivery_status;
	private String month_chart;
	private int sales_count;
	private int sales_amount;
	private String startdate2;
	private String enddate2;
}
