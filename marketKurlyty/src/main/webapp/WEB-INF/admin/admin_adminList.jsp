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
 <script src="jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/board/list";
			})
		})
	</script>
</head>
<body class="sb-nav-fixed">
	<jsp:include page="default/top.jsp"></jsp:include>
	<jsp:include page="default/sideMenu.jsp"></jsp:include>

	<!-- Main -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<h1 class="mt-4">매니저관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
					<li class="breadcrumb-item active">Tables</li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">
						여기내용 수정
						<a target="_blank" href="https://datatables.net/">???필요해??</a> .
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 매니저 목록
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>직급</th>
									<th>수정/삭제</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>직급</th>
									<th>수정/삭제</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="adminList" items="${adminList }">
									<tr>
										<td>${adminList.admin_id }</td>
										<td>${adminList.admin_name }</td>
										<td>${adminList.admin_position }</td>
										<td>
											<input type="button" value="수정" onclick="location.href= 'update.mdo?admin_id=${adminList.admin_id}'">
											<input type="button" value="삭제" onclick="location.href= 'admin_adminList.mdo'">
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>


			</div>
		</main>

		<jsp:include page="default/footer.jsp"></jsp:include>
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