<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>??????????????</title>
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
      })
      function delete_check(url) {
         var answer = confirm("게시글를 정말로 삭제할까요?");
         if (answer == true) {
            location = url;
         }
      }
      if(${notification!=null}){
         alert("재고 부족한 재품이 있습니다.")
      }
      /* var noti = document.getElementById("noti").value;
      if(noti<20){
         alert("재고가 충분하지 않습니다.");
      }else{ null;} */
      
      //   var dis = document.getElementById("dis");
   //   if(dis==100){
   //      alert("100미만으로 입력 해주세요.");
   //      location.href = "getGoodsList.mdo";
   //   }else{
   //      alert("할인 적용!");
   //      location.href = "admin_index.mdo";
      //}
   function stock(index,serial){
   document.updateForm.action="insertStock.mdo?index="+String(index)+"&serial="+String(serial);
   document.updateForm.submit();
}
   $(document).ready(function(){ 
      $('checkbox').click(function(e){
         var id = e.target.getAttribute('name');
         if ( ( name != '') && (name != null))  
         alert(name);
      });
      
      $("tr").each(function(){
         $(this).click(function(){
            if($(this).attr("style")){
               $(this).attr("style","background:white;");
            } else
                $(this).attr("style","background:pink;");
            var text = $(this).find("#serial").text();
            var serial = $(this).find("#hiSerial").val();
            $("#a").attr("href","insertStock.mdo?serial="+serial);
         })
      });
      
   });
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

            <h1 class="mt-4">상품조회/수정</h1>
            

            <div class="card mb-4">
               <div class="card-header"  align="right">
                     <div class="col three">
                        <a href="#" id="a" class ="btn1 btn-dark">입고</a>
                     </div>
                     <div>
                        <button type="button" class="btm_image" id="img_btn" onclick="stockstock.mdo?goods_detail_serial">
                        <img src="${pageContext.request.contextPath }/resources/images/Admin/Re.png" style="width:25px; height:25px; border:0">
                        </button>
                     </div>
                  </div>
               <div class="card-body">
               <form name="updateForm" method="post" action="updateGoods.mdo?goods_detail_serial=${goods.goods_detail_serial}">
                  <table id="datatablesSimple">
                     <thead>
                        <tr>
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
                           <th>수정/삭제</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:forEach var="goodsList" items="${goodsList}" varStatus="index">
                           <tr id="${index.index}">
                              <td>${goodsList.goods_detail_serial}</td>
                              <td>${goodsList.category_main_serial}</td>
                              <td>${goodsList.category_sub_serial}</td>
                              <td id="serial">
                                 <input type="hidden" id="hiSerial" value="${goodsList.category_goods_serial }"/>
                                 ${goodsList.category_goods_serial}
                              </td>
                              <td>${goodsList.goods_detail_stock_quantity}</td>
                              <td><input type="text" name="goods_detail_price" value="${goodsList.goods_detail_price}" size="4"/>원</td>
                              
                              <td><input id="noti" type="text" name="goods_detail_stock_notification" 
                              value="${goodsList.goods_detail_stock_notification}" size="3"/>개</td>
                              
                              <td><select name="goods_detail_promotion_serial" id="promotion">
                                 <option value="1" ${goodsList.goods_detail_promotion_serial == 1 ? "selected='selected'" : '' }>1번프로</option>
                                 <option value="2" ${goodsList.goods_detail_promotion_serial == 2 ? "selected='selected'" : '' }>2번프로</option>
                                 <option value="3" ${goodsList.goods_detail_promotion_serial == 3 ? "selected='selected'" : '' }>3번프로</option>
                                 <option value="4" ${goodsList.goods_detail_promotion_serial == 4 ? "selected='selected'" : '' }>4번프로</option>
                              </select></td>
                              
                              <td><select name="goods_detail_status" id="status">
                                 <option value="0" ${goodsList.goods_detail_status == 0 ? "selected='selected'" : '' }>판매완료</option>
                                 <option value="1" ${goodsList.goods_detail_status == 1 ? "selected='selected'" : '' }>판매중</option>
                                 <option value="2" ${goodsList.goods_detail_status == 2 ? "selected='selected'" : '' }>판매중지</option>
                              </select></td>
                              
                              <td id="dis"><input type="text" name="goods_detail_dicountrate" 
                              value="${goodsList.goods_detail_dicountrate}" size="3"/>%</td>
                              
                              <td><input type="button" value="재고" onclick="location.href='stockList.mdo?category_goods_serial=${goodsList.category_goods_serial}'"></td>
                              <td>
                                 <input type="submit" onclick="javascript:update('${index.index}','${goodsList.goods_detail_serial}')" value="수정"/>
                                 <input type="button" value="삭제" onclick="javascript:delete_check('deleteGoods.mdo?goods_detail_serial=${goodsList.goods_detail_serial}')"/>
                              </td>
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