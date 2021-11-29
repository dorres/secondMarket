<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>??????????????</title>
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
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
					<li class="breadcrumb-item">답변완료</li>
					<li class="breadcrumb-item active">목록</li>
				</ol>
				<div class="card mb-4">
				<div class="card-header">
						<div class="col three">
								<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
									답변완료 목록
								</div>
							</div>
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>번호</th>
									<th>문의종류</th>
									<th>문의 회원</th>
									<th>제목</th>
									<th>문의 날짜</th>
									<th>답변 날짜</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>번호</th>
									<th>문의종류</th>
									<th>문의 회원</th>
									<th>제목</th>
									<th>문의 날짜</th>
									<th>답변 날짜</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="qna" items="${qnaFinishList }">
									<tr>
										<td onclick="location.href= 'admin_personalQnaFinish.mdo?qna_personal_serial=${qna.qna_personal_serial}'">${qna.rownum }</td>
										<td onclick="location.href= 'admin_personalQnaFinish.mdo?qna_personal_serial=${qna.qna_personal_serial}'">${qna.qna_personal_category }</td>
										<td onclick="location.href= 'admin_personalQnaFinish.mdo?qna_personal_serial=${qna.qna_personal_serial}'">${qna.user_id}(${qna.user_name })</td>
										<td onclick="location.href= 'admin_personalQnaFinish.mdo?qna_personal_serial=${qna.qna_personal_serial}'">${qna.qna_personal_title }</td>
										<td onclick="location.href= 'admin_personalQnaFinish.mdo?qna_personal_serial=${qna.qna_personal_serial}'"><fmt:formatDate value="${qna.qna_personal_date }" pattern="yyyy-MM-dd"/></td>
										<td onclick="location.href= 'admin_personalQnaFinish.mdo?qna_personal_serial=${qna.qna_personal_serial}'"><fmt:formatDate value="${qna.qna_personal_answer_date }" pattern="yyyy-MM-dd"/></td>
										<td>
											<input type="button" value="삭제" onclick="javascript:delete_check('admin_personalQnaFinishDelete.mdo?qna_personal_serial=${qna.qna_personal_serial}')"/>
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