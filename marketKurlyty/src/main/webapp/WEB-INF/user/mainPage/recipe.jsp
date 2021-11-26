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
<script>
var index=1;
$(document).ready(function(){
	$("ul.banner").css("width","${(bannerCount+2)*1520}px")
	$("ul.banner").css("transition","1ms");
	$("ul.banner").css("transform","translate3d(-1520px,0px,0px)");
	
	$("button.bx-next").click(function(){
		console.log("fur:",index);
		index=index+1;
		var move = "translate3d(-"+String(1520*index)+"px,0px,0px)";
		$("ul.banner").css("transition","1000ms");
		$("ul.banner").css("transform",move);
		console.log("dd",index);
		if(index==${bannerCount+1}){
			index=1;
			setTimeout(function(){
				$("ul.banner").css("transition","1ms");
				$("ul.banner").css("transform","translate3d(-1520px,0px,0px)");
			},1000)
		}
	});
	$("button.bx-prev").click(function(){
		console.log("fur:",index);
		index=index-1;
		var move = "translate3d(-"+String(1520*index)+"px,0px,0px)";
		$("ul.banner").css("transition","1000ms");
		$("ul.banner").css("transform",move);
		
		console.log("dd",index);
		if(index-1<0){
			index=${bannerCount};
			setTimeout(function(){
				move = "translate3d(-"+String(${(bannerCount)*1520})+"px,0px,0px)";
				$("ul.banner").css("transition","1ms");
				$("ul.banner").css("transform",move);
			},1000)
			
		}
		
	});
	TSlide(4000);
})
function TSlide(time){
	
	setTimeout(function(){
		index=index+1;
		var move = "translate3d(-"+String(1520*index)+"px,0px,0px)";
		$("ul.banner").css("transition","1000ms");
		$("ul.banner").css("transform",move);
		if(index==${bannerCount+1}){
			index=1;
			setTimeout(function(){
				$("ul.banner").css("transition","1ms");
				$("ul.banner").css("transform","translate3d(-1520px,0px,0px)");
			},1000)
			TSlide(3000);
		}else{
			TSlide(4000);	
		}
	},time);
	
	
}
</script>
<style>
div.bx-controls-direction {
    position: relative;
    width: 1520px;
    margin: 0 auto;
}
button.bx-prev{
 position:absolute;
 	bottom: 220px;
    width: 52px;
    height: 52px;
	background: url(https://res.kurly.com/pc/service/main/1908/ico_prev1_x1.png) no-repeat 50% 50%;
    transition: opacity 0.5s;
    border:0;
    left:80px;
   
}
button.bx-next{
 position:absolute;
 	bottom: 220px;
    width: 52px;
    height: 52px;
	background: url(https://res.kurly.com/pc/service/main/1908/ico_next1_x1.png) no-repeat 50% 50%;
    transition: opacity 0.5s;
    border:0;
    right:80px;
}
</style>
<body class="main-index" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return !disableSelection">
	<a href="#top" id="gotoTop">맨 위로 가기</a>
	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
		
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			
			<div id="main">
				<div id="content">
				
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- sidemenu부분 -->
					<div class="page_aticle">
						<div id="lnbMenu" class="lnb_menu">
							<div class="inner_lnb">
								<div class="ico_cate">
									<span class="tit">레시피</span>
								</div>
								<ul class="list">
									<li><a class="on" id="no_anchor"
										href="/shop/board/list.php?&amp;id=recipe">전체보기</a></li>
									<li><a class="" href="?&amp;id=recipe&amp;subSpeech=매일밥상">매일밥상</a>
									</li>
									<li><a class="" href="?&amp;id=recipe&amp;subSpeech=특별한날">특별한날</a>
									</li>
									<li><a class="" href="?&amp;id=recipe&amp;subSpeech=간단요리">간단요리</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="layout-wrapper">
						<div id="recipe" class="wrap">
							<table width="100%" align="center">
								<tbody>
									<tr>
										<td>
											<form name="frmList" action="/shop/board/list.php?&amp;"
												onsubmit="return chkFormList(this)">
												<input type="hidden" name="id" value="recipe">
												<table width="100%" id="recipe_table">
													<tbody>
														<tr class="recipe_tr">
															<td align="left" valign="top">
																<div>
																	<ul>
																		<li class="recipe_item"><a
																			href="view.php?id=recipe&amp;no=429"> <img
																				src="//img-cf.kurly.com/shop/data/board/recipe/r/d672a4bd34f71680"
																				width="480" height="480"
																				onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																				<p class="tit_recipe">죽순 솥밥</p>
																		</a></li>
																	</ul>
																</div>
															</td>
															<td align="left" valign="top">
																<div>
																	<ul>
																		<li class="recipe_item"><a
																			href="view.php?id=recipe&amp;no=428"> <img
																				src="//img-cf.kurly.com/shop/data/board/recipe/r/4633715485024ed8"
																				width="480" height="480"
																				onerror="this.src=&quot;/shop/data/skin/designgj/board/gallery/img/noimg.gif&quot;">
																				<p class="tit_recipe">전복죽</p>
																		</a></li>
																	</ul>
																</div>
															</td>
														</tr>
														<tr class="recipe_tr">
														</tr>
													</tbody>
												</table>
												<!-- <div class="layout-pagination">
													<div class="pagediv">
														<a href="list.php?id=recipe&amp;page=1"
															class="layout-pagination-button layout-pagination-first-page">맨
															처음 페이지로 가기</a><a href="list.php?id=recipe&amp;page=1"
															class="layout-pagination-button layout-pagination-prev-page">이전
															페이지로 가기</a><strong
															class="layout-pagination-button layout-pagination-number __active">1</strong><a
															href="list.php?id=recipe&amp;page=2"
															class="layout-pagination-button layout-pagination-number">2</a><a
															href="list.php?id=recipe&amp;page=3"
															class="layout-pagination-button layout-pagination-number">3</a><a
															href="list.php?id=recipe&amp;page=4"
															class="layout-pagination-button layout-pagination-number">4</a><a
															href="list.php?id=recipe&amp;page=5"
															class="layout-pagination-button layout-pagination-number">5</a><a
															href="list.php?id=recipe&amp;page=6"
															class="layout-pagination-button layout-pagination-number">6</a><a
															href="list.php?id=recipe&amp;page=7"
															class="layout-pagination-button layout-pagination-number">7</a><a
															href="list.php?id=recipe&amp;page=8"
															class="layout-pagination-button layout-pagination-number">8</a><a
															href="list.php?id=recipe&amp;page=9"
															class="layout-pagination-button layout-pagination-number">9</a><a
															href="list.php?id=recipe&amp;page=10"
															class="layout-pagination-button layout-pagination-number">10</a><a
															href="list.php?id=recipe&amp;page=2"
															class="layout-pagination-button layout-pagination-next-page">다음
															페이지로 가기</a><a href="list.php?id=recipe&amp;page=32"
															class="layout-pagination-button layout-pagination-last-page">맨
															끝 페이지로 가기</a>
													</div>
												</div> -->
											</form>
										</td>
									</tr>
								</tbody>
							</table>
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