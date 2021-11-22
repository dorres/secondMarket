<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/mykurly/order_detail.css">
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/default/style.css">
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/default/style2.css">
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/default/style3.css">
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/default/style4.css">
</head>
<body class="main-index" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return !disableSelection">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
					<jsp:include page="default/mainTop.jsp"></jsp:include><!-- mypage상단부분 -->

					<div class="page_aticle aticle_type2">
						<!-- Main 시작 -->
						<jsp:include page="default/mainLeft.jsp"></jsp:include>
						<!-- Mainleft -->
						<div class="page_aticle aticle_type2">
							<!-- MainCenter 시작 -->
							<div class="page_section section_review">
								<div class="head_aticle">
									<h2 class="tit">상품 후기</h2>
								</div>
								<div id="reviewView">
									<div class="review_notice">
										<p>
											<b>후기 작성 시 사진후기 100원, 글후기 50원을 적립해드립니다.</b>
										</p>
										- 퍼플, 더퍼플은 <b>2배</b> 적립 (사진 200원, 글 100원)<br>- 주간 베스트 후기로
										선정 시 <b>5,000원</b>을 추가 적립<br>* 후기 작성은 배송 완료일로부터 30일 이내
										가능합니다.
									</div>
									<ul class="tab_menu">
										<li class="on"><a href="#viewBeforeList">작성가능 후기 <span>(0)</span></a></li>
										<li class=""><a href="#viewAfterList">작성완료 후기 <span>(0)</span></a></li>
									</ul>
								</div>

								<div id="viewBeforeList" class="before_view">
									<ul class="list_before">
										<!---->
										<li>
											<!----> <strong class="tit_item"><span class="emph">주문번호</span>
												1637132460375</strong>
											<div class="item">
												<a href="/shop/goods/goods_view.php?&amp;goodsno=9773"
													class="thumb"><img
													src="https://img-cf.kurly.com/shop/data/goods/1604296177490s0.jpg"
													alt="상품 이미지"></a>
												<div class="name">
													<div class="inner_name">
														<a href="/shop/goods/goods_view.php?&amp;goodsno=9773"
															class="sub_name">제주 무농약 노지 감귤 3종 (800g, 1kg, 2kg)</a> <a
															href="/shop/goods/goods_view.php?&amp;goodsno=9773"
															class="main_name">제주 무농약 점보 감귤 1kg</a> <span class="num">1개
															구매</span>
													</div>
												</div>
												<div class="date">
													<div class="inner_date">
														<div class="in_date">
															<!---->
															<span class="start">11월17일 배송완료</span> <span class="end"></span>
														</div>
													</div>
												</div>
												<a
													href="/shop/goods/goods_review_register.php?mode=add_review&amp;goodsno=9773&amp;sno=undefined&amp;referer=mypage&amp;ordno=1637132460375&amp;package_goodsno=30891"
													class="btn_write">후기쓰기</a>
											</div>
										</li>
										<!---->
									</ul>
								</div>


								<div id="viewAfterList" class="after_view">
									<ul class="list_after">
										<li class="no_data">작성한 후기가 없습니다.</li>
									</ul>
								</div>
								<!-- 작성가능 후기 내역과 작성완료 후기를 선택하는거에 따라서 내용이 수정됨 -->

							</div>
						</div>
						<!-- MainCenter 끝 -->
					</div>
					<!-- Main 끝 -->
				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

	<a href="#top" id="pageTop">맨 위로가기</a>


	<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank"
		style="display: none; width: 100%; height: 600px;"></iframe>
</body>
</html>