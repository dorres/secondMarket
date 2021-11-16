package first.market.kurlyty.admin.vo;

import lombok.Data;

@Data
public class AdminCategoryGoodsVO {
	int rownum;
	//1�� ī�װ�
	String category_main_serial;
	//2�� ī�װ�
	String category_sub_serial;
	//3�� ī�װ�(��ǰ) pk
	int category_goods_serial;
	//��ǰ �̸�
	String category_goods_name;
	//��ǰ�� ����
	String category_goods_name_subtext;
	//��ǰ ����
	String category_goods_unit;
	//��ǰ ����
	String category_goods_weight;
	//��ǰ ������
	String category_goods_origin;
	//��ǰ ���� Ÿ��
	String category_goods_packaging_type;
	//��ǰ ��� ����
	String category_goods_delivery_type;
	//��ǰ �������
	String category_goods_exp_date; 
	//��ǰ �ȳ�����
	String category_goods_info;
	//��ǰ ��������
	String category_goods_ref;
	//��ǰ �˷��������
	String category_goods_allergy;
	//��ǰ ������ �̸�1
	String category_goods_detail_name1;
	//��ǰ ������ �̸�2
	String category_goods_detail_name2;
	//��ǰ ������ ����
	String category_goods_detail_name_subtext;	
	//��ǰ ����� �̹���(ex..��ٱ���, �������� ����)
	String category_goods_image_thumb;
	//��ǰ ���� �̹���(��ǰ���� ���)
	String category_goods_image_detail_header;
	//��ǰ ���� �̹���
	String category_goods_image_detail_main;
	
	//join~~
	String category_main_name;
	String category_sub_name;
}
