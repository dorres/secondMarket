<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->

<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/mykurly/order_detail.css">
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/default/style.css">
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/default/style2.css">
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/default/style3.css">
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/default/style4.css">
</head>
<body class="main-index" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return !disableSelection">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
					<jsp:include page="default/mainTop.jsp"></jsp:include><!-- mypage상단부분 -->

					<div class="page_aticle aticle_type2">
						<!-- Main 시작 -->
						<jsp:include page="default/mainLeft.jsp"></jsp:include>
						<!-- Mainleft -->
						<div class="page_aticle aticle_type2">
							<!-- MainCenter 시작 -->
							<div class="page_section section_review">
								<div class="head_aticle">
									<h2 class="tit">상품 후기</h2>
								</div>
								<div id="reviewView">
									<div class="review_notice">
										<p>
											<b>후기 작성 시 사진후기 100원, 글후기 50원을 적립해드립니다.</b>
										</p>
										- 퍼플, 더퍼플은 <b>2배</b> 적립 (사진 200원, 글 100원)<br>- 주간 베스트 후기로
										선정 시 <b>5,000원</b>을 추가 적립<br>
									</div>
									<ul class="tab_menu">
																			
										<li class="" id="beforeRc"><div id="beforeR"> <a href="#viewBeforeList" >작성가능 후기 (<span id="BBC" >${count }</span>)</a></div></li>
										<li class="on" id="afterRc"><div id="afterR"><a href="#viewAfterList" >작성완료 후기 <span id="AAC">(${rcount })</span></a></div></li>
									</ul>
								</div>

								<div id="viewBeforeList" class="before_view" style="display:block;">
									<c:choose>
										<c:when test="${!empty review }">
											<c:forEach var="review" items="${review }">

												<ul class="list_before">
													<li><strong class="tit_item"><span
															class="emph">주문번호</span> ${review.order_merchant_serial }</strong>
														<div class="item">
															<a href="/shop/goods/goods_view.php?&amp;goodsno=9773"
																class="thumb"><img
																src="${review.category_goods_image_thumb}" alt="상품 이미지"></a>
															<div class="name">
																<div class="inner_name">
																	<a href="" class="sub_name">${review.category_goods_detail_name2 }</a>
																	<a href="/shop/goods/goods_view.php?&amp;goodsno=9773"
																		class="main_name">${review.category_goods_detail_name1 }</a>
																	<span class="num">${review.order_goods_count }개
																		구매</span>
																</div>
															</div>
															<div class="date">
																<div class="inner_date">
																	<div class="in_date">
																		<!---->
																		<span class="start">11월17일 배송완료</span> <span
																			class="end"></span>
																	</div>
																</div>
															</div>
															<a
																href="reviewWrite.do?order_details_serial=${review.order_details_serial }"
																class="btn_write">후기쓰기</a>
														</div></li>
												</ul>
											</c:forEach>
										</c:when>

										<c:otherwise>
											<ul class="list_before">
												<li class="no_data">작성가능 후기 내역이 없습니다.</li>
											</ul>
										</c:otherwise>
									</c:choose>
								</div>




								<div id="viewAfterList" class="after_view" style="display:none;">
								
								
									<ul class="list_after">
									<c:choose>
								<c:when test="${!empty reviewAA }">
									<c:forEach var="reviewAA" items="${reviewAA }">
																		
										<li class="item_view">
											<div class="tit_after">
											<a href="" class="main_name">${reviewAA.category_goods_detail_name1 } (${reviewAA.category_goods_detail_name2 })</a>
											</div>
											<div class="cont_after">
											<a class="desc_after">
											<span class="subject"> ${reviewAA.review_title } 
											<span class="date"><fmt:formatDate value="${reviewAA.review_date }" pattern="yy-MM-dd" /> 작성</span>
											</span>
											<span class="">
											<span class="thumb">
											<span class="photo" style="background-image: url(&quot;${reviewAA.review_image_main}&quot;);" ></span>															
											</span> 
											<span class="txt">${reviewAA.review_content }</span>
											</span>
											<span class="view"><span class="img"></span> 
											<span class="txt"></span>
											</span>
											</a>
											<div class="btn_after">
											<button type="button" class="btn_help">도움이 돼요 0</button>
											<input type="hidden" id="review_serial2" value="${reviewAA.review_serial }">
											<a href="reviewWrite.do?review_serial=${reviewAA.review_serial }&category_goods_serial=${reviewAA.category_goods_serial}" class="btn btn_modify">수정</a> <a id="delB" class="btn btn_del">삭제하기</a>
											</div>
											</div>
											<div class="write_reply" style="display: none;">
												<div class="inner_replay">
													<div class="time">
														답변일 <span class="num"></span>
													</div>
													<div class="reply"></div>
												</div>
											</div>
										</li>
										<!---->
										</c:forEach>										
										</c:when>
										</c:choose>
									</ul>				
									
									
									<ul class="list_after">	
									<c:choose>	
									<c:when test="${empty reviewAA }">	
															
										<li class="no_data">작성한 후기가 없습니다.</li>
										</c:when>
									</c:choose>									
									</ul>
									
								</div>
								<!-- 작성가능 후기 내역과 작성완료 후기를 선택하는거에 따라서 내용이 수정됨 -->

							</div>
						</div>
						<!-- MainCenter 끝 -->
					</div>
					<!-- Main 끝 -->
				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>
	<script>
            $("#delB").click(function(){
                if(confirm('정말로 삭제하시겠습니까? 삭제한 리뷰는 복구가 불가능합니다')){
                	 var review_serial2 = $("#review_serial2").val();
                	 var beCount = parseInt(document.getElementById("BBC").outerText);
                	 console.log(beCount)
                	  $.ajax({                		 
                          type : "post", 
                          url : "reviewDelete.do", 
                          data : {review_serial2 : review_serial2}, 
                          async : false,                           
                          contentType: "application/x-www-form-urlencoded; charset=UTF-8", // 인코딩 설정
                          success : function(data){
                          	if(data == 1){
                          		
                          		location.reload();
                          	}
                          },
                          error:function(request,status,error){
                              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                             }

                      });
                }
            });
            
            $("#beforeR").click(function() {    
            	 var b = document.getElementById("viewAfterList");
            	 var a = document.getElementById("viewBeforeList");
            	 if(a.style.display == 'none'){
            		 a.style.display = 'block';
            		 b.style.display = 'none';
            	 }
            	 document.getElementById("beforeRc").className = "on";
            	 document.getElementById("afterRc").className = "";
            });
           
            $("#afterR").click(function() {
            	var b = document.getElementById("viewAfterList");
           		var a = document.getElementById("viewBeforeList");
           	    if(b.style.display == 'none'){
           			 b.style.display = 'block';
           		 	 a.style.display = 'none';
           	 }
                 document.getElementById("afterRc").className = "on";
                 document.getElementById("beforeRc").className = "";
            });
    </script>

	<a href="#top" id="pageTop">맨 위로가기</a>


	<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank"
		style="display: none; width: 100%; height: 600px;"></iframe>
</body>
</html>