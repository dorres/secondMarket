<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="position: absolute; inset: 0px;">
	<table id="orderList" width="100%" height="100%" cellpadding="0"
		cellspacing="0" border="0">
		<tbody>
			<tr>
				<td style="border: 10px solid #fff" valign="top">
					<table height="100%" width="100%" cellpadding="0" cellspacing="0"
						border="0" align="center">
						<tbody>
							<tr>
								<td height="100%" valign="top">
									<table cellpadding="3" cellspacing="0" border="0">
										<tbody>
											<tr>
												<td class="stxt" style="padding-top: 10">문의하실 주문번호를
													선택하세요.</td>
											</tr>
										</tbody>
									</table>
									<table width="100%" cellpadding="0" cellspacing="0" border="0"
										style="margin-top: 10px;">
										<colgroup>
											<col width="20%">
											<col width="12%">
											<col width="36%">
											<col width="10%">
											<col width="15%">
											<col width="7%">
										</colgroup>
										<tbody>
											<tr height="19" bgcolor="#A8A8A8">
												<th style="font: bold 8pt 돋움; color: #FFFFFF">주문번호</th>
												<th style="font: bold 8pt 돋움; color: #FFFFFF">주문일자</th>
												<th style="font: bold 8pt 돋움; color: #FFFFFF">상품명</th>
												<th style="font: bold 8pt 돋움; color: #FFFFFF">수량</th>
												<th style="font: bold 8pt 돋움; color: #FFFFFF">주문금액</th>
												<th style="font: bold 8pt 돋움; color: #FFFFFF">선택</th>
											</tr>
											<!-- 여기 값을 수정 -->
											
												<c:forEach var="order" items="${orderList }">
													<tr height="25" align="center">
														<td id="merchant">${order.order_merchant_serial }</td>
														<td><fmt:formatDate value="${order.order_date  }" pattern="yyyy-MM-dd"/></td>
														<td>${order.category_goods_name } .. 외${order.order_goods_count -1}건</td>
														<td >${order.order_goods_count }개</td>
														<td >${order.order_goods_price }원</td>
														<td>
														<input type="radio" name="ordernoSelect"></td>
													</tr>
												</c:forEach>
											
											<!-- 여기 값을 수정 -->
											
											<tr>
												<td colspan="6" height="1" bgcolor="E5E5E5"></td>
											</tr>
										</tbody>
									</table>
<!-- 									<div class="layout-pagination">
										<div class="pagediv">
											<a href="/shop/mypage/mypage_qna_order.php?&amp;page=1"
												class="layout-pagination-button layout-pagination-first-page">맨
												처음 페이지로 가기</a><a
												href="/shop/mypage/mypage_qna_order.php?&amp;page=1"
												class="layout-pagination-button layout-pagination-prev-page">이전
												페이지로 가기</a><strong
												class="layout-pagination-button layout-pagination-number __active">1</strong><a
												href="/shop/mypage/mypage_qna_order.php?&amp;page=1"
												class="layout-pagination-button layout-pagination-next-page">다음
												페이지로 가기</a><a
												href="/shop/mypage/mypage_qna_order.php?&amp;page=1"
												class="layout-pagination-button layout-pagination-last-page">맨
												끝 페이지로 가기</a>
										</div>
									</div> -->
								</td>
							</tr>
							<tr>
								<td height="19" align="right">
									<button  onclick="javascript:myClose()">닫기</button>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
<script>
$("input[name=ordernoSelect]").click(function(){
	var checkBtn = $(this);
	var tr = checkBtn.closest("tr")
	var merchant = tr.find("#merchant").text();
	opener.$("input#order_details_order_serial").val(merchant);
	
	self.close();
})

	function myClose(){
		self.close();
	}	
</script>
</body>
</html>