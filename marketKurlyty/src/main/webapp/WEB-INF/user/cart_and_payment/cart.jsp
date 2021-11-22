<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<style>
#main {
	min-height: 100vh
}
</style>
<!-- <link rel="styleSheet" href="style/ItemListStyle.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/cart_and_payment/cart.css">
</head>
<body class="main-index" oncontextmenu="return false" ondragstart="return false">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
					<div class="tit_page">
						<h2 class="tit">장바구니</h2>
					</div>
					<div id="main">
						<div id="content">
							<!-- 상품목록이 없을때 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
							<h3 class="screen_out">장바구니 상품 목록</h3>
							<form action="paymentPage.do" method="get">
								<div id="cartItemList" class="only_pc" style="min-height: 557px;">
									<input type="hidden" id="totalPrice" name="totalPrice" value="${totalPrice }"/>
									<input type="hidden" id="dcPrice" name="dcPrice" value="${dcPrice }"/>
									<input type="hidden" id="user_address1" name="user_address1" value="${defaultAddress.user_address1 }"/>
									<input type="hidden" id="user_address2" name="user_address2" value="${defaultAddress.user_address2 }"/>
									<input type="text" id="user_zipcode" name="user_zipcode" value="${defaultAddress.user_zipcode }"/>
									<input type="text" id="user_name" name="user_name" value="${defaultAddress.user_name }"/>
									<input type="text" id="user_name" name="user_phone" value="${defaultAddress.user_phone }"/>
									<input type="text" id="address_serial" name="address_serial" value="${defaultAddress.address_serial }"/>
									<div class="empty">
										<div class="cart_item no_item">
											<div class="cart_select">
												<div class="inner_select">
													<c:if test="${frozenList == null && coldList==null && roomList==null }">
														<label class="check"><input type="checkbox" name="checkAll" disabled="" checked="">
															<span class="ico"></span>전체선택 (0/0)
														</label>
													</c:if>
													<c:if test="${frozenList != null || coldList!=null || roomList!=null }">
														<label class="check"><input type="checkbox" name="checkAll" checked="checked">
															<span class="ico"></span><span class="checkCount">전체선택 (${listSize }/${listSize })</span>
														</label>
													</c:if>
													<a href="#none" class="btn_delete" onclick="javascript:selectDelete()">선택삭제</a>
												</div>
											</div>
											<div class="inner_empty">
												<c:if test="${frozenList == null && coldList==null && roomList==null }">
														<span class="bg"></span>
														<p class="txt">장바구니에 담긴 상품이 없습니다</p>
														<div class="btn_submit">
															<button type="button" class="btn disabled">상품을담아주세요</button>
														</div>
												</c:if>
											</div>
											<c:if test="${coldList != null}">
												<div class="box cold">
													<div class="tit_box">
														<h4 class="tit">
															<span class="inner_tit"><span class="ico"></span>냉장
																상품</span>
														</h4>
														<button type="button" class="btn_dropup">접기 / 펼치기</button>
													</div>
													<ul class="list ">
														<c:forEach var="item" items="${coldList }" varStatus="count">
															<li id="${item.category_goods_serial}">
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.goods_last_price*item.goods_cart_count }" var="lastPrice"/>
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.goods_detail_price }" var="usuallyPrice"/>
																
																<input type="hidden" id="price" value="${item.goods_last_price }"/>
																<input type="hidden" id="oldPrice" value="${item.goods_detail_price }"/>
																
																<div class="item">
																	<label class="check"><input
																		type="checkbox"
																		name="chkItem"
																		checked=""
																		value="${item.category_goods_serial}"><span class="ico"></span></label>
																	<div class="name">
																		<div class="inner_name">
																			<a href="#" class="package ">${item.category_goods_name }</a>
																			<div class="info"></div>
																		</div>
																	</div>
																	<div class="goods">
																		<a href="#" class="thumb "
																			style="background-image:url(${item.category_goods_image_thumb}) ">상품이미지</a>
																		<div class="price">
																			<div class="in_price">
																				<span class="selling">${lastPrice}<span class="won">원</span></span>
																				<span class="cost">${usuallyPrice}<span class="won">원</span></span>
																				<p class="noti"></p>
																			</div>
																			<div class="stamper count">
																				<input type="hidden" id="goodsSerial" value="${item.category_goods_serial }">
																				<button type="button" class="btn minus">감소</button>
																				<input type="number" id="cartCount" class="num"
																					readonly="readonly" value="${item.goods_cart_count }">
																				<button type="button" class="btn plus">추가</button>
																			</div>
																		</div>
																	</div>
																	<input type="hidden" id="deleteSerial" value="${item.category_goods_serial}">
																	<button type="button" class="btn_delete">상품 삭제</button>
																</div>
															</li>
														</c:forEach>
													</ul>
												</div>
											</c:if>
											
											<c:if test="${frozenList != null}">
												<div class="box frozen">
													<div class="tit_box">
														<h4 class="tit">
															<span class="inner_tit"><span class="ico"></span>냉동
																상품</span>
														</h4>
														<button type="button" class="btn_dropup">접기 / 펼치기</button>
													</div>
													<ul class="list ">
														<c:forEach var="item" items="${frozenList }" varStatus="count">
															<li id="${item.category_goods_serial}">
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.goods_last_price*item.goods_cart_count }" var="lastPrice"/>
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.goods_detail_price }" var="usuallyPrice"/>
																<input type="hidden" id="price" value="${item.goods_last_price }"/>
																<input type="hidden" id="oldPrice" value="${item.goods_detail_price }"/>
																<div class="item">
																	<label class="check"><input
																		type="checkbox"
																		name="chkItem"
																		checked=""
																		value="${item.category_goods_serial}"><span class="ico"></span></label>
																	<div class="name">
																		<div class="inner_name">
																			<a href="#" class="package ">${item.category_goods_name }</a>
																			<div class="info"></div>
																		</div>
																	</div>
																	<div class="goods">
																		<a href="#" class="thumb "
																			style="background-image:url(${item.category_goods_image_thumb}) ">상품이미지</a>
																		<div class="price">
																			<div class="in_price">
																				<span class="selling">${lastPrice }<span class="won">원</span></span>
																				<span class="cost">${usuallyPrice}<span class="won">원</span></span>
																				<p class="noti"></p>
																			</div>
																			<div class="stamper count">
																				<input type="hidden" id="goodsSerial" value="${item.category_goods_serial }">
																				<button type="button" class="btn minus">감소</button>
																				<input type="number" id="cartCount" class="num"
																					readonly="" value="${item.goods_cart_count }">
																				<button type="button" class="btn plus">추가</button>
																			</div>
																		</div>
																	</div>
																	<input type="hidden" id="deleteSerial" value="${item.category_goods_serial}">
																	<button type="button" class="btn_delete">상품 삭제</button>
																</div>
															</li>
														</c:forEach>
													</ul>
												</div>
											</c:if>
											
											<c:if test="${roomList != null}">
												<div class="box room">
													<div class="tit_box">
														<h4 class="tit">
															<span class="inner_tit"><span class="ico"></span>실온
																상품</span>
														</h4>
														<button type="button" class="btn_dropup">접기 / 펼치기</button>
													</div>
													<ul class="list ">
														<c:forEach var="item" items="${roomList }" varStatus="count">
															<li id="${item.category_goods_serial}">
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.goods_last_price*item.goods_cart_count }" var="lastPrice"/>
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.goods_detail_price }" var="usuallyPrice"/>
																<input type="hidden" id="price" value="${item.goods_last_price }"/>
																<input type="hidden" id="oldPrice" value="${item.goods_detail_price }"/>
																<div class="item">
																	<label class="check"><input
																		type="checkbox"
																		name="chkItem"
																		checked=""
																		value="${item.category_goods_serial}"><span class="ico"></span></label>
																	<div class="name">
																		<div class="inner_name">
																			<a href="#" class="package ">${item.category_goods_name }</a>
																			<div class="info"></div>
																		</div>
																	</div>
																	<div class="goods">
																		<a href="#" class="thumb "
																			style="background-image:url(${item.category_goods_image_thumb}) ">상품이미지</a>
																		<div class="price">
																			<div class="in_price">
																				<span class="selling">${lastPrice }<span class="won">원</span></span>
																				<span class="cost">${usuallyPrice}<span class="won">원</span></span>
																				<p class="noti"></p>
																			</div>
																			<div class="stamper count">
																				<input type="hidden" id="goodsSerial" value="${item.category_goods_serial }">
																				<button type="button" class="btn minus">감소</button>
																				<input type="number" id="cartCount" class="num"
																					readonly value="${item.goods_cart_count }">
																				<button type="button" class="btn plus">추가</button>
																			</div>
																		</div>
																	</div>
																	<input type="hidden" id="deleteSerial" value="${item.category_goods_serial}">
																	<button type="button" class="btn_delete" id="deleteCartItem">상품 삭제</button>
																</div>
															</li>
														</c:forEach>
													</ul>
												</div>
											</c:if>
											
											<div class="cart_select">
												<div class="inner_select">
													<c:if test="${frozenList == null && coldList==null && roomList==null }">
														<label class="check"><input type="checkbox" name="checkAll" disabled="" checked="">
															<span class="ico"></span>전체선택 (0/0)
														</label>
													</c:if>
													<c:if test="${frozenList != null || coldList!=null || roomList!=null }">
														<label class="check"><input type="checkbox" name="checkAll" checked="checked">
															<span class="ico"></span><span class="checkCount">전체선택 (${listSize }/${listSize })</span>
														</label>
													</c:if>
													<a href="#none" class="btn_delete">선택삭제</a>
												</div>
											</div>
										</div>
										<div class="cart_result">
											<div class="inner_result" style="top: 60px;">
												<!-- 배송지 -->
												<div class="cart_delivery">
													<h3 class="tit">배송지</h3>
													<c:if test="${defaultAddress == null }">
														<div class="no_address">
															<span class="emph">배송지를 입력</span>하고<br>배송유형을 확인해 보세요!
															<a href="#" class="btn default"><span class="ico"></span>주소 검색</a>
														</div>
													</c:if>
													<c:if test="${defaultAddress != null }">
														<div class="address">
															<p class="addr">${defaultAddress.user_address1 }<br> ${defaultAddress.user_address2 }</p>
															<span class="delivery star">샛별배송</span>
															<a href="#" class="btn default" onclick="javascript:shippingAddressPage()">배송지 변경</a>
														</div>
														
													</c:if>
												</div>
												<div class="amount_view">
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" var="total"/>
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${dcPrice-totalPrice }" var="discount"/>
													<c:if test="${frozenList!=null || coldList!=null || roomList!=null }">
														<c:if test="${dcPrice < 40000}">
															<fmt:formatNumber type="number" maxFractionDigits="3" value="3000" var="shippingFee"/>
															<fmt:formatNumber type="number" maxFractionDigits="3" value="${dcPrice+3000}" var="applicable"/>
														</c:if>
														<c:if test="${dcPrice >= 40000}">
															<fmt:formatNumber type="number" maxFractionDigits="3" value="0" var="shippingFee"/>
															<fmt:formatNumber type="number" maxFractionDigits="3" value="${dcPrice}" var="applicable"/>
														</c:if>
													</c:if>
													<c:if test="${frozenList==null && coldList==null && roomList==null }">
															<fmt:formatNumber type="number" maxFractionDigits="3" value="0" var="shippingFee"/>
															<fmt:formatNumber type="number" maxFractionDigits="3" value="${dcPrice}" var="applicable"/>
													</c:if>
													
													
													<dl class="amount">
														<dt class="tit">상품금액</dt>
														<dd class="price">
															<span id="total" class="num">${total}</span><span class="won">원</span>
														</dd>
													</dl>
													<dl class="amount">
														<dt class="tit">상품할인금액</dt>
														<dd class="price">
															<span id="discount" class="num">${discount}</span><span class="won">원</span>
														</dd>
													</dl>
													<dl class="amount">
														<dt class="tit">배송비</dt>
														<dd class="price">
															<span id="shippingFee" class="num">+${shippingFee}</span><span class="won">원</span>
														</dd>
													</dl>
													<dl class="amount lst">
														<dt class="tit">결제예정금액</dt>
														<dd class="price">
															<span id="applicable" class="num">${applicable}</span><span class="won">원</span>
														</dd>
													</dl>
													<div class="reserve"></div>
												</div>
												<div class="btn_submit">
													<c:if test="${listSize>0}">
														<button type="submit" class="btn active">주문하기</button><!-- active -->
													</c:if>
													<c:if test="${listSize == null || listSize <= 0}">
														<button type="button" class="btn disabled">상품을 담아주세요</button>
													</c:if>
												</div>
												<div class="notice">
													<span class="txt"><span class="ico">·</span>
														‘입금확인’ 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</span>
													<span class="txt">
													
													<span class="ico">·</span>‘입금확인’ 이후 상태에는 고객센터로 문의해주세요.</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>

							<form id="viewCart" name="frmCart" method="post" action="/shop/order/order.php">
								<input type="hidden" name="mode" value="setOrder">
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
		
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

		<a href="#top" id="pageTop">맨 위로가기</a>


		<!-- <iframe name="ifrmHidden" id="ifrmHidden" src="about:blank" style="display: none; width: 100%; height: 600px;"></iframe> -->
