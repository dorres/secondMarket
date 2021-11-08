<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<jsp:include page="default/top.jsp"></jsp:include>
	<jsp:include page="default/sideMenu.jsp"></jsp:include>

	<!-- Main -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4">자주하는 질문</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">자주하는질문 상세</a></li>
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
						<!-- 메인작업 -->
						<form action="admin_FAQUpdate.mdo" method="POST">
							<table >
								<tr>
									<td width="300px" height="40px">글번호</td>
									<td width="400px" height="40px">
										<input type="text" style="width:100%; height:100%; border: none;" name="faq_serial" value="${faq.faq_serial }" readonly="readonly">
									</td>
									
									<td width="300px" height="40px">카테고리</td>
									<td>
										<select name="faq_category">
											<option value="배송지연/불만" >배송지연/불만</option>
											<option value="컬리패스 (무료배송)">컬리패스 (무료배송)</option>
											<option value="반품문의">반품문의</option>
											<option value="A/S문의">A/S문의</option>
											<option value=">환불문의">환불문의</option>
											<option value="주문결제문의">주문결제문의</option>
											<option value="회원정보문의">회원정보문의</option>
											<option value="취소문의">취소문의</option>
											<option value="교환문의">교환문의</option>
											<option value="상품정보문의">상품정보문의</option>											
											<option value="기타문의">기타문의</option>
										</select>
									</td>
								</tr>
							
								<tr>
									<td width="300px" height="40px">제목</td>
									<td width="400px" height="40px" colspan="3">
										<input type="text"style="width:100%; height:100%; border: none;" name="faq_title" value="${faq.faq_title }" >
									</td>
								</tr>
								
								<tr>
									<td width="300px" height="500px">내용</td>
									<td colspan="3"  height="500px"><textarea name="faq_content" >${faq.faq_content }</textarea>
								</tr>
							</table>
							<input type="submit" value="수정하기" />
							<input type="button" value="삭제하기" onclick="javascript:delete_check('admin_FAQDelete.mdo?faq_serial=${faq.faq_serial}')"/>
							<input type="button" value="목록보기" onclick="location.href='admin_FAQList.mdo'"/>
						</form>
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
		<jsp:include page="default/footer.jsp"></jsp:include>
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