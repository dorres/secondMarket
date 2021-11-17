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
			<form method="post" action="*">
  <table class="body">  
   <tr>
    <th class="tg-0pky">카테고리 </th>
    <th class="tg-0pky"> 상위카테고리               중위카테고리               하위카테고리<br>
    	
    	<th>
    	<select name="category_main_serial" id="category_main_serial">
		<c:forEach var="goods" items="${category1 }">
		<option value="${goods.category_main_serial }">${goods.category_main_name }</option>
		</c:forEach>
		</select>
		</th>
		
		<th>
        <select>
        <option id="*"value="*">카테고리2</option>
        <option value="*">카테고리2</option>
        <option value="*">카테고리3</option>
        </select>
        </th>
        
        <th>
        <select>
        <option id="*"value="*">카테고리3</option>
        <option value="*">카테고리2</option>
        <option value="*">카테고리3</option>
        </select>
        </th>
    </tr>
    
      <tr>  
        <th>판매가격</th>
        <th><input type="text" name="*"/>원</th>
      </tr> 
      
      <tr>
      <th>입고수량</th>
       <th><input type="text" name="*">개</th>
      </tr>
      
      <tr>
		<th>재고알림</th>
		<th><input type="text" name="*">개</th>      
      </tr>
      
      <tr>
		<th>프로모션</th>
		<th><select>
		<option value="*">프로모션1</option>
		<option value="*">프로모션2</option>
		<option value="*">프로모션3</option>
		</select> </th>      
      </tr>
      
      <tr>
		<th>상태</th>
		<th><select>
		<option value="*">판매완료</option>
		<option value="*">판매중</option>
		<option value="*">판매중지</option>
		</select> </th>      
      </tr>
      
      <tr>
		<th>입고일자</th>
		<th><input type="date" name="*"></th>      
      </tr>
      
      <tr>
		<th>유통기한</th>
		<th><input type="date" name="*"></th>      
      </tr>
      
      <tr>
		<th>할인</th>
		<th><input type="text" name="*">%</th>      
      </tr>
      
      <tr>
      	<th><input type="submit" value="등록"/></th>
      	<th><input type="button" value="목록"/></th>
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