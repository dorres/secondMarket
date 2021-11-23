<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">
</head>
<body class="main-index" oncontextmenu="return false" ondragstart="return false" onselectstart="return !disableSelection">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
					<jsp:include page="default/mainTop.jsp"></jsp:include><!-- mypage상단부분 -->

					<div class="page_aticle aticle_type2">	<!-- Main 시작 -->
						<jsp:include page="default/mainLeft.jsp"></jsp:include>	<!-- Mainleft -->
						<div class="page_aticle aticle_type2">	<!-- MainCenter 시작 -->
							<div class="page_section section_point">
								<div class="head_aticle">
									<h2 class="tit">
										적립금 
										<span class="tit_sub">보유하고 계신 적립금의 내역을 한 눈에 확인 하실 수 있습니다.</span>
									</h2>
								</div>
								
								<div id="viewPointList">
									<div class="point_header">
										<div class="point_view">
											<h3 class="tit">현재 적립금</h3>
											<strong class="point"><fmt:formatNumber value="${totalPoint}" pattern="#,###" /> <span class="won">원</span></strong>
										</div>
										
									</div>
									
									<table class="tbl tbl_type1">
										<caption style="display: none;">적립 사용 내역 상세보기</caption>
										<colgroup>
											<col style="width: 120px;">
											<col style="width: auto;">
											<col style="width: 122px;">
											<col style="width: 140px;">
										</colgroup>
										<thead>
											<tr>
												<th>날짜</th>
												<th class="info">내용</th>
												<th>금액</th>
											</tr>
										</thead>
										
										<!-- 적립금 없으면 ↓↓↓↓↓↓↓↓↓ -->
										
										<c:if test="${totalPoint eq 0 }">
 										 <tbody>
											<tr>
												<td colspan="3" class="no_data">적립금 내역이 존재하지 않습니다.</td>
											</tr>
										</tbody>
										</c:if>
										<!-- 적립금 있으면 ↓↓↓↓↓↓ -->
										<c:if test="${totapPoint ne 0 }">
										<tbody> 
										<c:forEach var="point" items="${point }">
											<tr>
												<td><fmt:formatDate value="${point.order_date }" pattern="yyyy.MM.dd" /></td>
												<td class="info">
													<span class="link">[${point.order_merchant_serial }] &nbsp;구매적립</span>
												</td>
												<td class="point"><span>+</span>
													${point.order_point } 원
												</td>
											</tr>
											
											<!---->
											</c:forEach>
										</tbody>
										</c:if>
									</table>
									<div class="layout-pagination">
										<div class="pagediv">
											<a href="#viewOrderList" class="layout-pagination-button layout-pagination-first-page">맨처음 페이지로 가기</a> 
											<a href="#viewOrderList" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a> 
											<span><strong class="layout-pagination-button layout-pagination-number __active">1</strong>
											</span> <a href="#viewOrderList" class="layout-pagination-button layout-pagination-next-page">다음페이지로 가기</a> 
											<a href="#viewOrderList" class="layout-pagination-button layout-pagination-last-page">맨끝 페이지로 가기</a>
										</div>
									</div>
								</div>
							</div>
						</div> <!-- MainCenter 끝 -->
					</div> <!-- Main 끝 -->
				</div>
			</div>
		</div>	
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

		<a href="#top" id="pageTop">맨 위로가기</a>


		<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank" style="display: none; width: 100%; height: 600px;"></iframe>
</body>
</html>