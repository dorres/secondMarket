package first.market.kurlyty.admin.vo;

import lombok.Data;

@Data
public class AdminCouponVO {
	private String coupon_name; // ���� �̸�
	private String coupon_code; // ���� �ڵ�
	private String coupon_expiry; // ���� ������
	private String coupon_discount_price; // ���� ���� �ݾ�
	private String coupon_min_use; // ������� ���ѱݾ�
	private String coupon_max_bargain; // �������� ���ѱݾ� ( �ִ� ���� �ݾ� )
	private String coupon_note; // ���� ����(���)
}