<script>
$(document).ready(function(){
	$("button.minus").click(function(){
		var count=parseInt($(this).siblings("#cartCount").val());
		var serial=parseInt($(this).siblings("#goodsSerial").val());
		var part=$(this);
		
		var price=parseInt(part.closest("li").find("input#price").val());
		var oldPrice=parseInt(part.closest("li").find("input#oldPrice").val());
		
		var rootLi=$(this).closest("li");
		var totalPrice = parseInt($("div#cartItemList").find("input[name='totalPrice']").val());
		var dcPrice=parseInt($("div#cartItemList").find("input[name='dcPrice']").val());
		if(count>1){
			$.ajax({
				url:"cartUpdateCount.do",
				type:"post",
				data:{"category_goods_serial":serial,"goods_cart_count":count-1},
				datatype:"text",
				success:function(res){
					part.siblings("#cartCount").val(parseInt(res));
					
						rootLi.find("div.price").find("span.selling").text((price*parseInt(res)).toLocaleString("ko-KR")+"원");
						rootLi.find("div.price").find("span.cost").text((oldPrice*parseInt(res)).toLocaleString("ko-KR")+"원");
					if(rootLi.find("input[name='chkItem']").is(":checked")){
						cartResult(totalPrice-oldPrice, dcPrice-price )
					}
				},
				error:function(res){
					alert("예상치 못한 오류 발생");
				}
			});
		}
	});
	$("button.plus").click(function(){
		var count=parseInt($(this).siblings("#cartCount").val());
		var serial=parseInt($(this).siblings("#goodsSerial").val());
		var part=$(this);
		
		var price=parseInt(part.closest("li").find("input#price").val());
		var oldPrice=parseInt(part.closest("li").find("input#oldPrice").val());
		
		var rootLi=$(this).closest("li");
		var totalPrice = parseInt($("div#cartItemList").find("input[name='totalPrice']").val());
		var dcPrice=parseInt($("div#cartItemList").find("input[name='dcPrice']").val());
		$.ajax({
				url : "cartUpdateCount.do",
				type : "post",
				data : {
					"category_goods_serial" : serial,
					"goods_cart_count" : count + 1
				},
				datatype : "text",
				success : function(res) {
					part.siblings("#cartCount").val(parseInt(res));
					
						rootLi.find("div.price").find("span.selling").text((price*parseInt(res)).toLocaleString("ko-KR")+"원");
						rootLi.find("div.price").find("span.cost").text((oldPrice*parseInt(res)).toLocaleString("ko-KR")+"원");
					if(rootLi.find("input[name='chkItem']").is(":checked")){
						cartResult(totalPrice+oldPrice, dcPrice+price)
					}
				},
				error : function(res) {
					alert("예상치 못한 오류 발생");
				}
			});

		});
	$("button.btn_delete").click(function(){
		if(confirm("상품을 장바구니에서 삭제하시겠습니까?")==true){
			var serial = parseInt($(this).siblings("#deleteSerial").val());
			var part=$(this);
			var list=$(this).closest("ul");
			var isCheck = $(this).closest("li").find("input[name='chkItem']").is(":checked");
			
			//제품 수량
			var goodsCount=parseInt($(this).siblings("div.goods").find("input#cartCount").val());
			
			//제품 개인의 가격 old:할인전 가격
			var price=parseInt(part.closest("li").find("input#price").val());
			var oldPrice=parseInt(part.closest("li").find("input#oldPrice").val());
			
			//장바구니 제품 올 가격
			var totalPrice = parseInt($("div#cartItemList").find("input[name='totalPrice']").val());
			var dcPrice=parseInt($("div#cartItemList").find("input[name='dcPrice']").val());
			$.ajax({
				url:"cartDelete.do",
				type:"post",
				data:{"category_goods_serial" : serial},
				datatype:"text",
				success:function(res){
					part.closest("li").remove();
					var totalp=totalPrice-(oldPrice*goodsCount);
					var dcp=dcPrice-(price*goodsCount);
					var itemCount = $("#cartItemList ul.list").find("li");
					var checkList = $("label.check").find("input[name='chkItem']:checked");
					if(isCheck){
						
						$("div#cartItemList").find("input[name='totalPrice']").val(totalPrice-(oldPrice*goodsCount));
						$("div#cartItemList").find("input[name='dcPrice']").val(dcPrice-(price*goodsCount));
						
						$("div.cart_result").find("span#total").text((totalPrice-(oldPrice*goodsCount)).toLocaleString("ko-KR"));
						$("div.cart_result").find("span#discount").text((dcp-totalp).toLocaleString("ko-KR"));
						if((dcPrice-price)>40000){
							$("div.cart_result").find("span#applicable").text((dcPrice-(price*goodsCount)).toLocaleString("ko-KR"));
							$("div.cart_result").find("span#shippingFee").text("0");						
						}else{
							$("div.cart_result").find("span#applicable").text((dcPrice-(price*goodsCount)+3000).toLocaleString("ko-KR"));
							$("div.cart_result").find("span#shippingFee").text("+3,000");
						}
						if(checkList.length==0){
							$("div.cart_result").find("span#applicable").text((dcPrice-(price*goodsCount)).toLocaleString("ko-KR"));
							$("div.cart_result").find("span#shippingFee").text("0");
						}
					}
					$("label.check").find("span.checkCount").text("전체선택 ("+checkList.length +"/"+itemCount.length+")");
					if(checkList.length==itemCount.length){
						if(itemCount.length>0){
							$("label.check").find("input[name='checkAll']").prop("checked",true);
						}
					}
					if(list.children().length==0){
						list.closest("div.box").remove();
					}
					if($("#cartItemList").find("ul").length==0){
						$(".inner_empty").html("<div class='inner_empty'><span class='bg'></span><p class='txt'>장바구니에 담긴 상품이 없습니다</p><div class='btn_submit'><button type='button' class='btn disabled'>상품을담아주세요</button></div></div>");
					}
					
				},
				error:function(res){
					alert("예상치 못한 오류 발생");
				}
			});
		}
	})
})
$("button.btn_dropup").click(function(){
		var partDiv = $(this).closest("div");
		if($(this).attr("class")=="btn_dropup"){
			partDiv.nextAll("ul").css("display","none");
			$(this).addClass("off");
		}
		else{
			partDiv.nextAll("ul").css("display","block");
			$(this).removeClass("off");
		}
});

