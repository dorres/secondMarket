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
	<jsp:include page="../default/top.jsp"></jsp:include>
	<jsp:include page="../default/sideMenu.jsp"></jsp:include>

	<!-- Main -->
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
			<h2>상품등록</h2>  
			<form>
  <table class="body">  
   <tr>
    <th class="tg-0pky">카테고리 </th>
    <th class="tg-0pky"> 상위카테고리               중위카테고리               하위카테고리<br><select>
        <option id="*"value="*">카테고리1</option>
        <option value="*">카테고리2</option>
        <option value="*">카테고리3</option>
        </select>
        <select>
        <option id="*"value="*">카테고리1</option>
        <option value="*">카테고리2</option>
        <option value="*">카테고리3</option>
        </select>
        <select>
        <option id="*"value="*">카테고리1</option>
        <option value="*">카테고리2</option>
        <option value="*">카테고리3</option>
        </select>
        </th>
    
  </tr>
      <tr>  
        <th>판매가격</th>
        <th><input type="text" name="*"/></th>
      </tr> 
      
      <tr>
      <th>재고알림</th>
       <th><input type="text" name="*"></th>
      </tr>
      
       <tr>
       <td>유통기한 
       <input type="date" id="*" value="" placeholder="ex) 2021-00-00">&nbsp;&nbsp;</td>
       <td>프로모션
       <select>
       <option value="none" selected="selected">프로모션 선택</option>
       <option value="적용">적용</option>
       <option value="미적용">미적용</option> 
       </select> </td>
       <td>상태
       <select>
       <option value="none" selected="selected">상태선택</option>
       <option value="적용">판매중</option>
       <option value="미적용">판매중지</option>
       <option value="미적용">판매완료</option> 
       </select> </td>
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