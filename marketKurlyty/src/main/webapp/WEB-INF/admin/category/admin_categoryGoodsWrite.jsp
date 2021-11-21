<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>??????????????</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
table{
	border-collapse: collapse;
	text-align: left;
	width: 1300px;
}
th {
	width: 130px;
	font-weight: bold;
	border: 1px solid #ccc;
	height: 50px;

}
td {
	width: 200px;
	border: 1px solid #ccc;
}
td >input{
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
<script type="text/javascript">
$(document).ready(function () {
	$('#category_main_serial').change(function () {
		var selectType=$(this).val();

		$.ajax({
			type : "POST",
			url : "admin_getCategoryType.mdo",
			dataType : "json",
			data : {"category_main_serial" : selectType},
			success : function(result) {
				$("#category_sub_serial").html("");
				for(key in result){
					$('#category_sub_serial').append("<option value="+result[key].category_sub_serial+">"+result[key].category_sub_name+"</option>")
				}
		 }
		});//ajax 
	})
})
function formGoodsSubmit() {
	if(document.goodsForm.category_goods_name.value==""){
		alert("상품명을 입력하세요.");
		document.goodsForm.category_goods_name.focus();
		return;
	}
	if(document.goodsForm.category_goods_name_subtext.value==""){
		alert("상품명 설명을 입력하세요.");
		document.goodsForm.category_goods_name_subtext.focus();
		return;
	}
	if(document.goodsForm.category_goods_unit.value==""){
		alert("상품 단위를 입력하세요.");
		document.goodsForm.category_goods_unit.focus();
		return;
	}
	if(document.goodsForm.category_goods_weight.value==""){
		alert("상품 무게를 입력하세요.");
		document.goodsForm.category_goods_weight.focus();
		return;
	}
	if(document.goodsForm.category_goods_origin.value==""){
		alert("원산지를 입력하세요.");
		document.goodsForm.category_goods_origin.focus();
		return;
	}
	if(document.goodsForm.category_goods_detail_name1.value==""){
		alert("상품 정보 제목을 입력하세요.");
		document.goodsForm.category_goods_detail_name1.focus();
		return;
	}
	if(document.goodsForm.category_goods_detail_name2.value==""){
		alert("상품 정보 소제목을 입력하세요.");
		document.goodsForm.category_goods_detail_name2.focus();
		return;
	}
	if(document.goodsForm.category_goods_detail_name_subtext.value==""){
		alert("상품 정보 설명을 입력하세요.");
		document.goodsForm.category_goods_detail_name_subtext.focus();
		return;
	}
	if(document.goodsForm.goodsImage1.value==""){
		alert("썸네일 이미지를 등록하세요.");
		document.goodsForm.goodsImage1.focus();
		return;
	}
	if(document.goodsForm.goodsImage2.value==""){
		alert("상품 정보 상단 이미지를 등록하세요.");
		document.goodsForm.goodsImage2.focus();
		return;
	}
	if(document.goodsForm.goodsImage3.value==""){
		alert("상품 정보 메인 이미지를 등록하세요.");
		document.goodsForm.goodsImage3.focus();
		return;
	}
	document.goodsForm.submit();
}
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
				<h1 class="mt-4">카테고리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="index.html">3차카테고리 등록(상품)</a></li>
					<li class="breadcrumb-item active">등록</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						3차 카테고리 등록
					</div>
					<div class="card-body">
						<form action="admin_categoryGoodsInsert.mdo" name="goodsForm" method="POST" enctype="multipart/form-data">
								<table>
									<tr>
										<th>카테고리</th>
										<td colspan="3" >
											<b>1차</b>
											<select name="category_main_serial" id="category_main_serial">
												<c:forEach var="main" items="${category1 }">
													<option value="${main.category_main_serial }">${main.category_main_name }</option>
												</c:forEach>
											</select>
											&nbsp;&nbsp;&nbsp;
											<b>2차</b>
											<select name="category_sub_serial" id="category_sub_serial">
												<c:forEach var="sub" items="${category2 }">
													<option value="${sub.category_sub_serial }">${sub.category_sub_name }</option>
												</c:forEach>
											</select>
										</td>
										
										<th>상품명</th>
										<td colspan="2"><input type="text" name="category_goods_name" style="width: 100%; height: 100%" placeholder="ex) 친환경 당근 500g"></td>
									</tr>
										
									<tr>

										<th>상품명 설명</th>
										<td colspan="5"><input type="text" name="category_goods_name_subtext" placeholder="ex) 껍질째 먹을 수 있는 친환경 흙당근 (500g 내외)" ></td>
									</tr>
									
									<tr>
										<th>상품 단위</th>
										<td><input type="text" name="category_goods_unit"  placeholder="ex) 1봉지"></td>
										
										<th>상품 무게</th>
										<td><input type="text" name="category_goods_weight" placeholder="ex) 500g(2~4개입)"></td>
										
										<th>원산지</th>
										<td><input type="text" name="category_goods_origin" placeholder="ex) 국내산"></td>
									</tr>
		
									<tr>
										<th>포장 타입</th>
										<td>
											<select name="category_goods_packaging_type" style="width: 200px">
													<option value="냉동/종이포장" selected="selected">냉동/종이포장</option>
													<option value="냉장/종이포장">냉장/종이포장</option>
													<option value="상온/종이포장">상온/종이포장</option>
													<option value="기타">기타</option>
											</select>
										</td>
										
										<th>배송 유형</th>
										<td>
											<select name="category_goods_delivery_type" style="width: 200px">
												<option value="샛별배송/택배배송" selected="selected">샛별배송/택배배송</option>
												<option value="기타">기타</option>
											</select>
										</td>
										
										<th>유통기한</th>
										<td><input type="text" name="category_goods_exp_date"></td>
									</tr>
									
									<tr>
										<th>안내사항</th>
										<td colspan="5"><textarea rows="5" style="width: 100%" name="category_goods_info"></textarea></td>
									</tr>
									
									<tr>
										<th>참조사항</th>
										<td colspan="5"><textarea rows="5"  style="width: 100%" name="category_goods_ref"></textarea></td>
									</tr>
									
									<tr>
										<th>알레르기</th>
										<td colspan="5"><textarea rows="5"  style="width: 100%" name="category_goods_allergy"></textarea></td>
									</tr>
									
									<tr>
										<th>상품 정보 제목</th>
										<td colspan="5"><input type="text" name="category_goods_detail_name1" placeholder="ex) 친환경 당근"></td>
									</tr>
									
									<tr>
										<th>상품 정보 소제목</th>
										<td colspan="5"><input type="text" name="category_goods_detail_name2" placeholder="ex) 베타카로틴이 풍부한 주황빛 채소"></td>
									</tr>
									
									<tr>
										<th>상품 정보 설명</th>
										<td colspan="5">
											<textarea rows="5"  style="width: 100%" name="category_goods_detail_name_subtext"></textarea>
										</td>
									</tr>
									
									<tr>
										<th>썸네일 이미지</th>
										<td colspan="5"><input type="file" name="goodsImage1" /></td>
									</tr>
									
									<tr>
										<th>상품 정보 상단 이미지</th>
										<td colspan="5"><input type="file" name="goodsImage2" /></td>
									</tr>
									
									<tr>
										<th>상품 정보 메인 이미지</th>
										<td colspan="5"><input type="file" name="goodsImage3" /></td>
									</tr>
																		
								</table>
								<br>
								<div align="right" style="width: 1200px">
									<input type="button" value="등록하기" onclick="formGoodsSubmit()"/>
									<input type="button" value="목록보기" onclick="location.href='admin_categoryGoodsList.mdo'"/>
								</div>
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