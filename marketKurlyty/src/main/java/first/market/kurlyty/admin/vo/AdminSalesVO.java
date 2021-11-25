package first.market.kurlyty.admin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminSalesVO {
		private Date order_date;
		private int order_goods_price;
		private String order_delivery_status;
		private String daily_chart;
		private int sales_count;
		private int sales_amount;
		private String startdate;
		private String enddate;
}

