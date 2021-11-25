<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="${pageContext.request.contextPath}/resources/style/ItemListStyle.css">

<style>
.xans-product-additional table.xans-board-listheader {
    margin: 15px 0 0;
    color: #353535;
    font-size: 12px;
    line-height: 140%;
    table-layout: fixed;
}
.xans-board-listheader {
    border-top: 2px solid #522772;
 }
  
body * {
    font-family: 'Noto Sans';
    font-weight: 400;
    letter-spacing: 0;
}
table {
    border-collapse: collapse;
    border-spacing: 0;
}
form {
    display: block;
}
div {
    display: block;
    word-break: break-all;
}	

script {
    display: none;
}

.xans-product-additional table.tbl_newtype1 td {
    height: auto;
    padding: 22px 3px 23px;
}
.xans-product-additional table.xans-board-listheaderd td {

    border-top: 1px solid #e3e3e3;
    text-align: center;
    vertical-align: middle;
}

element.style {
    display: block;
}

.goods_board .review_view {
    padding: 10px 10px 11px;
    border-top: 1px solid #e3e3e3;
}
.goods_board .review_view .inner_review {
    width: 100%;
    padding: 20px 9px 9px;
    line-height: 25px;
}
.goods_board .review_notice .name_purchase {
    display: none;
}
.goods_board .review_notice .review_photo {
    display: none;
}
.goods_board .review_photo {
    padding-top: 30px;
    line-height: 16px;
}

.xans-product-additional div.board .btnArea {
    padding: 10px 0;
    text-align: right;
    width: 100%;
    display: table;
}
.xans-product-additional div.board>.btnArea {
    border-top: 1px solid #6a3664;
}
.xans-product-additional div.board .btnArea a {
    display: inline-block;
}
a {
    background-color: transparent;
    text-decoration: none;
    color: inherit;
}
.xans-product-additional div.board .btnArea {
    padding: 10px 0;
    text-align: right;
    width: 100%;
    display: table;
}
.goods_board .board_pg_area {
    clear: both;
    text-align: center;
    padding-bottom: 15px;
}

