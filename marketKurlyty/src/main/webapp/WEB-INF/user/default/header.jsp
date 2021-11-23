<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
$(document).ready(function(){
	$.ajax({
		url:"categoryData.do",
		dataType:"JSON",
		beforeSend: function (xhr) {
            xhr.setRequestHeader("Content-type","application/json");
        },
		success:function(data){
			//var data=JSON.parse(res);
			for(key in data){
				var rink = "categoryItemPage.do?category_main_serial="+data[key].category_main_serial;
				$(".gnb_sub ul.gnb_menu").
				append("<li class="+data[key].category_main_serial+"><a href="+rink+" class='menu'><span class='icon'><img src='"+data[key].category_main_icon_black+"' class='icon_on'>"+
						"<img src='"+data[key].category_main_icon_color+"' class='icon_off'></span>"+
						"<span class='name'>"+data[key].category_main_name+"</span></a></li>");
				$(".gnb_sub ul.gnb_menu").find("li."+data[key].category_main_serial).append("<ul class='sub'></ul>");
				for(sub in data[key].data){
					var parentSerial = "categoryItemPage.do?category_main_serial="+data[key].category_main_serial+"&category_sub_serial="+data[key].data[sub].category_sub_serial;
					$("ul.gnb_menu li."+data[key].category_main_serial).find("ul").
					append("<li><a class='sub' href="+parentSerial+"><span>"+data[key].data[sub].category_sub_name).
					append("</span></a></li>")
				}
				$("#categoryMain li").mouseover(function(){
					$(this).css("background","#efebf0");
					$(this).find("img:eq(0)").attr("class","icon_off");
					$(this).find("img:eq(1)").attr("class","icon_on");
					$(this).find(".name").css("color","#8700a8");
					$(this).find("ul").attr("class", "sub_on");
					$(".gnb_sub").css("width","438");
					$("#categoryMain ul.sub_on").find("li").mouseover(function(){
						$(this).attr("class","on");
					});
					$("#categoryMain ul.sub_on").find("li").mouseleave(function(){
						$(this).attr("class","");
					});
				});
				$("#categoryMain li").mouseleave(function(){
					$(this).css("background","none");
					$(this).find("img:eq(0)").attr("class","icon_on");
					$(this).find("img:eq(1)").attr("class","icon_off");
					$(this).find(".name").css("color","black");
					$(this).find("ul").attr("class","sub");
					$(".gnb_sub").css("width","219");
					$("#categoryMain ul.sub_on").find("li").mouseover(function(){
						$(this).attr("class","on");
					});
					$("#categoryMain ul.sub_on").find("li").mouseleave(function(){
						$(this).attr("class","");
					});
				});
				$("#categoryMain ul.sub_on").mouseover(function(){
					$(this).attr("class","on");
				});
				$("#categoryMain ul.sub_on").mouseleave(function(){
					$(this).attr("class","");
				});
			}
		},
		error:function(res,error){
			alert(res);
			alert(error);
		}
		
	});
	$(".menu1").hover(function(){
		$(".gnb_sub").css("display","block");
	});
	$(".menu1").mouseleave(function(){
		$(".gnb_sub").css("display","none");
	});
	$(".gnb_sub").hover(function(){
		$(this).css("display","block");
	});
	$(".gnb_sub").mouseleave(function(){
		$(this).css("display","none");
	});
	
	$("#userMenu .menu_user").hover(function(){
		$(this).find(".sub").css("display","block").css("opacity","1");
		$(this).find(".sub").css("height","225px").css("z-index","200").css("position","absolute");
	});
	$("#userMenu .menu_user").mouseleave(function(){
		$(this).find(".sub").css("display","none");
	});
	$("#userMenu .lst").hover(function(){
		$(this).find(".sub").css("display","block").css("opacity","1");
		$(this).find(".sub").css("height","156px").css("z-index","200").css("position","absolute");
	});
	$("#userMenu .lst").mouseleave(function(){
		$(this).find(".sub").css("display","none");
	});
});

	
</script>
<style>
.icon_off {
	display: none;
}

