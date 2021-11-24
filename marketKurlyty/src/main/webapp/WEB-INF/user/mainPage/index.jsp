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
					
					<div id="kurlyMain" class="page_aticle page_main"
						style="width: 100%;">
						<div id="shellMain"
							style="width: 100%; height: 325px; margin-bottom: 80px; overflow: hidden; background: #eee;">
							<ul class="banner">
								<li class="banner" id="${bannerCount }" style="width:1520px; height: 325px; float:left;">
									<img src="${banners[bannerCount-1].banner_filepath}"
										style="width: 100%; height: 100%; object-fit: cover">
								</li>
								<c:forEach var="banner" items="${banners }" varStatus="index">
									<li class="banner" id="${index.index }" style="width:1520px; height: 325px; float:left;">
										<img src="${banner.banner_filepath}"
										style="width: 100%; height: 100%; object-fit: cover">
									</li>
								</c:forEach>
								<li class="banner" id="0" style="width:1520px; height: 325px; float:left;">
									<img src="${banners[0].banner_filepath}"
										style="width: 100%; height: 100%; object-fit: cover">
								</li>
							</ul>
						</div>
						<div
							class="bx-has-controls-direction">
							<div class="bx-controls-direction">
								<button class="bx-prev"></button>
								<button class="bx-next"></button>
							</div>
						</div>
						<!-- 이 상품 어때요? -->
						<div class="MainIntroTitle">
							<div class="TitleDiv" align="center">
								<span>이 상품 어때요?</span>
							</div>
						</div>
						<div class="MainIntroContain">
							<ul class="foodList">
								<c:forEach begin="1" end="3" step="1">
									<li>
										<div class="foodImg">
											<a href="#"><img src="${pageContext.request.contextPath }/resources/images/Item/foodItem.png"></a>
										</div> <a class="info" href="#"> <span class="name">[네이처]
												오이 묶음</span> <span class="cost"> <span class="dc">36%</span>
												<span class="price">7,500원</span> <span class="origin">11,800원</span>
												<span class="desc">오이는 별로 맛없음</span>
										</span>
									</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!-- 놓치면 후회할 가격 -->
						<div class="MainIntroTitle">
							<div class="TitleDiv" align="center">
								<span>놓치면 후회할 가격 > </span>
							</div>
						</div>
						<div class="MainIntroContain">
							<ul class="foodList">
								<c:forEach var="item" items="${hotDeal }">
									<li>
										<div class="foodImg">
											<a href="itemPage.do?category_goods_serial=${item.category_goods_serial }">
												<img src="${item.category_goods_image_thumb}">
											</a>
										</div>
										<a class="info" href="itemPage.do?category_goods_serial=${item.category_goods_serial }">
											<span class="name">${item.category_goods_name }</span>
											<span class="cost">
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.goods_last_price }" var="lastPrice"/>
												<span class="dc">${item.goods_detail_dicountrate }%</span>
												<span class="price">${lastPrice}원</span>
												<span class="origin">${item.goods_detail_price }</span>
												<span class="desc">${item.category_goods_name_subtext }</span>
											</span>
										</a>
									</li>
								</c:forEach>
							</ul>
						</div>
						<!-- MD -->
						<div class="Maincategory">
							<div class="MainIntroTitle">
								<div class="TitleDiv" align="center">
									<span>MD추천</span>
								</div>
							</div>
							<div class="categoryMenu">
								<ul class="categoryList">
									<li><a class="Menu" href="#">채소</a></li>
									<li><a class="Menu" href="#">과일ㆍ견과ㆍ쌀</a></li>
									<li><a class="Menu" href="#">육류</a></li>
									<li><a class="Menu" href="#">유제품</a></li>
								</ul>
							</div>
							<div class="MainIntroContain">
								<ul class="foodList">
									<c:forEach begin="1" end="3" step="1">
										<li>
											<div class="foodImg">
												<a href="#"><img src="${pageContext.request.contextPath }/resources/images/Item/foodItem.png"></a>
											</div> <a class="info" href="#"> <span class="name">[네이처]
													오이 묶음</span> <span class="cost"> <span class="dc">36%</span>
													<span class="price">7,500원</span> <span class="origin">11,800원</span>
													<span class="desc">오이는 별로 맛없음</span>
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
		</div>
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

	<a href="#top" id="pageTop">맨 위로가기</a>


	<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank"
		style="display: none; width: 100%; height: 600px;"></iframe>
</html>