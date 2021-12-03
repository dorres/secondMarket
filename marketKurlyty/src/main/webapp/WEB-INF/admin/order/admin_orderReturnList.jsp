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
 td{
 	text-align: center;
 	vertical-align: middle;
 }
 th{
 	text-align: center;
 }
 </style>
 <style type="text/css">
.btn1 {font-size: 15px; white-space:nowrap; width:200px; padding:.8em 1.5em; font-family: Open Sans, Helvetica,Arial,sans-serif; text-decoration-line: none;
		line-height:10px; display: inline-block;zoom: 1; color: #fff; text-align: center; position:relative;
		-webkit-transition: border .25s linear, color .25s linear, background-color .25s linear;
		transition: border .25s linear, color .25s linear, background-color .25s linear;

	}
.btn1.btn-dark{background-color: #8f3cab; border-color: #8f3cab; -webkit-box-shadow: 0 3px 0 #8f3cab; box-shadow: 0 3px 0 #8f3cab;}
.btn1.btn-dark:hover{background-color:#5f0080;}
.btn1.btn-dark:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}
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
					<li class="breadcrumb-item">반품</li>
					<li class="breadcrumb-item active">목록</li>
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<div class="col three">
							<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
								반품요청 / 반품완료
							</div>
						</div>
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th style="text-align: center;">주문번호</th>
									<th style="text-align: center;">날짜</th>
									<th style="text-align: center;">이름(아이디)</th>
									<th style="text-align: center;">번호</th>
									<th style="text-align: center;">배송지</th>
									<th style="text-align: center;">주문금액</th>
									<th style="text-align: center;">배송상태</th>
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
							<c:forEach var="order" items="${orderList }">
								<tr>
									<td onClick="location.href='admin_orderWait.mdo?order_merchant_serial=${order.order_merchant_serial}'" style="width: 200px" >${order.order_merchant_serial }</td>
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
											<option value="반품요청" <c:if test ="${order.order_delivery_status eq '반품요청'}">selected="selected"</c:if> >반품요청</option>
											<option value="반품완료" <c:if test ="${order.order_delivery_status eq '반품완료'}">selected="selected"</c:if> >반품완료</option>											
											<option value="환불요청" <c:if test ="${order.order_delivery_status eq '환불요청'}">selected="selected"</c:if> >환불요청</option>
											<option value="환불완료" <c:if test ="${order.order_delivery_status eq '환불완료'}">selected="selected"</c:if> >환불완료</option>
											<option value="구매완료" <c:if test ="${order.order_delivery_status eq '구매완료'}">selected="selected"</c:if> >구매완료</option>										
										</select>
									</td>
									<td>
										<input type="hidden" id="order_merchant_serial" value="${order.order_merchant_serial}">
										<input type="button" value="수정" id="updateBtn"/>
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
<script type="text/javascript"><!-- 동적 테이블은 이렇게 해야 버튼 이벤트가 먹힘-->
	$(document).on("click", "#updateBtn", function(){
		var checkBtn = $(this);
		var tr = checkBtn.closest("tr");
		var status = tr.find("#deleveryStatus-select option:selected").val();
		var serial = tr.find("#order_merchant_serial").val();
		
	    if(confirm('배송상태를 수정하시겠습니까?')) {
		$.ajax({
			type:"POST",
			url:"admin_orderWaitUpdate.mdo",
			dataType : "json",
			data : {"order_merchant_serial" : serial, "order_delivery_status" : status},
			success: function(result) {
				if(result != 0){
					alert("배송 상태를 성공적으로 수정하였습니다.")
					location.reload();
				}else{
					alert("배송 상태 수정에 실패했습니다.")
					location.reload();
				}
			}
		}) 
		}
	});
</script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>

</body>
</html>