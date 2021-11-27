package first.market.kurlyty.user.vo;

import java.util.Date;

import lombok.Data;

@Data
public class GoodsQnaVO {

	private int qna_goods_serial;
	private String user_id;
	private String user_name;
	//1�� ī�װ���
	private String category_main_serial;
	//2�� ī�װ���
	private String category_sub_serial;
	//3�� ī�װ���(��ǰ) pk
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
	
	//��ǰ �̸� join with ItemPageVO -DB���� 
	private String category_goods_name;
	//��ǰ ����� �̹���(ex..��ٱ���, �������� ����)
	private String category_goods_image_thumb;
	//�� ��ȣ
	private int rnum;
	
}