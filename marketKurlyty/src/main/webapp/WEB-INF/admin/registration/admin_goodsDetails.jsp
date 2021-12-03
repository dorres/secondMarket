<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리티 :: 내일의 장보기, 마켓컬리티</title>
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
 <script src="jquery-3.6.0.min.js"></script>
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

				<h1 class="mt-4">재고</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">상품에 대한 재고 관리 페이지 입니다.</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						<div class="col three">
								<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
								재고 목록
								</div>							
						</div>
					</div>
					<div class="card-body">
					<form method="post" action="updateStock.mdo">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>상품재고번호</th>
									<th>3차카테고리</th>
									<th>입고일자</th>
									<th>입고수량</th>
									<th>재고수량</th>
									<th>유통기한</th>
									<th>수정</th>
								</tr>
							</thead>
							<tbody>
									<tr>
										<td>${stock.goods_stock_serial}</td>
										<td><input type="text" name="category_goods_serial" value="${stock.category_goods_serial}" readonly="readonly"/></td>
										<td><fmt:formatDate value="${stock.goods_stock_receiving_date}" pattern="yyyy-MM-dd"/></td>
										<td><input type="text" name="goods_stock_receiving_quantity" value="${stock.goods_stock_receiving_quantity}" /></td>
										<td>${stock.goods_stock_stock_quantity}</td>
										<td><fmt:formatDate value="${stock.goods_stock_exp_date}" pattern="yyyy-MM-dd"/></td>
										<td>
											<input type="submit" value="수정" />
										</td>
									</tr>
							</tbody>
						</table>
						</form>
					</div>
				</div>


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
</html> --%>