.layout-pagination-button:first-child {
    border-left: 1px solid #ddd;
}
.layout-pagination-first-page {
    background-image: url(https://res.kurly.com/pc/etc/old/images/common/icon-pagination-first.png);
}
.layout-pagination-prev-page {
    background-image: url(https://res.kurly.com/pc/etc/old/images/common/icon-pagination-prev.png);
}
.layout-pagination-first-page, .layout-pagination-prev-page, .layout-pagination-next-page, .layout-pagination-last-page {
    background-repeat: no-repeat;
    background-position: 50% 50%;
    text-indent: -9999px;
}
.layout-pagination-next-page {
    background-image: url(https://res.kurly.com/pc/etc/old/images/common/icon-pagination-next.png);
}
.layout-pagination-last-page {
    background-image: url(https://res.kurly.com/pc/etc/old/images/common/icon-pagination-last.png);
}
.layout-pagination-button {
    display: inline-block;
    width: 34px;
    height: 34px;
    border: 1px solid #ddd;
    border-left: 0;
    vertical-align: top;
}

.layout-pagination-first-page, .layout-pagination-prev-page, .layout-pagination-next-page, .layout-pagination-last-page {
    background-repeat: no-repeat;
    background-position: 50% 50%;
    text-indent: -9999px;
}
.layout-pagination-button {
    display: inline-block;
    width: 34px;
    height: 34px;
    border: 1px solid #ddd;
    border-left: 0;
    vertical-align: top;
}
.layout-pagination-number:hover, .layout-pagination-number.__active {
    background-color: #f7f7f7;
    color: #5f0080;
}
.layout-pagination-number {
    font-weight: 700;
    line-height: 34px;
}
.goods-review-grp-btn {
    text-align: right;
}
.goods_board .goods-review-grp-btn .styled-button {
    height: 32px;
}

.goods-review-grp-btn .styled-button {
    width: auto;
    min-width: 75px;
    padding: 0 15px;
    line-height: 28px;
    font-size: 12px;
}
.styled-button {
    display: inline-block;
    width: 175px;
    height: 50px;
    border: 1px solid #5f0080;
    background-color: #fff;
    font-size: 14px;
    color: #5f0080;
    line-height: 50px;
    text-align: center;
}
body {
    color: #4c4c4c;
    font-size: 12px;
    max-width: 100%;
}
button {
    outline: none;
}
.xans-product-additional div.board .btnArea a {
    display: inline-block;
}
a {
    background-color: transparent;
    text-decoration: none;
    color: inherit;
}
element.style {
    line-height: 30px;
    width: 130px;
}
.xans-product-additional .btnArea .bhs_button {
    margin: 20px 0 20px 5px;
}
.bhs_button {
    display: inline-block;
    text-align: center;
    background-color: #795b8f;
    border: 1px solid #5f0080;
    color: #fff;
    float: right;
    font-size: 13px;
}
.goods_board .board_pg_area {
    clear: both;
    text-align: center;
    padding-bottom: 15px;
}

<!-- 상품 문의  -->
#goods-infomation, #goods-review, #goods-qna {
    padding-top: 100px;
    margin-bottom: 0;
}
.goods-view-infomation-content {
    padding-top: 40px;
    min-height: 500px;
    margin-bottom: 50px;
}

.board-container {
    height: 100%;
}
.board-header-container {
    padding-bottom: 38px;
    font-family: Noto Sans;
}
.board-header-container strong {
    display: block;
    padding-bottom: 16px;
    font-size: 16px;
    font-weight: 700;
    line-height: 24px;
    color: #333;
}

.list-description {
    font-family: Noto Sans;
    font-size: 14px;
    line-height: 24px;
    font-weight: 400;
    color: #999;
}
.list-description li {
    padding-left: 12px;
}
.list-description a {
    font-weight: 700;
    color: #999;
    text-decoration: underline;
}

.board-item-container.product {
    width: 1010px;
}
.board-item-container {
    position: relative;
    font-family: Noto Sans;
    border-top: 2px solid #333;
}
.board-item-container .inquiry-board-header {
    display: table;
    table-layout: fixed;
    border-bottom: 1px solid #333;
}
.board-item-container .inquiry-board-header>div {
    display: table-cell;
    text-align: center;
    padding: 18px 0 20px;
    width: 100px;
    font-family: Noto Sans;
    font-size: 14px;
    line-height: 20px;
    font-weight: 700;
    letter-spacing: -.5px;
    color: #333;
}

.board-item-container .inquiry-notice-list {
    position: relative;
}
ul {
    list-style-type: none;
}
.board-item-container.product .board-list>li, .board-item-container.product .inquiry-notice-list>li {
    padding: 0;
    height: 61px;
}
.board-item-container .board-list>li, .board-item-container .inquiry-notice-list>li {
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

.board-item-container .board-list>li .item-cell, .board-item-container .inquiry-notice-list>li .item-cell {
    display: table-cell;
    vertical-align: middle;
    width: 100px;
}

.board-item-container.product .board-list>li .notice-cell span, .board-item-container.product .inquiry-notice-list>li .notice-cell span {
    display: inline-block;
    overflow: hidden;
    border-radius: 4px;
    margin-right: 12px;
    padding: 0 8px;
    font-size: 12px;
    line-height: 22px;
    font-weight: 500;
    color: #666;
    background: hsla(0,0%,40%,.06);
    vertical-align: top;
}
.board-item-container.product .board-list>li .notice-cell strong, .board-item-container.product .inquiry-notice-list>li .notice-cell strong {
    display: inline-block;
    overflow: hidden;
    max-width: 613px;
    font-size: 14px;
    font-weight: 400;
    line-height: 24px;
    color: #333;
    white-space: nowrap;
    text-overflow: ellipsis;
    vertical-align: top;
}

.board-item-container.product .board-list>li .notice-cell, .board-item-container.product .board-list>li>div.inquiry-item:first-child, .board-item-container.product .inquiry-notice-list>li .notice-cell, .board-item-container.product .inquiry-notice-list>li>div.inquiry-item:first-child {
    width: 710px;
    text-align: left;
    padding: 0 20px;
    min-height: 22px;
    box-sizing: border-box;
    cursor: pointer;
}
.txt_sub.text_medium {
    color: #999;
}
.board-item-container.product .board-list>li, .board-item-container.product .inquiry-notice-list>li {
    padding: 0;
    height: 61px;
}
.board-item-container .board-list, .board-item-container .inquiry-notice-list {
    position: relative;
}

ol, ul {
    list-style-type: none;
}

.board-item-container.product .board-list>li .product-detail, .board-item-container.product .inquiry-notice-list>li .product-detail {
    height: 100%;
    padding: 0 0 0 20px;
    display: flex;
    align-items: center;
    cursor: pointer;
}
.board-item-container .board-list>li .product-detail, .board-item-container .inquiry-notice-list>li .product-detail {
    min-height: 44px;
    text-align: left;
    padding: 8px 20px 0 0;
    font-weight: 400;
    box-sizing: border-box;
    vertical-align: top;
}
.board-item-container.product .board-list>li .product-detail strong, .board-item-container.product .inquiry-notice-list>li .product-detail strong {
    max-width: 640px;
    vertical-align: top;
    font-weight: 400;
}
.board-item-container .board-list>li .product-detail strong, .board-item-container .inquiry-notice-list>li .product-detail strong {
    display: inline-block;
    max-width: 500px;
    font-size: 14px;
    line-height: 22px;
    color: #333;
}
.board-item-container .board-list>li .product-detail .product-name, .board-item-container .board-list>li .product-detail strong, .board-item-container .inquiry-notice-list>li .product-detail .product-name, .board-item-container .inquiry-notice-list>li .product-detail strong {
    display: block;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
}
.txt_sub.kurlyPurple {
    color: #5f0080;
}
.layout-wrapper.goods-view-area {
    padding-right: 40px;
}
.layout-wrapper {
    position: relative;
    width: 1050px;
    height: 100%;
    margin: 0 auto;
}
.board-inquiry-area {
    position: relative;
}
.paging-navigation {
    padding-top: 20px;
    text-align: center;
}

.paging-navigation>button:disabled.paging-prev {
    margin-right: 12px;
    background-image: url(https://res.kurly.com/kurly/img/2021/direction_prev_disabled_24_44_gray.svg);
}
.paging-navigation>button.paging-prev {
    margin-right: 12px;
    background: url(https://res.kurly.com/kurly/img/2021/direction_prev_24_44_black.svg) 50% 0 no-repeat;
}
.paging-navigation>button:disabled {
    border-color: #eee;
    cursor: default;
}
.paging-navigation>button {
    display: inline-block;
    width: 44px;
    height: 44px;
    padding: 0;
    margin: 0;
    background: 0;
    border: 1px solid #eee;
    border-radius: 3px;
    cursor: pointer;
}
button[disabled], html input[disabled] {
    cursor: default;
}
button {
    outline: none;
}
body, input, select, textarea, button {
    font-family: noto sans,malgun gothic,AppleGothic,dotum;
    line-height: 1;
    letter-spacing: -.05em;
    color: #4c4c4c;
    font-size: 12px;
    max-width: 100%;
}
button, html input[type=button], input[type=reset], input[type=submit] {
    -webkit-appearance: button;
    cursor: pointer;
}
button, select {
    text-transform: none;
}
button {
    overflow: visible;
    border-radius: 0;
}
button, input, optgroup, select, textarea {
    color: inherit;
    font: inherit;
    margin: 0;
}

.paging-navigation>button.paging-next {
    background: url(https://res.kurly.com/kurly/img/2021/direction_next_24_44_black.svg) 50% 0 no-repeat;
}
.paging-navigation>button {
    display: inline-block;
    width: 44px;
    height: 44px;
    padding: 0;
    margin: 0;
    background: 0;
    border: 1px solid #eee;
    border-radius: 3px;
    cursor: pointer;
}
.paging-navigation>button span {
    overflow: hidden;
    position: absolute;
    width: 1px;
    height: 1px;
    clip: rect(0,0,0,0);
}
.board-item-container .board-list>li.inquiry-item-expand .expand-question, .board-item-container .inquiry-notice-list>li.inquiry-item-expand .expand-question {
    position: relative;
    padding: 20px 26px 30px 36px;
}

.board-item-container .board-list>li.inquiry-item-expand>div, .board-item-container .inquiry-notice-list>li.inquiry-item-expand>div {
    display: block;
}
.board-item-container.product .board-list>li.inquiry-item-expand, .board-item-container.product .inquiry-notice-list>li.inquiry-item-expand {
    padding: 0 0 10px 20px;
}
.board-item-container .board-list>li.inquiry-item-expand, .board-item-container .inquiry-notice-list>li.inquiry-item-expand {
    padding: 0 0 10px 100px;
    background: #fafafa;
    text-align: left;
    color: #333;
    box-sizing: border-box;
}
.board-item-container .board-list>li.inquiry-item-expand [class^=icon-].icon-question, .board-item-container .inquiry-notice-list>li.inquiry-item-expand [class^=icon-].icon-question {
    background: url(https://res.kurly.com/kurly/ico/2021/question_24_24_purple.svg) 0 0 no-repeat;
}
.board-item-container .board-list>li.inquiry-item-expand [class^=icon-].icon-answer, .board-item-container .inquiry-notice-list>li.inquiry-item-expand [class^=icon-].icon-answer {
    background: url(https://res.kurly.com/kurly/ico/2021/answer_24_24_purple.svg) 0 0 no-repeat;
}

.board-item-container .board-list>li.inquiry-item-expand [class^=icon-], .board-item-container .inquiry-notice-list>li.inquiry-item-expand [class^=icon-] {
    display: inline-block;
    position: absolute;
    top: 20px;
    left: 0;
    width: 24px;
    height: 24px;
}

.board-item-container .board-list>li.inquiry-item-expand .expand-answer .created-time, .board-item-container .inquiry-notice-list>li.inquiry-item-expand .expand-answer .created-time {
    display: block;
    padding-top: 20px;
    font-size: 14px;
    line-height: 22px;
    color: #999;
}
.board-item-container .board-list>li.inquiry-item-expand, .board-item-container .inquiry-notice-list>li.inquiry-item-expand {
    padding: 0 0 10px 100px;
    background: #fafafa;
    text-align: left;
    color: #333;
    box-sizing: border-box;
}

.board-item-container.product .board-list>li.inquiry-item-expand .expand-question p, .board-item-container.product .inquiry-notice-list>li.inquiry-item-expand .expand-question p {
    min-height: auto;
}
.board-item-container .board-list>li.inquiry-item-expand .expand-question p, .board-item-container .inquiry-notice-list>li.inquiry-item-expand .expand-question p {
    margin: 2px 0 0;
    min-height: 60px;
}

.board-item-container .board-list>li.inquiry-item-expand [class^=icon-].icon-answer, .board-item-container .inquiry-notice-list>li.inquiry-item-expand [class^=icon-].icon-answer {
    background: url(https://res.kurly.com/kurly/ico/2021/answer_24_24_purple.svg) 0 0 no-repeat;
}
.board-item-container .board-list>li.inquiry-item-expand .expand-answer p *, .board-item-container .inquiry-notice-list>li.inquiry-item-expand .expand-answer p * {
    background: 0 0!important;
    font-family: Noto Sans!important;
    font-size: 14px!important;
    line-height: 20px!important;
    color: #333!important;
}
.board-item-container .board-list>li.inquiry-item-expand>div, .board-item-container .inquiry-notice-list>li.inquiry-item-expand>div {
    display: block;
}

.board-inquiry-area .btn {
    position: absolute;
    bottom: 0;
    right: 0;
    width: 120px;
    height: 44px;
    font-family: Noto Sans;
    font-weight: 500;
    line-height: 1;
}
.btn.active {
    border: 1px solid #5f0081;
    background-color: #5f0080;
    color: #fff;
}
.btn {
    width: 100%;
    height: 52px;
    border: 0;
    border-radius: 4px;
    font-weight: 600;
    font-size: 16px;
    line-height: 50px;
    text-align: center;
    outline: none;
}
button {
    outline: none;
}
body, input, select, textarea, button {
    font-family: noto sans,malgun gothic,AppleGothic,dotum;
    line-height: 1;
    letter-spacing: -.05em;
    color: #4c4c4c;
    font-size: 12px;
    max-width: 100%;
}
button, html input[type=button], input[type=reset], input[type=submit] {
    -webkit-appearance: button;
    cursor: pointer;
}
button, select {
    text-transform: none;
}
button {
    overflow: visible;
    border-radius: 0;
}
button, input, optgroup, select, textarea {
    color: inherit;
    font: inherit;
    margin: 0;
}
.board-inquiry-area .btn span {
    display: inline-block;
    font-size: 14px;
    vertical-align: top;
}





</style>

</head>

<script>

function quantity(count){
	var currentCount=$("span.count").find("input.inp").val();
	var changeCount = parseInt(currentCount)+count;
	var price=$("input#oldPrice").val();
	var discount=${getItemPage.goods_detail_dicountrate}
	var membership=-0;
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
	$("#write_div").fadeIn(300);
 //document.getElementById("write_div").style.display = "block";
}
function div_show_update() {
	$("#update_div").fadeIn(300);
}
//숨기기
function div_hide() {
	$("input[name=qna_goods_title]").val("");
	$("textarea[name=qna_goods_content]").val("");
	$("#write_div").fadeOut(300);
 //document.getElementById("write_div").style.display = "none";
}
</script>

<body class="main-index" oncontextmenu="return false" ondragstart="return false">
	<a href="#top" id="gotoTop">맨 위로 가기</a>
	<input type="hidden" id="oldPrice" value="${getItemPage.goods_detail_price}"/>
	<input type="hidden" id="dcPrice" value="${getItemPage.goods_last_price }"/>
	<fmt:formatNumber var="fmOldPrice" maxFractionDigits="3" value="${getItemPage.goods_detail_price }"/>
	<fmt:formatNumber var="fmDcPrice" maxFractionDigits="3" value="${getItemPage.goods_last_price }"/>
	<fmt:parseNumber var="oldReserves" type="number" integerOnly="true" value="${(getItemPage.goods_detail_price*(membership.user_membership_point_rate/100)+5)/10}"/>
	<fmt:formatNumber var="afterReserves" type="number" maxFractionDigits="1" value="${oldReserves*10 }"/>
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
							<div id="shareLayer">
								<div class="layer_share">
									<div class="inner_layersns">
										<h3 class="screen_out">SNS 공유하기</h3>
								<ul class="list_share">
									<li><a class="btn btn_fb" data-sns-name="페이스북"
										data-sns="facebook" href="#none"><img
											src="https://res.kurly.com/mobile/service/goodsview/1804/ico_facebook.png"
											alt="페이스북"><span class="txt">공유하기</span></a></li>
									<li><a class="btn btn_tw" data-sns-name="트위터"
										data-sns="twitter" href="#none"><img
											src="https://res.kurly.com/mobile/service/goodsview/1804/ico_twitter.png"
											alt="트위터"><span class="txt">트윗하기</span></a></li>
									<li class="btn_url"><input type="text" class="inp" value="" readonly="readonly">
									 <a class="btn_copy off" data-sns-name="링크 복사" data-sns="copy" href="#none">URL 복사<img
											src="https://res.kurly.com/mobile/service/goodsview/1804/ico_checked_x2.png"
											alt=""></a> </li>
								</ul>
							</div>
								</div>
							</div>

							<div id="sectionView">
								<div class="inner_view">
									<div class="thumb">
										<img src="${getItemPage.category_goods_image_thumb}" alt="상품 대표 이미지" class="bg"/>
									</div>
									<p class="goods_name">
										<span class="btn_share"><button id="btnShare">공유하기</button></span>
										<input type="hidden" name="category_goods_serial" value="${getItemPage.category_goods_serial}"/>
										
										<strong class="name">${getItemPage.category_goods_name}</strong>
										<span class="short_desc">${getItemPage.category_goods_name_subtext}</span>
									</p>
									<p class="goods_dcinfo">회원할인가</p>
									<p class="goods_price">
										<span class="position">
											<span class="dc"><!-- 할인된 가격 -->	
												<span class="dc_price">
													${fmDcPrice}
												</span>
												<span class="won">원</span>
												<span class="dc_percent">${getItemPage.goods_detail_dicountrate}<span class="per">%</span>
												</span>
											</span>
											<a class="original_price">
												<span class="price">${fmOldPrice}
													<span class="won">원</span>
												</span>
											</a>
										</span>
										<span class="not_login"> <!--적립금--> <span>로그인 후, 적립혜택이 제공됩니다.</span>
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
												${getItemPage.category_goods_packaging_type}<strong class="emph"> 
												택배배송은 에코포장시에는 스티로폼으로 대체됩니다. </strong>
											</dd>
										</dl>
										<!-- c:if문 적용되는 항목들 유통기한, 안내사항, 추가정보, 알레르기정보 -->
										<c:if test="${getItemPage.category_goods_exp_date != null && getItemPage.category_goods_exp_date != ''}">
										<dl class="list">
											<dt class="tit">유통기한</dt>
											<dd class="desc">${getItemPage.category_goods_exp_date}</dd>
										</dl>
										</c:if>
										<c:if test="${getItemPage.category_goods_info != null && getItemPage.category_goods_info != ''}">
											<dl class="list">
												<dt class="tit">안내사항</dt>
												<dd class="desc">
												<c:forEach var="goodsInfo" items="${fn:split(getItemPage.category_goods_info,'-') }">
													-${goodsInfo}<br>
												</c:forEach>
												</dd>
											</dl>
										</c:if>
										<c:if test="${getItemPage.category_goods_ref != null && getItemPage.category_goods_ref != ''}">
										<dl class="list">
											<dt class="tit">추가정보</dt>
											<dd class="desc">
												<span class="txt">${getItemPage.category_goods_ref}</span>
											</dd>
										</dl>
										</c:if>
										<c:if test="${getItemPage.category_goods_allergy != null && getItemPage.category_goods_allergy != ''}">
										<dl class="list">
											<dt class="tit">알레르기정보</dt>
											<dd class="desc">
												${getItemPage.category_goods_allergy}
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
                											<input type="hidden" class="hprice"/>
															<input type="hidden" class="hdiscount"/>
															<input type="hidden" class="hserial" name="category_goods_serial" value=""/>
												<span class="count">
													<input type="button" class="btn down on" onclick="javascript:quantity(-1)" value="수량내리기"/>
												    <input type="number" value="1" name="goods_cart_count" readonly="readonly" onfocus="this.blur()" class="inp">
												    <input type="button" class="btn up on" onclick="javascript:quantity(1)" value="수량올리기"/>
												</span> 
											</div>
										</li>
									</ul>
								</div>
									<div class="total">
										<div class="price">
											<!---->
											<strong class="tit">총 상품금액 :</strong> 
											<span class="sum">
												<span class="num">${fmDcPrice }</span>	
												<span class="won">원</span>
											</span> 
										</div>
<!-- 수량따라 금액 올라가게 처리필  -->
										<p class="txt_point">
											<span class="ico">적립</span>
											<c:if test="${membership != null }">
												<span class="point"> 구매 시 <strong class="emph">${afterReserves }원 적립</strong></span>
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
									<span class="btn_type1">
												<input type="button" class="txt_type" value="장바구니 담기" onclick="javascript:inputCart()"/> <!---->
											</span>
										</div>
								<!---->	
							</div>
						</form>
					</div>
		
							
		<!-- 이너, 상품 선택 click으로 숨기기 보이기  -->
<!-- 				<div class="wrap"> -->
					<div class="cart_option cartList cart_type1 on" style="">
						<form name="cartInput" action="cartInput.do">
							<div class="inner_option">
								<div class="in_option">
									<div class="list_goods">
									<!-- ------------------------------------ -->
										<div class="bar_open">
										<a href=#none data-child-id="show0" class="asked" 
											onclick= "if(hide0.style.display=='none'){hide0.style.display='';} else {hide0.style.display='none';}">
											<button type="button" class="btn_close">
												<span class="ico open">상품 선택</span>
											</button>
										</a>
										</div>
								<div id="hide0" style="display:none"> 										
										<ul class="list list_nopackage">
											<li class="on">
												<span class="btn_position">
													<button type="button" class="btn_del">
														<span class="txt">삭제하기</span>
													</button>
														</span>
													
													<span class="name"> <!---->
													${getItemPage.category_goods_name} <!---->
											</span> <!---->
											
												<div class="option">			
												 	<input type="hidden" class="hprice"/>
												    <input type="hidden" class="hdiscount"/>
												    <input type="hidden" class="hserial" name="category_goods_serial" value=""/>	
												<span class="count">
													<input type="button" class="btn down on" onclick="javascript:quantity(-1)" value="수량내리기"/>
												    <input type="number" value="1" name="goods_cart_count" readonly="readonly" onfocus="this.blur()"  class="inp">
												    <input type="button" class="btn up on" onclick="javascript:quantity(1)" value="수량올리기"/>
												</span> 
													
													 <span class="price" >
														<span class="dc_price">${lastPrice}원</span>
														<span class="original_price">${getItemPage.goods_detail_price}원</span>
													</span>
												</div>
											</li>
										</ul>
					
									<div class="total">
										<div class="price">
											<!---->
											<strong class="tit">총 상품금액 :</strong>
									<!-- 수량따라 금액 올라가게 처리필  -->													
											<span class="sum"><span class="num"></span> 
											<span class="won">원</span></span>
										</div>
										
										<p class="txt_point">
											<span class="ico">적립</span>
											<!---->
											<span class="point"> 구매 시 <strong class="emph">${afterReserves }원 적립</strong></span>
										</p>
									</div>
								
								<div class="group_btn">
									<div class="view_function">
										<button type="button" class="btn btn_alarm">재입고 알림</button>
									</div>
									<span class="btn_type1">
										<input type="button" class="txt_type" value="장바구니 담기" onclick="javascript:inputCart()"/> <!---->
									</span>
								</div>
											
										</div> <!-- hide0 -->
										
									</div>
								</div>
							</div>	
						</form> 
					</div>
						<form name="frmBuyNow" method="post"
							action="/shop/order/order.php">
							<input type="hidden" name="mode" value="addItem"> 
							<input type="hidden" name="goodsno" value="">
						</form>
						<form name="frmWishlist" method="post"></form>
					</div>
<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->
					<!-- 놓치면 후회할 가격 -->
						
						<div class="layout-wrapper goods-view-area">
				
							<script src="/resources/js/autoslider.js"></script>
							<div class="goods-add-product">
								<h3 class="goods-add-product-title">RELATED PRODUCT</h3>
								<div class="goods-add-product-wrapper __slide-wrapper" data-slide-item="5">
									<button class="goods-add-product-move goods-add-product-move-left __slide-go-left"
										>왼쪽으로 슬라이드 이동</button>
									<button class="goods-add-product-move goods-add-product-move-right __slide-go-right"
										>오른쪽으로 슬라이드 이동</button>
									<div class="goods-add-product-list-wrapper" style="height: 320px">
										
										<!-- 하위 제품 목록 표시 -->
										<ul class="goods-add-product-list __slide-mover">
										 <c:forEach var="categoryItemPage" items="${getCategoryItemPage }" > 
											<li class="goods-add-product-item __slide-item">
												<div class="goods-add-product-item-figure">
													<a href="#" onclick="KurlyTrackerLink('../goods/goods_view.php?goodsno=3327', 'select_related_product', {origin_price: 5400, package_id: 3327, package_name: '[남향푸드] 우리밀 또띠아 (냉동)'}, {openWindow: true})">
														<img src="//img-cf.kurly.com/shop/data/goods/1486128824798m0.jpg"
														class="goods-add-product-item-image"
														onerror="this.src='https://res.kurly.com/mobile/service/common/bg_1x1.png'">
													</a>
												</div>
												
												<div class="goods-add-product-item-content">
													<form class="goods-add-product-item-content-wrapper">
														<input type="hidden" class="categorySubSerial" value="${categoryItemPage.category_sub_serial}"/>
														<input type="hidden" class="categoryGoodsSerial" value="${categoryItemPage.category_goods_serial}"/>
														
														<p class="goods-add-product-item-name" style="right">${categoryItemPage.category_goods_name}</p>
														<p class="goods-add-product-item-price" style="right">${categoryItemPage.goods_detail_price}원</p>
													</form>
												</div>
											
											</li>
										</c:forEach>
										</ul>
								
								</div>			
							</div>
						</div>
					
			
							<div class="goods-view-infomation detail_wrap_outer" id="goods-view-infomation">
						
								<div class="goods-view-tab">
								<nav>
									<ul class="goods-view-infomation-tab-group">
										<li class="goods-view-infomation-tab">
										<a href="#goods-description" class="goods-view-infomation-tab-anchor __active">상품상세정보</a></li>
										<li class="goods-view-infomation-tab">
										<a href="#why-kurlyty" class="goods-view-infomation-tab-anchor">Why Kurylty</a></li>
										<li class="goods-view-infomation-tab goods-view-review-tab">
										<a href="#goods-review" class="goods-view-infomation-tab-anchor">후기
												<span class="count_review">XXXXXXXXXX</span></a></li>

										<li class="goods-view-infomation-tab qna-show">
										<a href="#goods-qna" class="goods-view-infomation-tab-anchor">문의</a></li>
									</ul>
								</nav>
								</div>
							</div>
	
<!--   상품설명 -->
					<div class="all">
					
						<div class="goods-view-infomation-content __active" id="goods-description">

							<!-- 상세이미지 -->
									<div class="goods_wrap">
										<div class="goods_intro">
											<div class="pic">
												<h1>상세 메인 넣기 S3</h1>
											<!-- 	<img src="${category_goods_image_detail_header}"/> -->
												<img src="//img-cf.kurly.com/shop/data/goodsview/20210308/gv30000163362_1.jpg">
												<!-- 위의 사진은 테스트용 삭제예정 -->
											</div>
											
									<div class="daily_desc">
										<div class="daily_box">
											<strong class="daily_goodsTit">
											    <span>${category_goods_detail_name2} 이것이 배추다 ! 알이 꽉 찬 한국인의 힘 !</span>
											      ${category_goods_detail_name1} "맛있는 김치용 배추"</strong>
										 <p class="words">${ category_goods_detail_name_subtext} 
										 "물건에 대한 상세설명입니다. 물건에 대한 상세설명입니다. 물건에 대한 상세설명입니다. 물건에 대한 상세설명입니다. 
										 물건에 대한 상세설명입니다. 물건에 대한 상세설명입니다. 물건에 대한 상세설명입니다. 물건에 대한 상세설명입니다. 
										 물건에 대한 상세설명입니다. 물건에 대한 상세설명입니다. 물건에 대한 상세설명입니다. 물건에 대한 상세설명입니다. 
										 물건에 대한 상세설명입니다. 물건에 대한 상세설명입니다. 물건에 대한 상세설명입니다. 물건에 대한 상세설명입니다. "</p>
										
										 
									 <div class="pic">
												<h1>상세 메인 넣기 S3</h1>
												<img src="${category_goods_image_detail_main}"/>
												<img src="//img-cf.kurly.com/shop/data/goodsview/20210308/gv30000163362_1.jpg">
												<!-- 위의 사진은 테스트용 삭제예정 -->
											</div>
										 </div>
									 </div>
							</div>
					</div>
							
									<div id="why-kurlyty"  class="whykurly_area">
										<div class="row">
											<strong class="tit_whykurly">WHY KURLYTY</strong>
											<div id="why_kurly" class="txt_area">
												<div class="why-kurly">
													<div class="col">
														<div class="icon">
															<img src="https://res.kurly.com/pc/ico/1910/01_check.svg">
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
															<img src="https://res.kurly.com/pc/ico/1910/04_price.svg">
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
												아래 중 편하신 방법으로 접수해 주시면<span class="bar"></span> 빠르게 도와드리겠습니다.
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
											onclick= "if(hide.style.display=='none'){hide.style.display='';} else {hide.style.display='none';}"> 
											<span class="txt">자세히보기</span> 
											<img src="https://res.kurly.com/pc/ico/2001/pc_arrow_close@2x.png" alt="아이콘" class="ico">
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
												<strong class="subject no_padding">신선 / 냉장 / 냉동 식품</strong>
												<p class="desc">
													재판매가 불가한 상품의 특성상, <span class="bar_m"></span>단순 변심, 주문 착오 시
													<span class="bar_m"></span>교환 및 반품이 어려운 점 양해 부탁드립니다.
												</p>
												<p class="space"></p>
												<p class="desc">
													상품에 따라 조금씩 맛이 다를 수 있으며, <span class="bar_m"></span>개인의 기호에
													따라 같은 상품도 다르게 <span class="bar_m"></span>느끼실 수 있습니다.
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
													다음에 해당하는 교환·환불 신청은 <span class="bar_m"></span>처리가 어려울 수 있으니
													양해 부탁드립니다.
												</p>
												<ul class="list_questions">
													<li>고객님의 책임 있는 사유로 상품이 멸실되거나 훼손된 경우 <span
														class="bar_m bar_pc"></span>(단, 상품의 내용을 확인하기 위해 포장 등을 훼손한
														경우는 제외)
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
													<li><strong class="emph">- [입금 확인] 단계</strong> 마이컬리 주문 내역 상세페이지에서 직접 취소하실 수 있습니다.</li>
													<li><strong class="emph">- [입금 확인] 이후 단계</strong> 고객행복센터로 문의해주세요.</li> 
													<li><strong class="emph"> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;&ensp;
													 - 결제 승인 취소 / 환불</strong> 결제 수단에 따라 영업일 기준 3~7일 내에 처리해드립니다.</li>
													
													</ul>
									
												<a href="#none" data-child-id="show2" class="asked" 
												onclick="if(hide2.style.display=='none'){hide2.style.display='';} else {hide2.style.display='none';}">
												<span class="txt" data-open="자세히보기" data-close="닫기">자세히보기</span> 
											<img src="https://res.kurly.com/pc/ico/2001/pc_arrow_close@2x.png" alt="아이콘" class="ico">
											</a>
										</div>
											<div id="hide2" style="display: none"> 
										<div class="happy_faq">
												<span class="item">주문 취소 관련</span>
												<div class="questions hide">
													<p class="desc">- [상품 준비 중] 이후 단계에는 취소가 제한되는 점 고객님의 양해
														부탁드립니다.</p>
													<p class="desc">- 비회원은 모바일 App / Web &gt; 마이컬리 &gt; 비회원
														주문 조회 페이지에서 주문을 취소하실 수 있습니다.</p>
													<p class="desc">- 일부 예약 상품은 배송 3~4일 전에만 취소하실 수 있습니다.</p>
													<p class="desc">- 주문 상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매해
														주세요.</p>
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
											<p class="sub">배송 과정 중 기상 악화 및 도로교통 상황에 따라 부득이하게 지연 배송이
												발생될 수 있습니다.</p>
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

																					<input type="hidden" name="index" value="2">
																					<input type="hidden" name="image" value="true">
																					<input type="hidden" name="grade" value="2">
																					<input type="hidden" name="best" value="true">
																					<input type="hidden" name="pNo" value="">

																					<td align="center">BEST</td>
																					<td class="subject">
																						<div class="fst">
																							진짜 대박입니다 <img
																								src="https://res.kurly.com/pc/ico/1910/ico_attach2.gif"
																								alt="이미지가 첨부됨">
																						</div>
																						<div class="snd">
																							진짜 대박입니다 <img
																								src="https://res.kurly.com/pc/ico/1910/ico_attach2.gif"
																								alt="이미지가 첨부됨">
																						</div>
																					</td>
																					<td class="user_grade grade_comm"><span
																						class="ico_grade grade2"> 라벤더 </span></td>
																					<td class="user_grade">손*라</td>
																					<td class="time">2018-11-23</td>
																					<td><span class="review-like-cnt"
																						data-sno="1718066">0</span></td>
																					<td><span class="review-hit-cnt"
																						data-sno="1718066">3164</span></td>
																				</tr>
																			</tbody>
																		</table>
																		<div data-sno="1718066" class="review_view">
																			<div class="inner_review">
																				<div class="name_purchase">
																					<strong class="name">[존쿡 델리미트] 바베큐 백립 450g
																						(냉동)</strong>
																					<p class="package"></p>
																				</div>
																				<div class="review_photo"></div>
																				평소에 립 먹고싶어서 먹으면 항상 후회해요 <br> 고기냄새나고 짜고 질기고 ㅜㅜ <br>
																				먹고나서 후회하고 항상 반복 ㅜㅜ<br> 후기 좋기도하고 존쿡이라 믿고 구매했는데
																				진짜 대박입니다<br> 전 오븐에서 조리했어요<br> 엄청 부드럽고 냄새도
																				전혀 안났어요<br> 그리고 젤 좋았던점이 짜지않아서 정말 좋았어요<br>
																				바베큐 양념자체가 짜지않고 그냥 딱 맛있는 양념이네요 <br> 넘넘 맛있어서 추가로
																				두개나 더 구매했어요<br> 손님올때 이거 내면 진짜 대박일듯해요^^
																			</div>
																			<div class="goods-review-grp-btn">
																				<button type="button"
																					class="styled-button review-like-btn"
																					data-sno="1718066"
																					onclick="review_like('1718066',$(this));">
																					도움이 돼요 <span class="num">0</span>
																				</button>
																			</div>
																		</div>
																	</div>
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

																					<input type="hidden" name="index" value="5">
																					<input type="hidden" name="image" value="true">
																					<input type="hidden" name="grade" value="0">
																					<input type="hidden" name="best" value="true">
																					<input type="hidden" name="pNo" value="">

																					<td align="center">BEST</td>
																					<td class="subject">
																						<div class="fst">
																							존쿡 바베큐 백립 달달한데 맛있어요! 살이 부들부... <img
																								src="https://res.kurly.com/pc/ico/1910/ico_attach2.gif"
																								alt="이미지가 첨부됨">
																						</div>
																						<div class="snd">
																							존쿡 바베큐 백립 달달한데 맛있어요! 살이 부들부들~~ <img
																								src="https://res.kurly.com/pc/ico/1910/ico_attach2.gif"
																								alt="이미지가 첨부됨">
																						</div>
																					</td>
																					<td class="user_grade grade_comm"></td>
																					<td class="user_grade">김*영</td>
																					<td class="time">2018-03-21</td>
																					<td><span class="review-like-cnt"
																						data-sno="650380">2</span></td>
																					<td><span class="review-hit-cnt"
																						data-sno="650380">1643</span></td>
																				</tr>
																			</tbody>
																		</table>
																		<div data-sno="650380" class="review_view">
																			<div class="inner_review">
																				<div class="name_purchase">
																					<strong class="name">[존쿡 델리미트] 바베큐 백립 450g
																						(냉동)</strong>
																					<p class="package"></p>
																				</div>
																				<div class="review_photo"></div>
																				<br> 라이너스 립바베큐 먼저 주문해서 먹어보구 이번엔 존쿡꺼 주문해서 먹어봤어요~<br>
																				두가지를 다 먹어본 결과! 존쿡 백립은 어린 송아지같은 느낌~ <br> 야들야들하게
																				고기가 부드럽고 소스가 좀 달달했어요. <br> 저희는 벨지안 모듬감자튀김이랑
																				자몽딸기샐러드 자몽샹그리아까지 해서 같이 먹었는데 <br> 양이 조금
																				적더라구요^^;;; 너무 맛있어서 그런지 더 먹고 싶어서 아쉬웠다는ㅠㅠㅠ<br>
																				라이너스는 양이 진짜 많아요 쉽게 말해서 미국 스타일이라고나 할까?ㅎㅎ 막 점보사이즈같이 립이
																				두껍구 뼈도 굵어요. 양도 많고!<br> 이렇게 비교를 해봐도~ 두 제품은 가격차이가
																				꽤 많이 나니 양이나 이런건 필요한만큼 조절해서 구매하면 될것 같아요.^^<br>
																				존쿡 립의 특징은 아이들도 좋아할만한 한국스타일~~~ 아이 있는 집은 존쿡 추천합니다! 백퍼
																				적중할 것 같아요. ㅎㅎ<br> 양이 좀 애매하게 아쉬웠다는.... ㅠㅠ 다음번엔
																				사이드 가니쉬를 좀 더 많이 하거나 아니면 <br> 립을 그냥 두개 사서 오븐에 같이
																				구워버릴려구요ㅎㅎㅎㅎ 1인1립으로다가ㅎㅎㅎ<br> <br>
																			</div>
																			<div class="goods-review-grp-btn">
																				<button type="button"
																					class="styled-button review-like-btn"
																					data-sno="650380"
																					onclick="review_like('650380',$(this));">
																					도움이 돼요 <span class="num">2</span>
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
																페이지로 가기</a><strong
																class="layout-pagination-button layout-pagination-number __active">1</strong><a
																href="/shop/goods/goods_review_list.php?goodsno=5051&amp;page=2"
																class="layout-pagination-button layout-pagination-number">2</a><a
																href="/shop/goods/goods_review_list.php?goodsno=5051&amp;page=3"
																class="layout-pagination-button layout-pagination-number">3</a><a
																href="/shop/goods/goods_review_list.php?goodsno=5051&amp;page=4"
																class="layout-pagination-button layout-pagination-number">4</a><a
																href="/shop/goods/goods_review_list.php?goodsno=5051&amp;page=5"
																class="layout-pagination-button layout-pagination-number">5</a><a
																href="/shop/goods/goods_review_list.php?goodsno=5051&amp;page=6"
																class="layout-pagination-button layout-pagination-number">6</a><a
																href="/shop/goods/goods_review_list.php?goodsno=5051&amp;page=7"
																class="layout-pagination-button layout-pagination-number">7</a><a
																href="/shop/goods/goods_review_list.php?goodsno=5051&amp;page=8"
																class="layout-pagination-button layout-pagination-number">8</a><a
																href="/shop/goods/goods_review_list.php?goodsno=5051&amp;page=9"
																class="layout-pagination-button layout-pagination-number">9</a><a
																href="/shop/goods/goods_review_list.php?goodsno=5051&amp;page=10"
																class="layout-pagination-button layout-pagination-number">10</a><a
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
															<div class="inquiry-board-header" style="table-layout:fixed;">
																<div style="width: 710px;">제목</div>
																<div>작성자</div>
																<div>작성일</div>
																<div>답변상태</div>
															</div>
															<!-- <ul class="inquiry-notice-list">
																<li class="inquiry-item notice-item"><div
																		class="item-cell notice-cell">
																		<span>공지 -</span><strong> 판매 (일시)중단 제품 안내 (21.11.12 업데이트)</strong>
																	</div>
																	<div class="item-cell">
																		<p class="txt_sub text_medium normal ">Marketkurly</p>
																	</div>
																	<div class="item-cell">
																		<p class="txt_sub text_medium normal ">2021.11.12</p>
																	</div>
																	<div class="item-cell">
																	<p class="txt_sub kurlyPurple normal ">공지사항</p>
																	</div>
																</li>
															</ul> -->
															
										<c:forEach var="goodsqnalist" items="${goodsqnalist}">
											<input type="hidden" name="category_goods_serial" value="${goodsqnalist.category_goods_serial}" />
											<input type="hidden" name="qna_goods_answer_date" value="${goodsqnalist.qna_goods_answer_date}" />
											
															<ul class="board-list">
																<li class="inquiry-item">
																	<div class="product-detail ">
																		<strong>${goodsqnalist.qna_goods_title}</strong>
																	</div>
																	<div class="item-cell">
																		<p class="txt_sub text_medium normal">${goodsqnalist.user_name}</p>
																	</div>
																	<div class="item-cell">
																		<p class="txt_sub text_medium normal"><fmt:formatDate value="${goodsqnalist.qna_goods_date}" pattern="yyyy-mm-dd"/></p>
																	</div>
																	<div class="item-cell">
																		<p class="txt_sub kurlyPurple normal">${goodsqnalist.qna_goods_answer_status}</p>
																	</div>
																</li>
																	<li class="inquiry-item-expand " style="align:center; display:block; width:100%;"> 
																		
																<c:if test="${goodsqnalist.qna_goods_answer_date == null}">
																	<div class="expand-question">
																			<span class="icon-question"><span>질문</span></span>
																			<p>
																				<span>${goodsqnalist.qna_goods_title} </span>
																			</p><br><br>
																		
																		<div class="inquiry-content-footer">
																			<input type="button" class="bhs_button yb" value="수정" onclick="javascript:div_show_update()" style="align:center; line-height: 25px; width: 60px;">
																			<input type="button" class="bhs_button yb" value="삭제" onclick="location.href='deleteGoodsQna.do?qna_goods_serial=${goodsqnalist.qna_goods_serial}&category_goods_serial=${goodsqnalist.category_goods_serial}'" style="align:center; line-height: 25px; width: 60px;">
																		<br><br><!-- -->
																		</div>
																	</div>
																</c:if>
																		<!--  답변이 없을 때 !  -->
																	<c:if test="${goodsqnalist.qna_goods_answer_date != null}">	 
																		<div class="expand-question">
																			<span class="icon-question"><span>질문</span></span>
																			<p>
																				<span>${goodsqnalist.qna_goods_title} </span>
																			</p><br>
																		</div>
																		<div class="expand-answer">
																			<span class="icon-answer"><span>답변</span></span>
																			<p>Love food, Love life!<br>
																				${goodsqnalist.qna_goods_answer}
																				<br>혹여 컬리 이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우<br>언제든
																				컬리 고객행복센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다.<br>
																				<br>마켓컬리 드림.
																			</p>	
																			<span class="created-time">${goodsqnalist.qna_goods_answer_date}</span>
																		
																		</div>
																	</c:if>	
																</li>
															</ul>
											</c:forEach> 
													
													<!-- <ul>
																<li class="inquiry-item"><div
																		class="product-detail is-secret">
																		<strong>비밀글입니다.</strong><span class="icon-secret"><span
																			class="screen_out">비밀글</span></span>
																	</div>
																	<div class="item-cell">
																		<p class="txt_sub text_medium normal ">노*석</p>
																	</div>
																	<div class="item-cell">
																		<p class="txt_sub text_medium normal ">2021.08.06</p>
																	</div>
																	<div class="item-cell">
																		<p class="txt_sub kurlyPurple normal ">답변완료</p>
																	</div></li>
															</ul>
 																		-->
															<div class="board-inquiry-area">
																<div class="paging-navigation">
																	<button type="button" class="paging-prev" disabled="disabled">
																		<span>이전</span>
																	</button>
																	<button type="button" class="paging-next">
																		<span>다음</span>
																	</button>
																</div>
																<!--  문의 하기 버튼 누르면 창을 띄움.  -->
																<button class="btn active"
																	onclick="javascript:div_show()">
																	<span>문의하기</span>
																</button>
															</div>

														</div>
													</div>
												</div>
											</div>


											<div class="modal-container" id="write_div" style="display:none;">
												<form name="insert" id="insertgoodsqna" method="post" style="height: 100%;" action="insertGoodsQna.do">
													<input type="hidden" name="user_id" value="${userId}">
													<input type="hidden" name="user_name" value="${userName}">
													<input type="hidden" name="category_main_serial" value="${getItemPage.category_main_serial}"/>
													<input type="hidden" name="category_sub_serial" value="${getItemPage.category_sub_serial}"/>
													<input type="hidden" name="category_goods_serial" value="${getItemPage.category_goods_serial}"/>
													<input type="hidden" name="category_goods_name" value="${getItemPage.category_goods_name}"/>
													<input type="hidden" name="category_goods_image_thumb" value="${getItemPage.category_goods_image_thumb}"/>
										
													<div class="dimmed-layer">
														<div class="inner-layer">
															<div class="inquiry-modal" style="margin-bottom: 20px; margin-top: 20px;">												
																<div class="modal-header">
																	<strong>상품 문의하기</strong>
																	<button type="button" class="btn-close" onclick="location.href='itemPage.do?category_goods_serial=${getItemPage.category_goods_serial}'">
																		<span class="screen_out">닫기</span>
																	</button>
																</div>
													
																<div class="modal-body">
																	<div class="product-item">
																		<span class="frame-img" style="background-image: url(${getItemPage.category_goods_image_thumb});"></span>
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
																						<textarea name="qna_goods_content" maxlength="5000" placeholder="상품문의를 작성해주세요."></textarea>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="inquiry-row">
																			<span><span class="screen_out">비밀글 여부</span></span>
																			<div class="inquiry-cell">
																				<label class="check_agree label_block">
																				<input type="radio" name="qna_goods_lock" value="true"> <!-- 기본값 false -->
																				<span class="ico"></span>비밀글로 문의하기</label>
																			</div>
																		</div>
																	</div>
																</div>
													
																<div class="modal-footer">
																	<button type="button" class="btn normal" onclick="javascript:div_hide();">취소</button>
																
																	<button type="submit" class="btn active" onclick="insertGoodsQna.do">등록</button>
																	
																	<button type="submit" class="btn active" onclick="updateGoodsQna.do">수정</button>
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
				</div> <!-- layout-wrapper goods-view-area -->
			                                                       
<!-- <link rel="stylesheet" type="text/css" href="https://www.kurly.com/asset/css/product/inquiry/pc.bundle.css?ver=1.43.5"> -->


<div class="bg_loading" id="bgLoading">
<div class="loading_show"></div>
</div>

		</div>		<!-- content -->
		
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>   	<!-- main -->

	<!-- 이하 footer -->
	</div> <!-- Container -->
 </div><!-- Wrap -->
 </div>
<a href="#top" id="pageTop">맨 위로가기</a>


<script>
		$(".inquiry-item-expand")
				.click(
						function() {
							if ($(this).nextAll("tr:eq(0)").find(".sub").is(
									":visible")) {
								$(this).nextAll("tr:eq(0)").find(".sub").css(
										"display", "none");
							} else {
								$(this).nextAll("tr:eq(0)").find(".sub").css(
										"display", "table-cell");
							}
						})
	</script>
</body>
</html>