.icon_on {
	display: block;
}

.gnb_sub ul.gnb_menu .icon {
	float: left;
	width: 24px;
	height: 24px;
}

.gnb_sub ul.gnb_menu .name{
	float: left;
	width: 140px;
	height: 24px;
	font-family: sans-serif;
	font-weight: bold;
	font-size: 13px;
	line-height: 1.7;
	margin-left:5px;
}

.gnb_sub ul.gnb_menu li {
	text-align: left;
}

ul.sub {
	position:absolute;
	z-index:0;
	left:200px;
	top:0px;
	width:248px;
	height:100%;
	padding: 0 0 0 20px;
	opacity:0;
	transition:opacity 0.2s;
}
ul.sub_on{
	position:absolute;
	z-index:1;
	left:200px;
	top:0px;
	width:248px;
	height:100%;
	padding: 0 0 0 20px;
	opacity:1;
	transition:opacity 0.5s;
}
.gnb_sub ul.gnb_menu li ul li {
	width: 100px;
	height: 24px;
	margin-left: 10px;
	font-family: sans-serif;
	font-weight: bold;
	font-size: 14px;
	line-height: 2;
}
ul.sub_on li.on{
	text-decoration:underline;
	color:#8700a8;
}
</style>
<div id="header">
	<!-- 헤더부분 -->
	
	<div class="bnr_header" id="top-message">
		<a
			href="https://www.kurly.com/shop/event/kurlyEvent.php?htmid=event/join/join_211006"
			id="eventLanding"> 지금 가입하고 인기상품 <b>100원</b>에 받아가세요!<img
			src="https://res.kurly.com/pc/ico/1908/ico_arrow_fff_84x84.png"
			class="bnr_arr">
			<div class="bnr_top">
				<div class="inner_top_close">
					<button id="top-message-close" class="btn_top_bnr">가입하고
						혜택받기</button>
				</div>
			</div>
		</a>

	</div>
	<!-- 우측 최상단 메뉴 -->
	<div id="userMenu">
		<ul class="list_menu">
			<c:if test="${userId eq null}">
				<li class="menu none_sub menu_join"><a
					href="join.do" class="link_menu">회원가입</a></li>
				<li class="menu none_sub menu_login"><a
					href="login.do" class="link_menu">로그인</a> <!----></li>
			</c:if>
			<c:if test="${userId != null}">
				<li class="menu menu_user"><a class="link_menu grade_comm" href="mykurly.do"><span
						class="ico_grade grade6">웰컴</span> <span class="txt"><span
							class="name">${userName }</span><span class="sir">님</span></span> <!----></a>
					<ul class="sub">
						<li><a href="order.do">주문 내역</a></li>
						<li><a href="#none"
							onclick="KurlyTrackerLink('/shop/mypage/mypage_gift.php', 'select_my_kurly_gift_list')">선물
								내역</a></li>
						<li><a href="user_address_list.do">배송지
								관리</a></li>
						<li><a href="/shop/mypage/mypage_review.php">상품 후기</a></li>
						<li><a>상품 문의</a></li>
						<li><a href="point.do">적립금</a>
							<!----></li>
						<li><a href="#none"
							onclick="KurlyTrackerLink('/shop/mypage/mypage_coupon.php', 'select_my_kurly_coupon_list', {selection_type: 'dropdown'})">쿠폰</a>
							<!----></li>
						<li><a href="infoModify1.do">개인 정보 수정</a></li>
						<li><a href="logoutProc.do">로그아웃</a></li>
					</ul></li>
			</c:if>
			<!---->
			<li class="menu lst"><a href="notice.do"
				class="link_menu">고객센터</a>
				<ul class="sub">
					<li><a href="notice.do">공지사항</a>
					</li>
					<li><a href="faq.do">자주하는
							질문</a></li>
					<li><a href="personalQnaBoard.do">1:1
							문의</a></li>
					<li><a href="#none"
						onclick="KurlyTrackerLink('/shop/main/html.php?htmid=mypage/bulk_order.htm', 'select_my_kurly_bulk_order')">대량주문
							문의</a></li>
					<li><a href="#none"
						onclick="KurlyTrackerLink('/shop/mypage/offer.php', 'select_my_kurly_product_offer')">상품
							제안</a></li>
					<li><a href="#none"
						onclick="KurlyTrackerLink('/shop/mypage/echo_packing.php', 'select_my_kurly_eco_packing_feedback')">에코포장
							피드백</a></li>
				</ul></li>
		</ul>
	</div>

	<div id="headerLogo" class="layout-wrapper">
		<h1 class="logo">
			<a href="index.do" class="link_main"> <span
				id="gnbLogoContainer"></span> <img src="${pageContext.request.contextPath }/resources/images/logo.png"
				alt="마켓컬리 로고">
			</a>
		</h1>
		<a href="/shop/board/view.php?id=notice&no=64"
			onclick="ga('send','event','etc','main_gif_btn_click');"
			class="bnr_delivery"> <img
			src="https://res.kurly.com/pc/service/common/2011/delivery_210801.png"
			alt="샛별, 택배 배송안내" width="121" height="22">
		</a>
	</div>
	<div id="gnb">
		<h2 class="screen_out">메뉴</h2>
		<div id="gnbMenu" class="gnb_kurly">
			<div class="inner_gnbkurly">
				<div class="gnb_main">
					<ul class="gnb">
						<li class="menu1" class="on"><a href="#none"><span
								class="ico"></span><span class="txt">전체 카테고리</span></a></li>
						<li class="menu2"><a class="link new "
							href="newItemPage.do"><span class="txt">신상품</span></a></li>
						<li class="menu3"><a class="link best " href="BestItemPage.do"><span
								class="txt">베스트</span></a></li>
						<li class="menu4"><a class="link bargain "
							href="altleShopping.do"><span class="txt">알뜰쇼핑</span></a></li>
						<li class="lst"><a class="link event "
							href="/shop/goods/event.php?&"><span class="txt">특가/혜택</span></a></li>
					</ul>
					<div id="side_search" class="gnb_search">
						<form action="/shop/goods/goods_search.php?&"
							onsubmit="return searchTracking(this)">
							<input type=hidden name=searched value="Y"> <input
								type=hidden name=log value="1"> <input type=hidden
								name=skey value="all"> <input type="hidden"
								name="hid_pr_text" value=""> <input type="hidden"
								name="hid_link_url" value=""> <input type="hidden"
								id="edit" name="edit" value=""> <input name="sword"
								type="text" id="sword" class="inp_search" value="" required
								label="검색어" placeholder="검색어를 입력해주세요."> <input
								type=image
								src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png"
								class="btn_search">
							<div class="init">
								<button type="button" class="btn_delete" id="searchInit">검색어
									삭제하기</button>
							</div>
						</form>

					</div>
					<div class="cart_count">
						<div class="inner_cartcount">
							<a href="cartPage.do" class="btn_cart"> <span
								class="screen_out">장바구니</span> <span
								class="num realtime_cartcount" id="cart_item_count"></span>
							</a>
						</div>
						<div id="addMsgCart" class="msg_cart">
							<span class="point"></span>
							<div class="inner_msgcart">
								<img src="https://res.kurly.com/images/common/bg_1_1.gif" alt=""
									class="thumb">
								<p id="msgReaddedItem" class="desc">
									<span class="tit"></span> <span class="txt"> 장바구니에 상품을
										담았습니다. <span class="repeat">이미 담으신 상품이 있어 추가되었습니다.</span>
									</span>
								</p>
							</div>
						</div>
					</div>
					<div class="location_set">
						<button type="button" class="btn_location on">배송지 설정하기</button>
						<div class="layer_location" style="display: none"></div>
					</div>
				</div>
				<div class="gnb_sub">
					<div class="inner_sub">
						<ul id="categoryMain"
							class="gnb_menu size_over" style="height: 200.833px;">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>