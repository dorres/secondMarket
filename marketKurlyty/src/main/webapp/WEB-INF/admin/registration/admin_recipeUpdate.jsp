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
table {
    width: 1000px;
    border: 1px solid #444444;
  }
  th, td {
    border: 1px solid #444444;
  }
 .btn1 {font-size: 15px; white-space:nowrap; width:100%; padding:.8em 1.5em; font-family: Open Sans, Helvetica,Arial,sans-serif; text-decoration-line: none;
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

				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4">레시피 상세</h1>
				<div class="card mb-4">
					
					<div class="card-body">
						<!-- 메인작업 -->
						<form id="updateRR" >
							<table >		
														
								<tr>
								
									<th width="100px" height="40px">레시피 고유번호</th>
									<td  height="40px" >
										<input type="text"style="width:100%; height:100%; border: none;" name="recipe_serial" value="${upList.recipe_serial }" readonly="readonly">
									</td>
									
									<th width="100px" height="40px">등록일</th>
									<td  height="40px" >
										<input type="text"style="width:100%; height:100%; border: none;" value="<fmt:formatDate value="${upList.recipe_date }" pattern="yyyy-MM-dd"/>" readonly="readonly" >
										
									</td>
								</tr>
								<tr>
									<th width="100px" height="40px">제목</th>
									<td height="40px" colspan="3">
										<input type="text"style="width:100%; height:100%; border: none;" name="recipe_title" value="${upList.recipe_title }">
									</td>
								</tr>
								<tr>
									<th width="100px" height="40px">핵심재료</th>
									<td height="40px" colspan="3">
										<input type="text"style="width:100%; height:100%; border: none;" name="recipe_key_ingredients" value="${upList.recipe_key_ingredients }" >
									</td>
								</tr>
																
								<tr>
									<th width="100px" height="400px">내용</th>
									<td colspan="3" >
										
											<img  src="${upList.recipe_content}" width="500px" height="800px">
										
									</td>
								</tr>
								<tr>
								<td colspan=2><input type="button" id="updateIn" class="btn1 btn-dark" value="레시피수정"></td>
								<td colspan=2><input type="button" id="deleteIn" class="btn1 btn-dark" value="레시피삭제"></td>
								</tr>
							</table>
							</form>
					</div>	
			
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
<script type="text/javascript">  
   $(document).ready(function(){
   $("#updateIn").click(function(){
	   var form =$("#updateRR").serialize() ;	
		$.ajax({
			type :"post", 
            url : "recipeUpProc.mdo", 
            data : form, 
            async : false,                           
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(result){
				if(result !=0){
				alert('레시피 수정 완료')
				location.href="recipe.mdo";
				}else{
					alert('펑션 벗 낫딜'+result)
				}
            	
			},
			error:function(){  
	            alert('레시피 삭제 실패')
			}
		});
	})
   })
   
    $(document).ready(function(){
   $("#deleteIn").click(function(){
	   var form =$("#updateRR").serialize() ;	
		$.ajax({
			type :"post", 
            url : "recipeDel.mdo", 
            data : form, 
            async : false,                           
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success: function(result){
				if(result !=0){
				alert('레시피 삭제 완료')
				location.href="recipe.mdo";
				}else{
					alert('펑션 벗 낫딜'+result)
				}
            	
			},
			error:function(){  
	            alert('레시피 삭제 실패')
			}
		});
	})
   })
   </script>
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