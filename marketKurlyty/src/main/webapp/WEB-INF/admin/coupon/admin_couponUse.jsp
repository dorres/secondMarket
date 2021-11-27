<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>쿠폰 발급</title>
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
table.type02 {
  border-collapse: separate;
  border-spacing: 0;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 1px solid #ccc;
  margin : 20px 10px;
}
table.type02 th {
  width: 200px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  border-top: 1px solid #fff;
  border-left: 1px solid #fff;
  background: #eee;
}
table.type02 td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>
	<form action="admin_couponUpdate.mdo" method="POST">
		<table class="type02">
			<tr>
				<th scope="row">쿠폰 이름</th>
				<td>
					<select name="coupon_serial" id="coupon_serial"  style="width: 190px">
						<c:forEach var="coupon" items="${couponList }">
							<option value="${coupon.coupon_serial }">${coupon.coupon_name }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row">등급 선택</th>
				<td>
					<select name="user_membership_name" id="user_membership_name"  style="width: 190px">
					
					<c:forEach var="membership" items="${membershipList }">
						<option value="${membership.user_membership_name }">${membership.user_membership_name }</option>
					</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		<input type="button" id="couponIssue" name="couponIssue" value="발급하기" style=" margin:40px auto; display: block; vertical-align: bottom; width: 100px; font-size: 18px">
	</form>
<script>
	$("#couponIssue").click(function(){
		var checkBtn = $(this);
		var table = checkBtn.siblings("table")
		var coupon = table.find("tr").eq(0).find("#coupon_serial option:selected").val();
		var membership = table.find("tr").eq(1).find("#user_membership_name option:selected").val();
		
		$.ajax({
			type:"POST",
			url:"admin_couponUseInsert.mdo",
			dataType : "json",
			data : {"coupon_serial" : coupon, "user_membership_name" : membership},
			success: function(result) {
				if(result != 0){
					alert("쿠폰을 발행했습니다")
					opener.document.location.reload();
					self.close()
				}else{
					alert("쿠폰발행에 실패했습니다.")
					location.reload();
				}
			}
		}) 
	})

	function myClose(){
		self.close();
	}	
</script>
</body>
</html>