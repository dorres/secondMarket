package first.market.kurlyty.admin.vo;

import java.util.Date;

import lombok.Data;
@Data
public class GoodsQnaVO {
	private int qna_goods_serial;
	private String user_id;
	private String user_name;
	private String category_main_serial;
	private String category_sub_serial;
	private String category_goods_serial;
	private String qna_goods_title;
	private String qna_goods_content;
	private Date qna_goods_date;
	private int qna_goods_answer_status;
	private boolean qna_goods_lock;
	private String qna_goods_answer;
	private Date qna_goods_answer_date;
	private String category_goods_name;
	private int count;
}



