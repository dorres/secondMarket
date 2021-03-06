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
				<h1 class="mt-4">1:1문의</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">답변대기</li>
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
									<td>
										<input type="text" style="width:100%; height:100%; border: none;"  value="${qnaWait.qna_personal_category }" readonly="readonly">
									</td>
									
									<th scope="row">작성자</th>
									<td>
										<input type="text"style="width:100%; height:100%; border: none;"  value="${qnaWait.user_id}(${qnaWait.user_name })" readonly="readonly" >
									</td>
								</tr>
							
								<tr>
									<th scope="row">주문번호</th>
									<td>
										<input type="text"style="width:100%; height:100%; border: none;" value="${qnaWait.order_details_order_serial}" readonly="readonly">
									</td>
									
									<th scope="row">날짜</th>
									<td  height="40px" >
										<input type="text"style="width:100%; height:100%; border: none;" value="<fmt:formatDate value="${qnaWait.qna_personal_date }" pattern="yyyy-MM-dd"/>" readonly="readonly" >
										
									</td>
								</tr>
								<tr>
									<th scope="row">제목</th>
									<td colspan="3">
										<input type="text"style="width:100%; height:100%; border: none;" value="${qnaWait.qna_personal_title }" readonly="readonly">
									</td>
								</tr>
								
								<tr>
									<th scope="row">내용</th>
									<td colspan="3" >
										<c:if test="${qnaWait.qna_personal_image1 != null}">
											<img alt="1:1문의 이미지" src="${qnaWait.qna_personal_image1}" width="40%" height="60%">
										</c:if>
										<c:if test="${qnaWait.qna_personal_image2 != null}">
											<img alt="1:1문의 이미지" src="${qnaWait.qna_personal_image2}" width="40%" height="60%">
										</c:if>
										<textarea readonly="readonly" rows="10%">${qnaWait.qna_personal_content }</textarea>
									</td>
								</tr>
							</table>
					</div>
					
					<div class="card-header">
						<div class="col three">
								<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
									1:1문의 답변
								</div>
							</div>
					</div>
					<div class="card-body">
						<!-- 메인작업 -->
						<form action="admin_personalQnaWaitUpdate.mdo" method="POST" id="subForm" name="subForm">
							<table class="type02">
								<tr>
									<th scope="row">제목</th>
									<td>
										<input type="text" style="width:100%; height:100%; border: none;" name="qna_personal_answer_title" id="qna_personal_answer_title" value="${qnaWait.qna_personal_answer_title }">
									</td>
								</tr>
								<tr>
									<th scope="row">내용</th>
									<td ><textarea name="qna_personal_answer" id="qna_personal_answer" rows="10%">${qnaWait.qna_personal_answer }</textarea>
								</tr>
							</table>
							<input type="hidden" name="qna_personal_serial" id="qna_personal_serial" value="${qnaWait.qna_personal_serial }" >
							<input type="hidden" name="order_details_order_serial" value="${qnaWait.order_details_order_serial}" id="order_details_order_serial">
							<input type="submit" value="답변 등록하기" style="margin-left: 10px"/>
							<c:if test="${qnaWait.qna_personal_category == '환불문의'}">
								<input type="button" value="환불요청 처리" id="refund" />
							</c:if>
							<c:if test="${qnaWait.qna_personal_category == '반품문의'}">
								<input type="button" value="반품요청 처리" id="return"/>
							</c:if>
							<c:if test="${qnaWait.qna_personal_category == '취소문의'}">
								<input type="button" value="취소요청 처리" id="cancle"/>
							</c:if>
							<input type="button" value="1:1문의글 목록보기" onclick="location.href='admin_personalQnaWaitList.mdo'"/>
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
<script type="text/javascript">
$(document).on("click", "#refund", function(){
	var checkBtn = $(this);
	var tr = checkBtn.closest("#subForm");
	var serial1 = tr.find("#qna_personal_serial").val();
	var serial2 = tr.find("#order_details_order_serial").val();
	var title = tr.find("#qna_personal_answer_title").val();
	var content = tr.find("#qna_personal_answer").val();
	
	if(document.subForm.qna_personal_answer_title.value==""){
		alert("답변 제목을 입력하세요.");
		document.subForm.qna_personal_answer_title.focus();
		return;
	}
	if(document.subForm.qna_personal_answer.value==""){
		alert("답변 내용을 입력하세요.");
		document.subForm.qna_personal_answer.focus();
		return;
	} 
	
	if(confirm(serial2 +' 주문건을 환불요청으로 처리하시겠습니까?')) {
		$.ajax({
		    type: 'post',
		    url: 'admin_orderRefundUpdate.mdo',
		    dataType: 'text',
		    data: {"qna_personal_serial" : serial1 ,"qna_personal_answer_title" : title, "qna_personal_answer" : content, "order_details_order_serial": serial2 },
		    success: function(result) {
				if(result){
					alert("배송 상태 수정을 성공 하였습니다.")
					 window.location.href = "admin_personalQnaWaitList.mdo";
				}else{
					alert("배송 상태 수정을 실패 하였습니다.")
					location.reload();
				}
			}
		});
	}
});

