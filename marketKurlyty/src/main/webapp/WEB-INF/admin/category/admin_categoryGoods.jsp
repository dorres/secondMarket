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
  width: 200px;
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
  width: 350px;
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
					<li class="breadcrumb-item">3차카테고리(상품)</li>
					<li class="breadcrumb-item active">상세</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
							3차 카테고리 상세
						</div>
					</div>
					<div class="card-body">
						<form action="admin_categoryGoodsUpdate.mdo" method="POST" enctype="multipart/form-data">
								<table class="type02">
									<tr>
										<th>1차카테고리</th>
										<td><input type="text" name="${goods.category_main_serial }" value="${goods.category_main_name }" disabled></td>
										
										<th>2차카테고리</th>
										<td><input type="text" name="${goods.category_sub_serial }" value="${goods.category_sub_name }" disabled></td>
										
										<th>상품명</th>
										<td colspan="2"><input type="text" name="category_goods_name" value="${goods.category_goods_name }" style="width: 100%; height: 100%"></td>
									</tr>
									<tr>

										<th>상품명 설명</th>
										<td colspan="5"><input type="text" name="category_goods_name_subtext" value="${goods.category_goods_name_subtext }"></td>
									</tr>
									
									<tr>
										<th>상품 단위</th>
										<td><input type="text" name="category_goods_unit" value="${goods.category_goods_unit }"></td>
										
										<th>상품 무게</th>
										<td><input type="text" name="category_goods_weight" value="${goods.category_goods_weight }"></td>
										
										<th>원산지</th>
										<td><input type="text" name="category_goods_origin" value="${goods.category_goods_origin }"></td>
									</tr>
		
									<tr>
										<th>포장 타입</th>
										<td><input type="text" name="category_goods_packaging_type" value="${goods.category_goods_packaging_type }"></td>
										
										<th>배송 유형</th>
										<td><input type="text" name="category_goods_delivery_type" value="${goods.category_goods_delivery_type }"></td>
										
										<th>유통기한</th>
										<td><input type="text" name="category_goods_exp_date" value="${goods.category_goods_exp_date }"></td>
									</tr>
									
									<tr>
										<th>안내사항</th>
										<td colspan="5"><textarea rows="5" style="width: 100%" name="category_goods_info" >${goods.category_goods_info }</textarea></td>
									</tr>
									
									<tr>
										<th>참조사항</th>
										<td colspan="5"><textarea rows="5"  style="width: 100%" name="category_goods_ref">${goods.category_goods_ref }</textarea></td>
									</tr>
									
									<tr>
										<th>알레르기</th>
										<td colspan="5"><textarea rows="5"  style="width: 100%" name="category_goods_allergy">${goods.category_goods_allergy }</textarea></td>
									</tr>
									
									<tr>
										<th>상품 정보 제목</th>
										<td colspan="5"><input type="text" name="category_goods_detail_name1" value="${goods.category_goods_detail_name1 }"></td>
									</tr>
									
									<tr>
										<th>상품 정보 소제목</th>
										<td colspan="5"><input type="text" name="category_goods_detail_name2" value="${goods.category_goods_detail_name2 }"></td>
									</tr>
									
									<tr>
										<th>상품 정보 설명</th>
										<td colspan="5"><textarea rows="5"  style="width: 100%" name="category_goods_detail_name_subtext">${goods.category_goods_detail_name_subtext }</textarea></td>
									</tr>
									
									<tr>
										<th>썸네일 이미지</th>
										<td colspan="5"><img alt="썸네일 이미지" src="${goods.category_goods_image_thumb }" width="250" height="350"><input type="file" name="thumbImage"/></td>
									</tr>
									
									<tr>
										<th>상품 정보 상단 이미지</th>
										<td colspan="5"><img alt="상품 정보 상단 이미지" src="${goods.category_goods_image_detail_header }" width="600" height="300"><br><input type="file" name="headerImage" /></td>
									</tr>
									
									<tr>
										<th>상품 정보 메인 이미지</th>
										<td colspan="5"><img alt="상품 정보 메인 이미지" src="${goods.category_goods_image_detail_main }" width="600" height="900"><br><input type="file" name="mainImage" /></td>
									</tr>
																		
								</table>
								<br>
								<div style="margin-left:10px">
									<input type="hidden" name="category_goods_image_thumb" value="${goods.category_goods_image_thumb }">
									<input type="hidden" name="category_goods_image_detail_header" value="${goods.category_goods_image_detail_header }">
									<input type="hidden" name="category_goods_image_detail_main" value="${goods.category_goods_image_detail_main }">
									<input type="hidden" name="category_goods_serial " value="${goods.category_goods_serial }">
									<input type="submit" value="등록하기" />
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