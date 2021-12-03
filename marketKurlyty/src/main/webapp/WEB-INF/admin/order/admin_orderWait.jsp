<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리티 :: 내일의 장보기, 마켓컬리티</title>
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
table.type02 td >input{
	width: 100%;
	height: 100%;
	border: none;
	resize: none;
}
textarea {
	width: 100%;
	height: 100%;
	border: none;
	resize: none;
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
					<li class="breadcrumb-item">주문정보</li>
					<li class="breadcrumb-item active">상세</li>
				</ol>
				
				<div class="card mb-4">
					<div class="card-header">
						<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
							주문정보 상세 페이지
						</div>
					</div>
					<div class="card-body">
						<form action="admin_categoryGoodsUpdate.mdo" method="POST" >
								<h3 style="margin-left: 10px">주문자 정보</h3>
								<table class="type02">
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
										<th>주문 날짜</th>
										<td><input type="text" value="<fmt:formatDate value="${orderWait.order_date  }" pattern="yyyy-MM-dd"/>" readonly="readonly"></td>
										
										<th>주문 번호</th>
										<td><input type="text" value="${orderWait.order_merchant_serial }" readonly="readonly"></td>
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
											<textarea rows="5" style="width: 100%" readonly="readonly"><c:forEach var="detail" items="${orderWaitDetail }">${detail.category_goods_name }
가격: ${detail.goods_detail_price }
수량: ${detail.order_goods_count }
총가격: ${detail.order_goods_old_price }
할인가격: ${detail.order_goods_price } 

</c:forEach></textarea>
										</td>
									</tr>					
								</table>
								<br>
								<h3 style="margin-left: 10px">받으실 분</h3>
								<table class="type02">
									<tr>
										<th>이름</th>
										<td><input type="text" name="shipping_recipient_name" id="shipping_recipient_name" value="${shippingInfo.shipping_recipient_name }" ></td>
										
										<th>연락처</th>
										<td><input type="text" name="shipping_recipient_phone" value="${shippingInfo.shipping_recipient_phone }" ></td>
									</tr>                 
									
									<tr>
										<th>받으실 장소</th>
										<td colspan="3"><input type="text" name="shipping_pickup_type" value="${shippingInfo.shipping_pickup_type }" ></td>
									</tr>
		
									<tr>
										<th>기타 정보</th>
										<td colspan="3"><input type="text" name="shipping_pickup_detail" value="${shippingInfo.shipping_pickup_detail }" ></td>
									</tr>
									<tr>
									<th>배송 완료 메시지 전송</th>
										<td><input type="text" name="shipping_message_time" value="${shippingInfo.shipping_message_time }" ></td>
									
									<th>공동 비밀번호</th>
										<td ><input type="text" name="shipping_door_password" value="${shippingInfo.shipping_door_password }" ></td>
									</tr>
				
								</table>
								
								<div style="margin-left: 10px">
									<input type="button" value="받는사람 수정하기" id="updateBtn"  /> 
									<input type="hidden" value="${orderWait.order_merchant_serial }" name="order_merchant_serial">
									<c:if test="${orderWait.order_delivery_status eq '결제완료' or orderWait.order_delivery_status eq '배송준비중' }">
										<input type="button" value="목록보기" onclick="location.href='admin_orderWaitList.mdo'"/>
									</c:if>
									<c:if test="${orderWait.order_delivery_status eq '배송중' or orderWait.order_delivery_status eq '배송완료' }">
										<input type="button" value="목록보기" onclick="location.href='admin_orderdeliveryList.mdo'"/>
									</c:if>
									<c:if test="${orderWait.order_delivery_status eq '구매완료' }">
										<input type="button" value="목록보기" onclick="location.href='admin_orderFinishList.mdo'"/>
									</c:if>
									<c:if test="${orderWait.order_delivery_status eq '환불요청' or orderWait.order_delivery_status eq '환불완료' }">
										<input type="button" value="목록보기" onclick="location.href='admin_orderRefundList.mdo'"/>
									</c:if>
									<c:if test="${orderWait.order_delivery_status eq '반품요청' or orderWait.order_delivery_status eq '반품완료' }">
										<input type="button" value="목록보기" onclick="location.href='admin_orderReturnList.mdo'"/>
									</c:if>
									<c:if test="${orderWait.order_delivery_status eq '취소요청' or orderWait.order_delivery_status eq '취소완료' }">
										<input type="button" value="목록보기" onclick="location.href='admin_orderCancleList.mdo'"/>
									</c:if>									
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
<script>
function popup(){
	var url="admin_shippingInfoUpdate.mdo";
	window.open(url,'','width=450,height=500,location=no,status=no,scrollbars=yes');
}
</script>
<script type="text/javascript">
$("#updateBtn").on("click",function(){
	var serial = $('input[name=order_merchant_serial]').val();
	var name = $('input[name=shipping_recipient_name]').val();
	var phone = $('input[name=shipping_recipient_phone]').val();
	var place = $('input[name=shipping_pickup_type]').val();
	var info = $('input[name=shipping_pickup_detail]').val();
	var message = $('input[name=shipping_message_time]').val();
	var pw = $('input[name=shipping_door_password]').val();
	if(confirm('받는 사람을 수정하시겠습니까?')) {
	$.ajax({
		type:"POST",
		url:"admin_shippingInfoUpdate.mdo",
		dataType : "json",
		data : {"order_merchant_serial" : serial, "shipping_recipient_name" : name, "shipping_recipient_phone" : phone, "shipping_pickup_type" : place, "shipping_pickup_detail" : info, "shipping_message_time" : message, "shipping_door_password" : pw },
		success: function(result) {
			if(result != 0){
				alert("성공적으로 수정하였습니다.")
				location.reload();
			}else{
				alert("수정에 실패했습니다.")
				location.reload();
			}
		}
	}) 
	}
});

</script>
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