$(document).on("click", "#return", function(){
	var checkBtn = $(this);
	var tr = checkBtn.closest("#subForm");
	var serial1 = tr.find("#qna_personal_serial").val();
	var serial2 = tr.find("#order_details_order_serial").val();
	var title = tr.find("#qna_personal_answer_title").val();
	var content = tr.find("#qna_personal_answer").val();
	
	if(document.subForm.qna_personal_answer_title.value==""){
		alert("답변 제목을 입력하세요.");
		document.subForm.qna_personal_answer_title.focus();
		return;
	}
	if(document.subForm.qna_personal_answer.value==""){
		alert("답변 내용을 입력하세요.");
		document.subForm.qna_personal_answer.focus();
		return;
	} 
	
	if(confirm(serial2 +' 주문건을 반품요청으로 처리하시겠습니까?')) {
		$.ajax({
		    type: 'post',
		    url: 'admin_orderReturnUpdate.mdo',
		    dataType: 'text',
		    data: {"qna_personal_serial" : serial1 ,"qna_personal_answer_title" : title, "qna_personal_answer" : content, "order_details_order_serial": serial2 },
		    success: function(result) {
				if(result){
					alert("배송 상태 수정을 성공 하였습니다.")
					window.location.href = "admin_personalQnaWaitList.mdo";
				}else{
					alert("배송 상태 수정을 실패 하였습니다.")
					location.reload();
				}
			}
		});
	}
});

$(document).on("click", "#cancle", function(){
	var checkBtn = $(this);
	var tr = checkBtn.closest("#subForm");
	var serial1 = tr.find("#qna_personal_serial").val();
	var serial2 = tr.find("#order_details_order_serial").val();
	var title = tr.find("#qna_personal_answer_title").val();
	var content = tr.find("#qna_personal_answer").val();
	if(document.subForm.qna_personal_answer_title.value==""){
		alert("답변 제목을 입력하세요.");
		document.subForm.qna_personal_answer_title.focus();
		return;
	}
	if(document.subForm.qna_personal_answer.value==""){
		alert("답변 내용을 입력하세요.");
		document.subForm.qna_personal_answer.focus();
		return;
	} 
	
	 if(confirm(serial2 +' 주문건을 취소요청으로 처리하시겠습니까?')) {
		$.ajax({
		    type: 'post',
		    url: 'admin_orderCancleUpdate.mdo',
		    dataType: 'text',
		    data: {"qna_personal_serial" : serial1 ,"qna_personal_answer_title" : title, "qna_personal_answer" : content, "order_details_order_serial": serial2 },
		    success: function(result) {
				if(result){
					alert("배송 상태 수정을 성공 하였습니다.")
					window.location.href = "admin_personalQnaWaitList.mdo";
				}else{
					alert("배송 상태 수정을 실패 하였습니다.")
					location.reload();
				}
			}
		});
	}
});
</script>
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