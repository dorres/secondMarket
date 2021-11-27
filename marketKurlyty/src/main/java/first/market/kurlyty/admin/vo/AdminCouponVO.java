package first.market.kurlyty.admin.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AdminCouponVO {
	
	private int rownum;
	//mk_coupon
	//����pk
	private int coupon_serial;
	
	//���� �ڵ�
	private String coupon_code;
	
	//���� �̸�
	private String coupon_name;
	
	//���� Ÿ��(0:�ۼ�Ʈ , 1:�ݾ�)
	private int coupon_type;
	
	//���� �ּ� ��� �ݾ�
	private int coupon_min;
	
	//���� ������/�ݾ�
	private int coupon_discount;
	
	
	//���� �ִ� ���αݾ�(%\�ϰ��)
	private int coupon_max;
	
	//���� ��ȿ�Ⱓ
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_start;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date coupon_end;
	
	//mk_coupon_use
	//���� ���� �ø���
	private int counpon_use_serial;
	
	//��Ǭ�� ������ �ִ� ���̵�
	private String coupon_use_userid;
	
	//���� ���� Ű��
	private int coupon_use_coupon_serial;
	
	//������ ������ ����ߴ��� ���ߴ��� (0:������-�̹� ����� ���� 1:��밡�� 2:�����-�������� ���� ����)
	private int coupon_use_status;
	
	
}
