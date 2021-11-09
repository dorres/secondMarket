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
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
	<jsp:include page="default/top.jsp"></jsp:include>
	<jsp:include page="default/sideMenu.jsp"></jsp:include>

	<!-- Main -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">


				<!-- 여기에 추가하면 가운데 페이지 추가하면 됩니다~~~~-->
					<form>
					<h1>약관 등록</h1>
					<h6>약관 등록하는 페이지</h6>
					<table>
						<p>약관번호<br>
						<input type="text" class="*" placeholder="번호를 입력해주세요"/></p>
						<p>약관이름<br>
						<input type="text" class="*" placeholder="약관명을 입력해주세요"/></p>
						약관 필수여부<br>
						<div>
 							 <input type="radio" id="ch_status1" name="ch_status1" value="필수" checked>필수
 							 <input type="radio" id="ch_status2" name="ch_status2" value="선택" >선택
						</div>
						<div>
							등록일
							<div>
								<input type="text" readonly="readonly" id="terms_agree_status"/>
							</div>
						</div>
						<div>
							약관내용
							<div>
								<textarea rows="100" cols="150" ></textarea>
								<div>
									<input type="submit" value="등록"/>
									<input type="submit" value="목록"/>
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