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
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
 <script src="jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/board/list";
			})
		});
		function delete_check(url) {
			var answer = confirm("답변을 정말로 삭제합니까?");
			if (answer == true) {
				location.href = url;
			}
		}
		
	</script>
	<style type="text/css">
.btn1 {font-size: 20px; white-space:nowrap; width:200px; padding:.8em 1.5em; font-family: Open Sans, Helvetica,Arial,sans-serif; text-decoration-line: none;
		line-height:10px; display: inline-block;zoom: 1; color: #fff; text-align: center; position:relative;
		-webkit-transition: border .25s linear, color .25s linear, background-color .25s linear;
		transition: border .25s linear, color .25s linear, background-color .25s linear;

	}	
.btn1.btn-dark{background-color: #8f3cab; border-color: #8f3cab; -webkit-box-shadow: 0 3px 0 #8f3cab; box-shadow: 0 3px 0 #8f3cab;}
.btn1.btn-dark:hover{background-color:#5f0080;}
.btn1.btn-dark:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}
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
			</div>
				<h1 class="mt-4">상품문의(답변완료)</h1>
				

				<div class="card mb-4">
					<div class="card-header"  align="right">
						</div>
					<div class="card-body">
					<form>
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>번호</th>
									<th>상품명</th>
									<th>아이디</th>
									<th>제목</th>
									<th>내용</th>
									<th>작성일</th>
									<th>공개유무</th>
									<th>답변확인</th>
									<th>문의삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="ListSuc" items="${gqnaListSuc}">
									<tr>
										<td>${ListSuc.qna_goods_serial}</td>
										<td>${ListSuc.category_goods_name }</td>
										<td>${ListSuc.user_id}</td>
										<td>${ListSuc.qna_goods_title}</td>
										<td>${ListSuc.qna_goods_content }</td>
										<td><fmt:formatDate value="${ListSuc.qna_goods_date}" pattern="yyyy-MM-dd"/></td>
										<td>${ListSuc.qna_goods_lock}</td>
										<td><input type="button" value="답변확인" onclick="location.href='checkAnswer.mdo?qna_goods_serial=${ListSuc.qna_goods_serial}'"/></td>
										<td>
											<input type="button" value="삭제" onclick="javascript:delete_check('deleteGqnaSuc.mdo?qna_goods_serial=${ListSuc.qna_goods_serial}')"/>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</form>
				</div>
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