package first.market.kurlyty.user.vo;

import lombok.Data;

@Data
public class ItemPageVO {
	   //1�� ī�װ�
	   private String category_main_serial;
	   //2�� ī�װ�
	   private String category_sub_serial;
	   //3�� ī�װ�(��ǰ) pk
	   private int category_goods_serial;
	   //��ǰ �̸�
	   private String category_goods_name;
	   //��ǰ�� ����
	   private String category_goods_name_subtext;
	   //��ǰ ����
	   private String category_goods_unit;
	   //��ǰ ����
	   private String category_goods_weight;
	   //��ǰ ������
	   private String category_goods_origin;
	   //��ǰ ���� Ÿ��
	   private String category_goods_packaging_type;
	   //��ǰ ��� ����
	   private String category_goods_delivery_type;
	   //��ǰ �������
	   private String category_goods_exp_date; 
	   //��ǰ �ȳ�����
	   private String category_goods_info;
	   //��ǰ ��������
	   private String category_goods_ref;
	   //��ǰ �˷��������
	   private String category_goods_allergy;
	   //��ǰ ������ �̸�1
	   private String category_goods_detail_name1;
	   //��ǰ ������ �̸�2
	   private String category_goods_detail_name2;
	   //��ǰ ������ ����
	   private String category_goods_detail_name_subtext;   
	   //��ǰ ����� �̹���(ex..��ٱ���, �������� ����)
	   private String category_goods_image_thumb;
	   //��ǰ ���� �̹���(��ǰ���� ���)
	   private String category_goods_image_detail_header;
	   //��ǰ ���� �̹���
	   private String category_goods_image_detail_main;
	   
	   private int goods_detail_price;
	   private int goods_detail_stock_quantity;
	   private int goods_detail_stock_notification;
	   private int goods_detail_promotion_serial;
	   private int goods_detail_dicountrate;
	   private int goods_last_price;
	
}
