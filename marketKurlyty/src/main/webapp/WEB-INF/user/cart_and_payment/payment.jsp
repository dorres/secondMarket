<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/style/cart_and_payment/cart.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/style/cart_and_payment/payment.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
</head>
<body>
<body class="main-index" oncontextmenu="return false"
	ondragstart="return false">
	<input type="hidden" id="isShipping" value="false"/>
	<input type="hidden" id="pickUpType" value=""/>
	<input type="hidden" id="pickUpDetail" value=""/>
	<input type="hidden" id="shippingMessageTime" value=""/>
	<input type="hidden" id="doorPassword" value=""/>
	<input type="hidden" id="recipientName" value=""/>
	<input type="hidden" id="recipientPhone" value=""/>
	<c:if test="${orderPrice >= 40000 }">
		<fmt:formatNumber var="payPrice" maxFractionDigits="3" value="${orderPrice}"/>
		<input type="hidden" id="payment" value="${orderPrice }">
	</c:if>
	<c:if test="${orderPrice < 40000 }">
		<fmt:formatNumber var="payPrice" maxFractionDigits="3" value="${orderPrice+3000}"/>
		<input type="hidden" id="payment" value="${orderPrice+3000 }">
	</c:if>
	<fmt:formatNumber var="oldPrice" maxFractionDigits="3" value="${goodsPrice}"/>
	<fmt:formatNumber var="dc" maxFractionDigits="3" value="${orderPrice-goodsPrice }"/>
	<%-- <input type="hidden" id="payment" value="${orderPrice }"> --%>
	<input type="hidden" id="orderPrice" value="${orderPrice }"/>
	<input type="hidden" id="address1" value="${shippingAddress.user_address1 }"/>
	<input type="hidden" id="address2" value="${shippingAddress.user_address2 }"/>
	<input type="hidden" id="zipcode" value="${shippingAddress.user_zipcode}"/>
	<fmt:parseNumber var="oldReserves" type="number" integerOnly="true" value="${(orderPrice*(membershipInfo.user_membership_point_rate/100)+5)/10}"/>
	<fmt:formatNumber var="afterReserves" type="number" maxFractionDigits="1" value="${oldReserves*10 }"/>
	<input type="hidden" id="reserves" value="${oldReserves*10 }"/>
	<input type="hidden" name="userPoint" value="${userPoint }">
	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div class="tit_page">
				<h2 class="tit">주문서</h2>
			</div>
			<div id="main">
				<div id="content">

					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
					<div class="user_form">
						<script id="delivery"></script>

						<c:if test="${fn:contains(shippingAddress.user_address1,'서울')|| fn:contains(shippingAddress.user_address1,'부산')||fn:contains(shippingAddress.user_address1,'대구')||fn:contains(shippingAddress.user_address1,'대전')}">
							<div id="popup-for-new-satbyul-user-web" class="service_delivery"
								style="display: block;">
								<h2 class="tit_bnr">
									<c:if test="${fn:contains(shippingAddress.user_address1,'서울') }">
										<span id="new-satbyul-region">주문 지역(서울 일부)에 </span>
									</c:if>
									<c:if test="${fn:contains(shippingAddress.user_address1,'부산') }">
										<span id="new-satbyul-region">주문 지역(부산 일부)에 </span>
									</c:if>
									<c:if test="${fn:contains(shippingAddress.user_address1,'대구') }">
										<span id="new-satbyul-region">주문 지역(대구 일부)에 </span>
									</c:if>
									<c:if test="${fn:contains(shippingAddress.user_address1,'대전') }">
										<span id="new-satbyul-region">주문 지역(대전 일부)에 </span>
									</c:if>
									<span class="emph"><span class="in_emph">샛별배송 </span></span> 서비스가
									시작됩니다!
								</h2>
								<ul class="list">
									<li class="fst"><strong class="tit">이제부터 새벽에
											배송됩니다.</strong> <strong class="emph" id="new-satbyul-order-end-time">매일
											20시</strong>까지 주문하시면<br> <strong class="emph"
										id="new-satbyul-order-delivery-time">다음날 8시</strong>까지 배송됩니다.</li>
									<li class="snd"><strong class="tit">공동현관 비밀번호를
											입력해주세요.</strong> 새벽 시간 공동 현관 출입이 불가한 경우,<br> <strong class="emph">공동현관
											앞에 배송될 수 있습니다.</strong></li>
								</ul>
							</div>
						</c:if>
						<h2 class="tit_section fst">주문상품</h2>
						<div id="itemList" class="page_aticle order_goodslist">
							<div class="info_product">
								<a class="btn" id="btn_dropup" href="#none"><span class="screen_out">펼침
										/ 닫힘</span></a>
								<c:set var="listSize" value="${fn:length(purchaseList) }"/>
								<c:if test="${fn:length(purchaseList)==1 }">
									<div class="short_info">${purchaseList[0].category_goods_name }(을)를 주문합니다.</div>
								</c:if>
								<c:if test="${fn:length(purchaseList)>1 }">
									<div class="short_info">${purchaseList[0].category_goods_name } 외 ${listSize -1 }개 상품을 주문합니다.</div>
								</c:if>
							</div>
							<ul class="list_product">
								<c:forEach var="item" items="${purchaseList }">
									<li>
										<div class="thumb">
											<img
												src="${item.category_goods_image_thumb}"
												alt="상품이미지">
										</div>
										<div class="name">
											<div class="inner_name">${item.category_goods_name }</div>
										</div>
										<div class="ea">${item.goods_cart_count }개</div>
										<div class="info_price">
											<fmt:formatNumber var="itemPrice" maxFractionDigits="3" value="${item.goods_cart_count*item.goods_last_price }"/>
											<span class="num"><span class="price">${itemPrice }원</span></span>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
						<form id="form" name="frmOrder" action="/checkout/settle.php"
							method="post" onsubmit="return validateOrderForm(this)"
							class="order_view" novalidate="">

							<input type="hidden" name="platform" value="desktop">
							<input type="hidden" id="order_method" name="order_method" value="cart">
							<input type="hidden" name="fallback_on_delivery_fail_method" value="2">
							<input type="hidden" name="settlement_price" value="0">
							<input type="hidden" name="settlekind_option" value="">
							<input type="hidden" id="package_benefit_apply" name="package_benefit_apply" value="false">
							<input type="hidden" id="package_type" name="package_type" value="DEFAULT">
							<div id="apply_coupon"></div>
							<input type="hidden" name="apr_coupon_data" value="">

							<h2 class="tit_section" id="titFocusOrderer">주문자 정보</h2>
							<div class="order_section data_orderer">
								<table class="goodsinfo_table ">
									<tbody>
										<tr class="fst">
											<th>보내는 분</th>
											<td>${userInfo.user_name }<input type="hidden" name="orderer_name"
												value="${userInfo.user_name }">
											</td>
										</tr>
										<tr>
											<th>휴대폰</th>
											<td>${userInfo.user_phone } <input type="hidden"
												name="orderer_phone" value="${userInfo.user_phone }">
											</td>
										</tr>
										<tr>
											<th>이메일</th>
											<td><input type="hidden" id="email" name="orderer_email"
												value="${userInfo.user_email }" option="regEmail">
												${userInfo.user_email }
												<p class="txt_guide">
													<span class="txt txt_case1">이메일을 통해 주문처리과정을 보내드립니다.</span>
													<span class="txt txt_case2">정보 변경은 <span
														class="txt_desc">마이컬리 &gt; 개인정보 수정</span> 메뉴에서 가능합니다.
													</span>
												</p></td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<input type="hidden" name="deliveryType" id="deliveryType" value="direct">
							<h2 class="tit_section" id="divAddressWrapper">
								배송 정보 <span class="desc">배송 휴무일: 샛별배송(휴무없음), 택배배송(일요일)</span>
							</h2>

							<div class="address_info">
								<a href="#none" id="btnLayerInfo" class="desc">배송지 변경 안내</a>
								<div class="layer_info" id="layerInfo">
									<strong class="emph">장바구니, 홈</strong>에서 <br> 배송지를 변경할 수
									있어요.
								</div>
							</div>

							<div class="order_section order_address" id="dataDelivery">
								<h3 href="#none" class="section_crux">배송지</h3>
								<div class="section_full">
									<span class="address" id="divDestination" style="">
										<!-- <span class="default on" id="addrDefault" data-text="기본배송지">기본배송지</span> -->
										<span class="addr" id="addrInfo">${shippingAddress.user_address1 } <br>
											${shippingAddress.user_address2 }</span>
										<span class="tag" id="addrTags">
											<c:if test="${fn:contains(shippingAddress.user_address1,'서울')|| fn:contains(shippingAddress.user_address1,'부산')||fn:contains(shippingAddress.user_address1,'대구')}">
												<span class="badge star" id="addrBadge">샛별배송</span>
											</c:if>
										</span>
									</span>
								</div>
							</div>

							<div class="order_section order_reception" id="divReception"
								style="">
								<h3 class="section_crux">상세 정보</h3>
								<div class="section_full">
									<c:if test="${shippingAddress.user_name==''||shippingAddress.user_name==null }">
										<div class="receiving off" id="receiverInfo">받으실 분 정보를
										입력해 주세요</div>
									</c:if>
									<c:if test="${shippingAddress.user_name!=''&&shippingAddress.user_name!=null }">
										<div class="receiving" id="receiverInfo">${shippingAddress.user_name }, ${shippingAddress.user_phone }</div>
									</c:if>
									<div class="way" id="wayPlace" style="display: none;">
										<span class="place" id="areaInfo" style="display: none; float:left;"></span>

										<span class="txt off" id="meanType"></span>
										<div class="message" id="deliveryMessage" style="display: none;">
											<span class="place" id="deliveryMessageTitle">배송완료 메시지</span>
											<span class="txt" id="deliveryMessageDetail">배송 직후</span>
										</div>
									</div>
									<button type="button" id="btnUpdateSubAddress" class="btn active"
										onclick="javascript:shippingInfoPage()">입력</button>

								</div>
							</div>

							<div id="package-method" class="order_section reusable_packaging"></div>
							<div id="bnrOrder" class="bnr_order" style="display: none;">
								<img
									src="https://res.kurly.com/kurly/img/2021/banner-order-paper_1050_107%402x.jpg"
									alt="All Paper Challenge">
								<p class="screen_out">사람에게도 환경에도 더 이로운 배송 친환경 포장재 자세히 보기</p>
							</div>
							<div class="tax_absolute">
								<div class="inner_sticky" id="sticky" style="top: 0px;">
									<h2 class="tit_section">결제금액</h2>
									<div id="orderitem_money_info">
										<dl class="amount fst">
											<dt class="tit">주문금액</dt>
											<dd class="price">
												<fmt:formatNumber var="strOrderPrice" maxFractionDigits="3" value="${orderPrice }"/>
												<span id="productsTotalPrice">${strOrderPrice }</span> 원
											</dd>
										</dl>
										<dl class="amount sub">
											<dt class="tit">상품금액</dt>
											<dd class="price">
												<span id="paper_goodsprice">${oldPrice }</span> 원
											</dd>
										</dl>
										<dl class="amount sub">
											<dt class="tit">상품할인금액</dt>
											<dd class="price sales_area">
												<!-- <span class="pm_sign normal" style="display: none;">-</span> -->
												<span id="special_discount_amount" class="normal">${dc }</span> 원
											</dd>
											<!-- <dd id="paper_sale" class="screen_out">0</dd> -->
										</dl>
										<dl class="amount">
											<dt class="tit">배송비</dt>
											<dd class="price delivery_area">
												<div id="paper_delivery_msg1">
													<c:if test="${orderPrice>=40000 }">
														<span id="paper_delivery" class="">0</span>
													</c:if>
													<c:if test="${orderPrice<40000 }">
														<span id="paper_delivery" class="">+3,000</span>
													</c:if>
													원
													<!-- <span id="paper_delivery2" style="display: none">0</span> 원 -->
												</div>
												<div id="paper_delivery_msg_extra" class="small"
													style="display: none;"></div>
												<span id="free_delivery_coupon_msg" class="screen_out">미적용</span>
												<input type="hidden" name="free_delivery" value="0">
											</dd>
										</dl>
										<dl class="amount">
											<dt class="tit">쿠폰할인금액</dt>
											<dd class="price coupon_area">
												<span class="pm_sign" style="display: none;">-</span> <span
													id="apr_coupon_data">0</span> 원 <input type="hidden"
													name="coupon" size="12" value="0" readonly="">
											</dd>
										</dl>
										<dl class="amount">
											<dt class="tit">적립금사용</dt>
											<dd class="price">
												<span class="num pay_sum" id="paper_reserves">0 원</span>
												<input type="hidden" name="coupon_emoney" size="12" value="0" readonly="">
											</dd>
										</dl>
										<dl class="amount lst">
											<dt class="tit">최종결제금액</dt>
											<dd class="price">
												<span id="paper_settlement">${payPrice }</span> <span class="won">원</span>
											</dd>
										</dl>
										<p class="reserve" style="display: block;">
											<span class="ico">적립</span> 구매 시 <span class="emph">
											
											<span id="expectAmount">${afterReserves}</span>
											 원 (
												<span class="ratio">${membershipInfo.user_membership_point_rate }</span>%)
												적립</span>
										</p>
									</div>
								</div>
							</div>

							<div class="data_payment">
								<div class="tbl_left">
									<h2 class="tit_section">쿠폰 / 적립금</h2>

									<table class="goodsinfo_table">
										<tbody>
											<tr>
												<th>쿠폰 적용</th>
												<td>
													<div class="view_popselbox">
													사용 가능 쿠폰 <span id="useCoupon">${fn:length(myCoupon) }</span>개
														<div id="popselboxView" class="select_box">
														<select id="selectCoupon" style="opacity:1;" onchange="javascript:changeCoupon();">
															<option value="-1">쿠폰 적용 안 함</option>
															<c:forEach var="coupon" items="${myCoupon }" varStatus="index">
																<option value="${index.index }">${coupon.coupon_name }
																<c:if test="${coupon.coupon_type==1 }">
																	&nbsp;&nbsp;${coupon.coupon_discount }원 할인,
																</c:if>
																<c:if test="${coupon.coupon_type==0 }">
																	&nbsp;&nbsp;${coupon.coupon_discount }% 할인,
																	최대 ${coupon.coupon_max }원 할인적용
																</c:if>
																최소 주문 금액:${coupon.coupon_min }원
																</option>
															</c:forEach>
														</select>
														</div>
														
														<div id="selBox" style="display:none;">
														<c:forEach var="coupon" items="${myCoupon }">
															<input type="hidden" id="couponserial" value="${coupon.coupon_use_serial }">
															<input type="hidden" id="couponMax" value="${coupon.coupon_max }">
															<input type="hidden" id="couponMin" value="${coupon.coupon_min }">
															<input type="hidden" id="couponDiscount" value="${coupon.coupon_discount }">
														</c:forEach>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<th></th>
												<td><span id="couponFalse" style="color:red"></span></td>
											</tr>
											<tr class="emoney_use ">
												<th class="no_emoney">적립금 적용 <input type="hidden"
													value="0" name="checkEmoney">
												</th>
												<c:if test="${userPoint==0 }">
													<td>사용 가능한 적립금이 없습니다.
													<input type="hidden" name="using_point" id="emoney" value="0">
													</td>
												</c:if>
												<c:if test="${userPoint>0 }">
													<td>
														<div id="ondealCheck">
															<div class="emoney_reg">
																<input type="text" name="using_point" id="usePoint"
																	class="number_only" value="" placeholder="0"
																	pattern="[0-9]*" inputmode="decimal"
																	onblur=""
																	onkeyup="javascript:inputPoint()"
																	onkeydown="if (event.keyCode == 13) {return false}">
																<div class="check">
																	<label class="emoney_chkbox"> <input
																		type="checkbox" name="allPoint" id="allPoint"> <span
																		class="txt_checkbox">모두사용</span>
																	</label>
																</div>
															</div>
															<p class="possess">
															<strong id="notMore" style="display:none; color:red;">결제할 금액보다 많은 적립금을 사용할 순 없습니다.<br/></strong>
															<strong id="excessPoint" style="display:none; color:orange;">보유한 적립금을 초과하여 사용할 순 없습니다.</strong>
																<fmt:formatNumber var="point" maxFractionDigits="3" value="${userPoint }"/>
																보유 적립금 : <strong class="emph">${point }</strong>원 
																
																<strong id="not1Place" style="display:none; color:red;">10원 단위로 사용할 수 있습니다.</strong>
															</p>
															<ul class="list_notice">
																<li>· 보유 적립금 100원 이상부터 사용가능</li>
																<li>· 적립금 내역: 마이컬리 &gt; 적립금</li>
															</ul>
														</div>
														<p id="msgNomoney"></p>
													</td>
												</c:if>
											</tr>
										</tbody>
									</table>
								</div>
							</div>


							<div class="data_method">
								<h2 class="tit_section" id="titFocusMethod">결제 수단</h2>

								<input type="hidden" name="escrow" value="N">
								<div class="type_form" style="display: block;">
									<input type="hidden" name="save_payment_method" value="false">
									<label> 
									</label>
								</div>
								<table class="goodsinfo_table tbl_left">
									<tbody>
										<tr>
											<th>결제수단 선택</th>
											<td>

												<div class="payment_first on">
													<label id="kakaopayPayment" class="kakaopay"
														data-payment="kakao"> <input type="radio"
														name="settlekind" value="kakao-pay"
														checked="checked">
														<img
														src="https://res.kurly.com/mobile/service/order/2109/ico_kakao-pay.png"
														alt="카카오페이" class="logo_kakao"> <span
														id="paymentBenefitKakao" class="icon_benefit"
														style="display: inline;">혜택</span>
													</label>
													<p class="notice_card kakao">카카오페이 전용 쿠폰 사용 시, 카카오페이
														결제만 가능합니다.</p>
												</div>

												<ul class="menu_payment">
													<!-- <li class="simple"><label for="paymentChai"
														data-payment="simple"> 간편결제 <span
															id="paymentBenefitSimple" class="icon_benefit"
															style="display: inline;">혜택</span>
													</label></li>
													<li class="phone"><label data-payment="mobilians">
															<input type="radio" data-phone="mobilians"
															name="settlekind" value="h"
															onclick="input_escrow(this,'N')"> 휴대폰
													</label></li> -->
												</ul>
											</td>
										</tr>
										<tr id="payNotice">
											<td class="txt_notice" colspan="2">
												<ul>
													<li>※ 카카오페이 결제 시, 결제하신 수단으로만 환불되는
														점 양해부탁드립니다.</li>
													<li>※ 고객님은 안전거래를 위해 현금 등으로 결제시 저희 쇼핑몰에서 가입한 토스 페이먼츠의
														구매안전(에스크로) 서비스를 이용하실 수 있습니다.</li>

													<li id="coupon_typinfo" style="display: none">※
														무통장입금에서만 사용가능한 쿠폰을 선택하였습니다. 다른 결제 수단을 선택하시려면 쿠폰을 제거 하여
														주십시오.</li>
												</ul>
											</td>
										</tr>
									</tbody>
								</table>
								<input type="hidden" name="undeliver_way" value="2">

								<!-- <div id="cash" style="display: none;">
									<h2 class="tit_section">현금영수증발급</h2>
									<table class="goodsinfo_table">
										<tbody>
											<tr>
												<th>현금영수증</th>
												<td><label class="label_radio"> <input
														type="radio" name="cashreceipt" value="Y"
														onclick="cash_required()"> 신청
												</label> <label class="label_radio checked"> <input
														type="radio" name="cashreceipt" value="N"
														onclick="cash_required()" checked=""> 신청안함
												</label></td>
											</tr>
											<tr>
												<th>발행용도</th>
												<td><label class="label_radio checked"> <input
														type="radio" name="cashuseopt" value="0"
														onclick="setUseopt()" checked=""> 소득공제용
												</label> <label class="label_radio"> <input type="radio"
														name="cashuseopt" value="1" onclick="setUseopt()">
														지출증빙용
												</label></td>
											</tr>
											<tr>
												<th><span id="cert_0" style="display: block;">휴대폰번호</span>
													<span id="cert_1" style="display: none;">사업자번호</span></th>
												<td style="padding-top: 14px;"><input type="text"
													name="cashcertno" value="" option="regNum" class="line"
													placeholder="- 생략"></td>
											</tr>
										</tbody>
									</table>
								</div> -->

							</div>
							<div style="clear: both;"></div>
							<h2 class="tit_section" id="titFocusAgree">개인정보 수집/제공</h2>
							<table class="goodsinfo_table">
								<tbody>
									<tr>
										<td class="reg_agree">
											<div class="bg_dim"></div>
											<div class="check type_form">
												<label class="agree_check"> <input type="checkbox"
													name="ordAgree" value="y" required="" fld_esssential=""
													label="결제 진행 필수 동의" msgr="결제 진행 필수 동의 내용에 동의하셔야 결제가 가능합니다.">
													<span class="ico"></span> 결제 진행 필수 동의
												</label>
												<ul class="list_agree">
													<li>
														<span class="subject">개인정보 수집 · 이용 및 처리 동의
															<span class="emph">(필수)</span>
														</span>
														<a href="#payNotice" class="link_terms" id="terms1">보기</a></li>
													<li id="kurlyTerms"><span class="subject">전자지급
															결제대행 서비스 이용약관 동의
															<span class="emph">(필수)</span>
														</span> 
														<a href="#payNotice" class="link_terms" id="terms2">보기</a>
													</li>
												</ul>
												<div class="layer layer_agree" style="display:block">
													<div class="choice_agree view_terms" id="termView1" style="display:none; border:4px solid">
														<div class="inner_layer">
															<div class="in_layer" id="viewTerms">
																<div class="layer_head">
																	<h3 class="tit_layer">
																		개인정보 수집·이용 및 처리 동의<span class="emph">(필수)</span>
																	</h3>
																</div>
																<div class="layer_body">
																	<div class="box_tbl">
																		<h4 class="tit_box">개인정보 수집·이용 동의</h4>
																		<table>
																			<caption class="screen_out">개인정보의 수집 및 이용목적</caption>
																			<colgroup>
																				<col width="30%">
																				<col width="35%">
																				<col width="35%">
																			</colgroup>
																			<thead>
																				<tr>
																					<th scope="row">수집 목적</th>
																					<th scope="row">수집 항목</th>
																					<th scope="row">보유 기간</th>
																				</tr>
																			</thead>
																			<tbody>
																				<tr class="log_in" style="display: table-row;">
																					<td>온라인 쇼핑 구매자에 대한 상품 결제 및 배송</td>
																					<td>결제정보, 수취인명, 휴대폰 번호, 수취인 주소</td>
																					<td class="emph">업무 목적 달성 후 파기<br>(단, 타
																						법령에 따라 법령에서 규정한 기간 동안 보존)
																					</td>
																				</tr>
																				<tr class="log_out" style="display: none;">
																					<td>온라인 쇼핑 구매자에 대한 상품 결제 및 배송</td>
																					<td>주문자 정보(이름, 휴대폰 번호, 이메일), 결제정보, 수취인 정보(주소,
																						이름, 휴대폰 번호)</td>
																					<td class="emph">업무 목적 달성 후 파기<br>(단, 타
																						법령에 따라 법령에서 규정한 기간 동안 보존)
																					</td>
																				</tr>
																			</tbody>
																		</table>
																		<br>
																		<h4 class="tit_box">개인정보 업무 위탁 동의</h4>
																		<table>
																			<caption class="screen_out">개인정보 취급업무 위탁 동의</caption>
																			<colgroup>
																				<col width="30%">
																				<col width="35%">
																				<col width="35%">
																			</colgroup>
																			<thead>
																				<tr>
																					<th scope="row">위탁받는 자</th>
																					<th scope="row">위탁정보</th>
																					<th scope="row">업무내용</th>
																				</tr>
																			</thead>
																			<tbody>
																				<tr class="log_in" style="display: table-row;">
																					<td>㈜프레시솔루션, 씨제이대한통운㈜</td>
																					<td>수취인명, 휴대폰 번호, 수취인 주소</td>
																					<td>온라인 쇼핑 구매자에 대한 상품 배송</td>
																				</tr>
																				<tr class="log_out" style="display: none;">
																					<td>㈜프레시솔루션, 씨제이대한통운㈜</td>
																					<td>수취인 정보(주소, 이름, 휴대폰 번호)</td>
																					<td>온라인 쇼핑 구매자에 대한 상품 배송</td>
																				</tr>
																				<tr>
																					<td>제이앤피닷컴㈜(삼성전자㈜), ㈜아웃사이드인컴퍼니(LG전자㈜),
																						㈜비허브(키친에이드코리아 유한회사), ㈜밀레코리아(㈜지아이지)</td>
																					<td>수취인명, 휴대폰 번호, 수취인 주소, 배송희망일, 배송 요청사항, 기타</td>
																					<td>전문 배송 서비스(예약, 설치 및 수거 등에 대한 고객상담)</td>
																				</tr>
																			</tbody>
																		</table>
																		<p class="tbl_desc narrow_emph">※ 원활한 서비스 제공을 위해
																			해당 상품 구매 및 위탁 동의하신 경우에만 개인정보가 제공됩니다.</p>
																		<br>
																		<h4 class="tit_box">개인정보 제3자 제공 동의</h4>
																		<table>
																			<caption class="screen_out">개인정보 제3자 제공 동의</caption>
																			<colgroup>
																				<col width="25%">
																				<col width="25%">
																				<col width="25%">
																				<col width="25%">
																			</colgroup>
																			<thead>
																				<tr>
																					<th scope="row">제공받는 자</th>
																					<th scope="row">제공 항목</th>
																					<th scope="row">제공 목적</th>
																					<th scope="row">보유 및 이용 기간</th>
																				</tr>
																			</thead>
																			<tbody>
																				<tr>
																					<td class="emph" rowspan="2">㈜올스테이, ㈜컴퍼니합,
																						㈜인터파크, ㈜온다</td>
																					<td class="less_emph" rowspan="2">서비스 제공(숙박,
																						항공, 여행상품 등 예약 및 취소), 고객 상담 및 불만처리</td>
																					<td class="emph">[숙박 및 여행] 구매자 정보(성명, 휴대폰
																						번호,이메일), 예약일자, 구매상품정보</td>
																					<td class="emph" rowspan="2">업무목적 달성 후 파기(단,
																						타법령에 따라 법령에서 규정한 기간 동안 보존)</td>
																				</tr>
																				<tr>
																					<td class="emph">[항공] 구매자 정보(성명, 휴대폰 번호, 이메일),
																						탑승객 정보(이름, 휴대폰 번호, 생년월일, 성별), 예약일자, 구매상품정보</td>
																				</tr>
																				<tr>
																					<td class="emph">㈜오픈갤러리</td>
																					<td class="less_emph">서비스 제공(전문 배송, 설치 및 수거),
																						고객 상담 및 불만처리</td>
																					<td class="emph">주문자 정보(성명, 휴대폰번호, 주소), 구매일자,
																						구매상품정보</td>
																					<td class="emph">업무목적 달성 후 파기(단, 타법령에따라 법령에서
																						규정한 기간동안 보존)</td>
																				</tr>
																				<tr>
																					<td class="emph">㈜지엔씨미디어</td>
																					<td class="less_emph">서비스 제공(구매자 확인), 고객 상담 및
																						불만 처리</td>
																					<td class="emph">주문자 정보(성명, 휴대폰번호), 예약일자,
																						구매상품정보</td>
																					<td class="emph">업무목적 달성 후 파기(단, 타법령에따라 법령에서
																						규정한 기간동안 보존)</td>
																				</tr>
																			</tbody>
																		</table>
																		<p class="tbl_desc narrow_emph">※ 원활한 서비스 제공을 위해
																			해당 상품 구매 및 제3자 제공 동의하신 경우에만 개인정보가 제공됩니다.</p>
																		<p class="txt_service">서비스 제공을 위해서 필요한 최소한의
																			개인정보입니다. 동의를 해 주셔야 서비스를 이용하실 수 있으며, 동의하지 않으실 경우 서비스에
																			제한이 있을 수 있습니다.</p>
																	</div>
																</div>
															</div>
															<button type="button" class="btn_ok" onclick="javascript:termViewClose();">확인</button>
															<button type="button" class="btn_close">
																<span class="screen_out" onclick="javascript:termViewClose();">레이어 닫기</span>
															</button>
														</div>
													</div>
													<div class="choice_agree view_pg" id="termView2" style="display:none;border:4px solid">
														<div class="inner_layer">
															<div class="in_layer" id="viewPg">

																<div class="layer_head">
																	<h4 class="tit_layer">컬리페이 전자지급 결제대행 서비스 이용약관</h4>
																</div>
																<div class="layer_body">
																	<div class="box_tbl">
																		<div class="terms_view">

																			<strong class="tit_sub">제1조 (목적)</strong> 본 약관은 주식회사
																			컬리페이(이하 “회사”라 합니다)가 제공하는 전자지급 결제대행 서비스를 “이용자”가 이용함에
																			있어 “회사”와 “이용자” 간 권리, 의무 및 “이용자”의 이용 절차 등에 관한 사항을 규정하는
																			것을 그 목적으로 합니다. <strong class="tit_sub">제2조
																				(용어의 정의)</strong> ① 본 약관에서 사용하는 용어의 정의는 다음과 같습니다. <br> <br>
																			1. “전자금융거래”라 함은 “회사”가 “전자적 장치”를 통하여 금융상품 및 서비스를 제공(이하
																			“전자금융업무”라 합니다)하고, “이용자”가 “회사”의 종사자와 직접 대면하거나 의사소통을 하지
																			아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다. <br> 2.
																			“전자금융거래서비스”라 함은 “회사”가 “전자금융업무”로서 제공하는 전자지급 결제대행 서비스를
																			말합니다. <br> 3. “전자지급 결제대행 서비스”라 함은 전자적 방법으로 재화의
																			구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을
																			대행하거나 매개하는 서비스를 말합니다. <br> 4. “전자지급수단”이라 함은 신용카드
																			등 전자금융거래법 제2조 제11호에서 정하는 전자적 방법에 따른 지급수단을 말합니다. <br>
																			5. “전자지급거래”라 함은 자금을 주는 자(이하 “지급인”이라 합니다)가 “회사”로 하여금
																			“전자지급수단”을 이용하여 자금을 받는 자(이하 “수취인”이라 합니다)에게 자금을 이동하게 하는
																			“전자금융거래”를 말합니다. <br> 6. “전자적 장치”라 함은 “전자금융거래”정보를
																			전자적 방법으로 전송하거나 처리하는데 이용되는 장치로서 현금자동지급기, 자동입출금기, 지급용
																			단말기, 컴퓨터, 전화기 그 밖에 전자적 방법으로 정보를 전송하거나 처리하는 장치를 말합니다.
																			<br> 7. “접근매체”라 함은 “전자금융거래”에 있어서 “거래지시”를 하거나
																			“이용자” 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 다음 각 목의 어느 하나에
																			해당하는 수단 또는 정보를 말합니다. <br> 가) 전자식 카드 및 이에 준하는 전자적
																			정보 <br> 나) 전자서명법 제2조 제4호의 전자서명생성정보 및 같은 조 제7호의
																			인증서 <br> 다) “회사”에 등록된 “이용자”번호 <br> 라)
																			“이용자”의 생체정보 <br> 마) 가목 또는 나목의 수단이나 정보를 사용하는데 필요한
																			비밀번호 <br> 8. “이용자”라 함은 본 약관에 동의하고 본 약관에 따라 “회사”가
																			제공하는 “전자금융거래서비스”를 이용하는 자를 말합니다. <br> 9. “거래지시”라
																			함은 “이용자”가 본 약관에 따라 “회사”에게 “전자금융거래”의 처리를 지시하는 것을 말합니다.
																			<br> 10. “오류”라 함은 “이용자”의 고의 또는 과실 없이 “전자금융거래”가 본
																			약관 또는 “이용자”의 “거래지시”에 따라 이행되지 아니한 경우를 말합니다. <br>
																			② 본 조 및 본 약관의 다른 조항에서 정의한 것을 제외하고는 전자금융거래법 등 관련 법령에서
																			정한 바에 따릅니다. <strong class="tit_sub">제3조 (약관의
																				명시 및 변경)</strong> ① “회사”는 “이용자”가 “전자금융거래서비스”를 이용하기 전에 본 약관을
																			서비스페이지에 게시하고 “이용자”가 본 약관의 중요한 내용을 확인할 수 있도록 합니다. <br>
																			② “회사”는 “이용자”의 요청이 있는 경우 전자문서의 전송방식(이하 전자우편을 이용한 전송을
																			포함합니다) 등에 의하여 본 약관의 사본을 “이용자”에게 교부합니다. <br> ③
																			“회사”는 “이용자”가 약관의 내용에 대한 설명을 요청하는 경우 다음 각 호의 어느 하나의
																			방법으로 “이용자”에게 약관의 중요내용을 설명합니다. <br> 1. 약관의 중요내용을
																			“이용자”에게 직접 설명 <br> 2. 약관의 중요내용에 대한 설명을 전자적 장치를
																			통하여 “이용자”가 알기 쉽게 표시하고 “이용자”로부터 해당 내용을 충분히 인지하였다는
																			의사표시를 전자적 장치를 통하여 수령 <br> ④ “회사”가 본 약관을 변경하는 때에는
																			그 시행일 1개월 전에 변경되는 약관을 “회사” 홈페이지에 게시함으로써 “이용자”에게
																			공지합니다. 다만 법령의 개정으로 인하여 긴급하게 약관을 변경하는 때에는 변경된 약관을 “회사”
																			홈페이지에 1개월 이상 게시하고 “이용자”에게 통지합니다. <br> ⑤ “회사”는
																			제4항의 공지나 통지를 할 경우, “이용자”가 약관의 변경에 동의하지 아니한 경우 공지나 통지를
																			받은 날로부터 30일 이내에 계약을 해지할 수 있으며, 변경내용에 대하여 이의를 제기하지
																			아니하는 경우에는 변경에 동의한 것으로 본다”라는 취지의 내용을 함께 공지합니다. <br>
																			⑥ “이용자”가 제4항의 공지나 통지된 날로부터 변경되는 약관의 시행일 전의 영업일까지
																			변경내용에 대하여 이의를 제기하지 아니하는 경우에는 약관의 변경에 동의한 것으로 봅니다. <strong
																				class="tit_sub">제4조 (서비스 이용 시간)</strong> ① “회사”는
																			“이용자”에게 연중무휴 1일 24시간 “전자금융거래서비스”를 제공함을 원칙으로 합니다. 단,
																			금융기관 및 기타 결제수단 발행업자 등의 사정에 따라 달리 정할 수 있습니다. <br>
																			② “회사”는 정보통신설비의 보수, 점검 및 기타 기술상의 필요나 금융기관 및 기타 결제수단
																			발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, “전자금융거래서비스” 중단 3일 전까지
																			게시 가능한 전자적 수단을 통하여 “전자금융거래서비스” 중단 사실을 게시한 후
																			“전자금융거래서비스”를 일시 중단할 수 있습니다. 다만, 시스템 장애복구, 긴급한 프로그램
																			보수, 외부요인 등 불가피한 경우에는 사전 게시 없이 “전자금융거래서비스”를 중단할 수
																			있습니다. <strong class="tit_sub">제5조 (거래내용의 확인)</strong>
																			① “회사”는 “이용자”가 “전자금융거래”에 사용하는 “전자적 장치”(“회사”와 “이용자”
																			사이에 미리 약정한 “전자적 장치”가 있는 경우에는 그 “전자적 장치”를 포함합니다)를 통하여
																			“이용자”의 거래내용 (“이용자”의 “오류”정정 요구사실 및 처리결과에 관한 사항'을
																			포함합니다.)을 확인할 수 있도록 하며, “이용자”가 거래내용을 서면(전자문서를 제외합니다.
																			이하 같습니다)으로 제공할 것을 요청하는 경우에는 그 요청을 받은 날부터 2주 이내에 거래내용에
																			관한 서면을 교부합니다. <br> ② “회사”는 “이용자”가 “전자적 장치”의
																			운영장애, 그 밖의 사유로 거래내용을 확인하게 할 수 없는 때에는 인터넷 등을 이용하여 즉시 그
																			사유를 알리고, 그 사유가 종료된 때부터 “이용자”가 거래내용을 확인할 수 있도록 합니다. <br>
																			③ “회사”는 제1항에 따라 “이용자”로부터 거래내용을 서면으로 제공할 것을 요청받은 경우
																			“전자적 장치”의 운영장애, 그 밖의 사유로 거래내용을 제공할 수 없는 때에는 그 “이용자”에게
																			즉시 알리며, 이 경우 거래내용에 관한 서면의 교부기간을 산정함에 있어서 “전자적 장치”의
																			운영장애, 그 밖의 사유로 거래내용을 제공할 수 없는 기간은 산입하지 아니 합니다. <br>
																			④ 제1항의 대상이 되는 거래내용 중 대상기간이 5년인 것은 다음 각 호와 같습니다. <br>
																			1. “전자금융거래”의 종류 및 금액, “전자금융거래”의 상대방에 관한 정보 <br>
																			2. “전자금융거래”의 거래일시, “전자적 장치”의 종류 및 “전자적 장치”를 식별할 수 있는
																			정보 <br> 3. “전자금융거래”가 계좌를 통하여 이루어지는 경우 거래계좌의 명칭
																			또는 번호 <br> 4. “전자금융거래” 신청, 조건변경에 관한 내용 <br>
																			⑤ 제1항의 대상이 되는 거래내용 중 대상기간이 1년인 것은 다음 각 호와 같습니다. <br>
																			1. “이용자”의 “오류” 정정 요구사실 및 처리결과에 관한 사항 <br> ⑥
																			“이용자”가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수
																			있습니다. <br> 1. 주소 : 서울특별시 강남구 테헤란로 133, 2층(역삼동,
																			한국타이어빌딩) <br> 2. 이메일 : kurlypay@kurlypay.co.kr <br>
																			3. 전화번호 : 02-6953-7312 <strong class="tit_sub">제6조
																				(“거래지시”의 철회)</strong> ① “이용자”가 “회사”의 “전자금융거래서비스”를 이용하여
																			“전자지급거래”를 한 경우, “이용자”는 그 지급의 효력이 발생하기 전까지 제5조 제6항에
																			기재된 연락처로 전자문서의 전송 등을 통하여 “거래지시”를 철회할 수 있습니다. <br>
																			② 전항의 지급의 효력이 발생하는 시점이란, “거래지시”된 금액의 정보가 “수취인”의 계좌가
																			개설되어 있는 금융회사 또는 “회사”의 전자적 장치에 입력이 끝난 때를 의미합니다. <br>
																			③ “이용자”는 제1항의 지급의 효력이 발생한 경우에는 전자상거래 등에서의 소비자보호에 관한
																			법률 등 관련 법령상 청약의 철회의 방법에 따라 결제대금을 반환 받을 수 있습니다. <strong
																				class="tit_sub">제7조 (“오류”의 정정 등)</strong> ① “이용자”는
																			“전자금융거래서비스”를 이용함에 있어 “오류”가 있음을 안 때에는 “회사”에 대하여 그 정정을
																			요구할 수 있습니다. <br> ② “회사”는 전항의 규정에 따른 “오류”의 정정요구를
																			받은 때 또는 스스로 “전자금융거래”에 “오류”가 있음을 안 때에는 이를 즉시 조사하여 처리한
																			후 정정요구를 받은 날 또는 “오류”가 있음을 안 날부터 2주 이내에 그 원인과 결과를 문서,
																			전화 또는 전자우편으로 “이용자”에게 알려 드립니다. 다만, “이용자”가 문서로 알려줄 것을
																			요청하는 경우에는 문서로 알려 드립니다. <strong class="tit_sub">제8조
																				(“전자금융거래”기록의 생성∙보존 및 파기)</strong> ① “회사”는 “전자금융거래”의 내용을 추적,
																			검색하거나 그 내용에 오류가 발생할 경우에 이를 확인하거나 정정할 수 있는 기록(이하 본 조에서
																			“전자금융거래”기록 이라 합니다)을 생성하여 보존합니다. <br> ② 전항의 규정에
																			따라 “회사”가 보존하여야 하는 기록의 종류 및 보존기간은 다음 각 호와 같습니다. <br>
																			1. 다음 각 목의 “전자금융거래” 기록은 5년간 보존합니다. <br> 가) 본 약관
																			제5조 제4항 제1호 내지 제4호에 관한 사항 <br> 나) 해당 “전자금융거래”와
																			관련한 “전자적 장치”의 접속기록 <br> 다) 건당 거래금액이 1만원을 초과하는
																			“전자금융거래”에 관한 기록 <br> 2. 다음 각 목의 “전자금융거래” 기록은 1년간
																			보존합니다. <br> 가) 제5조 제5항 제1호에 관한 사항 <br> 나)
																			건당 거래금액이 1만원 이하인 “전자금융거래”에 관한 기록 <br> 다)
																			“전자지급수단”의 이용과 관련된 거래승인에 관한 기록 <br> ③ “회사”는 본 조
																			제2항에 따라 보존하여야 하는 기간이 경과하고 금융거래 등 상거래관계가 종료된 경우에는 5년
																			이내에 “전자금융거래”기록(신용정보의 이용 및 보호에 관한 법률에 따른 신용정보는 제외)을
																			파기합니다. 다만, 다른 법령 등에 따라 보관하여야 하는 경우에는 그러하지 아니합니다. <strong
																				class="tit_sub">제9조 (“전자금융거래”정보의 제공금지)</strong> ①
																			“회사”는 “전자금융거래서비스”를 제공함에 있어서 취득한 “이용자”의 인적사항, “이용자”의
																			계좌, “접근매체” 및 “전자금융거래”의 내용과 실적에 관한 정보 또는 자료를, 법령에 의하거나
																			“이용자”의 동의를 얻은 경우를 제외하고는 제3자에게 제공, 누설하거나 업무상 목적 외에
																			사용하지 아니합니다. <br> ② “회사”는 “이용자”가 안전하게
																			“전자금융거래서비스”를 이용할 수 있도록 “이용자”의 개인정보보호를 위하여 개인정보처리방침을
																			제정하여 운용합니다. “회사”의 개인정보처리방침은 “회사”의 홈페이지에서 확인할 수 있습니다.
																			<strong class="tit_sub">제10조 (“접근매체”의 관리)</strong> ①
																			“회사”는 “전자금융거래서비스” 제공 시 “접근매체”를 선정하여 “이용자”의 신원, 권한 및
																			“거래지시”의 내용 등을 확인합니다. <br> ② “이용자”는 “접근매체”를 사용함에
																			있어서 다른 법률에 특별한 규정이 없는 한 다음 각 호의 행위를 하여서는 아니 됩니다. 다만,
																			전자금융거래법 제18조에 따른 선불전자지급수단이나 전자화폐의 양도 또는 담보제공을 위하여 필요한
																			경우(제3호의 행위 및 이를 알선하는 행위는 제외한다)에는 그러하지 아니합니다. <br>
																			1. “접근매체”를 양도하거나 양수하는 행위 <br> 2. 대가를 수수, 요구 또는
																			약속하면서 “접근매체”를 대여받거나 대여하는 행위 또는 보관, 전달, 유통하는 행위 <br>
																			3. 범죄에 이용할 목적으로 또는 범죄에 이용될 것을 알면서 “접근매체”를 대여받거나 대여하는
																			행위 또는 보관, 전달, 유통하는 행위 <br> 4. “접근매체”를 질권의 목적으로
																			하는 행위 <br> 5. 제1호부터 제4호까지의 행위를 알선하거나 광고하는 행위 <br>
																			③ “이용자”는 자신의 “접근매체”를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며,
																			“접근매체”의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다. <br>
																			④ “회사”는 “이용자”로부터 “접근매체”의 분실이나 도난 등의 통지를 받은 때에는 그 때부터
																			제3자가 그 접근매체를 사용함으로 인하여 “이용자”에게 발생한 손해를 배상할 책임이 있습니다.
																			다만, 선불전자지급수단이나 전자화폐의 분실∙도난의 통지 전 저장된 금액에 대한 손해에 대하여는
																			책임을 지지 아니합니다. <strong class="tit_sub">제11조
																				(회사의 책임)</strong> ① “회사”는 다음 각 호의 어느 하나에 해당하는 사고로 인하여 “이용자”에게
																			손해가 발생한 경우에는 그 손해를 배상할 책임을 집니다. <br> 1. “접근매체”의
																			위조나 변조로 발생한 사고 <br> 2. 계약체결 또는 “거래지시”의 전자적 전송이나
																			처리 과정에서 발생한 사고 <br> 3. “전자금융거래”를 위한 “전자적 장치” 또는
																			정보통신망 이용촉진 및 정보보호 등에 관한 법률 제2조 제1항 제1호에 따른 정보통신망에
																			침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 “접근매체”의 이용으로 발생한 사고 <br>
																			② 제1항의 규정에도 불구하고 “회사”는 다음 각 호의 어느 하나에 해당하는 경우에는 그 책임의
																			전부 또는 일부를 “이용자”가 부담하게 할 수 있습니다. <br> 1. “이용자”가
																			“접근매체”를 제3자에게 대여하거나 그 사용을 위임한 경우 또는 양도나 담보의 목적으로 제공한
																			경우 <br> 2. 제3자가 권한 없이 “이용자”의 “접근매체”를 이용하여
																			“전자금융거래”를 할 수 있음을 알았거나 쉽게 알 수 있었음에도 불구하고 “접근매체”를
																			누설하거나 노출 또는 방치한 경우 <br> 3. “회사”가 제10조 제1항에 따른 확인
																			외에 보안강화를 위하여 “전자금융거래” 시 요구하는 추가적인 보안조치를 “이용자”가 정당한 사유
																			없이 거부하여 제1항 제3호에 따른 사고가 발생한 경우 <br> 4. “이용자”가
																			제3호에 따른 추가적인 보안조치에 사용되는 매체, 수단 또는 정보에 대하여 다음 각 목의 어느
																			하나에 해당하는 행위를 하여 제1항 제3호에 따른 사고가 발생한 경우 <br> 가)
																			누설, 노출 또는 방치한 행위 <br> 나) 제3자에게 대여하거나 그 사용을 위임한
																			행위 또는 양도나 담보의 목적으로 제공한 행위 <br> 5. 법인(중소기업기본법 제2조
																			제2항에 의한 소기업을 제외합니다)인 “이용자”에게 손해가 발생한 경우로 “회사”가 사고를
																			방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한
																			주의의무를 다한 경우 <strong class="tit_sub">제12조
																				(“전자지급거래”계약의 효력)</strong> ① “회사”는 “이용자”와 체결한 “전자지급거래” 계약에 따라
																			“이용자”가 “거래지시”한 금액을 전송하여 지급이 이루어지도록 합니다. <br> ②
																			“회사”는 제1항의 규정에 따른 자금의 지급이 이루어질 수 없게 된 때에는 수령한 자금을
																			“이용자”에게 반환하여야 합니다. 이 경우 “이용자”의 과실로 인하여 지급이 이루어지지 아니한
																			때에는 그 전송을 하기 위하여 지출한 비용을 공제할 수 있습니다. <strong
																				class="tit_sub">제13조 (이용금액의 한도)</strong> “회사”의 정책 및
																			결제업체(신용카드사, 이동통신사 등)의 기준에 따라 “이용자”의 결제수단 별 월 누적 결제액 및
																			결제한도가 제한될 수 있습니다. <strong class="tit_sub">제14조
																				(분쟁처리 및 분쟁조정)</strong> ① “이용자”는 “회사”의 홈페이지에 게시된 분쟁처리 책임자 및
																			담당자에 대하여 “전자금융거래”에 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를
																			요구할 수 있습니다. <br> ② “이용자”는 “회사”에 대하여 서면(전자문서를
																			포함한다) 또는 전자적 장치를 이용하여 “회사”에 분쟁의 처리를 신청할 수 있으며, 이 경우
																			“회사”는 15일 이내에 이에 대한 조사 또는 처리 결과를 “이용자”에게 안내합니다. <br>
																			③ “이용자”가 “전자금융거래”의 처리에 관하여 이의가 있을 때에는 금융위원회의 설치 등에 관한
																			법률에 따른 금융감독원의 금융분쟁조정위원회 또는 소비자기본법에 따른 한국소비자원의
																			소비자분쟁조정위원회에 분쟁조정을 신청할 수 있습니다. <strong class="tit_sub">제15조
																				(회사의 안정성 확보 의무)</strong> “회사”는 “전자금융거래”가 안전하게 처리될 수 있도록 선량한
																			관리자로서의 주의를 다하며, “전자금융거래”의 안전성과 신뢰성을 확보할 수 있도록 전자적
																			전송이나 처리를 위한 인력, 시설, “전자적 장치”, 소요경비 등의 정보기술부문, 전자금융업무
																			및 전자서명법에 의한 인증서의 사용 등 인증방법에 관하여 금융위원회가 정하는 기준을 준수합니다.
																			<strong class="tit_sub">제16조 (약관 외 준칙)</strong> ①
																			“회사”와 “이용자” 사이에 개별적으로 합의한 사항이 본 약관에 정한 사항과 다를 때에는 그
																			합의 사항을 본 약관에 우선하여 적용합니다. <br> ② 제1항에서 정한 사항 이외에
																			본 약관에서 정하지 아니한 사항(용어의 정의를 포함합니다)에 대하여 “회사”와 “이용자” 사이에
																			다른 합의사항이 없는 때에는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률,
																			여신전문금융업법 등 관련 법령에서 정한 바에 따릅니다. <strong
																				class="tit_sub">제17조 (관할)</strong> “회사”와 “이용자” 간에
																			발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다. <strong
																				class="tit_sub">부칙</strong> <strong class="tit_sub">제1조
																				(시행일)</strong> 본 약관은 2021년 10월 13일부터 적용합니다. <br> <br>
																			주식회사 컬리페이 <br> <br>
																		</div>

																	</div>
																</div>




															</div>
															<button type="button" class="btn_ok" onclick="javascript:termViewClose();">확인</button>
															<button type="button" class="btn_close" onclick="javascript:termViewClose();">
																<span class="screen_out">레이어 닫기</span>
															</button>
														</div>
													</div>

													<!-- <div class="choice_agree view_layer">
														<div class="inner_layer">
															<div class="in_layer in_allpaper">
																<img
																	src="https://res.kurly.com/pc/service/order/2012/bnr_allpaper_big_v2.png"
																	alt="샛별배송은 왜 종이 포장재를 사용할까요?">
																<p class="screen_out">샛별배송을 사용하는 것만으로도 지구를 위하는 일에
																	함께하실 수 있어요. 신선함을 지키는 보냉력과 내구성은 그대로! 다른 어떤 소재보다도 재활용성이
																	우수하니까! 폐기해도 빠르게 분해되니까!</p>
															</div>
															<button type="button" class="btn_ok">확인</button>
														</div>
													</div> -->
												</div>

											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<input type="button" id="payBt" value="${payPrice }원 결제하기" onclick="javascript:reqeustPay()" class="btn_payment">
						</form>
					</div>
				</div>

			</div>
		</div>
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

	<a href="#top" id="pageTop">맨 위로가기</a>
