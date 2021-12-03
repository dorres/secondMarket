<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리티 :: 내일의 장보기, 마켓컬리티</title>
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
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
  width: 100px;
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
  width: 650px;
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
<script type="text/javascript">
function formGoodsSubmit() {
	if(document.noticeForm.notice_title.value==""){
		alert("제목을 입력하세요.");
		document.noticeForm.notice_title.focus();
		return;
	}
	if(document.noticeForm.notice_content.value==""){
		alert("내용을 입력하세요.");
		document.noticeForm.notice_content.focus();
		return;
	}
	document.form.submit();
}
</script>	
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
				<h1 class="mt-4">공지사항</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">관리자</li>
					<li class="breadcrumb-item active">등록</li>
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<div class="col three">
								<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
									공지사항 등록
								</div>
							</div>
					</div>
					<div class="card-body">
						<!-- 메인작업 -->
						<form action="admin_noticeInsert.mdo" method="POST" id="noticeForm">
							<input type="hidden" name="notice_id" value="${adminId }">
							<table class="type02">
								<tr>
									<th scope="row" >제목</th>
									<td width="800px" height="40px">
										<input type="text" style="width:100%; height:100%; border: none;" name="notice_title" id="notice_title">
									</td>
								</tr>
								<tr>
									<th scope="row" >내용</th>
									<td colspan="3"  height="500px"><textarea name="notice_content" id="notice_content"></textarea>
								</tr>
							</table>
							<input type="submit" value="등록하기" onclick="formGoodsSubmit()" style="margin-left: 10px"/>
							<input type="button" value="목록보기" onclick="location.href='admin_noticeList.mdo'"/>
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