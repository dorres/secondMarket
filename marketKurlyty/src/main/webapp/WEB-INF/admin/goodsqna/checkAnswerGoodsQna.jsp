<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>??????????????</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/style/admin/styles.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/top.jsp"></jsp:include>
		<jsp:include page="../default/sideMenu.jsp"></jsp:include>
		<!-- Main -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h2 align="center">상품문의 답변</h2>
					<form method="post" action="updqteGqnaSuc.mdo?qna_goods_serial=${qnaone.qna_goods_serial}">
							<table border="4" style="float:right; width:100%;">
							<tr align="center">
							<tr>
							<input type="hidden" name="qna_goods_serial" vlaue="${qnaone.qna_goods_serial}"/>
								<td>&nbsp;</td>
								<td><h3 style="text-align:right;">답변</h3></td>
							</tr>
							<tr height="20" bgcolor="#9932CC">
								<td colspan="4" style="color:#ffff; text-align:center;">답변</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center" style="height:100%;">내용</td>
								<td><textarea name="qna_goods_answer" cols="150" rows="13">${qnaone.qna_goods_answer}</textarea></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr>
								<td colspan="4" align="center" style="width:20px;">
								<input type="submit" value="수정">&nbsp;<input type="button" value="목록" onclick="location.href='gqnaListSuc.mdo'"></td>
							</tr>
						</table>
					</form>
				</div>
			</main>
			<jsp:include page="../default/footer.jsp"></jsp:include>
		</div>
	</div>
	<!-- 건들지마세요 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous">
	</script>
	<script
		src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>
	<!-- 건들지마세요 -->
</body>
</html>