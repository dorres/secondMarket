package first.market.kurlyty.user.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int review_serial;
	private String user_id;
	private String review_title;
	private String review_content;
	private Date review_date;
	private String review_image_main;
	private int review_hit;
	private boolean review_best_up;
	private int category_goods_serial;
	
	
}
