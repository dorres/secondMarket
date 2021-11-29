<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/ItemListStyle.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/style/sortMenu.css">
</head>
<style>
.cartBt {
	background:
		url(https://kurlybuc.s3.ap-northeast-2.amazonaws.com/kurlyImage/ico_cart.svg)
		no-repeat 50% 50%;
	background-size: 50px 50px;
	width: 50px;
	height: 50px;
	margin-top: 15px;
	border: 0;
	position:absolute;
	z-index:2;
	right:15px;
	bottom:15px;
	opacity:0.9;
}
/* .foodImg{
position:relative;
} */
.cartClick{
	position: fixed;
	z-index: 9998;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: #000;
	opacity: .5
}
.global_sticker {
    display: block;
    position:absolute;
    height: 0;
    top:0px;
}
</style>
<script>
$(document).ready(function(){
	console.log($("button.cartBt").position().left);
});
function openCart(serial,name,lastprice,price,discount){
	var totalprice = parseInt(lastprice)
	$("#cartPut .in_option").find("div.option").find("span.count").find(".inp").val(1);
	$(".cartNone").attr("class","cartClick");
	$(".cart_option").css("opacity","1").fadeIn(400);
	$("#cartPut .in_option").find("span.name").text(name);
	$("#cartPut .in_option").find("span.dc_price").text(totalprice.toLocaleString("ko-KR")+"원");
	$("#cartPut .in_option").find("span.sum").find("span.num").text(totalprice.toLocaleString("ko-KR"));
	$("#cartPut .in_option").find("input.hprice").val(price);
	$("#cartPut .in_option").find("input.hdiscount").val(discount);
	$("#cartPut .in_option").find("input.hserial").val(serial);
	
}
function cancelCart(){
	$(".cartClick").attr("class","cartNone");
	$(".cart_option").css("opacity","1").fadeOut(100);
}
function closeCart(){
	$(".cartClick").attr("class","cartNone");
	$(".cart_option").css("opacity","1").fadeOut(100);
}
function quantity(count){
	var currentCount=$("#cartPut .in_option").find("div.option").find("span.count").find(".inp").val();
	var changeCount = parseInt(currentCount)+count;
	var price=$("#cartPut .in_option").find("input.hprice").val();
	var discount=$("#cartPut .in_option").find("input.hdiscount").val();
	if(changeCount<1)changeCount=1;
	var changePrice = parseInt(price*((100-discount)/100))*changeCount;
	$("#cartPut .in_option").find("div.option").find("span.count").find(".inp").val(changeCount);
	$("#cartPut .in_option").find("div.total").find("span.num").text(changePrice.toLocaleString("ko-KR"));
}
function inputCart(){
	var serial=$("#cartPut .in_option").find("input.hserial").val();
	var count=$("#cartPut .in_option").find("div.option").find("span.count").find(".inp").val();
	$.ajax({
		url:"cartInput.do",
		type:"post",
		data:{"category_goods_serial":serial,"goods_cart_count":count},
		datatype:"text",
		success:function(res){
			if(res!="good"){
				alert(res);
			}
			closeCart();
		},
		error:function(res){
			alert("담기에 실패했습니다.");
		}
	});
}
</script>
<body class="main-index" oncontextmenu="return false"
	ondragstart="return false">
	<div class="cartNone"></div>
	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">

			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->

			<div id="main">
				<div id="content">

					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- sidemenu부분 -->

					<div style="margin: 0 auto; width: 1050px;">
						<div id="lnbMenu">
							<div class="inner_lnb">
								<h3 class="tit">${categoryRoot.category_main_name}</h3>
								<ul class="list on">
										<c:if test="${subSerial == null }">
											<li><a class="on" href="categoryItemPage.do?category_main_serial=${categoryRoot.category_main_serial}">전체보기</a></li>
										</c:if>
										<c:if test="${subSerial != null }">
											<li><a class="" href="categoryItemPage.do?category_main_serial=${categoryRoot.category_main_serial}">전체보기</a></li>
										</c:if>
									<c:forEach var="categorySub" items="${categorySub}">
										<c:if test="${subSerial == categorySub.category_sub_serial }">
											<li><a class="on" 
												href="categoryItemPage.do?category_main_serial=${categoryRoot.category_main_serial}&category_sub_serial=${categorySub.category_sub_serial}">
												${categorySub.category_sub_name}
												</a>
											</li>
										</c:if>
										<c:if test="${subSerial != categorySub.category_sub_serial }">
											<li><a class="" 
												href="categoryItemPage.do?category_main_serial=${categoryRoot.category_main_serial}&category_sub_serial=${categorySub.category_sub_serial}">
												${categorySub.category_sub_name}
												</a>
											</li>
										</c:if>
									</c:forEach>
									<li class="bg"></li>
								</ul>
							</div>
						</div>

						<div id="sortbar">
							<div class="list_ability">
								<div class="sort_menu">
									<div class="">
										<p class="count">
											<span class="inner_count"> 총 ${itemCount }건 </span>
										</p>
										<div class="select_type user_sort">
											<!---->
											<a class="name_select">| 신상품순</a>
											<ul class="list">
												<li><a class="">추천순</a></li>
												<li><a class="on">신상품순</a></li>
												<li><a class="">인기상품순</a></li>
												<li><a class="">낮은 가격순</a></li>
												<li><a class="">높은 가격순</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div id="cartPut">
							<div class="cart_option cartList cart_type3" style="opacity: 0; display:none;">
							<!--  -->
								<form name="cartInput" action="cartInput.do">
									<div class="inner_option">
										<input type="button" class="btn_close1" value="레이어닫기"/>
										<!---->
										<div class="in_option">
											<div class="list_goods">
												<ul class="list list_nopackage">
													<li class="on"><span class="btn_position"><button
																type="button" class="btn_del">
																<span class="txt">삭제하기</span>
															</button></span> <span class="name">
															
													</span> <!---->
														<div class="option">
															<input type="hidden" class="hprice"/>
															<input type="hidden" class="hdiscount"/>
															<input type="hidden" class="hserial" name="category_goods_serial" value=""/>
															<span class="count">
																<input type="button"
																	class="btn down on" onclick="javascript:quantity(-1)" value="수량내리기"/>
																<input type="number" value="1" name="goods_cart_count"
																	readonly="readonly" onfocus="this.blur()" class="inp">
																<input type="button" class="btn up on" onclick="javascript:quantity(1)"
																	value="수량올리기"/>
															</span> 
															<span class="price">
																<!----> <span class="dc_price"></span>
															</span>
														</div></li>
												</ul>
											</div>
											<div class="total">
												<div class="price">
													<strong class="tit">합계</strong>
													<!---->
													<span class="sum"><span class="num"></span> <span
														class="won">원</span></span>
												</div>
												<p class="txt_point">
													<span class="ico">적립</span> <span class="no_login">
														<span>로그인 후, 적립혜택 제공</span>
													</span>
												</p>
											</div>
										</div>
										<div class="group_btn off layer_btn2">
											<span class="btn_type2">
												<button type="button"
													class="txt_type" onclick="javascript:cancelCart()">취소</button>
											</span>
											<span class="btn_type1">
												<input
													type="button" class="txt_type" value="장바구니 담기"
													onclick="javascript:inputCart()"/> <!---->
											</span>
										</div>
									</div>
								</form>
								<!--  -->
							</div>
						</div>

						<div class="MainIntroContain">
							<ul class="foodList">
								<c:forEach var="item" items="${categoryProductList }">
									<li>
										<input type="hidden" class="goodsSerial" value="${item.category_goods_serial}"/>
										<div class="foodImg">
											<a href="itemPage.do?category_goods_serial=${item.category_goods_serial }"><img
												src="${item.category_goods_image_thumb}">
											</a>
											<c:if test="${item.goods_detail_promotion_serial>0 }">
											<span class="global_sticker">
												<span class="inner_sticker">
													<span class="bg_sticker" style="background-color: rgb(189, 118, 255); opacity: 0.9;"></span>
													<span class="txt_sticker">
														<span>
															<span class="emph_sticker">&nbsp;&nbsp;&nbsp;FLEX 10% 추가할인&nbsp;&nbsp;&nbsp;</span>
														</span>
													</span>
												</span>
											</span>
											</c:if>
											<button type="button" class="cartBt"
												onclick="javascript:openCart(${item.category_goods_serial},'${item.category_goods_name }','${item.goods_last_price}',${item.goods_detail_price },${item.goods_detail_dicountrate })"></button>
										</div>
										<a class="info" href="itemPage.do?category_goods_serial=${item.category_goods_serial }"> <span class="name">${item.category_goods_name }</span>
											<span class="cost"> <span class="dc">${item.goods_detail_dicountrate }%</span> <span
												class="price">&nbsp;
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.goods_last_price }" var="lastPrice"/>												
												${lastPrice}원</span> 
												<span class="origin">${item.goods_detail_price }</span>
												<span class="desc">${item.category_goods_name_subtext }</span>
										</span>
									</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

	<a href="#top" id="pageTop">맨 위로가기</a>

	<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank"
		style="display: none; width: 100%; height: 600px;"></iframe>
</html>