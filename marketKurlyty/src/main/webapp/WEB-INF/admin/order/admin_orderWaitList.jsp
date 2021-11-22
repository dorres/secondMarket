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
 td{
 	text-align: center;
 	vertical-align: middle;
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
				<h1 class="mt-4">주문관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">주문관리 목록</a></li>
					<li class="breadcrumb-item active">목록</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 주문관리 리스트
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>주문번호</th>
									<th>날짜</th>
									<th>이름(아이디)</th>
									<th>번호</th>
									<th>배송지</th>
									<th>주문금액</th>
									<th>배송상태</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>주문번호</th>
									<th>날짜</th>
									<th>이름(아이디)</th>
									<th>번호</th>
									<th>배송지</th>
									<th>주문금액</th>
									<th>배송상태</th>
								</tr>
							</tfoot>
							<tbody>
							<c:forEach var="order" items="${orderWaitList }">
								<tr>
									<td onClick="location.href='admin_orderWait.mdo?order_merchant_serial=${order.order_merchant_serial}'" style="width: 200px">${order.order_merchant_serial }</td>
									<td onClick="location.href='admin_orderWait.mdo?order_merchant_serial=${order.order_merchant_serial}'" style="width: 100px"><fmt:formatDate value="${order.order_date }" pattern="yyyy-MM-dd"/></td>
									<td onClick="location.href='admin_orderWait.mdo?order_merchant_serial=${order.order_merchant_serial}'" style="width: 150px">${order.user_name }/(${order.user_id })</td>
									<td onClick="location.href='admin_orderWait.mdo?order_merchant_serial=${order.order_merchant_serial}'" style="width: 130px">${order. user_phone }</td>
									<td onClick="location.href='admin_orderWait.mdo?order_merchant_serial=${order.order_merchant_serial}'" style="width: 550px">${order.user_address1 } ${order.user_address2 }</td>
									<td onClick="location.href='admin_orderWait.mdo?order_merchant_serial=${order.order_merchant_serial}'"><fmt:formatNumber value="${order.order_goods_price}" pattern="#,###"/>원</td>
									<td>
										<select id="deleveryStatus-select">
											<option value="결제완료" <c:if test ="${order.order_delivery_status eq '결제완료'}">selected="selected"</c:if> >결제완료</option>
											<option value="배송준비중" <c:if test ="${order.order_delivery_status eq '배송준비중'}">selected="selected"</c:if> >배송준비중</option>
											<option value="배송중" <c:if test ="${order.order_delivery_status eq '배송중'}">selected="selected"</c:if> >배송중</option>
											<option value="배송완료" <c:if test ="${order.order_delivery_status eq '배송완료'}">selected="selected"</c:if> >배송완료</option>
											<option value="취소요청" <c:if test ="${order.order_delivery_status eq '취소요청'}">selected="selected"</c:if> >취소요청</option>
											<option value="취소완료" <c:if test ="${order.order_delivery_status eq '취소완료'}">selected="selected"</c:if> >취소완료</option>											
											<option value="환불요청" <c:if test ="${order.order_delivery_status eq '환불요청'}">selected="selected"</c:if> >환불요청</option>
											<option value="환불완료" <c:if test ="${order.order_delivery_status eq '환불완료'}">selected="selected"</c:if> >환불완료</option>
											
										</select>
									</td>
									<td>
										<input type="button" value="수정" onclick="btnUpdate()"/>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
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
 <script type="text/javascript">
function btnUpdate(){
/* 	var tr = $(this);
    var td = tr.children();
    var serial = td.eq(0).text(); */
    var status =$("#deleveryStatus-select option:selected").val()
	
    
	if(confirm('배송 상태를 수정하시겠습니까?')) {
	$.ajax({
		type:"POST",
		url:"admin_orderWaitUpdate.mdo",
		dataType : "json",
		data : {"order_merchant_serial" : serial, "order_delivery_status" : status},
		success: function(result) {
			if(result != 0){
				alert("배송 상태를 성공적으로 수정하였습니다.")
			}else{
				alert("배송 상태 수정에 실패했습니다.")
			}
		}
	}) 
	}
}
</script>
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