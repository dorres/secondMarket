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
  width: 500px;
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
<body class="sb-nav-fixed">
<div id="layoutSidenav">
	<jsp:include page="../default/top.jsp"></jsp:include>
	<jsp:include page="../default/sideMenu.jsp"></jsp:include>

	<!-- Main -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4">1:1문의</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">답변완료</li>
					<li class="breadcrumb-item active">상세</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						<div class="col three">
								<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
									1:1문의 내용
								</div>
							</div>
					</div>
					<div class="card-body">
						<!-- 메인작업 -->

							<table class="type02">
								<tr>
									<th scope="row">문의종류</th>
									<td >
										<input type="text" style="width:100%; height:100%; border: none;"  value="${qnaFinish.qna_personal_category }" readonly="readonly">
									</td>
									
									<th scope="row">작성자</th>
									<td>
										<input type="text"style="width:100%; height:100%; border: none;"  value="${qnaFinish.user_id}(${qnaFinish.user_name })" readonly="readonly" >
									</td>
								</tr>
							
								<tr>
									<th scope="row">제목</th>
									<td>
										<input type="text"style="width:100%; height:100%; border: none;" value="${qnaFinish.qna_personal_title }" readonly="readonly">
									</td>
									
									<th scope="row">날짜</th>
									<td>
										<input type="text"style="width:100%; height:100%; border: none;" value="<fmt:formatDate value="${qnaFinish.qna_personal_date }" pattern="yyyy-MM-dd"/>" readonly="readonly" >
										
									</td>
								</tr>
								
								<tr>
									<th scope="row">내용</th>
									<td colspan="3"  >
										<c:if test="${qnaFinish.qna_personal_image1 != null}">
											<img alt="1:1문의 이미지" src="${qnaFinish.qna_personal_image1}" width="300px" height="300px%">
										</c:if>
										<c:if test="${qnaFinish.qna_personal_image2 != null}">
											<img alt="1:1문의 이미지" src="${qnaFinish.qna_personal_image2}" width="300px" height="300px%">
										</c:if>
										<br>
										<textarea readonly="readonly" rows="10">${qnaFinish.qna_personal_content }</textarea>
									</td>
								</tr>
							</table>
					</div>
					
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 1:1문의 답변
					</div>
					<div class="card-body">
						<!-- 메인작업 -->
						<form action="admin_personalQnaFinishUpdate.mdo" method="POST">
							<table class="type02">
							
								<tr>
									<th width="100px" height="40px">제목</th>
									<td>
										<input type="text" style="width:100%; height:100%; border: none;" name="qna_personal_answer_title" value="${ qnaFinish.qna_personal_answer_title}">
									</td>
								</tr>
								<tr>
									<th width="100px" height="300px">내용</th>
									<td  height="300px"><textarea name="qna_personal_answer">${qnaFinish.qna_personal_answer }</textarea>
								</tr>

							</table>
							<input type="hidden" name="qna_personal_serial" value="${qnaFinish.qna_personal_serial }">
							<input type="submit" value="답변 수정하기" />			
							<input type="button" value="1:1문의글 목록보기" onclick="location.href='admin_personalQnaFinishList.mdo'"/>
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