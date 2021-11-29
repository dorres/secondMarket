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
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
 <script>
	function delete_check(url) {
		var answer = confirm("선택한 회원 정보를 삭제하시겠습니까?");
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

				<!-- 여기만 수정해서 사용하세요!! -->
				<h2 class="mt-4">회원관리</h2>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">관리자에서 회원관리를 하는 페이지 입니다.</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						<div class="col three">
								<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
									회원 목록
								</div>							
						</div>
					</div>
					<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>번호</th>
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
								</thead>
								<tfoot>
									<tr>
										<th>번호</th>
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
								</tfoot>
								<tbody>
									<c:forEach var="user" items="${userList }">
										<tr>
											<td >${user.rownum }</td>
											<td >${user.user_id }</td>
											<td >${user.user_name }</td>
											<td >${user.user_phone }</td>
											<td >${user.user_membership_name }</td>
											<td >${user.user_last_login }</td>
											<td >${user.user_point }</td>
											<td >${user.user_total_purchase }</td>
											<td style="width: 120px">
												<select id="userStatus-select"  style="width:100px; text-align: center;">
													<option value="0" <c:if test ="${user.user_status ==0}">selected="selected"</c:if> >탈퇴</option>
													<option value="1" <c:if test ="${user.user_status ==1}">selected="selected"</c:if> >활성</option>
				
												</select>
											</td>
											<td>
												<input type="hidden" value="${user.user_serial }" name="user_serial" id="user_serial">
												<input type="button" value="수정" id="updateBtn"/>
												<input type="button" value="삭제" onclick="javascirpt:delete_check('deleteUser.mdo?user_id=${user.user_id}')"/>
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
<script type="text/javascript">
$(document).on("click", "#updateBtn", function(){
	var checkBtn = $(this);
	var tr = checkBtn.closest("tr");
	var status = tr.find("#userStatus-select option:selected").val();
	var serial = tr.find("#user_serial").val();
	
    if(confirm('회원의 상태를 수정하시겠습니까?')) {
		$.ajax({
			type:"POST",
			url:"updateUser.mdo",
			dataType : "json",
			data : {"user_serial" : serial, "user_status" : status},
			success: function(result) {
				if(result != 0){
					alert("회원 상태 변경을 성공하였습니다.")
					location.reload();
				}else {
					alert("회원 상태 변경을 실패했습니다.")
					location.reload();
				}
			}
		}) 
	}
});
</script>
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