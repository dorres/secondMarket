<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::레시피 등록::</title>
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
 <script src="jquery-3.6.0.min.js"></script>

   <style type="text/css">
.btn1 {font-size: 15px; white-space:nowrap; width:100%; padding:.8em 1.5em; font-family: Open Sans, Helvetica,Arial,sans-serif; text-decoration-line: none;
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
	max-width : 120%;
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

            <h1 class="mt-4">등록</h1>
         
            
            <div class="card mb-4">
               <div class="card-header"  align="right">
                     <div class="col three">
                        <a href="#" onclick="" id="recipeIn" class="btn1 btn-dark">레시피 등록</a>
                     </div>
                  </div>
               <div class="card-body">
               <form method="post" id="recipeF" name="inserRec" action="insertStocks.mdo">
                  <table id="datatablesSimple">
                     <thead>
                        <tr>
                           <th>제목</th>
                           <th>내용</th>
                           <th>핵심재료</th>
                           <th>메인이미지</th>                           
                        </tr>                        
                     </thead>                    
                     <tbody>
                           <tr>
                              <td><input type="text" name="recipe_title" /></td>
                              <td><input type="file" name="conImage"/></td>
                              <td><input type="text" name="recipe_key_ingredients"/>
                              <td><input type="file" name="mainImage" onchange="setThumbnail(event)"/></td>                              
                           </tr>                           
                     </tbody>
                     <tr>
                     	<th colspan=2></th>
                        <th>메인이미지</th>
                        </tr>
                        <tr>
                        	<td colspan=2></td>
                           <td colspan=2 rowspan="2"><div id="photoZone" ></div></td>
                           </tr>
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
   <script type="text/javascript">
   $("#recipeIn").click(function(){
	   var form = $('#recipeF')[0];  	    	          
	    var recipeInfo = new FormData(form);
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			url : 'recipeIn.mdo',
			data: recipeInfo,          
	        processData: false,    
	        contentType: false,      
	        cache: false,           
	        timeout: 600000,
			success: function(result){
				alert('레시피 등록 완료')
				location.reload();
			},
			error:function(){  
	            alert('레시피 등록 실패')
			}
		})
	});
   
   function setThumbnail(event) {
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			document.querySelector("div#photoZone").appendChild(img);
		};
		reader.readAsDataURL(event.target.files[0]);
	}		
	
   </script>
   <!-- 건들지마세요 -->
   <script   src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
   <script src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
   <script src="assets/demo/chart-area-demo.js"></script>
   <script src="assets/demo/chart-bar-demo.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
   <script src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>
   <!-- 건들지마세요 -->
</body>
</html>