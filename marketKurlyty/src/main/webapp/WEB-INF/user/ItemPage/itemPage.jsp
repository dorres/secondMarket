<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet"
	href="${pageContext.request.contextPath}/resources/style/ItemListStyle.css">

<link rel="styleSheet"
	href="${pageContext.request.contextPath}/resources/style/itemPage.css">

</head>
<style>
 li.inquiry-item {
 	display: table;
    width: 100%;
    table-layout: fixed;
    padding: 16px 0;
    font-family: Noto Sans;
    font-size: 14px;
    line-height: 20px;
    text-align: center;
    border-bottom: 1px solid #f4f4f4;
}
li.inquiry-item div{
    display: table-cell;
    vertical-align: middle;
 }
 .icon-secret {
    display: inline-block;
    position: relative;
    width: 12px;
    height: 14px;
    background: url(https://res.kurly.com/kurly/ico/2021/secret_12_14_black.svg) 0 0 no-repeat;
    margin: 2px 0 0 6px;
    vertical-align: top;
    float:left;
}
.expand-question{
    position: relative;
    padding: 20px 26px 30px 36px;
}
div.expand-question span.icon-question{
    background: url(https://res.kurly.com/kurly/ico/2021/question_24_24_purple.svg) 0 0 no-repeat;
    display: inline-block;
    position: absolute;
    top: 20px;
    left: 0;
    width: 24px;
    height: 24px;
}
div.expand-question span.icon-question span{
    overflow: hidden;
    position: absolute;
    width: 1px;
    height: 1px;
    clip: rect(0, 0, 0, 0);
}

.expand-answer{
    position: relative;
    padding: 20px 26px 30px 36px;
}
div.expand-answer span.icon-answer{
    background: url(https://res.kurly.com/kurly/ico/2021/answer_24_24_purple.svg) 0 0 no-repeat;
    display: inline-block;
    position: absolute;
    top: 20px;
    left: 0;
    width: 24px;
    height: 24px;
}
div.expand-answer span.icon-answer span{
    overflow: hidden;
    position: absolute;
    width: 1px;
    height: 1px;
    clip: rect(0, 0, 0, 0);
}   

.created-time{
	display: block;
    padding-top: 20px;
    font-size: 14px;
    line-height: 22px;
    color: #999;
}

.itemNavFixed{
	position: fixed;
    z-index: 300;
    width: 100%;
    display:flex;
}
</style>
<script>

function quantity(count){
	var currentCount=$("span.count").find("input.inp").val();
	var changeCount = parseInt(currentCount)+count;
	var price=$("input#oldPrice").val();
	var discount=${getItemPage.goods_detail_dicountrate}

	var membership=0;
	if(${membership != null})
		membership=parseInt("${membership.user_membership_point_rate}")+0;

	if(changeCount<1)changeCount=1;
	var changePrice = parseInt(price*((100-discount)/100))*changeCount;
	var point = parseInt((changePrice*(membership/100)+5)/10)*10
	$("span.count").find("input.inp").val(changeCount);
	$("span.sum").find("span.num").text(changePrice.toLocaleString("ko-KR"));
	$("p.txt_point").find("strong.emph").text(point.toLocaleString("ko-KR")+"원 적립");
}
function inputCart(){
	var serial=${getItemPage.category_goods_serial};
	var count=$("span.count").find("input.inp").val();
	$.ajax({
		url:"cartInput.do",
		type:"post",
		data:{"category_goods_serial":serial,"goods_cart_count":count},
		datatype:"text",
		success:function(res){
			alert("장바구니에 담았습니다.");
		},
		error:function(res){
			alert("담기에 실패했습니다.");
		}
	});
}

//보이기
function div_show() {
	$("button#insertBt").css("display","block");
	$("button#updateBt").css("display","none");
	$("div.modal-container");
	$("#write_div").fadeIn(300);
 //document.getElementById("write_div").style.display = "block";
}
function div_show_update(serial,title,content,lock) {
	$("button#insertBt").css("display","none");
	$("button#updateBt").css("display","block");
	$("input[name=qna_goods_serial]").val(serial);
	$("input[name=qna_goods_title]").val(title);
	$("textarea[name=qna_goods_content]").val(content.replaceAll("ln","\r\n"));
	$("input[name=qna_goods_lock]").prop('checked',lock);
	$("#write_div").fadeIn(300);
}
//숨기기
function div_hide() {
	$("input[name=qna_goods_title]").val("");
	$("textarea[name=qna_goods_content]").val("");
	$("#write_div").fadeOut(300);
 //document.getElementById("write_div").style.display = "none";
}

$(document).ready(function(){
	var topset = $("#gnb").height();
	var itemPgNavi=$("div.goods-view-tab").offset();
	$(window).scroll(function(){
		console.log("topset:",topset);
		console.log("windowToe",$(document).scrollTop());
		console.log(itemPgNavi.top);
		if($(document).scrollTop()+103>itemPgNavi.top){
			$("div.goods-view-tab").addClass("itemNavFixed");	
			$("div.goods-view-tab").css("top",String(topset-1)+"px");
			$("div#underCartShow").fadeIn(400);
		}
		else{
			$("div.goods-view-tab").removeClass("itemNavFixed");
			$("div.goods-view-tab").css("top","0px");
			$("div#underCartShow").fadeOut(400);
		}
	});
	$("li.goods-view-infomation-tab").click(function(){
		$("li.goods-view-infomation-tab").find("a").removeClass("__active");
		$(this).find("a").addClass("__active");
	})
});
</script>

<body class="main-index" oncontextmenu="return false"
	ondragstart="return false">
	<a href="#top" id="gotoTop">맨 위로 가기</a>
	<input type="hidden" id="oldPrice"
		value="${getItemPage.goods_detail_price}" />
	<input type="hidden" id="dcPrice"
		value="${getItemPage.goods_last_price }" />
	<fmt:formatNumber var="fmOldPrice" maxFractionDigits="3"
		value="${getItemPage.goods_detail_price }" />
	<fmt:formatNumber var="fmDcPrice" maxFractionDigits="3"
		value="${getItemPage.goods_last_price }" />
	<fmt:parseNumber var="oldReserves" type="number" integerOnly="true"
		value="${(getItemPage.goods_detail_price*(membership.user_membership_point_rate/100)+5)/10}" />
	<fmt:formatNumber var="afterReserves" type="number"
		maxFractionDigits="1" value="${oldReserves*10 }" />
	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">

			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->

			<div id="main">
				<div id="content">

					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- sidemenu부분 -->

					<div id="kurlyMain" class="page_aticle page_main"
						style="width: 100%;">

						<div class="section_view">

							<div id="sectionView">
								<div class="inner_view">
									<div class="thumb">
										<img src="${getItemPage.category_goods_image_thumb}"
											alt="상품 대표 이미지" class="bg" />
									</div>
									<p class="goods_name">
									
										<input type="hidden" name="category_goods_serial"
											value="${getItemPage.category_goods_serial}" />
										<strong	class="name">${getItemPage.category_goods_name}</strong>
										<span class="short_desc">${getItemPage.category_goods_name_subtext}</span>
									</p>
									<p class="goods_dcinfo">회원할인가</p>
									<p class="goods_price">
										<span class="position"> <span class="dc">
												<!-- 할인된 가격 --> <span class="dc_price"> ${fmDcPrice}
											</span> <span class="won">원</span> <span class="dc_percent">${getItemPage.goods_detail_dicountrate}<span
													class="per">%</span>
											</span>
										</span> <a class="original_price"> <span class="price">${fmOldPrice}
													<span class="won">원</span>
											</span>
										</a>
										</span> <span class="not_login"> <!--적립금--> <span>로그인
												후, 적립혜택이 제공됩니다.</span>
										</span>
									</p>
									<!---->
									<div class="goods_info">
										<dl class="list fst">
											<dt class="tit">판매단위</dt>
											<dd class="desc">${getItemPage.category_goods_unit}</dd>
										</dl>
										<dl class="list">
											<dt class="tit">중량/용량</dt>
											<dd class="desc">${getItemPage.category_goods_weight}</dd>
										</dl>
										<dl class="list">
											<dt class="tit">배송구분</dt>
											<dd class="desc">${getItemPage.category_goods_delivery_type}배송</dd>
										</dl>
										<dl class="list">
											<dt class="tit">원산지</dt>
											<dd class="desc">${getItemPage.category_goods_origin}</dd>
										</dl>
										<dl class="list">
											<dt class="tit">포장타입</dt>
											<dd class="desc">
												${getItemPage.category_goods_packaging_type}<strong
													class="emph"> 택배배송은 에코포장시에는 스티로폼으로 대체됩니다. </strong>
											</dd>
										</dl>
										<!-- c:if문 적용되는 항목들 유통기한, 안내사항, 추가정보, 알레르기정보 -->
										<c:if
											test="${getItemPage.category_goods_exp_date != null && getItemPage.category_goods_exp_date != ''}">
											<dl class="list">
												<dt class="tit">유통기한</dt>
												<dd class="desc">${getItemPage.category_goods_exp_date}</dd>
											</dl>
										</c:if>
										<c:if
											test="${getItemPage.category_goods_info != null && getItemPage.category_goods_info != ''}">
											<dl class="list">
												<dt class="tit">안내사항</dt>
												<dd class="desc">
													<c:forEach var="goodsInfo"
														items="${fn:split(getItemPage.category_goods_info,'-') }">
													-${goodsInfo}<br>
													</c:forEach>
												</dd>
											</dl>
										</c:if>
										<c:if
											test="${getItemPage.category_goods_ref != null && getItemPage.category_goods_ref != ''}">
											<dl class="list">
												<dt class="tit">추가정보</dt>
												<dd class="desc">
													<span class="txt">${getItemPage.category_goods_ref}</span>
												</dd>
											</dl>
										</c:if>
										<c:if
											test="${getItemPage.category_goods_allergy != null && getItemPage.category_goods_allergy != ''}">
											<dl class="list">
												<dt class="tit">알레르기정보</dt>
												<dd class="desc">${getItemPage.category_goods_allergy}
												</dd>
											</dl>
										</c:if>
									</div>
									<!--  -->
								</div>
							</div>
							<!--  -->
							<div id="cartPut">
								<div class="cart_option cartList cart_type2">
									<form name="cartInput">

										<div class="inner_option">
											<!---->
											<div class="in_option">
												<div class="list_goods">
													<ul class="list list_nopackage">
														<li class="on"><span class="btn_position">
																<button type="button" class="btn_del">
																	<span class="txt">삭제하기</span>
																</button>
														</span> <span class="name"> <!---->
																${getItemPage.category_goods_name}<!---->
														</span> <span class="tit_item">구매수량</span>


															<div class="option">
																<input type="hidden" class="hprice" /> <input
																	type="hidden" class="hdiscount" /> <input type="hidden"
																	class="hserial" name="category_goods_serial" value="" />
																<span class="count"> <input type="button"
																	class="btn down on" onclick="javascript:quantity(-1)"
																	value="수량내리기" /> <input type="number" value="1"
																	name="goods_cart_count" readonly="readonly"
																	onfocus="this.blur()" class="inp"> <input
																	type="button" class="btn up on"
																	onclick="javascript:quantity(1)" value="수량올리기" />
																</span>
															</div></li>
													</ul>
												</div>
												<div class="total">
													<div class="price">
														<!---->
														<strong class="tit">총 상품금액 :</strong> <span class="sum">
															<span class="num">${fmDcPrice }</span> <span class="won">원</span>
														</span>
													</div>
													<!-- 수량따라 금액 올라가게 처리필  -->
													<p class="txt_point">
														<span class="ico">적립</span>
														<c:if test="${membership != null }">
															<span class="point"> 구매 시 <strong class="emph">${afterReserves }원
																	적립</strong></span>
														</c:if>
														<c:if test="${membership==null }">
															<span class="point"> 로그인 시 적립 가능</span>
														</c:if>

													</p>
												</div>
											</div>
											<div class="group_btn off">
												<div class="view_function">
													<button type="button" class="btn btn_alarm">재입고 알림</button>
												</div>
												<span class="btn_type1"> <input type="button"
													class="txt_type" value="장바구니 담기"
													onclick="javascript:inputCart()" /> <!---->
												</span>
											</div>
											<!---->
										</div>
									</form>
								</div>


								<!-- 이너, 상품 선택 click으로 숨기기 보이기  -->
								<!-- 				<div class="wrap"> -->
								<div id="underCartShow" class="cart_option cartList cart_type1" style="">
									<form name="cartInput" action="cartInput.do">
										<div class="inner_option">
											<div class="in_option">
												<div class="list_goods">
													<!-- ------------------------------------ -->
													<div class="bar_open">
														<a href=#none data-child-id="show0" class="asked"
															onclick="if(hide0.style.display=='none'){hide0.style.display='';} else {hide0.style.display='none';}">
															<button type="button" class="btn_close">
																<span class="ico open">상품 선택</span>
															</button>
														</a>
													</div>
													<div id="hide0" style="display: none">
														<ul class="list list_nopackage">
															<li class="on"><span class="btn_position">
																	<button type="button" class="btn_del">
																		<span class="txt">삭제하기</span>
																	</button>
															</span> <span class="name"> <!---->
																	${getItemPage.category_goods_name} <!---->
															</span> <!---->

																<div class="option">
																	<input type="hidden" class="hprice" /> <input
																		type="hidden" class="hdiscount" /> <input
																		type="hidden" class="hserial"
																		name="category_goods_serial" value="" /> <span
																		class="count"> <input type="button"
																		class="btn down on" onclick="javascript:quantity(-1)"
																		value="수량내리기" /> <input type="number" value="1"
																		name="goods_cart_count" readonly="readonly"
																		onfocus="this.blur()" class="inp"> <input
																		type="button" class="btn up on"
																		onclick="javascript:quantity(1)" value="수량올리기" />
																	</span> <span class="price"> <span class="dc_price">${lastPrice}원</span>
																		<span class="original_price">${getItemPage.goods_detail_price}원</span>
																	</span>
																</div></li>
														</ul>

														<div class="total">
															<div class="price">
																<!---->
																<strong class="tit">총 상품금액 :</strong>
																<!-- 수량따라 금액 올라가게 처리필  -->
																<span class="sum"><span class="num"></span> <span
																	class="won">원</span></span>
															</div>

															<p class="txt_point">
																<span class="ico">적립</span>
																<!---->
																<span class="point"> 구매 시 <strong class="emph">${afterReserves }원
																		적립</strong></span>
															</p>
														</div>

														<div class="group_btn">
															<div class="view_function">
																<button type="button" class="btn btn_alarm">재입고
																	알림</button>
															</div>
															<span class="btn_type1"> <input type="button"
																class="txt_type" value="장바구니 담기"
																onclick="javascript:inputCart()" /> <!---->
															</span>
														</div>

													</div>
													<!-- hide0 -->

												</div>
											</div>
										</div>
									</form>
								</div>
								<form name="frmBuyNow" method="post"
									action="/shop/order/order.php">
									<input type="hidden" name="mode" value="addItem"> <input
										type="hidden" name="goodsno" value="">
								</form>
								<form name="frmWishlist" method="post"></form>
							</div>
							<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
							<!-- 놓치면 후회할 가격 -->

							<div class="layout-wrapper goods-view-area">

								<script src="/resources/js/autoslider.js"></script>
								<div class="goods-add-product">
									<h3 class="goods-add-product-title">RELATED PRODUCT</h3>
									<div class="goods-add-product-wrapper __slide-wrapper"
										data-slide-item="5">
										<button
											class="goods-add-product-move goods-add-product-move-left __slide-go-left">왼쪽으로
											슬라이드 이동</button>
										<button
											class="goods-add-product-move goods-add-product-move-right __slide-go-right">오른쪽으로
											슬라이드 이동</button>
										<div class="goods-add-product-list-wrapper"
											style="height: 320px">

											<!-- 하위 제품 목록 표시 -->
											<ul class="goods-add-product-list __slide-mover">
												<c:forEach var="categoryItemPage"
													items="${getCategoryItemPage }">
													<li class="goods-add-product-item __slide-item">
														<div class="goods-add-product-item-figure">
															<a href="itemPage.do?category_goods_serial=${categoryItemPage.category_goods_serial }">
																<img
																src="${categoryItemPage.category_goods_image_thumb }"
																class="goods-add-product-item-image"
																onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
															</a>
														</div>

														<div class="goods-add-product-item-content">
															<form class="goods-add-product-item-content-wrapper">
																<input type="hidden" class="categorySubSerial"
																	value="${categoryItemPage.category_sub_serial}" /> <input
																	type="hidden" class="categoryGoodsSerial"
																	value="${categoryItemPage.category_goods_serial}" />

																<p class="goods-add-product-item-name" style="">${categoryItemPage.category_goods_name}</p>
																<p class="goods-add-product-item-price" style="">${categoryItemPage.goods_detail_price}원</p>
															</form>
														</div>

													</li>
												</c:forEach>
											</ul>

										</div>
									</div>
								</div>


								<div class="goods-view-infomation detail_wrap_outer"
									id="goods-view-infomation">

									<div class="goods-view-tab">
										<nav>
											<ul class="goods-view-infomation-tab-group">
												<li class="goods-view-infomation-tab"><a
													href="#goods-description"
													class="goods-view-infomation-tab-anchor __active">상품상세정보</a></li>
												<li class="goods-view-infomation-tab"><a
													href="#why-kurlyty"
													class="goods-view-infomation-tab-anchor">Why Kurylty</a></li>
												<li class="goods-view-infomation-tab goods-view-review-tab">
													<a href="#goods-review"
													class="goods-view-infomation-tab-anchor">후기 <span
														class="count_review">XXXXXXXXXX</span></a>
												</li>

												<li class="goods-view-infomation-tab qna-show"><a
													href="#goods-qna" class="goods-view-infomation-tab-anchor">문의</a></li>
											</ul>
										</nav>
									</div>
								</div>

								<!--   상품설명 -->
								<div class="all">

									<div class="goods-view-infomation-content __active"
										id="goods-description">

										<!-- 상세이미지 -->
										<div class="goods_wrap">
											<div class="goods_intro">
												<div class="pic">
													<img
														src="${getItemPage.category_goods_image_detail_header}" />

												</div>

												<div class="daily_desc">
													<div class="daily_box">
														<strong class="daily_goodsTit"> <span>${getItemPage.category_goods_detail_name2}</span>
															${getItemPage.category_goods_detail_name1}
														</strong>
														<p class="words">${ getItemPage.category_goods_detail_name_subtext}
														</p>


														<div class="pic">
															<img
																src="${getItemPage.category_goods_image_detail_main}" />
														</div>
													</div>
												</div>
											</div>
										</div>

										<div id="why-kurlyty" class="whykurly_area">
											<div class="row">
												<strong class="tit_whykurly">WHY KURLYTY</strong>
												<div id="why_kurly" class="txt_area">
													<div class="why-kurly">
														<div class="col">
															<div class="icon">
																<img
																	src="https://res.kurly.com/pc/ico/1910/01_check.svg">
															</div>
															<div class="info">
																<div class="title">깐깐한 상품위원회</div>
																<div class="desc">
																	<p>
																		나와 내 가족이 먹고 쓸 상품을 고르는<br> 마음으로 매주 상품을 직접 먹어보고,<br>
																		경험해보고 성분, 맛, 안정성 등 다각도의<br> 기준을 통과한 상품만을 판매합니다.
																	</p>
																	<!---->
																</div>
															</div>
														</div>
														<div class="col">
															<div class="icon">
																<img src="https://res.kurly.com/pc/ico/1910/02_only.svg">
															</div>
															<div class="info">
																<div class="title">차별화된 Kurly Only 상품</div>
																<div class="desc">
																	<p>
																		전국 각지와 해외의 훌륭한 생산자가<br> 믿고 선택하는 파트너, 마켓컬리.<br>
																		3천여 개가 넘는 컬리 단독 브랜드, 스펙의<br> Kurly Only 상품을 믿고
																		만나보세요.
																	</p>
																	<span class="etc">(온라인 기준 / 자사몰, 직구 제외)</span>
																</div>
															</div>
														</div>
														<div class="col">
															<div class="icon">
																<img src="https://res.kurly.com/pc/ico/1910/03_cold.svg">
															</div>
															<div class="info">
																<div class="title">신선한 풀콜드체인 배송</div>
																<div class="desc">
																	<p>
																		온라인 업계 최초로 산지에서 문 앞까지<br> 상온, 냉장, 냉동 상품을 분리 포장 후<br>
																		최적의 온도를 유지하는 냉장 배송 시스템,<br> 풀콜드체인으로 상품을 신선하게
																		전해드립니다.
																	</p>
																	<span class="etc">(샛별배송에 한함)</span>
																</div>
															</div>
														</div>
														<div class="col">
															<div class="icon">
																<img
																	src="https://res.kurly.com/pc/ico/1910/04_price.svg">
															</div>
															<div class="info">
																<div class="title">고객, 생산자를 위한 최선의 가격</div>
																<div class="desc">
																	<p>
																		매주 대형 마트와 주요 온라인 마트의 가격<br> 변동 상황을 확인해 신선식품은 품질을<br>
																		타협하지 않는 선에서 최선의 가격으로,<br> 가공식품은 언제나 합리적인 가격으로<br>
																		정기 조정합니다.
																	</p>
																	<!---->
																</div>
															</div>
														</div>
														<div class="col">
															<div class="icon">
																<img src="https://res.kurly.com/pc/ico/1910/05_eco.svg">
															</div>
															<div class="info">
																<div class="title">환경을 생각하는 지속 가능한 유통</div>
																<div class="desc">
																	<p>
																		친환경 포장재부터 생산자가 상품에만<br> 집중할 수 있는 직매입 유통구조까지,<br>
																		지속 가능한 유통을 고민하며 컬리를 있게<br> 하는 모든 환경(생산자, 커뮤니티,
																		직원)이<br> 더 나아질 수 있도록 노력합니다.
																	</p>
																	<!---->
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>


										<div class="happy_center fst">
											<div class="happy">
												<h4 class="tit">고객행복센터</h4>
												<p class="sub">
													<span class="emph">궁금하신 점이나 서비스 이용에 불편한 점이 있으신가요?</span><span
														class="bar"></span> 문제가 되는 부분을 사진으로 찍어<span class="bar"></span>
													아래 중 편하신 방법으로 접수해 주시면<span class="bar"></span> 빠르게
													도와드리겠습니다.
												</p>
											</div>

											<ul class="list">
												<li>
													<div class="tit">전화 문의 1644-1107</div>
													<div class="sub">오전 7시~오후 7시 (연중무휴)</div>
												</li>
												<li>
													<div class="tit">카카오톡 문의</div>
													<div class="sub">오전 7시~오후 7시 (연중무휴)</div>
													<div class="expend">
														카카오톡에서 ’마켓컬리’를 검색 후<br> 대화창에 문의 및 불편사항을<br>
														남겨주세요.
													</div>
												</li>
												<li>
													<div class="tit">홈페이지 문의</div>
													<div class="sub">
														24시간 접수 가능<br> 로그인 &gt; 마이컬리 &gt; 1:1 문의
													</div>
													<div class="expend">고객센터 운영 시간에 순차적으로 답변해드리겠습니다.</div>
												</li>
											</ul>
										</div>

										<div class="happy_center on">
											<div class="happy unfold">
												<h4 class="tit">교환 및 환불 안내</h4>
												<p class="sub">교환 및 환불이 필요하신 경우 고객행복센터로 문의해주세요.</p>
												<a href=#none data-child-id="show" class="asked"
													onclick="if(hide.style.display=='none'){hide.style.display='';} else {hide.style.display='none';}">
													<span class="txt">자세히보기</span> <img
													src="https://res.kurly.com/pc/ico/2001/pc_arrow_close@2x.png"
													alt="아이콘" class="ico">
												</a>
											</div>

											<div id="hide" style="display: none">
												<div class="happy_faq fst">
													<span class="item">01. 상품에 문제가 있는 경우</span>
													<div id="refund1" class="questions hide">
														<p class="desc">
															받으신 상품이 표시·광고 내용 또는 계약 내용과 <span class="bar_m"></span>다른
															경우에는 상품을 받은 날부터 3개월 이내, <span class="bar_m bar_pc"></span>그
															사실을 알게 된 날부터 30일 이내에 <span class="bar_m"></span>교환 및 환불을
															요청하실 수 있습니다.
														</p>
														<p class="space"></p>
														<p class="desc">
															상품의 정확한 상태를 확인할 수 있도록 <span class="bar_m"></span>사진을 함께
															보내주시면 더 빠른 상담이 가능합니다.
														</p>
														<p class="noti">※ 상품에 문제가 있는 것으로 확인되면 배송비는 컬리가 부담합니다.</p>
													</div>
												</div>
												<div class="happy_faq">
													<span class="item">02. 단순 변심, 주문 착오의 경우</span>
													<div id="refund2" class="questions hide">
														<strong class="subject no_padding">신선 / 냉장 / 냉동
															식품</strong>
														<p class="desc">
															재판매가 불가한 상품의 특성상, <span class="bar_m"></span>단순 변심, 주문 착오
															시 <span class="bar_m"></span>교환 및 반품이 어려운 점 양해 부탁드립니다.
														</p>
														<p class="space"></p>
														<p class="desc">
															상품에 따라 조금씩 맛이 다를 수 있으며, <span class="bar_m"></span>개인의
															기호에 따라 같은 상품도 다르게 <span class="bar_m"></span>느끼실 수 있습니다.
														</p>
														<strong class="subject">유통기한 30일 이상 식품 <span
															class="bar_m"></span>(신선 / 냉장 / 냉동 제외) &amp; 기타 상품
														</strong>
														<p class="desc">
															상품을 받은 날부터 7일 이내에 <span class="bar_m"></span>고객행복센터로
															문의해주세요.
														</p>
														<p class="noti">
															※ 단순 변심으로 인한 교환 또는 환불의 경우 <span class="bar_m"></span>고객님께서
															배송비 6,000원을 부담하셔야 합니다. <span class="bar_m bar_pc"></span>(주문
															건 배송비를 결제하셨을 경우 3,000원)
														</p>
													</div>
												</div>
												<div class="happy_faq">
													<span class="item">03. 교환·반품이 불가한 경우</span>
													<div id="refund3" class="questions hide">
														<p class="desc">
															다음에 해당하는 교환·환불 신청은 <span class="bar_m"></span>처리가 어려울 수
															있으니 양해 부탁드립니다.
														</p>
														<ul class="list_questions">
															<li>고객님의 책임 있는 사유로 상품이 멸실되거나 훼손된 경우 <span
																class="bar_m bar_pc"></span>(단, 상품의 내용을 확인하기 위해 포장 등을
																훼손한 경우는 제외)
															</li>
															<li>고객님의 사용 또는 일부 소비로 상품의 가치가 감소한 경우</li>
															<li>시간이 지나 다시 판매하기 곤란할 정도로 상품의 가치가 감소한 경우</li>
															<li>복제가 가능한 상품의 포장이 훼손된 경우</li>
															<li>고객님의 주문에 따라 개별적으로 생산되는 <span class="bar_m"></span>상품의
																제작이 이미 진행된 경우
															</li>
														</ul>
													</div>
												</div>
											</div>


											<div class="happy_center on">
												<div class="happy unfold" style="border-top: none;">
													<h4 class="tit">주문 취소 안내</h4>
													<p class="sub">
													<ul>
														<li><strong class="emph">- [입금 확인] 단계</strong> 마이컬리
															주문 내역 상세페이지에서 직접 취소하실 수 있습니다.</li>
														<li><strong class="emph">- [입금 확인] 이후 단계</strong>
															고객행복센터로 문의해주세요.</li>
														<li><strong class="emph">
																&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;&ensp;
																- 결제 승인 취소 / 환불</strong> 결제 수단에 따라 영업일 기준 3~7일 내에 처리해드립니다.</li>

													</ul>

													<a href="#none" data-child-id="show2" class="asked"
														onclick="if(hide2.style.display=='none'){hide2.style.display='';} else {hide2.style.display='none';}">
														<span class="txt" data-open="자세히보기" data-close="닫기">자세히보기</span>
														<img
														src="https://res.kurly.com/pc/ico/2001/pc_arrow_close@2x.png"
														alt="아이콘" class="ico">
													</a>
												</div>
												<div id="hide2" style="display: none">
													<div class="happy_faq">
														<span class="item">주문 취소 관련</span>
														<div class="questions hide">
															<p class="desc">- [상품 준비 중] 이후 단계에는 취소가 제한되는 점 고객님의
																양해 부탁드립니다.</p>
															<p class="desc">- 비회원은 모바일 App / Web &gt; 마이컬리 &gt;
																비회원 주문 조회 페이지에서 주문을 취소하실 수 있습니다.</p>
															<p class="desc">- 일부 예약 상품은 배송 3~4일 전에만 취소하실 수 있습니다.</p>
															<p class="desc">- 주문 상품의 부분 취소는 불가능합니다. 전체 주문 취소 후
																재구매해 주세요.</p>
														</div>
													</div>

													<div class="happy_faq">
														<span class="item">결제 승인 취소 / 환불 관련</span>
														<div class="questions hide">
															<p class="desc">- 카드 환불은 카드사 정책에 따르며, 자세한 사항은 카드사에
																문의해주세요.</p>
															<p class="desc">- 결제 취소 시, 사용하신 적립금과 쿠폰도 모두 복원됩니다.</p>
														</div>
													</div>
												</div>

												<div class="happy_center lst">
													<div class="happy unfold">
														<h4 class="tit">배송관련 안내</h4>
														<p class="sub">배송 과정 중 기상 악화 및 도로교통 상황에 따라 부득이하게 지연
															배송이 발생될 수 있습니다.</p>
													</div>
												</div>
											</div>


											<!--  리뷰페이지를 가져와서 반영합니다. -->
											<div class="goods-view-infomation-content" id="goods-review"
												data-load="0">
												<div id="inreview" class="goods-view-infomation-board"
													frameborder="0" height="736">
													<div id="contents-wrapper" class="goods_board">
														<div
															class="xans-element- xans-product xans-product-additional detail_board  ">
															<div class="board">
																<span class="line"></span>
																<form name="frmList">
																	<input type="hidden" name="sort" value=""> <input
																		type="hidden" name="page_num" value=""> <input
																		type="hidden" name="goodsno" value="5051">
																	<div class="title_txt">
																		<h2>PRODUCT REVIEW</h2>
																		<div class="sort-wrap">
																			<ul class="list_type1 old">
																				<li><span class="ico"></span>
																					<p class="txt">상품에 대한 문의를 남기는 공간입니다. 해당 게시판의
																						성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</p></li>
																				<li><span class="ico"></span>
																					<p class="txt">
																						배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <a
																							href="#none"
																							onclick="window.parent.location.href = '/shop/mypage/mypage_qna.php'"
																							class="emph">1:1 문의</a>에 남겨주세요.
																					</p></li>
																			</ul>
																			<div class="sort" style="bottom: -9px">
																				<select
																					onchange="this.form.sort.value=this.value;this.form.submit()">
																					<option value="1">최근등록순</option>
																					<option value="2">좋아요많은순</option>
																					<option value="3">조회많은순</option>
																				</select>
																			</div>
																		</div>
																	</div>
																	<table class="xans-board-listheader" width="100%"
																		border="0" cellpadding="0" cellspacing="0">
																		<caption style="display: none">구매후기 제목</caption>
																		<colgroup>
																			<col style="width: 70px;">
																			<col style="width: auto;">
																			<col style="width: 51px;">
																			<col style="width: 77px;">
																			<col style="width: 100px;">
																			<col style="width: 40px;">
																			<col style="width: 80px;">
																		</colgroup>
																		<tbody>
																			<tr>
																				<th scope="col" class="input_txt">번호</th>
																				<th scope="col" class="input_txt">제목</th>
																				<th scope="col" class="input_txt"><span
																					class="screen_out">회원 등급</span></th>
																				<th scope="col" class="input_txt" align="left">작성자</th>
																				<th scope="col" class="input_txt">작성일</th>
																				<th scope="col" class="input_txt">도움</th>
																				<th scope="col" class="input_txt">조회</th>
																			</tr>
																		</tbody>
																	</table>

																	<div class="tr_line">
																		<table class="xans-board-listheaderd tbl_newtype1"
																			width="100%" cellpadding="0" cellspacing="0"
																			onclick="view_content(this,event,false)">
																			<caption style="display: none">구매후기 내용</caption>
																			<colgroup>
																				<col style="width: 70px;">
																				<col style="width: auto;">
																				<col style="width: 51px;">
																				<col style="width: 77px;">
																				<col style="width: 100px;">
																				<col style="width: 40px;">
																				<col style="width: 80px;">
																			</colgroup>
																			<tbody>
																				<tr>

																					<input type="hidden" name="index" value="1">
																					<input type="hidden" name="image" value="true">
																					<input type="hidden" name="grade" value="0">
																					<input type="hidden" name="best" value="true">
																					<input type="hidden" name="pNo" value="">

																					<td align="center">BEST</td>
																					<td class="subject">
																						<div class="fst">
																							촉촉한 존쿡백립은 진리입니다 <img
																								src="https://res.kurly.com/pc/ico/1910/ico_attach2.gif"
																								alt="이미지가 첨부됨">
																						</div>
																						<div class="snd">
																							촉촉한 존쿡백립은 진리입니다 <img
																								src="https://res.kurly.com/pc/ico/1910/ico_attach2.gif"
																								alt="이미지가 첨부됨">
																						</div>
																					</td>
																					<td class="user_grade grade_comm"></td>
																					<td class="user_grade">백*성</td>
																					<td class="time">2019-06-15</td>
																					<td><span class="review-like-cnt"
																						data-sno="4389757">0</span></td>
																					<td><span class="review-hit-cnt"
																						data-sno="4389757">2330</span></td>
																				</tr>
																			</tbody>
																		</table>
																		<div data-sno="4389757" class="review_view">
																			<div class="inner_review">
																				<div class="name_purchase">
																					<strong class="name">[존쿡 델리미트] 바베큐 백립 450g
																						(냉동)</strong>
																					<p class="package"></p>
																				</div>
																				<div class="review_photo"></div>
																				맛 4.5 / 식감 5 / 양 3 / 배송 5<br> 안녕하세요~! 컬리 이용한지
																				얼마 안된 신입입니다ㅎㅎ<br> 제가 초딩때부터 입맛이 비싸진 이유가 이
																				백립때문이라고 해도 무방할 정도로 아웃백에 가면 꼭 먹었던 음식이거든요! 그래서 주문한 것
																				중에 제일 기대했던 제품이기도 하네요@-@<br> 일단 맛만 보자면 어릴 때 대부분
																				한번은 드셔보셨을텐데 급식에 나오는 합박스테이크의 소스에서 케찹맛이 조금만 들어간 듯한
																				맛이였어요. 저는 원래 돈가스 먹기전에 돈가스 소스를 먼저 먹어보고 설렁탕 먹기전에 깍두기를
																				먹어보는 그런 사람이였는데 소스에 엄청난 기대를 하고 있던 저는 많은 아쉬움을 느꼈죠ㅠ.ㅠ항상
																				먹어보던 맛이였으니깐요....근데 또 조아하긴 해서ㅋㅋㅋㅋ괜찮았습니당<br> 근데
																				여기서부터 매우 중요합니다!!! 일단 뼈 사이사이를 잘랐는데 오마이갓.... 이미 보기에도
																				엄청난 부드러움이 보이길래 한번 씹었는데 얼마 씹지 않고 넘겼을정도로 정말 부드러워서 저를
																				지금 당장 누가 뺨을 치더라도 웃을정도로 맛있는 맛이였어요ㅎㅎㅎㅎㅎ헤헤<br> 양은
																				음...살 쬐금 먹다보면 얼마안가 뼈를 빨아먹고 있는 제 자신이 보여서 많이 아쉬웠답니다
																				흐규ㅠㅠ<br> 배송은 역시 컬리배송!!! 타 업체에선 느낄 수 없을정도로
																				식품배송에대한 언제올지 걱정도 안되고 너무 빨라서 정말 대단하다 생각했습니다ㅎㅎ<br>
																				암튼 컬리 만세 !__(^~^)__!
																			</div>
																			<div class="goods-review-grp-btn">
																				<button type="button"
																					class="styled-button review-like-btn"
																					data-sno="4389757"
																					onclick="review_like('4389757',$(this));">
																					도움이 돼요 <span class="num">0</span>
																				</button>
																			</div>
																		</div>
																	</div>
																</form>
																<p class="btnArea after">
																	<a href="#none"
																		onclick="popup_register( 'add_review', '5051' )"><span
																		class="bhs_button"
																		style="line-height: 30px; width: 130px;">후기쓰기</span></a>
																</p>
															</div>
														</div>
														<div class="board_pg_area">
															<a
																href="/shop/goods/goods_review_list.php?goodsno=5051&amp;page=1"
																class="layout-pagination-button layout-pagination-first-page">맨
																처음 페이지로 가기</a><a
																href="/shop/goods/goods_review_list.php?goodsno=5051&amp;page=1"
																class="layout-pagination-button layout-pagination-prev-page">이전
																페이지로 가기</a> <a
																href="/shop/goods/goods_review_list.php?goodsno=5051&amp;page=2"
																class="layout-pagination-button layout-pagination-next-page">다음
																페이지로 가기</a><a
																href="/shop/goods/goods_review_list.php?goodsno=5051&amp;page=4261"
																class="layout-pagination-button layout-pagination-last-page">맨
																끝 페이지로 가기</a>
														</div>
													</div>
												</div>
											</div>

											<!-- 제품 문의 게시판을 작업 후 데이를 첨부합니다. -->
											<div class="goods-view-infomation-content" id="goods-qna">
												<div class="board-container">
													<div id="productInquiryBoard" data-productno="81562"
														data-boardpagesize="10" data-boardtype="product"
														data-devicetype="pc">
														<div class="board-header-container">
															<strong>PRODUCT Q&amp;A</strong>
															<ul class="list-description">
																<li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이
																	담당 게시판으로 이동될 수 있습니다.</li>
																<li>배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 <a
																	href="/shop/mypage/mypage_qna.php">1:1 문의</a>에 남겨주세요.
																</li>
															</ul>
														</div>
														<div class="board-item-container product">
															<div class="inquiry-board-header"
																style="table-layout: fixed;">
																<div>번호</div>
																<div style="width: 710px;">제목</div>
																<div>작성자</div>
																<div>작성일</div>
																<div>답변상태</div>
															</div>
															
															
															<c:forEach var="goodsqnalist" items="${goodsqnalist}" varStatus="postNum">
																<input type="hidden" name="category_goods_serial"
																	value="${goodsqnalist.category_goods_serial}" />

																<ul class="board-list">
																	<li class="inquiry-item">
																		<div>${goodsqnalist.rnum}</div>
																		<input type="hidden" id="writer" value="${goodsqnalist.user_id }">
																		<input type="hidden" id="isLock" value="${goodsqnalist.qna_goods_lock }">
																		<c:if test="${!goodsqnalist.qna_goods_lock || goodsqnalist.user_id==userId}">
																			<div class="product-detail " style="width: 710px; align:left;">
																				<strong style="float:left; margin:0px 20px;">${goodsqnalist.qna_goods_title}</strong>
																			</div>
																			<div class="item-cell">
																				<p class="txt_sub text_medium normal">${goodsqnalist.user_name}</p>
																			</div>
																		</c:if>
																		<c:if test="${goodsqnalist.qna_goods_lock && goodsqnalist.user_id!=userId}">
																			<div class="product-detail " style="width: 710px;">
																				<strong style="float:left; margin:0px 20px;">비밀글입니다.</strong>
																				<span
																					class="icon-secret"> <span class="screen_out"></span>
																				</span>
																			</div>
																			<div class="item-cell">
																				<p class="txt_sub text_medium normal">***</p>
																			</div>
																		</c:if>
																		<div class="item-cell">
																			<p class="txt_sub text_medium normal">
																				<fmt:formatDate
																					value="${goodsqnalist.qna_goods_date}"
																					pattern="yyyy-MM-dd" />
																			</p>
																		</div>
																		<div class="item-cell">
																			<c:if test="${goodsqnalist.qna_goods_answer_status==0}">
																				<p class="txt_sub text_medium normal">답변대기</p>
																			</c:if>
																			<c:if test="${goodsqnalist.qna_goods_answer_status==1}">
																				<p class="txt_sub kurlyPurple normal">답변완료</p>
																			</c:if>
																		</div>
																		
																	</li>
																	<li class="inquiry-item-expand "
																		style="align: center; display: none; width: 100%; background-color:#f9f9ef">

																		<c:if test="${goodsqnalist.qna_goods_answer_date == null}">
																			<div class="expand-question">
																				<span class="icon-question"><span>질문</span></span>
																				<p>
																					<span>${fn:replace(goodsqnalist.qna_goods_content,"ln","<br>")} </span>
																				</p>
																				<br> <br>
																				<c:if test="${goodsqnalist.user_id == userId }">
																					<div class="inquiry-content-footer">
																						<input type="button" class="bhs_button yb"
																							value="수정"
																							onclick="javascript:div_show_update('${goodsqnalist.qna_goods_serial }','${goodsqnalist.qna_goods_title}','${goodsqnalist.qna_goods_content}',${goodsqnalist.qna_goods_lock })"
																							style="align: center; line-height: 25px; width: 60px;">
																						<input type="button" class="bhs_button yb"
																							value="삭제"
																							onclick="location.href='deleteGoodsQna.do?qna_goods_serial=${goodsqnalist.qna_goods_serial}&category_goods_serial=${goodsqnalist.category_goods_serial}'"
																							style="align: center; line-height: 25px; width: 60px;">
																						<br> <br>
																						<!-- -->
																					</div>
																				</c:if>
																			</div>
																		</c:if> <!--  답변이 없을 때 !  --> 
																		<c:if test="${goodsqnalist.qna_goods_answer_date != null}">
																			<div class="expand-question">
																				<span class="icon-question"><span>질문</span></span>
																				<p>
																					<span>${fn:replace(goodsqnalist.qna_goods_content,"ln","<br>")} </span>
																				</p>
																				<br>
																			</div>
																			<div class="expand-answer">
																				<span class="icon-answer"><span>답변</span></span>
																				<p>
																					${goodsqnalist.qna_goods_answer}
																				<span class="created-time">
																					답변일:<fmt:formatDate value="${goodsqnalist.qna_goods_answer_date}" pattern="yyyy-MM-dd" />
																				</span>
																			</div>
																		</c:if>
																	</li>
																</ul>
															</c:forEach>

															<div class="board-inquiry-area">
																<div class="paging-navigation">
																	<button type="button" class="paging-prev"
																		disabled="disabled">
																		<span>이전</span>
																	</button>
																	<button type="button" class="paging-next">
																		<span>다음</span>
																	</button>
																</div>
																<!--  문의 하기 버튼 누르면 창을 띄움.  -->
																<button type="button" class="btn active"
																	onclick="javascript:div_show()">
																	<span>문의하기</span>
																</button>
															</div>

														</div>
													</div>
												</div>
											</div>


											<div class="modal-container" id="write_div"
												style="display: none;">
												<form name="goodsQnaForm" id="insertgoodsqna" method="post"
													style="height: 100%;" action="insertGoodsQna.do">
													<input type="hidden" name="user_id" value="${userId}">
													<input type="hidden" name="user_name" value="${userName}">
													<input type="hidden" name="category_main_serial"
														value="${getItemPage.category_main_serial}" />
													<input type="hidden" name="category_sub_serial"
														value="${getItemPage.category_sub_serial}" />
													<input type="hidden" name="category_goods_serial"
														value="${getItemPage.category_goods_serial}" />
													<input type="hidden" name="qna_goods_name"
														value="${getItemPage.category_goods_name}" />
													<input type="hidden" name="qna_goods_serial" value="0"/>
													<div class="dimmed-layer">
														<div class="inner-layer">
															<div class="inquiry-modal"
																style="margin-bottom: 20px; margin-top: 20px;">
																<div class="modal-header">
																	<strong>상품 문의하기</strong>
																	<button type="button" class="btn-close" onclick="javascript:div_hide()">
																		<span class="screen_out">닫기</span>
																	</button>
																</div>

																<div class="modal-body">
																	<div class="product-item">
																		<span class="frame-img"
																			style="background-image: url(${getItemPage.category_goods_image_thumb});"></span>
																		<div class="cell">
																			<strong>${getItemPage.category_goods_name}</strong>
																		</div>
																	</div>
																	<div class="inquiry-form">
																		<div class="inquiry-row">
																			<span>제목</span>
																			<div class="inquiry-cell">
																				<div class="input-comm type_form">
																					<input type="text" placeholder="제목을 입력해주세요"
																						name="qna_goods_title" maxlength="50" value="">
																				</div>
																			</div>
																		</div>
																		<div class="inquiry-row">
																			<span>내용</span>
																			<div class="inquiry-cell">
																				<div class="inquiry-text-area ">
																					<span class="txt-byte"><span></span></span>
																					<div class="input-comm type_form">
																						<textarea name="qna_goods_content"
																							maxlength="5000" placeholder="상품문의를 작성해주세요."></textarea>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="inquiry-row">
																			<span><span class="screen_out">비밀글 여부</span></span>
																			<div class="inquiry-cell">
																				<label class="check_agree label_block"> <input
																					type="checkbox" name="qna_goods_lock" value="true">
																					<!-- 기본값 false --> <span class="ico"></span>비밀글로
																					문의하기
																				</label>
																			</div>
																		</div>
																	</div>
																</div>

																<div class="modal-footer">
																	<button type="button" class="btn normal" style="float:left;"
																		onclick="javascript:div_hide();">취소</button>
																	<button type="button" class="btn active"
																		onclick="javascript:goodsQnaAction('insertGoodsQna.do');" id="insertBt">등록</button>
																	<button type="button" class="btn active"
																		onclick="javascript:goodsQnaAction('updateGoodsQna.do');" id="updateBt">수정</button>
																</div>
															</div>
														</div>
													</div>
												</form>
											</div>
											<!----------------------------- -->
										</div>

									</div>
								</div>
								<!-- 끝 -->
							</div>
						</div>
						<!-- layout-wrapper goods-view-area -->

						<!-- <link rel="stylesheet" type="text/css" href="https://www.kurly.com/asset/css/product/inquiry/pc.bundle.css?ver=1.43.5"> -->


						<div class="bg_loading" id="bgLoading">
							<div class="loading_show"></div>
						</div>

					</div>
					<!-- content -->

					<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
				</div>
				<!-- main -->

				<!-- 이하 footer -->
			</div>
			<!-- Container -->
		</div>
		<!-- Wrap -->
	</div>
	<a href="#top" id="pageTop">맨 위로가기</a>


<script>
	$("li.inquiry-item").hover(function(){
		$(this).css("background-color","#f1f1f1");
	});
	$("li.inquiry-item").mouseleave(function(){
		$(this).css("background-color","#ffffff");
	});
	$("li.inquiry-item").click(function(){
		
		if($(this).find("input#isLock").val()=='false'){
			
			if($(this).nextAll("li").is(":visible")){
				$(this).nextAll("li").css("display","none");
			}else{
				$("li.inquiry-item-expand").css("display","none");
				$(this).nextAll("li").css("display","block");
			}
			
		}else{
			if($(this).find("input#writer").val()=='${userId}'){
				if($(this).nextAll("li").is(":visible")){
					
					$(this).nextAll("li").css("display","none");
				}else{
					$("li.inquiry-item-expand").css("display","none");
					$(this).nextAll("li").css("display","block");
				}
			}
		}
	})
function goodsQnaAction(direction){
	document.goodsQnaForm.action=direction;
	document.goodsQnaForm.submit();
}
</script>
</body>
</html>