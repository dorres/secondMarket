<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
table{
	border-collapse: collapse;
	text-align: left;
	width: 1200px;
}
th {
	width: 100px;
	height: 50px;
	font-size: 15px;
	border: 1px solid #ccc;
}
td {
	width: 200px;
	border: 1px solid #ccc;
}
td >input{
	width: 100%;
	height: 100%;
	border: none;
	resize: none;
	font-style: italic;
}

textarea {
	width: 100%;
	height: 100%;
	border: none;
	resize: none;
	font-style: italic;
}
textarea:focus, input:focus{
    outline: none;
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
				<h1 class="mt-4">주문내역</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">주문내역 세부사항</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">주문내역 <fmt:formatDate value="${orderWait.order_date  }" pattern="yyyy-MM-dd"/></div>
					<div class="card-body">
						<form action="admin_categoryGoodsUpdate.mdo" method="POST" enctype="multipart/form-data">
								<h3>주문자 정보</h3>주문번호!!!!
								<table>
									<tr>
										<th>이름</th>
										<td><input type="text" name="user_name" value="${orderWait.user_name }" readonly="readonly"></td>
										
										<th>연락처</th>
										<td><input type="text" name="user_phone" value="${orderWait.user_phone }" readonly="readonly"></td>
										
									</tr>                 
									
									<tr>
										<th>주소</th>
										<td colspan="5"><input type="text" name="user_address1" value="${ orderWait.user_address1 } ${orderWait.user_address2}" readonly="readonly"></td>
									</tr>
		
									<tr>	
										<th>결제 금액</th>
										<td><input type="text" name="order_goods_price" value="${orderWait.order_goods_price }" readonly="readonly"></td>
										
										<th>주문 상태</th>
										<td><input type="text" name="order_delivery_status" value="${orderWait.order_delivery_status }" readonly="readonly"></td>
									</tr>
									<tr>
										<th>구매 물품 내역</th>
										<td colspan="5">
											<textarea rows="5" style="width: 100%"></textarea>
										</td>
									</tr>					
								</table>
								<br>
								<h3>받으실 분</h3>
								<table>
									<tr>
										<th>이름</th>
										<td><input type="text" name="shipping_reipient_name" value="${shippingInfo.shipping_recipient_name }" readonly="readonly"></td>
										
										<th>연락처</th>
										<td><input type="text" name="shipping_reipient_phone" value="${shippingInfo.shipping_recipient_phone }" readonly="readonly"></td>
									</tr>                 
									
									<tr>
										<th>받으실 장소</th>
										<td colspan="3"><input type="text" name="shipping_pickup_type" value="${shippingInfo.shipping_pickup_type }" readonly="readonly"></td>
									</tr>
		
									<tr>
										
										<th>기타 정보</th>
										<td colspan="3"><input type="text" name="shipping_pickup_detail" value="${shippingInfo.shipping_pickup_detail }" readonly="readonly"></td>
										
										
									</tr>
									<tr>
									<th>배송 완료 메시지 전송</th>
										<td><input type="text" name="shipping_message_time" value="${shippingInfo.shipping_message_time }" readonly="readonly"></td>
									
									<th>공동 비밀번호</th>
										<td ><input type="text" name="shipping_door_password" value="${shippingInfo.shipping_door_password }" readonly="readonly"></td>
									</tr>
				
								</table>
								
								<div align="right" style="width: 1200px">
									<input type="submit" value="등록하기" />
									<input type="button" value="목록보기" onclick="location.href='admin_categoryGoodsList.mdo'"/>
								</div>
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