<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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


					<h1>약관 수정</h1>
					<h6>약관 수정하는 페이지</h6>
					<form action="updateTerms.mdo" method="post">
					<table>
						<p>약관번호<br>
						<input type="text" class="*" name="terms_serial" readonly="readonly" value="${getTerms.terms_serial}"/></p>
						<p>약관이름<br>
						<input type="text" class="*" name="terms_id" value="${getTerms.terms_id }"/></p>
						약관 필수여부<br>
						<div>
 							 <input type="text" name="terms_status" readonly="readonly" value="${getTerms.terms_agree_status}"/>
 							 
						</div>
							약관내용
							<div>
								<textarea rows="100" cols="100" name="terms_content">${getTerms.terms_content}</textarea>
								<div>
									<input type="submit" value="수정"/>
									<input type="submit" value="삭제" onclick="location.href=javascript:delete_check('deleteTerms.mdo?terms_serial=${getTerms.terms_serial}')"/>
									<input type="button" value="목록" onclick="location.href='terms_agreeList.mdo'"/>
								</div>
							</div>
						</div>
							
					</table>
					</form>
			</div>
		</main>
		<jsp:include page="default/footer.jsp"></jsp:include>
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