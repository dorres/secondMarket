<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리티 :: 내일의 장보기, 마켓컬리티</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/style/admin/styles.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
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
					<form method="post" action="updqteGqna.mdo?qna_goods_serial=${qnaone.qna_goods_serial}">
						<table border="1" style="float:left; width:50%;">
							<tr align="center">
							<tr>
								<td>&nbsp;</td>
								<td align="center">번호</td>
								<td><input size="50" name="qna_goods_serial" value="${qnaone.qna_goods_serial}" readonly="readonly"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">제목</td>
								<td><input size="50" maxlength="50" value="${qnaone.qna_goods_title}" readonly="readonly"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">아이디</td>
								<td><input type="text" size="50" value="${qnaone.user_id}" readonly="readonly"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">내용</td>
								<td><textarea name="memo" cols="50" rows="13">${qnaone.qna_goods_content}</textarea></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
						</table>
						
							<table border="4" style="float:right; width:50%;">
							<tr align="center">
							<tr>
								<td>&nbsp;</td>
								<td><h3 style="text-align:right;">답변</h3></td>
							</tr>
							<tr height="20" bgcolor="#9932CC">
								<td colspan="4" style="color:#ffff; text-align:center;">답변을 달아라~~</td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center" style="height:100%;">내용</td>
								<td><textarea name="qna_goods_answer" cols="50" rows="13"></textarea></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr>
								<td colspan="4" align="center" style="width:20px;"><input type="submit" value="등록"></td>
							</tr>
						</table>
					</form>


				</div>
			</main>

			<jsp:include page="../default/footer.jsp"></jsp:include>
		</div>
	</div>
	<!-- Main -->

	<!-- 건들지마세요 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>
	<!-- 건들지마세요 -->
</body>
</html>