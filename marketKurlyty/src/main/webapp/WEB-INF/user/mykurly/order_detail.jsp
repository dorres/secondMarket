<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
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
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../default/header.jsp"></jsp:include>
	<div class="page_aticle aticle_type2">
		<div id="snb" class="snb_my">
			<h2 class="tit_snb">마이컬리</h2>
			<div class="inner_snb">
				<ul class="list_menu">
					<li class="on"><a href="/shop/mypage/mypage_orderlist.php">주문
							내역</a></li>

					<li><a href="#none"
						onclick="KurlyTrackerLink('/shop/mypage/mypage_gift.php', 'select_my_kurly_gift_list')">선물
							내역</a></li>
					<li><a href="#none"
						onclick="KurlyTrackerLink('/shop/mypage/destination/list.php', 'select_shipping_address_list')">배송지
							관리</a></li>
					<li><a href="/shop/mypage/mypage_review.php">상품 후기</a></li>
					<li><a href="/shop/mypage/product_inquiry.php">상품 문의</a></li>
					<li><a href="#none"
						onclick="KurlyTrackerLink('/shop/mypage/mypage_emoney.php', 'select_my_kurly_point_history', {selection_type: 'mypage'})">적립금</a>
					</li>
					<li><a href="#none"
						onclick="KurlyTrackerLink('/shop/mypage/mypage_coupon.php', 'select_my_kurly_coupon_list', {selection_type: 'mypage'})">쿠폰</a>
					</li>
					<li><a href="/shop/member/myinfo.php">개인 정보 수정</a></li>
				</ul>
			</div>
			<a href="/shop/mypage/mypage_qna_register.php?mode=add_qna"
				class="link_inquire"><span class="emph">도움이 필요하신가요 ?</span> 1:1
				문의하기</a>
		</div>
		
		<div class="page_section section_orderview">
			<div class="head_aticle">
				<h2 class="tit">주문 내역 상세</h2>
			</div>
			<div class="head_section link_type">
				<h3 class="tit">${shipping.order_merchant_serial }</h3>
				<span class="link"> 배송 또는 상품에 문제가 있나요? <a
					href="/shop/mypage/mypage_qna_register.php?mode=add_qna&amp;ordno=1637132460375">1:1
						문의하기</a>
				</span>
			</div>
			<form name="frmOrdView" method="post">
				<input type="hidden" name="mode"> <input type="checkbox"
					name="include" checked="checked" value="" class="chk_cart">
				<table class="tbl tbl_type1">
					<colgroup>
						<col style="width: 80px;">
						<col style="width: auto">
						<col style="width: 100px;">
						<col style="width: 136px;">
					</colgroup>
					<tbody>
					<c:forEach var="detail" items="${detail }">
						<tr>
							<td class="thumb" data-scr=""><a
								href=""
								style="background-image: url(${detail.category_goods_image_thumb })"></a>
							</td>
							<td class="info">
								<div class="name">
									<a href="/shop/goods/goods_view.php?&amp;goodsno=9773"
										class="link">${detail.category_goods_detail_name1 }</a>
								</div>
								<div class="name_package">
									<a href="/shop/goods/goods_view.php?&amp;goodsno=9773"
										class="link">${detail.category_goods_detail_name2 }</a>
								</div>
								<div class="desc">

									<span class="price"><fmt:formatNumber value="${detail.order_goods_price }" pattern="#,###" />원</span> <span class="cost"><fmt:formatNumber value="${detail.order_goods_old_price }" pattern="#,###" />
										원</span> <span class="ea">${detail.order_goods_count }개</span>
								</div>
							</td>
							<td class="progress "><span class="end"> 배송완료 </span></td>
							<td class="action"><span class="btn write_conf">후기완료</span>
								<button type="button" class="btn btn_cart ga_tracking_event"
									onclick="cartLayerOpenAction('9773')">장바구니 담기</button></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
			<div id="orderCancel" class="order_cancel">
				<span class="inner_cancel">

					<button type="button" id="cartPutAll" class="btn btn_cart">전체
						상품 다시 담기</button>
					<button type="button" class="btn btn_cancel off">전체 상품 주문
						취소</button>
				</span>
				<p class="cancel_notice">직접 주문취소는 ‘입금확인’ 상태일 경우에만 가능합니다.</p>
			</div>

			<div class="order_delivery">				
				<ul class="list_status">
					<li>
						<div class="subject">
							<span class="type">.</span>
						</div>
						<div class="state"></div>
						<div class="detail">
							<span class="maker">프레시솔루션</span> 
						</div>
					</li>
				</ul>
			</div>

			<div class="head_section">
				<h3 class="tit">결제정보</h3>
			</div>

			<table class="tbl tbl_type2 tbl_type3">
				<colgroup>
					<col style="width: 160px">
					<col style="width: auto">
				</colgroup>
				<tbody>
					<tr>
						<th>상품금액</th>
						<td><span id="paper_goodsprice">${op }</span>원</td>
					</tr>
					<tr>
						<th>배송비</th>
						<td>
							<div id="paper_delivery_msg1" style="display: none">
								<span id="paper_delivery">0</span>원
							</div>
							<div id="paper_delivery_msg2" style="">최초 1회 무료배송</div>
						</td>
					</tr>
					<tr>
						<th>상품할인금액</th>
						<td>- <span id="paper_goodsDc">${op-dp }</span>원
						</td>
					</tr>
					<tr>
						<th>쿠폰할인</th>
						<td><span id="paper_coupon">0</span>원</td>
					</tr>
					<tr>
						<th>적립금사용</th>
						<td><span id="paper_emoney">0</span>원</td>
					</tr>
					<tr>
						<th>결제금액</th>
						<td><span id="paper_settlement">${dp }</span>원</td>
					</tr>
					<tr>
						<th>적립예정금액</th>
						<td>${point }원</td>
					</tr>
					<tr>
						<th>결제방법</th>
						<td>신용카드</td>
					</tr>
				</tbody>
			</table>
			<div class="head_section">
				<h3 class="tit">주문정보</h3>
			</div>
			<table class="tbl tbl_type2">
				<colgroup>
					<col style="width: 160px">
					<col style="width: auto">
				</colgroup>
				<tbody>
					<tr>
						<th>주문 번호</th>
						<td>${shipping.order_merchant_serial }</td>
					</tr>
					<tr>
						<th>주문자명</th>
						<td>${shipping.shipping_sender_name }</td>
					</tr>
					<tr>
						<th>보내는 분</th>
						<td>${shipping.shipping_sender_name }</td>
					</tr>
					<tr>
						<th>결제일시</th>
						<td><fmt:formatDate value="${orderTime.order_date }" pattern="yyyy.MM.dd(HH:mm)" /></td>
					</tr>
				</tbody>
			</table>

			<div class="head_section">
				<h3 class="tit">배송 정보</h3>
			</div>
			<table class="tbl tbl_type2">
				<colgroup>
					<col style="width: 160px">
					<col style="width: auto">
				</colgroup>
				<tbody>
					<tr>
						<th>받는 분</th>
						<td>${shipping.shipping_recipient_name }</td>
					</tr>
					<tr>
						<th>핸드폰</th>
						<td>${shipping.shipping_recipient_phone }</td>
					</tr>
					<tr>
						<th>배송방법</th>
						<td>샛별배송</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>${shipping.shipping_address1 }&nbsp;${shipping.shipping_address2 }</td>
					</tr>
					<tr>
						<th>받으실 장소</th>
						<td>${shipping.shipping_pickup_type }</td>
					</tr>
					<tr>
						<th>공동현관 출입 방법</th>
						<td>${shipping.shipping_pickup_detail }</td>
					</tr>

					<tr>
						<th>포장방법</th>
						<td>종이 포장재</td>
					</tr>

				</tbody>
			</table>
			<div class="head_section">
				<h2 class="tit">추가 정보</h2>
			</div>
			<table class="tbl tbl_type2">
				<colgroup>
					<col style="width: 160px">
					<col style="width: auto">
				</colgroup>
				<tbody>
					<tr>
						<th>메세지 전송 시점</th>
						<td id="orderview_delivery_message_time">${shipping.shipping_message_time }</td>
					</tr>
					
				</tbody>
			</table>




			<table id="orderbox" class="tbl tbl_receipt">
				<colgroup>
					<col style="width: 160px">
					<col style="width: auto">
				</colgroup>
				<tbody>
					<tr>

						<td class="young" colspan="2"></td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>

</body>
<jsp:include page="../default/footer.jsp"></jsp:include>
</html>