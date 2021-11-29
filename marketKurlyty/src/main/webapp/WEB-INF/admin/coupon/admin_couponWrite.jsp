<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>??????????????</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
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
<body class="sb-nav-fixed">
<div id="layoutSidenav">
	<jsp:include page="../default/top.jsp"></jsp:include>
	<jsp:include page="../default/sideMenu.jsp"></jsp:include>

	<!-- Main -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4">쿠폰</h1>

				<div class="card mb-4">
					<div class="card-header">
						쿠폰 등록
					</div>
					<div class="card-body">
						<form action="admin_couponInsert.mdo" method="POST" >
								<table class="type02">
									<tr>
										<th scope="row" >쿠폰 이름</th>
										<td><input type="text" name="coupon_name" placeholder="ex) 20% 특별 쿠폰"/></td>
									</tr>
									<tr>
										<th scope="row" >쿠폰 코드</th>
										<td>
											<input type="text" name="coupon_code" id="coupon_code"/>
											<input type="button" id="codeUpdate" value="코드 생성">
										</td>
									</tr>	
									<tr>
										<th scope="row" >쿠폰 타입</th>
										<td>
											<select name="coupon_type" id="coupon_type" style="width: 190px ">
												<option value="0">할인율</option>
												<option value="1">금액</option>
											</select>
										</td>
									</tr>
									
									<tr>
										<th scope="row" >쿠폰 최소 사용 금액</th>
										<td><input type="text" name="coupon_min" value="0"/></td>
									</tr>
									
									<tr>
										<th scope="row"  >쿠폰 금액/할인율</th>
										<td><input type="text" name="coupon_discount" id="coupon_discount"/></td>
									</tr>
									<!-- 퍼센트 일경우 최대 할인금액 입력할수있게 readonly 상태를 변경? -->
									<tr>
										<th scope="row" >쿠폰 최대 할인금액</th>
										<td><input type="text" name="coupon_max" id="coupon_max"/></td>
									</tr>
									
									<tr>
										<th scope="row"  >쿠폰 시작일</th>
										<td><input type="date" name="coupon_start"/></td>
									</tr>
									
									<tr>
										<th scope="row" >쿠폰 만료일</th>
										<td><input type="date" name="coupon_end"/></td>
									</tr>
									
								</table>
							<input type="submit" value="등록하기" />
							<input type="button" value="목록보기" onclick="location.href='admin_couponList.mdo'"/>
						</form>
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
		<jsp:include page="../default/footer.jsp"></jsp:include>
	</div>
	</div>
	<!-- Main -->
<script type="text/javascript">
$("#codeUpdate").click( function() {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    for( var i=0; i < 15; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    $("#coupon_code").val(text);
})

</script>	
<script>
$('#coupon_discount').focusout(function() {
    var num = $("#coupon_discount").val();
    var result =  $("#coupon_type option:selected").val();
    console.log(result)
    if(result ==1){
    	$('input[name=coupon_max]').attr('value',num);
	}
});
</script>
	<!-- 건들지마세요 -->
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>
	<!-- 건들지마세요 -->
</body>
</html>