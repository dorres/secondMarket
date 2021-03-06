package first.market.kurlyty.user.vo;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsQnaVO {

	private int qna_goods_serial;
	private String user_id;
	private String user_name;
	//1차 카테고리
	private String category_main_serial;
	//2차 카테고리
	private String category_sub_serial;
	//3차 카테고리(상품) pk
	int category_goods_serial;
	
	private String qna_goods_title;
	private String qna_goods_content;
	private Date qna_goods_date;
	private int qna_goods_answer_status;
	private boolean qna_goods_lock;
	private String qna_goods_answer;
	private Date qna_goods_answer_date;
	private String qna_goods_name;
	private String qna_goods_image_thumb;
	
	//상품 이름 join with ItemPageVO -DB에서 
	private String category_goods_name;
	//상품 썸네일 이미지(ex..장바구니, 상세페이지 맨위)
	private String category_goods_image_thumb;
	//행 번호
	private int rnum;
	//페이징처리
	private int start;
	private int end;
	
}
