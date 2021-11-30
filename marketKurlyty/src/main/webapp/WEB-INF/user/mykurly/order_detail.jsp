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
<script>
function inputCart(serial){
	var goodsSerial=serial;
	$.ajax({
		url:"cartInput.do",
		type:"post",
		data:{"category_goods_serial":goodsSerial,"goods_cart_count":1},
		datatype:"text",
		success:function(res){
			if(res!="good"){
				alert(res);
			}else{
				alert("장바구니에 담았습니다.");
			}
			closeCart();
		},
		error:function(res){
			alert("담기에 실패했습니다.");
		}
	});
}
</script>
<body>
	<jsp:include page="../default/header.jsp"></jsp:include>
	<div class="page_aticle aticle_type2">
		<jsp:include page="default/mainLeft.jsp"></jsp:include>
		
		<div class="page_section section_orderview">
			<div class="head_aticle">
				<h2 class="tit">주문 내역 상세</h2>
			</div>
			<div class="head_section link_type">
				<h3 class="tit">${shipping.order_merchant_serial }</h3>
				
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
							<td class="progress "><span class="end"> 재구매 > </span></td>
							<td class="action">
								<button type="button" class="btn btn_cart ga_tracking_event"
									onclick="javascript:inputCart(${detail.category_goods_serial})">장바구니 담기</button></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>

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