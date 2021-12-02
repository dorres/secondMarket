<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리티 :: 내일의 장보기, 마켓컬리티</title>
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
  <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
				<h1 class="mt-4">리뷰</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">리뷰</li>
					<li class="breadcrumb-item active">내용</li>
				</ol>
				<div class="card mb-4">
					<div class="card-header">
						<div class="col three">
								<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
									리뷰
								</div>
							</div>
					</div>
					<div class="card-body">
						<!-- 메인작업 -->
							<table class="type02">
								<tr>
									<th scope="row">제목</th>
									<td>
										<input type="text" style="width:100%; height:100%; border: none;"  value="${reviewcon.review_title}" readonly="readonly">
									</td>
									
									<th scope="row">작성자</th>
									<td>
										<input type="text"style="width:100%; height:100%; border: none;"  value="${reviewcon.user_id}" readonly="readonly" >
									</td>
								</tr>
							
								<tr>
									<th scope="row">조회수</th>
									<td>
										<input type="text"style="width:100%; height:100%; border: none;"  value="${reviewcon.review_hit}" readonly="readonly" >
									</td>
									
									<th scope="row">작성일</th>
									<td  height="40px" >
										<input type="text"style="width:100%; height:100%; border: none;" value="<fmt:formatDate value="${reviewcon.review_date }" pattern="yyyy-MM-dd"/>" readonly="readonly" >
										
									</td>
								</tr>
								<tr>
									<th scope="row">베스트리뷰</th>
									<td>
										<select name="review_best_up" id="review_best_up">
												<option value="false" <c:if test ="${reviewcon.review_best_up eq 'false'}">selected="selected"</c:if> >일반리뷰</option>
												<option value="true" <c:if test ="${reviewcon.review_best_up eq 'true'}">selected="selected"</c:if> >베스트리뷰</option>
											</select>
									</td>
									<th scope="row">수정/삭제</th>
									<td>
											<input type="hidden" id="review_serial" value="${reviewcon.review_serial }">
											<input type="button" value="수정" id="updateBtn"/>
											<input type="button" value="삭제" onclick="javascript:delete_check('deleteReview.mdo?review_serial=${reviewcon.review_serial}')"/>
										</td>
							
								</tr>
								<tr>
									<th scope="row">내용</th>
									<td colspan="3" >
										<c:if test="${reviewcon.review_image_main != null}">
											<img alt="리뷰 이미지" src="${reviewcon.review_image_main}" width="40%" height="60%">
										</c:if>
										<textarea readonly="readonly" rows="10%">${reviewcon.review_content }</textarea>
									</td>
									
								</tr>
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
	<script type="text/javascript"><!-- 동적 테이블은 이렇게 해야 버튼 이벤트가 먹힘-->
	$(document).on("click", "#updateBtn", function(){
		var checkBtn = $(this);
		var tr = checkBtn.closest("tr");
		var review = tr.find("#review_best_up option:selected").val();
		var serial = tr.find("#review_serial").val();
		
		console.log(review);
		console.log(serial);
	    if(confirm('리뷰상태를 수정하시겠습니까?')) {
		$.ajax({
			type:"POST",
			url:"updateReview.mdo",
			dataType : "text",
			data : {"review_best_up" : review, "review_serial" : serial},
			success: function(result) {
				if(result != "0"){
					alert("수정 성공!")
					location.reload()
				}else{
					alert("수정 실패!")
					location.reload()
				}
			}
		}) 
		}
	});
	</script>
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<!-- 건들지마세요 -->
</body>
</html>