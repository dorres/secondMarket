<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리티 :: 내일의 장보기, 마켓컬리티</title>
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
 <style>
 .btn1 {
	font-size: 20px;
	white-space: nowrap;
	float:right;
	width: 100px;
	height: 30px;
	font-family: Open Sans, Helvetica, Arial, sans-serif;
	text-decoration-line: none;
	line-height: 10px;
	display: inline-block;
	zoom: 1;
	color: #fff;
	text-align: center;
	-webkit-transition: border .25s linear, color .25s linear,
		background-color .25s linear;
	transition: border .25s linear, color .25s linear, background-color .25s
		linear;
}
</style>
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
	<jsp:include page="default/top.jsp"></jsp:include>
	<jsp:include page="default/sideMenu.jsp"></jsp:include>

	<!-- Main -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4">베스트상품 TOP TEN!</h1>
				<div class="card mb-4">
					<div class="card-body">
						가장 많이 팔린 상품 1위~10위까지.
					</div>
					
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> Top10
					</div>
					<div style="width:100%;">
					<input type="button" class="btn1" value="Excel" style="float:right; margin-right:1%;"
					 onclick="location.href='bestExel.mdo'"></div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th style="background:#CCCCCC;">랭크</th>
									<th style="background:#CCCCCC;">상품명</th>
									<th style="background:#CCCCCC;">판매횟수</th>
									<th style="background:#CCCCCC;">총 판매금액</th>
								</tr>
							</thead>
							
							<c:forEach var="best" items="${bestList }">
							<c:set var="i" value="${i+1 }"/>
								<tr>
									<td style="background:#CCCCCC;">${i }위</td>
									<td>${best.category_goods_name}</td>
									<td>${best.order_goods_count}</td>
									<td>${best.order_goods_price}</td>
								</tr>
								</c:forEach>
						</table>
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
		<jsp:include page="default/footer.jsp"></jsp:include>
	</div>
	</div>
	<!-- Main -->
	
	<!-- 건들지마세요 -->
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>
	<!-- 건들지마세요 -->
</body>
</html>