$("label.check").find("input[name='checkAll']").click(function(){
	var itemPrice=document.querySelectorAll("input#price");
	var itemOldPrice=document.querySelectorAll("input#oldPrice");
	var itemCount=document.querySelectorAll("input#cartCount");
	var totalPrice=0;
	var dcPrice=0;
	var listCount = $("#cartItemList ul.list").find("li");
	var status=$(this).is(":checked");
	$.ajax({
		url:"changeStatus.do",
		data:{
			"goods_cart_status":status,
			"multiple":true},
		type:"POST",
		datatype:"text",
		success:function(res){
			
		},
		error:function(res){
			alert(res.message);
		}
	});
	if($(this).is(":checked")==false){
		$("label.check").find("input[name='checkAll']").prop("checked",false);
		$("label.check").find("input[name='chkItem']").prop("checked",false);
		$("div#cartItemList").find("input[name='totalPrice']").val(0);
		$("div#cartItemList").find("input[name='dcPrice']").val(0);
		$("div.cart_result").find("span#total").text(0);
		$("div.cart_result").find("span#discount").text(0);
		$("div.cart_result").find("span#applicable").text(0);
		$("div.cart_result").find("span#shippingFee").text("0");
		$("label.check").find("span.checkCount").text("전체선택 (0/"+itemCount.length+")");
	}else{
		$("label.check").find("input[name='checkAll']").prop("checked",true);
		$("label.check").find("input[name='chkItem']").prop("checked",true);
		for(var i=0;i<itemPrice.length;i++){
			var intPrice = parseInt(itemPrice[i].value);
			var intCount = parseInt(itemCount[i].value);
			var intOldPrice = parseInt(itemOldPrice[i].value);
			totalPrice=totalPrice+(intOldPrice*intCount);
			dcPrice=dcPrice+(intPrice*intCount);
		}
		cartResult(totalPrice, dcPrice);
		$("label.check").find("span.checkCount").text("전체선택 ("+listCount.length+"/"+listCount.length+")");
	}
})

