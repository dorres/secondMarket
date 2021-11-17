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
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
	<jsp:include page="../default/top.jsp"></jsp:include>
	<jsp:include page="../default/sideMenu.jsp"></jsp:include>

	<!-- Main -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
			<h2>상품등록</h2>  
			<form method="post" action="">
  <table class="body">  
  <tr>
		<th>카테고리</th>
			<td colspan="3">
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
			&nbsp;&nbsp;&nbsp;
			<b>3차</b>
			<select name="category_sub_serial" id="category_sub_serial">
				<c:forEach var="goods" items="${category3 }">
					<option value="${sub.category_goods_serial }">${sub.category_goods_name }</option>
				</c:forEach>
			</select>
			</td>
	</tr>							
    
      <tr>  
        <th>판매가격</th>
        <th><input type="text" name="goods_detail_price"/>원</th>
      </tr> 
      
      <tr>
      <th>입고수량</th>
       <th><input type="text" name="goods_stock_receving_quantity">개</th>
      </tr>
      
      <tr>
		<th>재고알림</th>
		<th><input type="text" name="goods_detail_stock_notification">개</th>      
      </tr>
      
      <tr>
		<th>프로모션</th>
		<th><select name="goods_detail_promotion_serial">
		<option value="1">프로모션1</option>
		<option value="2">프로모션2</option>
		<option value="3">프로모션3</option>
		</select> </th>      
      </tr>
      
      <tr>
		<th>상태</th>
		<th><select name="goods_detail_status">
		<option value="0">판매완료</option>
		<option value="1">판매중</option>
		<option value="2">판매중지</option>
		</select> </th>      
      </tr>
      
      <tr>
		<th>입고일자</th>
		<th><input type="date" name="goods_detail_promotion_serial"></th>      
      </tr>
      
      <tr>
		<th>유통기한</th>
		<th><input type="date" name="goods_stock_exp_date"></th>      
      </tr>
      
      <tr>
		<th>할인</th>
		<th><input type="text" name="goods_detail_dicountrate">%</th>      
      </tr>
      
      <tr>
      	<th><input type="submit" value="등록"/></th>
      	<th><input type="button" value="목록" onclick="location.href='getGoodsList.mdo'"/></th>
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
	<script	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstr44ap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>
	<!-- 건들지마세요 -->
</body>
</html>