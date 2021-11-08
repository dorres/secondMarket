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
<script type="text/javascript">

	function delete_check(url) {
		var answer = confirm("게시글를 정말로 삭제할꺼임?");
		if (answer == true) {
			location = url;
		}
	}
//-->
</script>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
	<jsp:include page="default/top.jsp"></jsp:include>
	<jsp:include page="default/sideMenu.jsp"></jsp:include>

	<!-- Main -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4">Tables</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
					<li class="breadcrumb-item active">Tables</li>
				</ol>
				<div class="card mb-4">
					<div class="card-body">
						DataTables is a third party plugin that is used to generate the
						demo table below. For more information about DataTables, please
						visit the <a target="_blank" href="https://datatables.net/">official
							DataTables documentation</a> .
					</div>
				</div>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> DataTable Example
					</div>
					<div class="card-body">
						<form action="admin_bannerUpdate.mdo" method="POST" enctype="multipart/form-data">
							<table>
									<tr>
										<td>배너 이미지</td>
										<td><img src="${banner.banner_filepath }" height="150" width="1000"></td>
									</tr>
									<tr>
										<td>변경하고싶은 배너 이미지</td>
										<td><input type="file" name="uploadFile" /></td>
									</tr>
									<tr>
										<td>배너 이름</td>
										<td><input type="text" name="banner_title" value="${banner.banner_title }"/></td>
									</tr>
									<tr>
										<td>배너 내용</td>
										<td><textarea name="banner_contents">${banner.banner_contents }</textarea></td>
									</tr>
								</table>
							<input type="hidden" name="banner_serial" value="${banner.banner_serial }">
							<input type="submit" value="수정하기" />
							<input type="button" value="삭제하기" onclick="javascript:delete_check('admin_bannerDelete.mdo?banner_serial=${banner.banner_serial}')"/>
							<input type="button" value="목록보기" onclick="location.href='admin_bannerList.mdo'"/>
						</form>
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
		<jsp:include page="default/footer.jsp"></jsp:include>
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