<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리티 :: 내일의 장보기, 마켓컬리티</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
table.type02 {
  border-collapse: separate;
  border-spacing: 0;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 1px solid #ccc;
  margin : 20px 10px;
}
table.type02 th {
  width: 200px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  border-top: 1px solid #fff;
  border-left: 1px solid #fff;
  background: #eee;
}
table.type02 td {
  width: 400px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
table.type02 td >input{
	width: 100%;
	height: 100%;
	border: none;
	resize: none;
}
textarea {
	width: 100%;
	height: 100%;
	border: none;
	resize: none;
}
textarea:focus, input:focus{
    outline: none;
} 
</style>
</head>
<script type="text/javascript">
function zip(){
	var myAddress;
	var myZipcode;
	new daum.Postcode({
		oncomplete:function(data){
			myAddress=data.address;
			myZipcode=data.zonecode;
			$("#admin_address1").val(myAddress);
			$(".hid").attr("class",".addressShow");
		}
	}).open();
}
</script>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
	<jsp:include page="../default/top.jsp"></jsp:include>
	<jsp:include page="../default/sideMenu.jsp"></jsp:include>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4">매니저 관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">관리자에서 매니저관리를 하는 페이지 입니다.</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						<div class="col three">
							<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
									매니저 상세
								</div>
						</div>
					</div>
					<div class="card-body">
						<form action="updateProc.mdo" method="POST">
							<table class="type02">
									<tr>
										<th scope="row">매니저 아이디</th>
										<td><input type="text" name="admin_id" readonly="readonly" value="${update.admin_id}"></td>
									</tr>
									<tr>
										<th scope="row">매니저 이름</th>
										<td><input type="text" name="admin_name" value="${update.admin_name}"/></td>
									</tr>
									<tr>
										<th scope="row">매니저 직급</th>
										<td>
											<select name="admin_position" id="position-select" style="width:150px">
												<option value="master" <c:if test ="${update.admin_position eq 'master' }">selected="selected"</c:if> >Master</option>
												<option value="senior" <c:if test ="${update.admin_position eq 'senior' }">selected="selected"</c:if> >Senior</option>
												<option value="junior" <c:if test ="${update.admin_position eq 'junior' }">selected="selected"</c:if> >Junior</option>								
											</select>										
										</td>
									</tr>
									<tr>
										<th scope="row">매니저 이메일</th>
										<td><input type="text" name="admin_email" value="${update.admin_email}"/></td>
									</tr>
									<tr>
										<th scope="row">매니저 번호</th>
										<td><input type="text" name="admin_phone" value="${update.admin_phone}"/></td>
									</tr>
									<tr>
										<th scope="row">매니저 주소<input type="button" value="검색" onclick="javascript:zip()" style="float: right;"></th>
										<td>
											<input type="text" name="admin_address1" id="admin_address1" value="${update.admin_address1}"/>
										</td>
									</tr>
									<tr>
										<th scope="row">매니저 상세주소</th>
										<td><input type="text" name="admin_address2" id="admin_address2" value="${update.admin_address2}"/></td>
									</tr>									
								</table>
							<input type="submit" value="수정하기" style="margin-left: 10px"/>
							<input type="button" value="목록보기" onclick="location.href='admin_adminList.mdo'"/>
						</form>
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
		<jsp:include page="../default/footer.jsp"></jsp:include>
	</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js/scripts.js"> </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>
</html>