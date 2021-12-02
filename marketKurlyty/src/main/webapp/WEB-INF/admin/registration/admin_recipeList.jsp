<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마켓컬리티 :: 내일의 장보기, 마켓컬리티</title>
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
  <script src="jquery-3.6.0.min.js"></script>
 
  
 <style type="text/css">
.btn1 {font-size: 20px; white-space:nowrap; width:200px; padding:.8em 1.5em; font-family: Open Sans, Helvetica,Arial,sans-serif; text-decoration-line: none;
      line-height:10px; display: inline-block;zoom: 1; color: #fff; text-align: center; position:relative;
      -webkit-transition: border .25s linear, color .25s linear, background-color .25s linear;
      transition: border .25s linear, color .25s linear, background-color .25s linear;

   }   
.btn1.btn-dark{background-color: #8f3cab; border-color: #8f3cab; -webkit-box-shadow: 0 3px 0 #8f3cab; box-shadow: 0 3px 0 #8f3cab;}
.btn1.btn-dark:hover{background-color:#5f0080;}
.btn1.btn-dark:active{top: 3px; outline: none; -webkit-box-shadow: none; box-shadow: none;}
#photoZone {
    display: block;
    width: 80px;
    height: 80px;
    background-repeat: no-repeat;
    background-position: 50% 50%;
    background-size: cover;
}
#photoZone img{
	max-width : 100%;
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

            <h1 class="mt-4">레시피 조회/수정</h1>
            

            <div class="card mb-4">
               <div class="card-header">
                     <div class="col three">
								<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
									레시피 목록
									<a href="insertRecipe.mdo" class="btn1 btn-dark" style="float:right;">레시피 등록</a>
								</div>
						</div>
                  </div>
               <div class="card-body">
               <form id="recipeF" method="post" action="recipeDel.mdo">
                  <table id="datatablesSimple">
                     <thead>
                        <tr>
                           <th>시리얼</th>
                           <th>레시피 제목</th>
                           <th>레시피 내용</th>
                           <th>핵심재료</th>
                           <th>메인이미지</th>                           
                           <th>수정/삭제</th>                           
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="List" items="${List}" >
                           <tr >
                              <td><input type="text" name="recipe_serial" value="${List.recipe_serial}" readonly="readonly"/></td>
                              <td><input type="text" name="recipe_title" value="${List.recipe_title}" size="10"></td>
                              <td>내용</td>
                              <td><input type="text" name="recipe_key_ingredients" value="${List.recipe_key_ingredients}" size="70"></td>
                              <td><div id="photoZone"><img src="${List.recipe_image_main }"></div></td>
                              <td><a href="recipeUp.mdo?recipe_serial=${List.recipe_serial }">
                              <input type="button" id="recipeUU"  value="수정/삭제"></a></td>
                                                            
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
                  </form>
               </div>
            </div>


         </div>
      </main>

      <jsp:include page="../default/footer.jsp"></jsp:include>
   </div>
   </div>
   <!-- Main --> 
   
   
   <!-- 건들지마세요 -->
   <script   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
   <script src="assets/demo/chart-area-demo.js"></script>
   <script src="assets/demo/chart-bar-demo.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
   <script src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>
   <!-- 건들지마세요 -->
<script>
function update(index,serial){
   document.updateForm.action="updateGoods.mdo?index="+String(index)+"&serial="+String(serial);
   document.updateForm.submit();
}

</script>
</body>
</html>