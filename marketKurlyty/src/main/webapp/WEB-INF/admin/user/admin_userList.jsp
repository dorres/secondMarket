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
 <script>
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

				<!-- 여기만 수정해서 사용하세요!! -->
				<h2 class="mt-4">회원관리</h2>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">회원수정</li>
					<li class="breadcrumb-item active">삭제</li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">
						여기내용을 수정
						<a target="_blank" href="https://datatables.net/"> 이거 필요한가??</a> .
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 회원목록
					</div>
					<div class="card-body">
						<form>
						<table id="datatablesSimple">
							
								<tr>
									<th>회원번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>폰번</th>
									<th>회원등급</th>
									<th>마지막로그인</th>
									<th>포인트</th>
									<th>총금액</th>
									<th>상태</th>
									<th>수정/삭제</th>
								</tr>
							<tbody>
								<c:forEach var="user" items="${userList }">
									<tr>
										<td>${user.user_serial }</td>
										<td>${user.user_id }</td>
										<td>${user.user_name }</td>
										<td>${user.user_phone }</td>
										<td>${user.user_membership_name }</td>
										<td>${user.user_last_login }</td>
										<td>${user.user_point }</td>
										<td>${user.user_total_purchase }</td>
										<td>${useuserrList.user_status }</td>
										<td>
											<input type="button" value="수정" onclick="location.href= 'getUser.mdo?user_id=${user.user_id}'"/>
											<input type="button" value="삭제" onclick="javascirpt:delete_check('deleteUser.mdo?user_id=${user.user_id}')"/>
										</td>
									</form>
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