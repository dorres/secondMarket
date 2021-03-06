<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

					<div class="page_aticle aticle_type2">	<!-- Main 시작 -->
						<jsp:include page="default/mainLeft.jsp"></jsp:include>	<!-- Mainleft -->
						<div class="page_aticle aticle_type2">	<!-- MainCenter 시작 -->
							
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
					
												<table width="100%" class="table_faq" id="faq_7" style=" table-layout:fixed;">
													<tbody>
													
														<c:forEach var="board" items="${board }">
																	<tr class="menu">
																		<td width=70 align=center>${board.faq_serial }</td>
																		<td width=135 align=center>${board.faq_category }</td>
																		<td style="cusor:pointer">${board.faq_title }</td>
																	</tr>
																	<tr>
																		<td align="center" colspan="3" class="sub" style="display:none;width:100% ">${board.faq_content }</td>
																	</tr>
																	
																</c:forEach>
																
														</tbody>
													</table> 
												</div>
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
										<!-- pagination{s} -->
										<div class="layout-pagination">
											<div class="pagediv">
												<c:if test="${pagination.prev}">
													<div class="layout-pagination-button layout-pagination-number">
														<a class="page-link" href="#"bonClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">이전 </a>
													</div>
												</c:if>
												<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
													<div class="layout-pagination-button layout-pagination-number <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
														<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
													</div>
												</c:forEach>
												<c:if test="${pagination.next}">
													<div class="layout-pagination-button layout-pagination-number">
														<a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">다음</a>
													</div>
												</c:if>
											</div>
										</div>
									</div>
								</div>
						</div> <!-- MainCenter 끝 -->
					</div> <!-- Main 끝 -->
				</div>
<a href="#top" id="pageTop">맨 위로가기</a>
<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank" style="display: none; width: 100%; height: 600px;"></iframe>
	<script>
            $(".menu").click(function(){
                if($(this).nextAll("tr:eq(0)").find(".sub").is(":visible")){
                    $(this).nextAll("tr:eq(0)").find(".sub").css("display","none");
                }
                else{
                    $(this).nextAll("tr:eq(0)").find(".sub").css("display","table-cell");
                }
            });
    </script>
	<script>
		function fn_prev(page,
			range, rangeSize) {
			var page = ((range - 2) * rangeSize) + 1;
			var range = range - 1;
			var url = "${pageContext.request.contextPath}/faq.do";
			url = url + "?page=" + page;
			url = url + "&range="+ range;
			location.href = url;}
			
			//페이지 번호 클릭
			function fn_pagination(
					page, range, rangeSize, searchType, keyword) {
					var url = "${pageContext.request.contextPath}/faq.do";
					url = url + "?page=" + page;
					url = url + "&range=" + range;
					location.href = url;
			}
					
			//다음 버튼 이벤트
			function fn_next(page, range, rangeSize) {
				var page = parseInt((range * rangeSize)) + 1;
				var range = parseInt(range) + 1;
				var url = "${pageContext.request.contextPath}/faq.do";
				url = url + "?page=" + page;
				url = url + "&range=" + range;
				location.href = url;
			}						
	</script>
</body>
<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
</html>