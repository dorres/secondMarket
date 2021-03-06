package first.market.kurlyty.user.vo;

import lombok.Data;

@Data
public class ItemPageVO {
	   //1차 카테고리
	   private String category_main_serial;
	   //2차 카테고리
	   private String category_sub_serial;
	   //3차 카테고리(상품) pk
	   private int category_goods_serial;
	   //상품 이름
	   private String category_goods_name;
	   //상품명 설명
	   private String category_goods_name_subtext;
	   //상품 단위
	   private String category_goods_unit;
	   //상품 무게
	   private String category_goods_weight;
	   //상품 원산지
	   private String category_goods_origin;
	   //상품 포장 타입
	   private String category_goods_packaging_type;
	   //상품 배송 유형
	   private String category_goods_delivery_type;
	   //상품 유통기한
	   private String category_goods_exp_date; 
	   //상품 안내사항
	   private String category_goods_info;
	   //상품 참조사항
	   private String category_goods_ref;
	   //상품 알레르기사항
	   private String category_goods_allergy;
	   //상품 상세정보 이름1
	   private String category_goods_detail_name1;
	   //상품 상세정보 이름2
	   private String category_goods_detail_name2;
	   //상품 상세정보 설명
	   private String category_goods_detail_name_subtext;   
	   //상품 썸네일 이미지(ex..장바구니, 상세페이지 맨위)
	   private String category_goods_image_thumb;
	   //상품 설명 이미지(상품설명 상단)
	   private String category_goods_image_detail_header;
	   //상품 정보 이미지
	   private String category_goods_image_detail_main;
	   
	   private int goods_detail_price;
	   private int goods_detail_stock_quantity;
	   private int goods_detail_stock_notification;
	   private int goods_detail_promotion_serial;
	   private int goods_detail_dicountrate;
	   private int goods_last_price;
	
}
