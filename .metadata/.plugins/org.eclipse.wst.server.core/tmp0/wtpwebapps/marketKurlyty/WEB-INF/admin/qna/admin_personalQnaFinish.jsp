<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>??????????????</title>
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
<style type="text/css">
table {
    width: 1400px;
    border: 1px solid #444444;
    margin: 0 auto;
  }
  th, td {
    border: 1px solid #444444;
  }
  
textarea {
    width: 100%;
    height: 99%;
    border: none;
    resize: none;
  }
</style>
<script type="text/javascript">

	function delete_check(url) {
		var answer = confirm("게시글를 정말로 삭제할꺼임?");
		if (answer == true) {
			location = url;
		}
	}
//-->
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
				<h1 class="mt-4">1:1문의</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">1:1 문의</a></li>
					<li class="breadcrumb-item active">1:1문의 답변 대기 상세</li>
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 1:1문의 내용
					</div>
					<div class="card-body">
						<!-- 메인작업 -->
							<table >
								<tr>
									<td width="200px" height="40px">문의종류</td>
									<td width="300px" height="40px">
										<input type="text" style="width:100%; height:100%; border: none;"  value="${qnaFinish.qna_personal_category }" readonly="readonly">
									</td>
									
									<td width="200px" height="40px">작성자</td>
									<td width="300px" height="40px" >
										<input type="text"style="width:100%; height:100%; border: none;"  value="${qnaFinish.user_id}(${qnaWait.user_name })"  >
									</td>
								</tr>
							
								<tr>
									<td width="200px" height="40px">제목</td>
									<td width="300px" height="40px" >
										<input type="text"style="width:100%; height:100%; border: none;" value="${qnaFinish.qna_personal_title }" readonly="readonly">
									</td>
									
									<td width="200px" height="40px">날짜</td>
									<td width="300px" height="40px" >
										<input type="text"style="width:100%; height:100%; border: none;" value="<fmt:formatDate value="${qnaFinish.qna_personal_date }" pattern="yyyy-MM-dd"/>" readonly="readonly" >
									</td>
								</tr>
								
								<tr>
									<td width="200px" height="300px">내용</td>
									<td colspan="3"  height="300px"><textarea readonly="readonly">${qnaFinish.qna_personal_content }</textarea>
								</tr>
							</table>
					</div>
					
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 1:1문의 답변
					</div>
					<div class="card-body">
						<!-- 메인작업 -->
						<form action="admin_personalQnaFinishUpdate.mdo" method="POST">
							<table >
								<tr>
								<td>답변</td>
								</tr>
								<tr>
									<td width="200px" height="300px"><textarea  name="qna_personal_answer">${qnaFinish.qna_personal_answer }</textarea>
								</tr>
							</table>
							<input type="hidden" name="qna_personal_serial" value="${qnaFinish.qna_personal_serial }">
							<input type="submit" value="답변 수정하기" />
							<input type="button" value="삭제" onclick="javascript:delete_check('admin_personalQnaFinishDelete.mdo?qna_personal_serial=${qnaFinish.qna_personal_serial}')"/>
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