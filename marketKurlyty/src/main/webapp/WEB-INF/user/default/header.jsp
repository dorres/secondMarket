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
		$(this).find(".sub").css("height","200px").css("z-index","200").css("position","absolute");
	});
	$("#userMenu .menu_user").mouseleave(function(){
		$(this).find(".sub").css("display","none");
	});
	$("#userMenu .lst").hover(function(){
		$(this).find(".sub").css("display","block").css("opacity","1");
		$(this).find(".sub").css("height","86px").css("z-index","200").css("position","absolute");
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
	height: 25px;
	margin-left: 10px;
	margin-top:2px;
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
	<!-- ???????????? -->
	
	<div class="bnr_header" id="top-message">

	</div>
	<!-- ?????? ????????? ?????? -->
	<div id="userMenu">
		<ul class="list_menu">
			<c:if test="${userId eq null}">
				<li class="menu none_sub menu_join"><a
					href="join.do" class="link_menu">????????????</a></li>
				<li class="menu none_sub menu_login"><a
					href="login.do" class="link_menu">?????????</a> <!----></li>
			</c:if>
			<c:if test="${userId != null}">
				<li class="menu menu_user"><a class="link_menu grade_comm" href="order.do"><span
						class="ico_grade grade6">??????</span> <span class="txt"><span
							class="name">${userName }</span><span class="sir">???</span></span> <!----></a>
					<ul class="sub">
						<li><a href="order.do">?????? ??????</a></li>
						<li><a href="user_address_list.do">?????????
								??????</a></li>
						<li><a href="review.do">?????? ??????</a></li>
						<li><a href="goodsQna.do">?????? ??????</a></li>
						<li><a href="point.do">?????????</a>
							<!----></li>
						<li><a href="couponPage.do">??????</a>
							<!----></li>
						<li><a href="infoModify1.do">?????? ?????? ??????</a></li>
						<li><a href="logoutProc.do">????????????</a></li>
					</ul></li>
			</c:if>
			<!---->
			<li class="menu lst"><a href="notice.do"
				class="link_menu">????????????</a>
				<ul class="sub">
					<li><a href="notice.do">????????????</a>
					</li>
					<li><a href="faq.do">????????????
							??????</a></li>
					<li><a href="personalQnaBoard.do">1:1??????</a>
					</li>
				</ul>
			</li>
		</ul>
	</div>

	<div id="headerLogo" class="layout-wrapper">
		<h1 class="logo">
			<a href="index.do" class="link_main"> <span
				id="gnbLogoContainer"></span> <img src="${pageContext.request.contextPath }/resources/images/logo.png"
				alt="???????????? ??????">
			</a>
		</h1>
		<a href="/shop/board/view.php?id=notice&no=64"
			onclick="ga('send','event','etc','main_gif_btn_click');"
			class="bnr_delivery"> <img
			src="https://res.kurly.com/pc/service/common/2011/delivery_210801.png"
			alt="??????, ?????? ????????????" width="121" height="22">
		</a>
	</div>
	<div id="gnb">
		<h2 class="screen_out">??????</h2>
		<div id="gnbMenu" class="gnb_kurly">
			<div class="inner_gnbkurly">
				<div class="gnb_main">
					<ul class="gnb">
						<li class="menu1" class="on"><a href="#none"><span
								class="ico"></span><span class="txt">?????? ????????????</span></a></li>
						<li class="menu2">
							<a class="link new "
								href="newItemPage.do?sort=0">
								<span class="txt">?????????</span>
							</a>
						</li>
						<li class="menu3">
							<a class="link best " href="BestItemPage.do?sort=0">
								<span class="txt">?????????</span>
							</a>
						</li>
						<li class="menu4"><a class="link bargain "
							href="altleItemPage.do?sort=0"><span class="txt">????????????</span></a></li>
						<li class="lst"><a class="link event "
							href="recipeItemPage.do"><span class="txt">?????????</span></a></li>
					</ul>
					<div id="side_search" class="gnb_search">
						<form action="searchItemPage.do">
							<input name="searchKeyword"	type="text" id="sword" class="inp_search" value="" required
							label="?????????" placeholder="???????????? ??????????????????.">
							<input type="image"
								src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png"
								class="btn_search">
							<div class="init">
								<button type="button" class="btn_delete" id="searchInit">?????????
									????????????</button>
							</div>
						</form>

					</div>
					<div class="cart_count">
						<div class="inner_cartcount">
							<a href="cartPage.do" class="btn_cart"> <span
								class="screen_out">????????????</span> <span
								class="num realtime_cartcount" id="cart_item_count"></span>
							</a>
						</div>
						<div id="addMsgCart" class="msg_cart">
							<span class="point"></span>
							<div class="inner_msgcart">
								<img src="https://res.kurly.com/images/common/bg_1_1.gif" alt=""
									class="thumb">
								<p id="msgReaddedItem" class="desc">
									<span class="tit"></span> <span class="txt"> ??????????????? ?????????
										???????????????. <span class="repeat">?????? ????????? ????????? ?????? ?????????????????????.</span>
									</span>
								</p>
							</div>
						</div>
					</div>
					<div class="location_set">
						<button type="button" class="btn_location on">????????? ????????????</button>
						<div class="layer_location" style="display: none"></div>
					</div>
				</div>
				<div class="gnb_sub">
					<div class="inner_sub">
						<ul id="categoryMain"
							class="gnb_menu size_over" style="height: 300.833px;">
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>