<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="${pageContext.request.contextPath}/resources/style/ItemListStyle.css">
</head>
<style>
.cartBt {
	background:
		url(https://kurlybuc.s3.ap-northeast-2.amazonaws.com/kurlyImage/ico_cart.svg)
		no-repeat 50% 50%;
	background-size: 46px 46px;
	width: 46px;
	height: 46px;
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
div.search_box{
overflow: hidden;
    margin-bottom: 20px;
    padding-bottom: 26px;
    border-top: 2px solid #5f0080;
    border-bottom: 1px solid #5f0080;
 }
 div.search_box .tit{
 float: left;
 padding: 39px 0 0 26px;
 font-weight: 700;
    font-size: 14px;
    color: #333;
    line-height: 18px;
    letter-spacing: -1px;
}
div.search_box .desc{
float: right;
    width: 841px;
    padding: 26px 0 0;
}
.search_box .inp {
    float: left;
    width: 607px;
    height: 45px;
    margin-right: 16px;
    padding-left: 20px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 14px;
    color: #333;
    letter-spacing: -1px;
}
.search_box .btn_search {
    float: left;
    width: 175px;
    height: 45px;
    border-radius: 3px;
    background-color: #5f0080;
    color: #fff;
    line-height: 45px;
}
</style>
<script>
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
			}else{
				alert("장바구니에 담았습니다.");
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
	<a href="#top" id="gotoTop">맨 위로 가기</a>
	<div class="cartNone"></div>
	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
		
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div class="tit_page">
				<h2 class="tit">레시피</h2>
			</div>
			<div id="main">
				<div id="content">
				
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- sidemenu부분 -->
					<div class="layout-wrapper">
						<table width="100%" align="center">
							<tbody>
								<tr>
									<td>
										<table width="100%">
											<tbody>
												<tr>
													<td>
														<table class="boardView" width="100%">
															<tbody>
																<tr>
																	<th scope="row" style="border: none;">제목</th>
																	<td>${recipeBook.recipe_title}</td>
																</tr>
																<tr>
																	<th scope="row">작성자</th>
																	<td>MarketKurly</td>
																</tr>
																<tr class="etcArea">
																	<td colspan="2">
																		<ul>
																			<li class="date"><strong class="th">작성일</strong>
																				<span class="td">
																					<fmt:formatDate value="${recipeBook.recipe_date}"
																						pattern="yyyy-MM-dd" />
																				</span>
																			</li>
																			<li class="hit"><strong class="th">조회수</strong>
																				<span class="td">${recipeBook.recipe_hit }</span></li>
																		</ul>
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
												<tr>
													<td height="200" valign="top" id="contents"
														class="view_recipe">
														<table width="100%" style="table-layout: fixed"
															class="goods_wrap">
															<tbody>
																<tr>
																	<td valign="top">
																		<div class="goods_recipe">
																			<div class="context">
																				<div class="pic">
																					<img
																						src="${recipeBook.recipe_content }">
																				</div>
																				
																			</div>
																		</div>
																	</td>
																</tr>
															</tbody>
														</table>
													</td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
								<tr>
									<td id="recipe_view" align="center"><script
											src="/shop/data/skin/designgj/autoslider.js"></script>
										<div class="goods-add-product">
											<h3 class="goods-add-product-title">RECIPE ITEMS</h3>
											<div class="goods-add-product-wrapper __slide-wrapper"
												data-slide-item="5">
												<div class="goods-add-product-list-wrapper"
													style="height: 310px">
													<ul class="goods-add-product-list __slide-mover">
														<c:forEach var="ingredItem" items="${ingredList }">
															<li class="goods-add-product-item __slide-item">
																<div class="goods-add-product-item-figure">
																	<a href="itemPage.do?category_goods_serial=${ingredItem.category_goods_serial}">
																		<img src="${ingredItem.category_goods_image_thumb }"
																		alt="" class="goods-add-product-item-image">
																	</a>
																	<button type="button" class="cartBt"
																	onclick="javascript:openCart(${ingredItem.category_goods_serial},'${ingredItem.category_goods_name }','${ingredItem.goods_last_price}',${ingredItem.goods_detail_price },${ingredItem.goods_detail_dicountrate })">
																	</button>
																</div>
																<div class="goods-add-product-item-content">
																	<div class="goods-add-product-item-content-wrapper">
																		<a href="#">
																			<p class="goods-add-product-item-name">${ingredItem.category_goods_name }</p>
																			<p class="goods-add-product-item-price" style="left: 35%;">${ingredItem.goods_last_price }원</p>
																		</a>
																	</div>
																</div>
															</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div style="margin:0 auto; width: 1050px;">
											<input type="hidden" name="searched" value="Y">
											<div class="search_box">
												<div class="tit">
													<label for="sword">검색조건</label>
												</div>
												<div class="desc">
													<input type="text" name="searchKeyword" id="recipeSword" class="inp"
																value="">
													<input type="button"
															class="styled-button btn_search" value="검색하기" onclick="javascript:recipeSearch();">
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td id="recipe_view" align="center"><script
											src="/shop/data/skin/designgj/autoslider.js"></script>
										<div class="goods-add-product">
											<h3 class="goods-add-product-title">RECIPE SEARCH</h3>
											<div class="goods-add-product-wrapper __slide-wrapper"
												data-slide-item="5">
												<div class="goods-add-product-list-wrapper"
													style="height: 310px">
													<ul class="goods-add-product-list __slide-mover" id="searchs">
														
													</ul>
												</div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						<table width="100%"
							style="table-layout: fixed; border-top: 1px solid #795c90; height: 80px;">
							<tbody>
								<tr>
									<td align="center" style="padding-top: 10px;">
										<table width="100%">
											<tbody>
												<tr>
													<td></td>
													<td align="right"><a href="recipeItemPage.do"><span
															class="bhs_button yb" style="float: none;">목록</span></a></td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
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
				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

	<a href="#top" id="pageTop">맨 위로가기</a>
<script>
function recipeSearch(){
	var search=$("input#recipeSword").val();
	console.log(search);
	$.ajax({
		url:"recipeSearchItemPage.do",
		data:{"search":search},
		dataType:"JSON",
		type:"post",
		success:function(res){
			var index=0;
			$("ul#searchs").html("");
			
			for(key in res){
				var opencart="javascript:openCart("+String(res[key].category_goods_serial)+",'"+String(res[key].category_goods_name)+"',"+String(res[key].goods_last_price)+","+String(res[key].goods_detail_price)+","+String(res[key].goods_detail_dicountrate)+")";
				$("ul#searchs").append("<li class='goods-add-product-item __slide-item'>");
				$("ul#searchs").find("li").eq(index).append("<div class='goods-add-product-item-figure'>"
				+"<a href='itemPage.do?category_goods_serial="+String(res[key].category_goods_serial)+"'>"
				+"<img src='"+String(res[key].category_goods_image_thumb)+"'"+"class='goods-add-product-item-image'></a>"
				+"<button type='button' class='cartBt' id='recipeSearchBt'> </button>"
				+"</div><div class='goods-add-product-item-content'><div class='goods-add-product-item-content-wrapper'><a href='#'>"
				+"<p class='goods-add-product-item-name'>"+String(res[key].category_goods_name)+"</p>"
				+"<p class='goods-add-product-item-price' style='left: 35%;'>"+String(res[key].goods_last_price)+"원</p>"
				+"</a></div></div></li>");
				$("button#recipeSearchBt").eq(index).attr("onclick",opencart);
				index=index+1;
			}
		},
		error:function(error,errors){
			console.log(error);
			console.log(errors);
		}
	})
}
</script>

	<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank"
		style="display: none; width: 100%; height: 600px;"></iframe>
</html>