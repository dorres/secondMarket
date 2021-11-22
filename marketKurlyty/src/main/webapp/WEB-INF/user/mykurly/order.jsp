<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/mykurly/order.css">

</head>
<script>
	
</script>
<body class="main-index" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return !disableSelection">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">

			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->

			<div id="main">
				<div id="content">

					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- sidemenu부분 -->
					<jsp:include page="default/mainTop.jsp"></jsp:include><!-- mypage상단부분 -->

					<div class="page_aticle aticle_type2">
						<!-- Main시작 -->
						<jsp:include page="default/mainLeft.jsp"></jsp:include>
						<!-- Mainleft부분 -->

						<div id="viewOrderList" class="page_section section_orderlist">
							<div class="head_aticle">
								<h2 class="tit">
									주문 내역 <span class="tit_sub">지난 3년간의 주문 내역 조회가 가능합니다</span>
								</h2>
							</div>
							<div class="search_date">
								<h3 class="screen_out">기간 선택</h3>
								<!-- 이게 왜있는건지 모르겠네 -->
								<a href="#none" class="btn_layer">전체기간</a>
								<ul class="layer_search">
									<li><a href="#none" class="on">전체기간</a></li>
									<li><a href="#none" data-year="2021">2021 년</a></li>
									<li><a href="#none" data-year="2020">2020 년</a></li>
									<li><a href="#none" data-year="2019">2019 년</a></li>
								</ul>
							</div>

							<ul class="list_order">
								<c:forEach var="order" items="${order }">
									<li><div class="date">
											<fmt:formatDate value="${order.order_date }"
												pattern="yyyy.MM.dd(HH:mm)" />
										</div>
										<div class="order_goods">
											<div class="orderName">
											<c:set var="count" value="${order.order_goods_count -1}"/>
												<a href="order_detail.do?order_merchant_serial=${order.order_merchant_serial }">${order.category_goods_name }외<c:out value="${count }"/>건</a>
											</div>
											<div class="order_info">
												<div class="thumb">
													<img src="${order.category_goods_image_thumb }"
														alt="해당 주문 대표 상품 이미지">
												</div>
												<div class="desc">
													<dl>
														<dt>주문번호</dt>
														<dd>${order.order_merchant_serial }</dd>
													</dl>
													<dl>
														<dt>결제금액</dt>
														<dd>
															<fmt:formatNumber value="${order.order_goods_price }" pattern="#,###" />원
														</dd>
													</dl>
													<dl>
														<dt>주문상태</dt>
														<dd class="status end">${order.order_delivery_status }</dd>
													</dl>
												</div>
											</div>
											<div class="order_status">
												<span class="inner_status"> <!----> <!---->
												<a href="personalQnaWrite.do?order_notice_merchant?="${order_merchant_serial }class="link ga_tracking_event">1:1 문의</a>
												</span>
											</div>
										</div></li>
								</c:forEach>
								<!---->
							</ul>
						</div>
					</div>
					
					<!-- pagination{s} -->
					<div class="layout-pagination">
						<div class="pagediv">
							<c:if test="${pagination.prev}">
								<div class="layout-pagination-button layout-pagination-number">
								<a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')"> 이전 </a>
								</div>
							</c:if>
							<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
								<div class="layout-pagination-button layout-pagination-number <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
									<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">${idx} </a>
								</div>
							</c:forEach>
							<c:if test="${pagination.next}">
								<div class="layout-pagination-button layout-pagination-number">
									<a class="page-link" href="#" onClick="fn_next('${pagination.range}','${pagination.range}', '${pagination.rangeSize}')">다음</a>
								</div>
							</c:if>
						</div>
					</div>
					<!-- pagination{e} -->
					<a href="#top" id="pageTop">맨 위로가기</a>
				</div>
			</div>
		</div>
	</div>
<script>
						function fn_prev(page, range, rangeSize) {
							var page = ((range - 2) * rangeSize) + 1;
							var range = range - 1;
							var url = "${pageContext.request.contextPath}/order.do";
							url = url + "?page=" + page;
							url = url + "&range=" + range;
							location.href = url;
						}
						//페이지 번호 클릭
						function fn_pagination(page, range, rangeSize,searchType, keyword) {
							var url = "${pageContext.request.contextPath}/order.do";
							url = url + "?page=" + page;
							url = url + "&range=" + range;
							location.href = url;
						}
						//다음 버튼 이벤트
						function fn_next(page, range, rangeSize) {
							var page = parseInt((range * rangeSize)) + 1;
							var range = parseInt(range) + 1;
							var url = "${pageContext.request.contextPath}/order.do";
							url = url + "?page=" + page;
							url = url + "&range=" + range;
							location.href = url;
						}
					</script>
</body>
<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
</html>