$("label.check").find("input[name='chkItem']").click(function(){
	var rootLi=$(this).closest("li");
	var serial=$(this).val();
	var status=$(this).is(":checked");
	var totalPrice = parseInt($("div#cartItemList").find("input[name='totalPrice']").val());
	var dcPrice=parseInt($("div#cartItemList").find("input[name='dcPrice']").val());
	
	var intPrice = parseInt(rootLi.find("input#price").val());
	var intOldPrice = parseInt(rootLi.find("input#oldPrice").val());
	var intCount = parseInt(rootLi.find("input#cartCount").val());
	if($(this).is(":checked")==false){
		totalPrice=totalPrice-(intOldPrice*intCount);
		dcPrice=dcPrice-(intPrice*intCount);
		cartResult(totalPrice, dcPrice);
	}else{
		totalPrice=totalPrice+(intOldPrice*intCount);
		dcPrice=dcPrice+(intPrice*intCount);
		cartResult(totalPrice, dcPrice);
	}
	$.ajax({
		url:"changeStatus.do",
		data:{
			"category_goods_serial":serial,
			"goods_cart_status":status,
			"multiple":false},
		type:"POST",
		datatype:"text",
		success:function(res){
			
		},
		error:function(res){
			alert(res.message);
		}
	});
	
	var checkBoxList = $("label.check").find("input[name='chkItem']");
	var checkCount = $("label.check").find("input[name='chkItem']:checked");
	var itemCount = $("#cartItemList ul.list").find("li");
	if(checkBoxList.length!=checkCount.length){
		$("label.check").find("input[name='checkAll']").prop("checked",false);
	}else if(checkBoxList.length==checkCount.length){
		$("label.check").find("input[name='checkAll']").prop("checked",true);
	}
	if(checkCount.length==0){
		$("div.cart_result").find("span#shippingFee").text("0");
		$("div.cart_result").find("span#applicable").text(0);
	}
	$("label.check").find("span.checkCount").text("전체선택 ("+checkCount.length +"/"+itemCount.length+")");
});

