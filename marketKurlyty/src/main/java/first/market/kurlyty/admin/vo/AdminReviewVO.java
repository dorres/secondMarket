package first.market.kurlyty.admin.vo;

import java.util.Date;

import lombok.Data;
@Data
public class AdminReviewVO {
	private int review_serial;
	private String user_serial;
	private String user_id;
	private String review_title;
	private String review_content;
	private Date review_date;
	private String review_image_main;
	private int review_hit;
	private boolean review_best_up;
	private int category_goods_serial;
	private int order_details_serial;
	private String category_goods_name;
}
