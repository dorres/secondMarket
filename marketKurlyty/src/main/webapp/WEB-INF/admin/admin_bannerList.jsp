<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>??????????????</title>
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
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
				<h1 class="mt-4">마케팅 관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">배너 등록</a></li>
					<li class="breadcrumb-item active">Tables</li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">
						DataTables is a third party plugin that is used to generate the
						demo table below. For more information about DataTables, please
						visit the <a target="_blank" href="https://datatables.net/">official
							DataTables documentation</a> .
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header" align="right">
						<input type="button" value="배너 등록하기" onclick="location.href='admin_bannerWrite.mdo'" style="background-color: #8f3cab; color: white" >
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>번호</th>
									<th>배너이름</th>
									<th>배너내용</th>
									<th width="1000">배너이미지</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>번호</th>
									<th>배너이름</th>
									<th>배너내용</th>
									<th width="1000">배너이미지</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="banner" items="${bannerList }">
								<tr>
									<td>${banner.banner_serial }</td>
									<td>${banner.banner_title }</td>
									<td>${banner.banner_contents }</td>
									<td><img src="${banner.banner_filepath }" height="150" width="1000"></td>
									<td>
										<input type="button" onclick="location.href='admin_banner.mdo?banner_serial=${banner.banner_serial}'" value="수정">
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
		<jsp:include page="default/footer.jsp"></jsp:include>
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