<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">
<script type="text/javascript">
	var $targetBtn = $('.search_date .btn_layer');
	var $targetLayer = $('.search_date .layer_search');
	var $targetSelector = $('.layer_search a');

	$targetSelector.each(function() {
		if ($(this).data('selected')) {
			$targetBtn.text($(this).data('selected'));
		}
	});
	$targetBtn.on('click', function(e) {
		e.preventDefault();
		$(this).toggleClass('on');
		$targetLayer.slideToggle(100);
	});
	$targetSelector.on('click', function(e) {
		e.preventDefault();
		var value = $(this).data('value');
		var text = $(this).text();
		$targetBtn.trigger('click').text(text);
		$('[name=sitemcd]').val(value);
		$('[name=frmList]').submit();
	});
</script>
</head>
<body class="main-index" oncontextmenu="return false" ondragstart="return false" onselectstart="return !disableSelection">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->

					<div class="page_aticle aticle_type2">	<!-- Main 시작 -->
						<jsp:include page="default/mainLeft.jsp"></jsp:include>	<!-- Mainleft -->
						<div class="page_aticle aticle_type2">	<!-- MainCenter 시작 -->
							<form name="frmList" id="form" method="get" action="?">
								<div class="page_section">
									<div class="head_aticle">
										<h2 class="tit">
											자주하는 질문 
											<span class="tit_sub">고객님들께서 가장 자주하시는 질문을 모두모았습니다.</span>
										</h2>
									</div>
									<div class="search_date">
										<a href="#none" class="btn_layer">선택</a>
										<ul class="layer_search">
											<li><a href="#none" @click="searchResult" data-value="01" data-selected="">회원문의</a></li>
											<li><a href="#none" @click="searchResult" data-value="02" data-selected="">주문/결제</a></li>
											<li><a href="#none" @click="searchResult" data-value="03" data-selected="">취소/교환/반품</a></li>
											<li><a href="#none" @click="searchResult" data-value="04" data-selected="">배송문의</a></li>
											<li><a href="#none" @click="searchResult" data-value="05" data-selected="">쿠폰/적립금</a></li>
											<li><a href="#none" @click="searchResult" data-value="07" data-selected="">서비스 이용 및 기타</a></li>
										</ul>
										<input type="hidden" name="sitemcd" value="">
									</div>

									<div class="xans-element- xans-myshop xans-myshop-couponserial ">
										<table width="100%" class="xans-board-listheader">
											<tbody>
												<tr>
													<th width="70" class="input_txt">번호</th>
													<th width="135" class="input_txt">카테고리</th>
													<th class="input_txt">제목</th>
												</tr>
											</tbody>
										</table>
										<div>
											<div>
												<table width="100%" class="table_faq"
													onclick="view_content(this)" id="faq_7">
													<tbody>
														<c:forEach var="board" items="${board }">
																	<tr>
																		<td>${board.faq_serial }</td>
																		<td>${board.faq_id }</a></td>
																		<td>${board.faq_title }</td>
																		
																		
																	</tr>
																</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<div style="padding: 1px; border-top: 1px solid #e6e6e6"></div>
										<div class="layout-pagination">
											<div class="pagediv">
												<a href="/shop/service/faq.php?&amp;page=1" class="layout-pagination-button layout-pagination-first-page">맨처음 페이지로 가기</a>
												<a href="/shop/service/faq.php?&amp;page=1" class="layout-pagination-button layout-pagination-prev-page">이전 페이지로 가기</a>
												<strong class="layout-pagination-button layout-pagination-number __active">1</strong>
												<a href="/shop/service/faq.php?&amp;page=2" class="layout-pagination-button layout-pagination-number">2</a>
												<a href="/shop/service/faq.php?&amp;page=3" class="layout-pagination-button layout-pagination-number">3</a>
												<a href="/shop/service/faq.php?&amp;page=4" class="layout-pagination-button layout-pagination-number">4</a>
												<a href="/shop/service/faq.php?&amp;page=5" class="layout-pagination-button layout-pagination-number">5</a>
												<a href="/shop/service/faq.php?&amp;page=2" class="layout-pagination-button layout-pagination-next-page">다음 페이지로 가기</a>
												<a href="/shop/service/faq.php?&amp;page=5" class="layout-pagination-button layout-pagination-last-page">맨끝 페이지로 가기</a>
											</div>
										</div>
										<table class="xans-board-search xans-board-search2">
											<tbody>
												<tr>
													<td class="input_txt">&nbsp;</td>
													<td>
														<div class="search_bt">
															<input type="image" src="${pageContext.request.contextPath }/resources/images/customerCenter/search" name="sword" value="" required="">
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>

								</div>
							</form>

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