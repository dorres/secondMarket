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
	function delete_check(url) {
		var answer = confirm("관리자 계정을 삭제하시겠습니까?");
		if (answer == true) {
			location = url;
		}
	}
</script>
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

				<h1 class="mt-4">매니저관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">관리자에서 매니저관리를 하는 페이지 입니다.</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
							<div class="col three">
								<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
									매니저 목록
									<a href="admin_join.mdo" class="btn1 btn-dark" style="float: right;">매니저 등록</a>
								</div>
							</div>
						</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>아이디</th>
									<th>직급</th>
									<th>이름</th>
									<th>이메일</th>
									<th>번호</th>
									<th>주소</th>
									<th>수정/삭제</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>아이디</th>
									<th>직급</th>
									<th>이름</th>
									<th>이메일</th>
									<th>번호</th>
									<th>주소</th>
									<th>수정/삭제</th>
								</tr>
							<tbody>
								<c:forEach var="adminList" items="${adminList }">
									<tr>
										<td onclick="location.href= 'update.mdo?admin_id=${adminList.admin_id}'">${adminList.admin_id }</td>
										<td onclick="location.href= 'update.mdo?admin_id=${adminList.admin_id}'">${adminList.admin_position }</td>
										<td onclick="location.href= 'update.mdo?admin_id=${adminList.admin_id}'">${adminList.admin_name }</td>
										<td onclick="location.href= 'update.mdo?admin_id=${adminList.admin_id}'">${adminList.admin_email }</td>
										<td onclick="location.href= 'update.mdo?admin_id=${adminList.admin_id}'">${adminList.admin_phone }</td>
										<td onclick="location.href= 'update.mdo?admin_id=${adminList.admin_id}'">${adminList.admin_address1 } ${adminList.admin_address2 }</td>
										<td>
											<input type="button" value="삭제" onclick="javascript:delete_check('deleteMember.mdo?admin_id=${adminList.admin_id}')"/>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
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
</html>