<script>
var originPayPrice=parseInt($("input#payment").val());
var rePoint=0;
var keepPayPrice=parseInt($("input#payment").val());
var couponIndex=-1;
$(document).ready(function(){
	$("a#btn_dropup").click(function(){
		if($("ul.list_product").css("display")=='none'){
			$("ul.list_product").css("display","block");
			$("div.short_info").css("display","none");
			$(this).css("transform","rotate(0deg)");
		}else{
			$("ul.list_product").css("display","none");
			$("div.short_info").css("display","block");
			$(this).css("transform","rotate(180deg)");
		}
	})
	$("input#allPoint").click(function(){
		if(${userPoint}>=100){
			if(${userPoint}<originPayPrice){
				if($(this).is(":checked")){
					$("input#usePoint").val(${userPoint});
					$("input#payment").val(originPayPrice-${userPoint});
					$("span#paper_settlement").text(parseInt(originPayPrice-${userPoint}).toLocaleString("ko-KR"))
					$("span#paper_reserves").text((${userPoint}).toLocaleString("ko-KR")+"원");
				}else{
					$("input#usePoint").val('');
					$("input#payment").val(originPayPrice);
					$("span#paper_settlement").text(originPayPrice.toLocaleString("ko-KR"))
					$("span#paper_reserves").text("0원");
				}
			}else{
				$("strong#notMore").fadeIn();
				$("strong#notMore").fadeOut(1000);
			}
		}
		$("input#payBt").val($("span#paper_settlement").text()+" 결제하기")
	})
})
function changeCoupon(){
	var point=$("input#usePoint").val();
	if(point==""||point==null)point=0;
	var index=parseInt(document.getElementById("selectCoupon").value);
	var discount;
	var max;
	var min;
	$("input#payment").val(originPayPrice-parseInt(point));
	var payment=parseInt($("input#payment").val());
	
	originPayPrice=keepPayPrice;
	$("span#couponFalse").text("")
	if(index>=0){
		discount=$("input#couponDiscount").eq(index).val();
		max=$("input#couponMax").eq(index).val();
		min=$("input#couponMin").eq(index).val();
		couponIndex=index;
		if(payment<min){
			couponIndex=-1;
			$("select#selectCoupon").val("-1").prop("selected",true);
			$("span#couponFalse").text("최소 주문 금액 이상이어야 할인이 적용됩니다.")
			$("input#payment").val(originPayPrice-point);
			$("span#paper_settlement").text(parseInt(originPayPrice-point).toLocaleString("ko-KR"))
			$("span#apr_coupon_data").text("0");
			$("input#payBt").val($("span#paper_settlement").text()+" 결제하기")
			return false;
		}
		if(discount<100){
			discount=parseInt(originPayPrice*discount/100);
			discount=parseInt(discount/10)*10;
			if(discount>max)discount=max;
		}
		if(payment<discount){
			couponIndex=-1;
			$("select#selectCoupon").val("-1").prop("selected",true);
			$("span#couponFalse").text("주문을 초과 적용되는 쿠폰은 사용할 수 없습니다.")
			$("input#payment").val(originPayPrice-point);
			$("span#paper_settlement").text(parseInt(originPayPrice-point).toLocaleString("ko-KR"))
			$("span#apr_coupon_data").text("0");
			$("input#payBt").val($("span#paper_settlement").text()+" 결제하기")
			return false;
		}
		$("input#payment").val(originPayPrice-discount-point);
		$("span#paper_settlement").text(parseInt(originPayPrice-discount-point).toLocaleString("ko-KR"))
		$("span#apr_coupon_data").text(parseInt(discount).toLocaleString("ko-KR"));
		originPayPrice=originPayPrice-discount;
	}else{
		couponIndex=-1;
		$("input#payment").val(originPayPrice-point);
		$("span#paper_settlement").text(parseInt(originPayPrice-point).toLocaleString("ko-KR"))
		$("span#apr_coupon_data").text("0");
	}
	$("input#payBt").val($("span#paper_settlement").text()+" 결제하기")
}
function inputPoint(){
	if((/[^0-9]/gi).test($("input#usePoint").val())){
		$("input#usePoint").val( $("input#usePoint").val().replace(/[^0-9]/gi,"") );
	}else{
		var point=$("input#usePoint").val();
		if(point=='')point=0;
		else point=parseInt(point);
		if(point>${userPoint}){
			$("input#usePoint").val(String(point).substring(0,String(rePoint).length));
			$("strong#excessPoint").css("display","block");
			$("input#payBt").val($("span#paper_settlement").text()+" 결제하기")
			return false;
		}
		$("strong#excessPoint").css("display","none");
		if(point<originPayPrice && point>=100){
			$("input#payment").val(originPayPrice-point);
			$("span#paper_settlement").text(parseInt(originPayPrice-point).toLocaleString("ko-KR"))
			$("span#paper_reserves").text(point.toLocaleString("ko-KR")+"원");
			rePoint=point;
			
		}else{
			if(point>=originPayPrice){
				$("strong#notMore").fadeIn();
				$("strong#notMore").fadeOut(1000);
			}
			$("input#payment").val(originPayPrice);
			$("span#paper_settlement").text(parseInt(originPayPrice).toLocaleString("ko-KR"))
			$("span#paper_reserves").text("0원");
			rePoint=point;
		}
		if(point!=0){
			if($("input#usePoint").val().substring($("input#usePoint").val().length-1)!="0"){
				$("strong#not1Place").css("display","block");
			}else{
				$("strong#not1Place").css("display","none");
			}
		}else{
			$("strong#not1Place").css("display","none");
		}
	}
	$("input#payBt").val($("span#paper_settlement").text()+" 결제하기")
}
$("a#terms1").click(function(){
	$("div.layer_agree").fadeIn(100);
	$("div#termView1").fadeIn(100);
})
$("a#terms2").click(function(){
	$("div.layer_agree").fadeIn(100);
	$("div#termView2").fadeIn(100);
})
function termViewClose(){
	$("div.layer_agree").fadeOut(100);
	$("div#termView1").fadeOut(100);
	$("div#termView2").fadeOut(100);
}
var IMP = window.IMP; // Can be omitted
IMP.init(""); // Example: imp00000000
function reqeustPay(){
	if($("input#isShipping").val()=="false"){
		alert("배송지 정보를 입력해주세요");
		return false
	}
	if($("input#usePoint").val()!=null){
		if($("input#usePoint").val()!="" && $("input#usePoint").val()!="0"){
			if($("input#usePoint").val().substring($("input#usePoint").val().length-1)!="0"){
				alert("적립금은 10원 단위로 사용할 수 있습니다.")
				return false;
			}
			if(parseInt($("input#usePoint").val())<100){
				alert("적립금은 100원 이상부터 사용가능합니다.");
				return false;
			}
		}
	}
	if(parseInt($("input#usePoint").val())>=originPayPrice){
		alert("결제금액보다 많은 적립금은 사용할 수 없습니다.");
		return false;
	}
	if($("input[name=ordAgree]").is(":checked")==false){
		alert("결제약관에 동의해주세요.")
		return false;
	}
	var amount=$("input#payment").val();
	var address = "${userInfo.user_address1}";
	if(${userInfo.user_address2!=null}){
		address=address+"${userInfo.user_address2}";
	}
	IMP.request_pay({
		 pg: "html5_inicis",
         pay_method: "card",
         merchant_uid: "merchant"+new Date().getTime(),
         name: '마켓컬리티 '+amount+'원 결제 요청',
         amount: amount,
         buyer_email: "${userInfo.user_email}",
         buyer_name: "${userInfo.user_name}",
         buyer_tel: "${userInfo.user_phone}",
         buyer_addr: address,
         buyer_postcode: ${userInfo.user_zipcode}
		},function(req){
			$.ajax({
				url:"iamport.do?imp_uid="+req.imp_uid,
				type:"POST",
				dataType:"JSON"
			}).done(function(data){
				var address1=$("input#address1").val();
				var address2=$("input#address2").val();
				var zipcode=$("input#zipcode").val();
				var listSize=String(${listSize});
				var price=$("input#orderPrice").val();
				var merchant=String(req.merchant_uid);
				var id='${userInfo.user_id}';
				var name='${userInfo.user_name}';
				var email='${userInfo.user_email}';
				var phone='${userInfo.user_phone}';
				var masterGoodsSerial=${purchaseList[0].category_goods_serial };
				var point=$("input#reserves").val();
				var pickupType=$("input#pickUpType").val();
				var pickupDetail=$("input#pickUpDetail").val();
				var messageTime=$("input#shippingMessageTime").val();
				var doorPw = $("input#doorPassword").val();
				var recipiName=$("input#recipientName").val();
				var recipiPhone=$("input#recipientPhone").val();
				var amount=parseInt(data.amount)
				var usingPoint=$("input#usePoint").val();
				if(usingPoint==""||usingPoint==null)usingPoint=0;
				var coupon=0;
				if(couponIndex>=0)coupon=$("input#couponserial").eq(couponIndex).val();
				if(req.paid_amount==data.response.amount){
					alert("성공적으로 결제되었습니다.");
					$.ajax({
						url:"paymentSuccess.do",
						type:"POST",
						dataType:"text",
						data:{
							"user_id":id,
							"user_name":name,
							"user_email":email,
							"user_phone":phone,
							"user_address1":address1,
							"user_address2":address2,
							"user_zipcode":zipcode,
							"order_goods_count":listSize,
							"order_goods_price":price,
							"order_coupon_serial":"0",
							"order_merchant_serial":merchant,
							"master_goods_serial":masterGoodsSerial,
							"user_point":point,
							"shipping_pickup_type":pickupType,
							"shipping_pickup_detail":pickupDetail,
							"shipping_message_time":messageTime,
							"shipping_door_password":doorPw,
							"shipping_recipient_name":recipiName,
							"shipping_recipient_phone":recipiPhone,
							"order_point":point,
							"usingPoint":usingPoint,
							"coupon_serial":coupon
						}
					}).done(function(location){
						window.location.href="index.do";
					})
				}
			})
		}
	);
}
function shippingInfoPage(){
	var url="shippingInfo.do?userName="+'${userInfo.user_name}'+"&phone="+'${userInfo.user_phone}'+"&shippingName=${shippingAddress.user_name}&shippingPhone=${shippingAddress.user_phone}";
	window.open(url,"post","toolbar=no, width=532, height=703,"+
			"directories=no, status=yes, scrollbars=yes,menubar=no, resizable=no");
}
</script>

	<!-- <iframe name="ifrmHidden" id="ifrmHidden" src="about:blank" style="display: none; width: 100%; height: 600px;"></iframe> -->
</body>
</html>
