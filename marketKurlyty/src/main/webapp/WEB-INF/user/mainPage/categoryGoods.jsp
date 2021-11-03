<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<body class="main-index" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return !disableSelection">

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
											<li><a class="on" href="categoryGoods.do?category_main_serial=${categoryRoot.category_main_serial}">전체보기</a></li>
										</c:if>
										<c:if test="${subSerial != null }">
											<li><a class="" href="categoryGoods.do?category_main_serial=${categoryRoot.category_main_serial}">전체보기</a></li>
										</c:if>
									<c:forEach var="categorySub" items="${categorySub}">
										<c:if test="${subSerial == categorySub.category_sub_serial }">
											<li><a class="on" 
												href="categoryGoods.do?category_main_serial=${categoryRoot.category_main_serial}&category_sub_serial=${categorySub.category_sub_serial}">
												${categorySub.category_sub_name}
												</a>
											</li>
										</c:if>
										<c:if test="${subSerial != categorySub.category_sub_serial }">
											<li><a class="" 
												href="categoryGoods.do?category_main_serial=${categoryRoot.category_main_serial}&category_sub_serial=${categorySub.category_sub_serial}">
												${categorySub.category_sub_name}
												</a>
											</li>
										</c:if>
										<!-- <li><a class="">친환경</a></li>
										<li><a class="">고구마·감자·당근</a></li>
										<li><a class="">시금치·쌈채소·나물</a></li>
										<li><a class="">브로콜리·파프리카·양배추</a></li>
										<li><a class="">양파·대파·마늘·배추</a></li>
										<li><a class="">오이·호박·고추</a></li>
										<li><a class="">냉동·이색·간편채소</a></li>
										<li><a class="">콩나물·버섯</a></li> -->
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
												<li><a class="">혜택순</a></li>
												<li><a class="">낮은 가격순</a></li>
												<li><a class="">높은 가격순</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="MainIntroContain">
							<ul class="foodList">
								<c:forEach var="item" items="${categoryProductList }">
									<li>
										<div class="foodImg">
											<a href="#"><img
												src="${pageContext.request.contextPath }/resources/images/Item/${item.category_goods_image_thumb}"></a>
										</div> <a class="info" href="#"> <span class="name">${item.category_goods_name }</span>
											<span class="cost"> <span class="dc">12%</span> <span
												class="price">6,500원</span> <span class="origin">1,800원</span>
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