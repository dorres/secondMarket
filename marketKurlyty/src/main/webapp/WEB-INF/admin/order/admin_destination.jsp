<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
table.type03 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 3px solid #5f0080;
  margin : 20px 10px;
}
table.type03 th {
  width: 147px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #153d73;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;

}
table.type03 td {
  width: 349px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
</style>
<script type="text/javascript">
var name = $('#shipping_reipient_name').val(opener.document.getElementById('shipping_reipient_name').value);
</script>
</head>
<body>
	<h3>������ ��</h3>
	<table class="type03">
		<tr>
			<th scope="row">�̸�</th>
			<td>
				<input type="text" name="shipping_reipient_name">
			</td>
		</tr>
		<tr>
			<th scope="row">����ó</th>
			<td>
				<input type="text" name="shipping_reipient_phone">
			</td>
		</tr>
		<tr>
			<th scope="row">������ ���</th>
			<td>
				<input type="text" name="shipping_pickup_type">
			</td>
		</tr>
		<tr>
			<th scope="row">��Ÿ ����</th>
			<td>
				<input type="text" name="shipping_pickup_detail">
			</td>
		</tr>
		<tr>
			<th scope="row">��� �Ϸ� �޽��� ����</th>
			<td>
				<input type="text" name="shipping_message_time">
			</td>
		</tr>
		<tr>
			<th scope="row">���� ��й�ȣ</th>
			<td>
				<input type="text" name="shipping_door_password">
			</td>
		</tr>	
	</table>
</body>
</html>