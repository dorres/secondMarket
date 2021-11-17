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
	
	<c:if test="${orderPrice >= 400 }">
		<fmt:formatNumber var="payPrice" maxFractionDigits="3" value="${orderPrice}"/>
		<input type="hidden" id="payment" value="${orderPrice }">
	</c:if>
	<c:if test="${orderPrice < 400 }">
		<fmt:formatNumber var="payPrice" maxFractionDigits="3" value="${orderPrice+3000}"/>
		<input type="hidden" id="payment" value="${orderPrice+3000 }">
	</c:if>
	<fmt:formatNumber var="oldPrice" maxFractionDigits="3" value="${goodsPrice}"/>
	<fmt:formatNumber var="dc" maxFractionDigits="3" value="${orderPrice-goodsPrice }"/>
	<input type="hidden" id="payment" value="${orderPrice }">
	<input type="hidden" id="address1" value="${userInfo.user_address1 }"/>
	<input type="hidden" id="address2" value="${userInfo.user_address2 }"/>
	<input type="hidden" id="zipcode" value="${userInfo.user_zipcode}"/>
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


						<div id="popup-for-new-satbyul-user-web" class="service_delivery"
							style="display: block;">
							<h2 class="tit_bnr">
								<span id="new-satbyul-region">주문 지역(대구 일부)에 </span> <span
									class="emph"><span class="in_emph">샛별배송 </span></span> 서비스가
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
						<h2 class="tit_section fst">주문상품</h2>
						<div id="itemList" class="page_aticle order_goodslist">
							<div class="info_product">
								<a class="btn" id="btn_dropup" href="#none"><span class="screen_out">펼침
										/ 닫힘</span></a>
								<c:set var="listSize" value="${fn:length(purchaseList) }"/>
								<c:if test="${fn:length(purchaseList)==1 }">
									<div class="short_info">${purchaseList[0].category_goods_name }</div>
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
												src="https://kurlybuc.s3.ap-northeast-2.amazonaws.com/${item.category_goods_image_thumb}"
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
												value="sodlfdms56@naver.com" option="regEmail">
												sodlfdms56@naver.com
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



							<input type="hidden" name="zonecode" id="zonecode" value="41826">
							<input type="hidden" name="zipcode[]" id="zipcode0" value="">
							<input type="hidden" name="zipcode[]" id="zipcode1" value="">
							<input type="hidden" name="address" id="address"
								value="대구 서구 평리동 1207-6"> 
							<input type="hidden" name="road_address" id="road_address" value="대구 서구 국채보상로52길 31-28">
							<input type="hidden" name="address_sub" id="address_sub" value="단독주택 3층">
							<input type="hidden" name="deliPoli" id="deliPoli" value="0">
							<input type="hidden" name="deliveryType" id="deliveryType" value="direct">
							<input type="hidden" id="means_inp" name="means" value="">
							<input type="hidden" id="addressBookNo" name="addressbook_no" value="12223986">
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
									<span class="address" id="divDestination" style=""> <span
										class="default on" id="addrDefault" data-text="기본배송지">기본배송지</span>
										<span class="addr" id="addrInfo">대구 서구 국채보상로52길 31-28
											단독주택 3층</span> <span class="tag" id="addrTags"> <span
											class="badge star" id="addrBadge">샛별배송</span>
									</span>
									</span>
								</div>
							</div>

							<div class="order_section order_reception" id="divReception"
								style="">
								<h3 class="section_crux">상세 정보</h3>
								<div class="section_full">

									<div class="receiving off" id="receiverInfo">받으실 분 정보를
										입력해 주세요</div>
									<div class="way" id="wayPlace" style="display: none;">
										<span class="place" id="areaInfo" style="display: none;"></span>

										<span class="txt off" id="meanType">받으실 장소를 입력해 주세요</span>



										<div class="message" id="deliveryMessage"
											style="display: none;">
											<span class="place" id="deliveryMessageTitle">배송완료 메시지</span>
											<span class="txt" id="deliveryMessageDetail">배송 직후</span>
										</div>
									</div>
									<button type="button" id="btnUpdateSubAddress"
										data-address-no="" class="btn active">입력</button>

								</div>
							</div>

							<div id="package-method" class="order_section reusable_packaging"></div>
							<div id="bnrOrder" class="bnr_order" style="display: none;">
								<img
									src="https://res.kurly.com/kurly/img/2021/banner-order-paper_1050_107%402x.jpg"
									alt="All Paper Challenge">
								<p class="screen_out">사람에게도 환경에도 더 이로운 배송 친환경 포장재 자세히 보기</p>
							</div>

							<div id="divFrozen" class="order_section order_pack">
								<h3 class="section_crux">냉동상품 포장*</h3>
								<div class="section_full">
									<input type="hidden" name="isFrozenPack" value=""> <label
										class="label_radio checked"> <input type="radio"
										name="frozen_product_packing_option" value="0"
										checked="checked"> <span class="ico"></span> 종이박스 포장
										(기본)
									</label> <label class="label_radio"><input type="radio"
										name="frozen_product_packing_option" value="1"> <span
										class="ico"></span> 스티로폼 박스 포장 </label>
								</div>
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
													<c:if test="${orderPrice>=400 }">
														<span id="paper_delivery" class="">0</span>
													</c:if>
													<c:if test="${orderPrice<400 }">
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
												<span class="num pay_sum" id="paper_reserves">0 원</span> <input
													type="hidden" name="coupon_emoney" size="12" value="0"
													readonly="">
											</dd>
										</dl>
										<dl class="amount lst">
											<dt class="tit">최종결제금액</dt>
											<dd class="price">
												<span id="paper_settlement">${payPrice }</span> <span class="won">원</span>
											</dd>
										</dl>
										<p class="reserve" style="display: block;">
											<span class="ico">적립</span> 구매 시 <span class="emph"><span
												id="expectAmount">596</span> 원 (<span class="ratio">5</span>%)
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
														<div id="popselboxView" class="select_box">
															사용 가능 쿠폰 <span id="useCoupon">0</span>개 / 전체 <span
																id="haveCoupon">1</span>개
														</div>
														<div id="popSelbox" class="layer_coupon">
															<ul id="addpopSelList" class="list">
																<li class="fst checked ">
																	<div class="inner_item">
																		<span class="txt_tit default">쿠폰 적용 안 함</span>
																	</div>
																</li>
																<li style="pointer-events: none;">
																	<div class="inner_item">
																		<div class="item_row">
																			<div class="item_td left">
																				<span class="txt_apr coupon_na">사용불가</span><span
																					class="txt_is_dc" style="display: none;">원
																					할인</span>
																			</div>
																			<div class="item_td">
																				<span class="txt_tit coupon_na">1만원 쿠폰(2만원 이상
																					주문, 만료일 24시까지)</span> <span class="txt_desc coupon_na">2만원
																					이상 주문 시 1만원 할인</span> <span class="txt_expire coupon_na">유효기간
																					2021-11-15 까지</span>
																				<div id="apply_delivery_coupon"
																					class="is_delivery_coupon" style="display: none;">0</div>
																				<div class="txt_apply_coupon" style="display: none;">776814782</div>
																				<ul id="payment_gateways" style="display: none;">
																					<li>ALL</li>
																				</ul>
																				<div id="point_allowed" style="display: none;">true</div>
																				<span class="credit_card_id" style="display: none;"></span>
																			</div>
																		</div>
																	</div>
																</li>
															</ul>
															<div class="coupon_list_default" style="display: none;">
																<li class="fst checked ">
																	<div class="inner_item">
																		<span class="txt_tit default">쿠폰 적용 안 함</span>
																	</div>
																</li>
															</div>
															<div id="listItem" style="display: none">
																<div class="inner_item">
																	<div class="item_row">
																		<div class="item_td left">
																			<span class="txt_apr"></span>
																		</div>
																		<div class="item_td">
																			<span class="txt_tit"></span> <span class="txt_desc"></span>
																			<span class="txt_expire"></span>
																			<div id="apply_delivery_coupon"
																				class="is_delivery_coupon" style="display: none;"></div>
																			<div class="txt_apply_coupon" style="display: none;"></div>
																			<ul id="payment_gateways" style="display: none;"></ul>
																			<div id="point_allowed" style="display: none;"></div>
																			<span class="credit_card_id" style="display: none;"></span>
																		</div>
																	</div>
																</div>
															</div>
															<button id="popSelboxCancel" type="button"
																class="btn btn_cancel screen_out">취소</button>
															<button id="popSelboxSelect" type="button"
																class="btn btn_conf screen_out">확인</button>
															<button id="popSelboxClose" type="button"
																class="btn_close screen_out">닫기</button>
														</div>
													</div>
													<div id="notavailableMsg" class="txt_notavailable"
														style="display: none;"></div>
													<p class="txt_inquiry">
														<a href="#none" class="link" id="happyTalk">쿠폰사용문의(카카오톡)</a>
													</p>
												</td>
											</tr>
											<tr class="emoney_use ">
												<th class="no_emoney">적립금 적용 <input type="hidden"
													value="0" name="checkEmoney">
												</th>
												<td>사용 가능한 적립금이 없습니다. <input type="hidden"
													name="using_point" id="emoney" value="0">
												</td>
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
									<label> <input type="checkbox"
										name="check_save_payment_method"> <span class="ico"></span>
										선택한 결제 수단을 다음에도 사용
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

												<div class="card_detail" style="display: none;">
													<div id="cardSelect">
														<div>
															<div class="card_select">
																<!-- <div class="select_box">
																	<strong class="tit">카드를 선택해주세요</strong> <input
																		type="hidden" name="lguplus_card_code">
																	<ul class="list off">
																		<li><a class="">현대 (무이자)</a></li>
																		<li><a class="">신한</a></li>
																		<li><a class="">비씨</a></li>
																		<li><a class="">KB국민</a></li>
																		<li><a class="">삼성</a></li>
																		<li><a class="">씨티</a></li>
																		<li><a class="">롯데</a></li>
																		<li><a class="">하나(외환)</a></li>
																		<li><a class="">NH채움</a></li>
																		<li><a class="">우리</a></li>
																		<li><a class="">수협</a></li>
																		<li><a class="">광주</a></li>
																		<li><a class="">전북</a></li>
																		<li><a class="">제주</a></li>
																		<li><a class="">신협체크</a></li>
																		<li><a class="">MG새마을체크</a></li>
																		<li><a class="">저축은행체크</a></li>
																		<li><a class="">우체국카드</a></li>
																		<li><a class="">KDB산업은행</a></li>
																		<li><a class="">카카오뱅크</a></li>
																	</ul>
																</div> -->
																<div class="select_box">
																	<strong class="tit off">할부기간을 선택해주세요</strong> <input
																		type="hidden" name="lguplus_card_installment_month">
																	<ul class="list off">
																		<li><a class="">일시불</a></li>
																	</ul>
																</div>
															</div>
															<!---->
															<div class="card_noti">은행계열/체크/기프트/선불/법인/개인사업자
																기업카드는 무이자 할부 시 제외</div>
															<!---->
														</div>
													</div>
												</div>

												<!-- <ul id="simplePayments" class="payments"
													style="display: none;">
													<li class="chai"><label class="label_radio"
														for="paymentChai"> <input type="radio"
															name="settlekind" value="chai"
															onclick="input_escrow(this,'N')" id="paymentChai">
															차이 <span class="txt_benefit" style="display: inline;">혜택</span>
													</label></li>
													<li class="toss"><label class="label_radio"> <input
															type="radio" name="settlekind" value="toss"
															onclick="input_escrow(this,'N')"> 토스 <span
															class="txt_benefit">혜택</span>
													</label></li>
													<li class="npay naver-pay"><label class="label_radio">
															<input type="radio" name="settlekind" value="n"
															onclick="input_escrow(this,'N');"> 네이버페이 <span
															class="txt_benefit" style="display: inline;">혜택</span>
													</label></li>
													<li class="payco"><label class="label_radio">
															<input type="radio" name="settlekind" value="t"
															onclick="input_escrow(this,'N');check_naverNcashUseAble();">
															페이코 <span class="txt_benefit" style="display: inline;">혜택</span>
													</label></li>
													<li class="spay smile-pay"><label class="label_radio">
															<input type="radio" name="settlekind" value="s"
															onclick="input_escrow(this,'N')"> 스마일페이 <span
															class="txt_benefit" style="display: inline;">혜택</span>
													</label></li>

												</ul> -->


											</td>
										</tr>
										<tr>
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
													<li><span class="subject">개인정보 수집 · 이용 및 처리 동의
															<span class="emph">(필수)</span>
													</span> <a href="#terms" class="link_terms">보기</a></li>
													<li id="pgTerms" style="display: none;"><span
														class="subject">결제대행 서비스 약관 동의 <span class="emph">(필수)</span></span>
														<a href="#pgTerms" class="link_terms">보기</a></li>
													<li id="kurlyTerms"><span class="subject">전자지급
															결제대행 서비스 이용약관 동의 <span class="emph">(필수)</span>
													</span> <a href="#kurlyTerms" class="link_terms">보기</a></li>
												</ul>
												<div class="layer layer_agree">
													<div class="choice_agree view_terms">
														<div class="inner_layer">
															<div class="in_layer" id="viewTerms"></div>
															<button type="button" class="btn_ok">확인</button>
															<button type="button" class="btn_close">
																<span class="screen_out">레이어 닫기</span>
															</button>
														</div>
													</div>
													<div class="choice_agree view_pg">
														<div class="inner_layer">
															<div class="in_layer" id="viewPg"></div>
															<button type="button" class="btn_ok">확인</button>
															<button type="button" class="btn_close">
																<span class="screen_out">레이어 닫기</span>
															</button>
														</div>
													</div>

													<div class="choice_agree view_layer">
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
													</div>
												</div>

											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<input type="button" value="${payPrice }원 결제하기" onclick="javascript:reqeustPay()" class="btn_payment">
							<input type="button" onclick="javascript:test()" class="btn_payment" value="클릭"/>
						</form>
					</div>
				</div>

			</div>
		</div>
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

	<a href="#top" id="pageTop">맨 위로가기</a>
<script>
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
})
var IMP = window.IMP; // Can be omitted
IMP.init("imp09497562"); // Example: imp00000000
function reqeustPay(){
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
				var price=$("input#payment").val();
				var merchant=String(req.merchant_uid);
				var id='${userInfo.user_id}';
				var name='${userInfo.user_name}';
				var email='${userInfo.user_email}';
				var phone='${userInfo.user_phone}';
				console.log(data);
				console.log(req);
				console.log(id);
				console.log(name);
				console.log(email);
				console.log(phone);
				console.log(id);
				var amount=parseInt(data.amount)
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
							"order_merchant_serial":merchant
						}
					}).done(function(location){
						window.location.href="index.do";
					})
				}
			})
		}
	);
}
function test(){
	$.ajax({
		url:"test.do",
		dataType:"JSON",
		success:function(res){
			console.log(res)
		}
	})
}
</script>

	<!-- <iframe name="ifrmHidden" id="ifrmHidden" src="about:blank" style="display: none; width: 100%; height: 600px;"></iframe> -->
</body>
</html>