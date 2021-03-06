<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/mykurly/coupon.css">
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
							<div class="page_section section_coupon">
								<div id="lacoupon-area">
									<div id="lacoupon">
										<div id="lacoupon_pc_page">
											<div class="title">
												<h2>쿠폰</h2>
											</div>
											<section class="couponList">
												<div id="lacoupon_table_description">
													<div>
														<span class="icon"></span>
														<span class="inform">
															쿠폰은 적용 가능한 상품이 따로 적용되어 있는 경우 해당 상품 구매 시에만 사용이 가능합니다.
														</span>
													</div>
													<!-- <span class="availableCoupon">사용가능쿠폰: 0장</span> -->
												</div>
												<table id="lacoupon_table">
													<caption>쿠폰 상세 내역</caption>
													<colgroup>
														<col style="width: auto;">
														<col style="width: 70px;">
														<col style="width: 100px;">
														<col style="width: 150px;">
														<col style="width: 100px;">
													</colgroup>
													<thead id="lacoupon_table_header">
														<tr>
															<th class="name">쿠폰명</th>
															<th>기능</th>
															<th>할인/적립</th>
															<th>사용가능기간</th>
															<th>사용여부</th>
														</tr>
													</thead>
													
													<!-- 쿠폰이 없는경우↓↓↓↓↓↓ -->
													<c:if test="${fn:length(myCoupon)==0 }">
													<tbody class="couponList"> 
														<tr>
															<td class="noCoupon" colspan="5">쿠폰 내역이 존재하지 않습니다.</td>
														</tr>
													</tbody> 
													</c:if>
													<!-- 쿠폰이 있는경우↓↓↓↓↓↓↓↓↓-->
													<c:if test="${fn:length(myCoupon)>0 }">
														<tbody class="couponList"> 
															<c:forEach var="coupons" items="${myCoupon }">
															<tr id="lacoupon_pc" class="">
																<td class="couponName">
																	<span class="name">${coupons.coupon_name}
																	<c:if test="${coupons.coupon_type==0 }">
																		${coupons.coupon_discount }%
																	</c:if>
																	<c:if test="${coupons.coupon_type==1 }">
																		${coupons.coupon_discount }원
																	</c:if>
																	</span>
																	<span class="hurdle">최대 ${coupons.coupon_max }원 할인</span>
																	<span class="hurdle"></span>
																</td>
																<td>할인</td>
																<td>
																	<c:if test="${coupons.coupon_type==0 }">
																		${coupons.coupon_discount }%
																	</c:if>
																	<c:if test="${coupons.coupon_type==1 }">
																		${coupons.coupon_discount }원
																	</c:if>
																</td>
																<td>
																	<fmt:formatDate value="${coupons.coupon_end}"
																	pattern="yyyy-MM-dd" />까지
																</td>
																<c:if test="${coupons.coupon_use_status==1 }">
																	<td class="available">
																		미사용
																	</td>
																</c:if>
																<c:if test="${coupons.coupon_use_status==0 }">
																	<td class="available" style="color:gray;">
																		사용
																	</td>
																</c:if>
																<c:if test="${coupons.coupon_use_status==2 }">
																	<td class="available" style="color:red;">
																		유효기간 만료
																	</td>
																</c:if>
															</tr>
															</c:forEach>
														</tbody>
													</c:if>
												</table>
											</section>
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