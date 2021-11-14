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
<style type="text/css">

table.type01 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  margin-bottom: 10px;
}
table.type01 th {
  width: 150px;
  padding: 10px;
  font-weight: bold;

  /* border: 1px solid #ccc; */
}
table.type01 td {
  width: 300px;
  padding: 10px;
  text-align: 
  
  /* border: 1px solid #ccc; */
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
				<h1 class="mt-4">카테고리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">1차카테고리 상세</a></li>
					<li class="breadcrumb-item active">목록</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						1차 카테고리 상세
					</div>
					<div class="card-body">
						<form action="admin_categoryMainUpdate.mdo" method="POST" enctype="multipart/form-data">
								<table class="type01">
									<tr>
										<th scope="row" style="font-size: 20px">이름</th>
										<td><input type="text" name="category_main_name" style="width: 300px;"></td>
									</tr>
									<tr>
										<th scope="row"  style="font-size: 20px">icon(black)</th>
										<td><input type="file" name="iconImage" /></td>
										<td><img alt="아이콘 검정" src="${category.category_main_icon_black }"></td>
									</tr>
									<tr>
										<th scope="row"  style="font-size: 20px">icon(color)</th>
										<td><input type="file" name="iconImage" /></td>
										<td><img alt="아이콘 컬러" src="${category.category_main_icon_color }"></td>
									</tr>
								</table>
							<input type="hidden" value="${category.category_main_icon_black }" name="category_main_icon_black">
							<input type="hidden" value="${category.category_main_icon_color }" name="category_main_icon_color">
							<input type="hidden" value="${category.category_main_serial }" name="category_main_serial">
							<input type="submit" value="수정하기" />
							<input type="button" value="목록보기" onclick="location.href='admin_categoryMainList.mdo'"/>
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