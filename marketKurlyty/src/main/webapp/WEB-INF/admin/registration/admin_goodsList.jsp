<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
 <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
 <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">        
/*       if(${notification!=null}){
         alert("재고 부족한 재품이 있습니다.")
      };  */	
    
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
.highlight { background-color: pink; }

 .do{
 	text-align: center;
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

            <h1 class="mt-4">판매</h1>
            <ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">판매 등록하는 페이지 입니다.</li>
				</ol>
            <form id="form" method="post">
            <div class="card mb-4">
               <div class="card-header">
                     <div class="col three">
                     	<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
									판매 목록
									 <a href="#" id="comeIn" class ="btn1 btn-dark" style="float: right;">입고</a>
                       				 <input type="hidden" id="arrayParam" name="arrayParam"/>
								</div>	
                       
                     </div>
                     <div>
                     </div>
                  </div>
               <div class="card-body">
                  <table id="datatablesSimple">
                     <thead>
                        <tr>
                        	<th class="do" style="text-align: center; vertical-align: middle;">
								<input type="checkbox" name="checkall" id="checkall"/>
							</th>
                           <th>상품번호</th>
                           <th>1차카테고리</th>
                           <th>2차카테고리</th>
                           <th>3차카테고리</th>
                           <th>재고수량</th>
                           <th>상품가격</th>
                           <th>알림</th>
                           <th>프로모션</th>
                           <th>상태</th>
                           <th>할인</th>
                           <th>재고</th>
                           <th>수정</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="goodsList" items="${goodsList}">
                           <tr id="rowBtn" >
                           	  <td class="do"><input type="checkbox" name="chk" value="${goodsList.category_goods_serial}"/></td>
                              <td>${goodsList.rownum}</td>
                              <td>${goodsList.category_main_name}</td>
                              <td>${goodsList.category_sub_name}</td>
                              <td>${goodsList.category_goods_name}</td>                         
                              <td>${goodsList.goods_detail_stock_quantity}</td>
                              <td>
                              	<input type="text" name="goods_detail_price" id="goods_detail_price" value="${goodsList.goods_detail_price}" size="4"/>원
                              </td>
                              <td>
                              	<input type="text" name="goods_detail_stock_notification" id="goods_detail_stock_notification" value="${goodsList.goods_detail_stock_notification}" size="3"/>개
                              </td>
                              <td>
                              		<select name="goods_detail_promotion_serial" id="goods_detail_promotion_serial">
	                                	<option value="0" ${goodsList.goods_detail_promotion_serial == 0 ? "selected='selected'" : '' }>0번프로</option>
	                                	<option value="1" ${goodsList.goods_detail_promotion_serial == 1 ? "selected='selected'" : '' }>1번프로</option>
	                                 	<option value="2" ${goodsList.goods_detail_promotion_serial == 2 ? "selected='selected'" : '' }>2번프로</option>
	                                 	<option value="3" ${goodsList.goods_detail_promotion_serial == 3 ? "selected='selected'" : '' }>3번프로</option>
	                                 	<option value="4" ${goodsList.goods_detail_promotion_serial == 4 ? "selected='selected'" : '' }>4번프로</option>
                              		</select>
                              </td>
                              
                              <td>
                              	<select name="goods_detail_status" id="goods_detail_status">
                                	<option value="0" ${goodsList.goods_detail_status == 0 ? "selected='selected'" : '' }>판매완료</option>
                                 	<option value="1" ${goodsList.goods_detail_status == 1 ? "selected='selected'" : '' }>판매중</option>
                                 	<option value="2" ${goodsList.goods_detail_status == 2 ? "selected='selected'" : '' }>판매중지</option>
                              	</select>
                              </td>
                              
                              <td>
                              		<input type="text" name="goods_detail_dicountrate" id="goods_detail_dicountrate" value="${goodsList.goods_detail_dicountrate}" size="3"/>%
                              </td>
                              
                              <td>
                              	<input type="button" value="재고" onclick="location.href='stockList.mdo?category_goods_serial=${goodsList.category_goods_serial}'">
                              </td>
                              
                              <td>
                              		<input type="hidden" id="goods_detail_serial" value="${goodsList.goods_detail_serial}">
                                	<input type=button id="updateBtn" value="수정"/>     
                              </td>
                           </tr>
                        </c:forEach>
                     </tbody>
                  </table>
               </div>
            </div>
            </form>
         </div>
      </main>
      <jsp:include page="../default/footer.jsp"></jsp:include>
   </div>
   </div>
   <!-- Main -->
<script type="text/javascript">
$(document).on("click", "#updateBtn", function(){
	var checkBtn = $(this);
	var tr = checkBtn.closest("tr");
	var price = tr.find("#goods_detail_price").val();
	var noti = tr.find("#goods_detail_stock_notification").val();
	var promotion = tr.find("#goods_detail_promotion_serial option:selected").val();
	var status = tr.find("#goods_detail_status option:selected").val();
	var rate = tr.find("#goods_detail_dicountrate").val();
	var serial = tr.find("#goods_detail_serial").val();
     if(confirm('판매 정보를 수정하시겠습니까?')) {
	$.ajax({
		type:"POST",
		url:"updateGoods.mdo",
		dataType : "json",
		data : {"goods_detail_serial" : serial, "goods_detail_price" : price,
			"goods_detail_stock_notification" : noti, "goods_detail_promotion_serial" : promotion,
			"goods_detail_status" : status, "goods_detail_dicountrate" :rate
			},
		success: function(result) {
			if(result != 0){
				alert("판매 정보를 변경을 성공적으로 수정하였습니다.")
				location.reload();
			}else{
				alert("판매 정보를 변경을 실패했습니다.")
				location.reload();
			}
		}
	}) 
	}  
});

$("#comeIn").click(function() {
	var array = [];
	$('input:checkbox[name=chk]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
	    array.push(this.value);
	});
	
	if(confirm('체크한 상품 재고를 입고하시겠습니까?')) {
		 if(array.length >0){
			$("#arrayParam").val(array);
			$("#form").attr("action", "registration.mdo");  
			$("#form").submit();
		 }else{
			 alert("상품을 체크해주세요.");
			 location.reload();
		 }
	}
	
	
	
	
	
	
});

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
<script type="text/javascript">
	$(window).load(function(){
		$("input#checkall").unwrap();
		
		$("#checkall").click(function(){
	        //클릭되었으면
	        if($("#checkall").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $("input[name=chk]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $("input[name=chk]").prop("checked",false);
	        }
	    })
		
	});
</script>
</body>
</html>