function cartResult(totalPrice, dcPrice){
	$("div#cartItemList").find("input[name='totalPrice']").val(totalPrice);
	$("div#cartItemList").find("input[name='dcPrice']").val(dcPrice);
	$("div.cart_result").find("span#total").text(totalPrice.toLocaleString("ko-KR"));
	$("div.cart_result").find("span#discount").text((dcPrice-totalPrice).toLocaleString("ko-KR"));
	if(dcPrice>40000){
		$("div.cart_result").find("span#applicable").text(dcPrice.toLocaleString("ko-KR"));
		$("div.cart_result").find("span#shippingFee").text("0");
	}else{
		$("div.cart_result").find("span#applicable").text((dcPrice+3000).toLocaleString("ko-KR"));
		$("div.cart_result").find("span#shippingFee").text("+3,000");
	}
}
function selectDelete(){
	var checkList = $("label.check").find("input[name='chkItem']:checked");
	var serialList=new Array();
	checkList.each(function(i,serial){
		serialList.push(serial.value);
	});
	
	jQuery.ajaxSettings.traditional = true
	if(checkList.length>0){
		$.ajax({
			url:"cartDelete.do",
			type:"post",
			data:{"category_goods_serial" : serialList},
			datatype:"text",
			success:function(res){
				checkList.each(function(i,serial){
					var rootLi = serial.parentNode.parentNode.parentNode;
					var listSize;
					
					var goodsCount=parseInt(rootLi.querySelector("input#cartCount").value);
					
					//제품 개인의 가격 old:할인전 가격
					var price=parseInt(rootLi.querySelector("input#price").value);
					var oldPrice=parseInt(rootLi.querySelector("input#oldPrice").value);
					console.log(price);
					console.log(oldPrice);
					
					//장바구니 제품 올 가격
					var totalPrice = parseInt($("div#cartItemList").find("input[name='totalPrice']").val());
					var dcPrice=parseInt($("div#cartItemList").find("input[name='dcPrice']").val());
		
					var rootUl = rootLi.parentNode;
					rootLi.remove();
					var totalp=totalPrice-(oldPrice*goodsCount);
					var dcp=dcPrice-(price*goodsCount);
					cartResult(totalp, dcp);
					$("div.cart_result").find("span#shippingFee").text("0");
					$("div.cart_result").find("span#applicable").text(0);
					var itemCount = $("#cartItemList ul.list").find("li");
					var checkList = $("label.check").find("input[name='chkItem']:checked");
					$("label.check").find("span.checkCount").text("전체선택 ("+checkList.length +"/"+itemCount.length+")");
					if(rootUl.childElementCount==0){
						rootUl.parentNode.remove();
					}
					if($("#cartItemList").find("ul").length==0){
						$(".inner_empty").html("<div class='inner_empty'><span class='bg'></span><p class='txt'>장바구니에 담긴 상품이 없습니다</p><div class='btn_submit'><button type='button' class='btn disabled'>상품을담아주세요</button></div></div>");
						$("label.check").find("input[name='checkAll']").prop("checked",false);
					}
				})
				var itemCount = $("#cartItemList ul.list").find("li");
				var checkCount = $("label.check").find("input[name='chkItem']:checked");
				$("label.check").find("span.checkCount").text("전체선택 ("+checkCount.length +"/"+itemCount.length+")");
			},
			error:function(res){
				alert("예상치 못한 오류 발생"+res.message);
			}
		});
	}
		
}
function shippingAddressPage(){
	var addressSerial = $("input#address_serial").val();
	var url="shippingAddressPage.do?user_id=${userId}&addressSerial="+addressSerial;
	window.open(url,"post","top=40, left=600,toolbar=no, width=482, height=543,"+
			"directories=no, status=yes, scrollbars=yes,menubar=no, resizable=no");
}
</script>
</body>
</html>