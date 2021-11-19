package first.market.kurlyty.admin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminOrderVO {
	//pk
	private int order_serial;
	//주문 날짜 
	private Date order_date;
	//주문자 아이디
	private String user_id;
	//주문자 이름
	private String user_name;
	//주문자 이메일
	private String user_email;
	//주문자 폰번호
	private String user_phone;
	//주소1
	private String user_address1;
	//주소2
	private String user_address2;
	//우편번호
	private String user_zipcode;
	//주문 품목 수 ex) 사과 2, 오렌지 3, 포도 5, 값은 3
	private int order_goods_count;
	//주문 결제 금액 (배달비 x)
	private int order_goods_price;
	//쿠폰??
	private int order_coupon_serial;
	//배송상태 (결제완료, 배송준비중, 배송중, 배송완료, 구매확정)
	private String order_delivery_status;
	//주문번호
	private String order_merchant_serial;
	//주문했을때 주문내역에 대표 이미지 띄우기 위해서
	private int master_goods_serial;
}
