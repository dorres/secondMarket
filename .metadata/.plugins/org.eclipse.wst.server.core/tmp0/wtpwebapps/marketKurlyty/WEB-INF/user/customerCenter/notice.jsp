<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">
<style type="text/css">
.notice .layout-pagination {
	margin: 0
}

.eng2 {
	color: #939393
}

.xans-board-listheader {
	font-size: 12px
}
</style>
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

					<div class="page_aticle aticle_type2">
						<!-- Main 시작 -->
						<jsp:include page="default/mainLeft.jsp"></jsp:include>
						<!-- Mainleft -->
						<div class="page_aticle aticle_type2">
							<!-- MainCenter 시작 -->

							<div class="page_section">
								<div class="head_aticle">
									<h2 class="tit">
										공지사항 <span class="tit_sub">컬리의 새로운 소식들과 유용한 정보들을 한곳에서
											확인하세요.</span>
									</h2>
								</div>
								<form name="notice_serial" method="get">
									<input type="hidden" name="id" value="notice">
									<table width="100%" align="center" cellpadding="0"
										cellspacing="0">
										<tbody>
											<tr>
												<td>
													<div
														class="xans-element- xans-myshop xans-myshop-couponserial ">
														<table width="100%" class="xans-board-listheader jh"
															cellpadding="0" cellspacing="0">
															<thead>
																<tr>
																	<th>번호</th>
																	<th>제목</th>
																	<th>작성자</th>
																	<th>작성일</th>
																	<th>조회</th>
																</tr>
															</thead>

															<tbody>

																<c:forEach var="board" items="${board }">
																	<tr>
																		<td>${board.notice_serial }</td>
																		<td><a
																			href="notice_detail.do?notice_serial=${board.notice_serial}">${board.notice_title }</a></td>
																		<td>${board.notice_id }</td>
																		<td><fmt:formatDate value="${board.notice_date }"
																				pattern="yyyy-MM-dd" /></td>
																		<td>${board.notice_hit }</td>
																	</tr>
																</c:forEach>

															</tbody>

														</table>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</form>
								<script>
													function fn_prev(page,
															range, rangeSize) {

														var page = ((range - 2) * rangeSize) + 1;

														var range = range - 1;

														var url = "${pageContext.request.contextPath}/notice.do";

														url = url + "?page="
																+ page;

														url = url + "&range="
																+ range;

														location.href = url;

													}

													//페이지 번호 클릭

													function fn_pagination(
															page, range,
															rangeSize,
															searchType, keyword) {

														var url = "${pageContext.request.contextPath}/notice.do";

														url = url + "?page="
																+ page;

														url = url + "&range="
																+ range;

														location.href = url;

													}

													//다음 버튼 이벤트

													function fn_next(page,
															range, rangeSize) {

														var page = parseInt((range * rangeSize)) + 1;

														var range = parseInt(range) + 1;

														var url = "${pageContext.request.contextPath}/notice.do";

														url = url + "?page="
																+ page;

														url = url + "&range="
																+ range;

														location.href = url;

													}
												</script>
	<!-- pagination{s} -->

	<div class="layout-pagination">
		<div class="pagediv">


			<c:if test="${pagination.prev}">

				<div class="layout-pagination-button layout-pagination-number">
					<a class="page-link" href="#"
						onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">
						이전 </a>
				</div>

			</c:if>



			<c:forEach begin="${pagination.startPage}"
				end="${pagination.endPage}" var="idx">

				<div
					class="layout-pagination-button layout-pagination-number <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
					<a class="page-link" href="#"
						onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">
						${idx} </a>
				</div>

			</c:forEach>



			<c:if test="${pagination.next}">

				<div class="layout-pagination-button layout-pagination-number">
					<a class="page-link" href="#"
						onClick="fn_next('${pagination.range}', 

'${pagination.range}', '${pagination.rangeSize}')">다음</a>
				</div>

			</c:if>

		</div>

	</div>


	<!-- pagination{e} -->
								<div class="layout-pagination">
									<div class="pagediv"></div>
								</div>

								<table class="xans-board-search xans-board-search2">
									<tbody>
										<tr>
											<td class="input_txt"><img
												src="${pageContext.request.contextPath }/resources/images/customerCenter/customerCenter_notice_1.gif">검색어</td>
											<td class="stxt"><input type="checkbox"
												name="search[name]">이름 <input type="checkbox"
												name="search[subject]">제목 <input type="checkbox"
												name="search[contents]">내용&nbsp;</td>
											<td class="input_txt">&nbsp;</td>


										</tr>
									</tbody>
								</table>

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