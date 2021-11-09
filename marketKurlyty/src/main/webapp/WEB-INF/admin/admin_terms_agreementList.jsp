<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		function delete_check(url) {
		var answer = confirm("게시글를 정말로 삭제할까요?");
		if (answer == true) {
			location = url;
		}
	}
	</script>
	
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
	<jsp:include page="default/top.jsp"></jsp:include>
	<jsp:include page="default/sideMenu.jsp"></jsp:include>

	<!-- Main -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<h1 class="mt-4">약관관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">약관 약간?</a></li>
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
						<i class="fas fa-table me-1"></i> 약관 목록
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
							<tr>
									<th>번호</th>
									<th>약관번호</th>
									<th>약관이름</th>
									<th>약관필수여부</th>
									<th>약관등록일</th>
									<th>마지막수정일</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach var="agreeList" items="${agreeList}">
									<tr>
										<td>${agreeList.terms_agreement_serial }</td>
										<td>${agreeList.terms_serial }</td>
										<td><a href=".mdo?terms_serial=${terms_setial} }">${agreeList.terms_id }</a></td>
										<td>${agreeList.terms_agree_status }</td>
										<td><fmt:formatDate value="${agreeList.terms_agree_date}" pattern="yyyy-MM-dd"/></td>
										<td><fmt:formatDate value="${agreeList.terms_agree_date_modified}" pattern="yyyy-MM-dd"/></td>
									</tr>
								</c:forEach>
								
							</tbody>
						</table>
						<input type="button" value="등록" onclick="location.href='insertTerms.mdo'"/>
					</div>
				</div>


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