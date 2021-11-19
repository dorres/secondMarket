package first.market.kurlyty.admin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminOrderVO {
	//pk
	private int order_serial;
	//�ֹ� ��¥ 
	private Date order_date;
	//�ֹ��� ���̵�
	private String user_id;
	//�ֹ��� �̸�
	private String user_name;
	//�ֹ��� �̸���
	private String user_email;
	//�ֹ��� ����ȣ
	private String user_phone;
	//�ּ�1
	private String user_address1;
	//�ּ�2
	private String user_address2;
	//�����ȣ
	private String user_zipcode;
	//�ֹ� ǰ�� �� ex) ��� 2, ������ 3, ���� 5, ���� 3
	private int order_goods_count;
	//�ֹ� ���� �ݾ� (��޺� x)
	private int order_goods_price;
	//����??
	private int order_coupon_serial;
	//��ۻ��� (�����Ϸ�, ����غ���, �����, ��ۿϷ�, ����Ȯ��)
	private String order_delivery_status;
	//�ֹ���ȣ
	private String order_merchant_serial;
	//�ֹ������� �ֹ������� ��ǥ �̹��� ���� ���ؼ�
	private int master_goods_serial;
}
