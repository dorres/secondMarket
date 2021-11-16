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
  width: 200px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  /* border: 1px solid #ccc; */
}
table.type01 td {
  width: 200px;
  padding: 10px;
  vertical-align: top;
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
					<li class="breadcrumb-item"><a href="index.html">2차카테고리 등록</a></li>
					<li class="breadcrumb-item active">등록</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						2차 카테고리 등록
					</div>
					<div class="card-body">
						<form action="admin_categorySubInsert.mdo" method="POST">
								<table class="type01">
									<tr>
										<th scope="row" style="font-size: 20px">1차 카테고리</th>
										<td>
											<select name="category_sub_first_no">
												<c:forEach var="main" items="${mainList }">
													<option value="${main.category_main_serial }">${main.category_main_name }</option>
												</c:forEach>
											</select>
										</td>
										<th scope="row"  style="font-size: 20px">2차 카테고리</th>
										<td><input type="text" name="category_sub_name"/></td>
									</tr>
								</table>
							<input type="submit" value="등록하기" />
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