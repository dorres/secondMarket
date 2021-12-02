<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%
  Date now = new Date();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리티 :: 내일의 장보기, 마켓컬리티</title>
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
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
  width: 500px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
#inpupu{
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
<body class="sb-nav-fixed">
<div id="layoutSidenav">
	<jsp:include page="../default/top.jsp"></jsp:include>
	<jsp:include page="../default/sideMenu.jsp"></jsp:include>

	<!-- Main -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4">약관관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">관리자에서 약관관리를 하는 페이지 입니다.</li>
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<div class="col three">
								<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
									약관 등록
								</div>							
						</div>
					</div>
					<div class="card-body">				
						<form action="insertTerms.mdo" method="POST" enctype="multipart/form-data">
								<table class="type02">
									<tr>
										<th scope="row">약관번호</th>
										<td><input type="text" name="terms_serial" id="inpupu" placeholder="번호를 입력해주세요"/></td>
										
									</tr>
									<tr>
									
										<th scope="row">약관이름</th>
										<td><input type="text"  name="terms_id" id="inpupu" placeholder="약관명을 입력해주세요"/></td>
									</tr>
									<tr>
										<th scope="row">약관 필수여부</th>
										<td>
											<input type="radio" name="terms_agree_status" value="true"/>필수
	 										<input type="radio" name="terms_agree_status" value="false"/>선택
										</td>
									</tr>
									<tr >
										<th scope="row">약관내용</th>
										<td>
											<textarea rows="30"  name="terms_content"></textarea>
										</td>
									</tr>
							
								</table>
								<br>
								<div style="margin-left:10px">
									<input type="submit" value="등록"/>
									<input type="button" value="목록" onclick="location.href='terms_agreeList.mdo'"/>
								</div>
								
						</form>
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
		<jsp:include page="../default/footer.jsp"></jsp:include>
	</div>
</div>
	
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