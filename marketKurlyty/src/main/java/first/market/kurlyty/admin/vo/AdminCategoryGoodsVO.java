package first.market.kurlyty.admin.vo;

import lombok.Data;

@Data
public class AdminCategoryGoodsVO {
	int rownum;
	//1차 카테고리
	String category_main_serial;
	//2차 카테고리
	String category_sub_serial;
	//3차 카테고리(상품) pk
	int category_goods_serial;
	//상품 이름
	String category_goods_name;
	//상품명 설명
	String category_goods_name_subtext;
	//상품 단위
	String category_goods_unit;
	//상품 무게
	String category_goods_weight;
	//상품 원산지
	String category_goods_origin;
	//상품 포장 타입
	String category_goods_packaging_type;
	//상품 배송 유형
	String category_goods_delivery_type;
	//상품 유통기한
	String category_goods_exp_date; 
	//상품 안내사항
	String category_goods_info;
	//상품 참조사항
	String category_goods_ref;
	//상품 알레르기사항
	String category_goods_allergy;
	//상품 상세정보 이름1
	String category_goods_detail_name1;
	//상품 상세정보 이름2
	String category_goods_detail_name2;
	//상품 상세정보 설명
	String category_goods_detail_name_subtext;	
	//상품 썸네일 이미지(ex..장바구니, 상세페이지 맨위)
	String category_goods_image_thumb;
	//상품 설명 이미지(상품설명 상단)
	String category_goods_image_detail_header;
	//상품 정보 이미지
	String category_goods_image_detail_main;
	
	//join~~
	String category_main_name;
	String category_sub_name;
}
