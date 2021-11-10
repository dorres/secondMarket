<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<style>
#main {
	min-height: 100vh
}
</style>
<link rel="styleSheet" href="style/ItemListStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/cart_and_payment/cart.css">
</head>
<body class="main-index" oncontextmenu="return false" ondragstart="return false">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
					<div class="tit_page">
						<h2 class="tit">장바구니</h2>
					</div>
					<div id="main">
						<div id="content">
							<!-- 상품목록이 없을때 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
							<h3 class="screen_out">장바구니 상품 목록</h3>
							<form>
								<div id="cartItemList" class="only_pc" style="min-height: 557px;">
									<input type="text" name="totalPrice" value="${totalPrice }"/>
									<input type="text" name="dcPrice" value="${dcPrice }"/>
									<div class="empty">
										<div class="cart_item no_item">
											<div class="cart_select">
												<div class="inner_select">
													<label class="check"><input type="checkbox" name="checkAll" disabled="" checked="">
														<span class="ico"></span>전체선택 (0/0)
													</label>
													<a href="#none" class="btn_delete">선택삭제</a>
												</div>
											</div>
											<div class="inner_empty">
												<c:if test="${frozenList == null && coldList==null && roomList==null }">
														<span class="bg"></span>
														<p class="txt">장바구니에 담긴 상품이 없습니다</p>
														<div class="btn_submit">
															<button type="button" class="btn disabled">상품을담아주세요</button>
														</div>
												</c:if>
											</div>
											<c:if test="${coldList != null}">
												<div class="box cold">
													<div class="tit_box">
														<h4 class="tit">
															<span class="inner_tit"><span class="ico"></span>냉장
																상품</span>
														</h4>
														<button type="button" class="btn_dropup">접기 / 펼치기</button>
													</div>
													<ul class="list ">
														<c:forEach var="item" items="${coldList }" varStatus="count">
															<li id="${item.category_goods_serial}">
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.goods_last_price*item.goods_cart_count }" var="lastPrice"/>
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.goods_detail_price }" var="usuallyPrice"/>
																<input type="hidden" id="price" value="${item.goods_last_price }"/>
																<input type="hidden" id="oldPrice" value="${item.goods_detail_price }"/>
																<div class="item">
																	<label class="check"><input
																		type="checkbox"
																		name="chkItem"
																		checked=""><span class="ico"></span></label>
																	<div class="name">
																		<div class="inner_name">
																			<a href="#" class="package ">${item.category_goods_name }</a>
																			<div class="info"></div>
																		</div>
																	</div>
																	<div class="goods">
																		<a href="#" class="thumb "
																			style="background-image:url(https://kurlybuc.s3.ap-northeast-2.amazonaws.com/${item.category_goods_image_thumb}) ">상품이미지</a>
																		<div class="price">
																			<div class="in_price">
																				<span class="selling">${lastPrice}<span class="won">원</span></span>
																				<span class="cost">${usuallyPrice}<span class="won">원</span></span>
																				<p class="noti"></p>
																			</div>
																			<div class="stamper count">
																				<input type="hidden" id="goodsSerial" value="${item.category_goods_serial }">
																				<button type="button" class="btn minus off">감소</button>
																				<input type="number" id="cartCount" class="num"
																					readonly="readonly" value="${item.goods_cart_count }">
																				<button type="button" class="btn plus">추가</button>
																			</div>
																		</div>
																	</div>
																	<input type="hidden" id="deleteSerial" value="${item.category_goods_serial}">
																	<button type="button" class="btn_delete">상품 삭제</button>
																</div>
															</li>
														</c:forEach>
													</ul>
												</div>
											</c:if>
											
											<c:if test="${frozenList != null}">
												<div class="box frozen">
													<div class="tit_box">
														<h4 class="tit">
															<span class="inner_tit"><span class="ico"></span>냉동
																상품</span>
														</h4>
														<button type="button" class="btn_dropup ">접기 / 펼치기</button>
													</div>
													<ul class="list ">
														<c:forEach var="item" items="${frozenList }" varStatus="count">
															<li id="${item.category_goods_serial}">
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.goods_last_price*item.goods_cart_count }" var="lastPrice"/>
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.goods_detail_price }" var="usuallyPrice"/>
																<input type="hidden" id="price" value="${item.goods_last_price }"/>
																<input type="hidden" id="oldPrice" value="${item.goods_detail_price }"/>
																<div class="item">
																	<label class="check"><input
																		type="checkbox"
																		name="chkItem"
																		checked=""><span class="ico"></span></label>
																	<div class="name">
																		<div class="inner_name">
																			<a href="#" class="package ">${item.category_goods_name }</a>
																			<div class="info"></div>
																		</div>
																	</div>
																	<div class="goods">
																		<a href="#" class="thumb "
																			style="background-image:url(https://kurlybuc.s3.ap-northeast-2.amazonaws.com/${item.category_goods_image_thumb}) ">상품이미지</a>
																		<div class="price">
																			<div class="in_price">
																				<span class="selling">${lastPrice }<span class="won">원</span></span>
																				<span class="cost">${usuallyPrice}<span class="won">원</span></span>
																				<p class="noti"></p>
																			</div>
																			<div class="stamper count">
																				<input type="hidden" id="goodsSerial" value="${item.category_goods_serial }">
																				<button type="button" class="btn minus off">감소</button>
																				<input type="number" id="cartCount" class="num"
																					readonly="" value="${item.goods_cart_count }">
																				<button type="button" class="btn plus">추가</button>
																			</div>
																		</div>
																	</div>
																	<input type="hidden" id="deleteSerial" value="${item.category_goods_serial}">
																	<button type="button" class="btn_delete">상품 삭제</button>
																</div>
															</li>
														</c:forEach>
													</ul>
												</div>
											</c:if>
											
											<c:if test="${roomList != null}">
												<div class="box room">
													<div class="tit_box">
														<h4 class="tit">
															<span class="inner_tit"><span class="ico"></span>실온
																상품</span>
														</h4>
														<button type="button" class="btn_dropup ">접기 / 펼치기</button>
													</div>
													<ul class="list ">
														<c:forEach var="item" items="${roomList }" varStatus="count">
															<li id="${item.category_goods_serial}">
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.goods_last_price*item.goods_cart_count }" var="lastPrice"/>
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.goods_detail_price }" var="usuallyPrice"/>
																<input type="hidden" id="price" value="${item.goods_last_price }"/>
																<input type="hidden" id="oldPrice" value="${item.goods_detail_price }"/>
																<div class="item">
																	<label class="check"><input
																		type="checkbox"
																		name="chkItem"
																		checked=""><span class="ico"></span></label>
																	<div class="name">
																		<div class="inner_name">
																			<a href="#" class="package ">${item.category_goods_name }</a>
																			<div class="info"></div>
																		</div>
																	</div>
																	<div class="goods">
																		<a href="#" class="thumb "
																			style="background-image:url(https://kurlybuc.s3.ap-northeast-2.amazonaws.com/${item.category_goods_image_thumb}) ">상품이미지</a>
																		<div class="price">
																			<div class="in_price">
																				<span class="selling">${lastPrice }<span class="won">원</span></span>
																				<span class="cost">${usuallyPrice}<span class="won">원</span></span>
																				<p class="noti"></p>
																			</div>
																			<div class="stamper count">
																				<input type="hidden" id="goodsSerial" value="${item.category_goods_serial }">
																				<button type="button" class="btn minus off">감소</button>
																				<input type="number" id="cartCount" class="num"
																					readonly value="${item.goods_cart_count }">
																				<button type="button" class="btn plus">추가</button>
																			</div>
																		</div>
																	</div>
																	<input type="hidden" id="deleteSerial" value="${item.category_goods_serial}">
																	<button type="button" class="btn_delete" id="deleteCartItem">상품 삭제</button>
																</div>
															</li>
														</c:forEach>
													</ul>
												</div>
											</c:if>
											
											<div class="cart_select">
												<div class="inner_select">
													<label class="check"><input type="checkbox" name="checkAll" disabled="" checked="">
													<span class="ico"></span>전체선택 (0/0)</label>
													<a href="#none" class="btn_delete">선택삭제</a>
												</div>
											</div>
										</div>
										<div class="cart_result">
											<div class="inner_result" style="top: 60px;">
												<div class="cart_delivery">
													<h3 class="tit">배송지</h3>
													<div class="no_address">
														<span class="emph">배송지를 입력</span>하고<br>배송유형을 확인해 보세요!
														<a href="#" class="btn default"><span class="ico"></span>주소 검색</a>
													</div>
												</div>
												<div class="amount_view">
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${totalPrice}" var="total"/>
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${dcPrice-totalPrice }" var="discount"/>
													<c:if test="${dcPrice < 40000}">
														<fmt:formatNumber type="number" maxFractionDigits="3" value="3000" var="shippingFee"/>
														<fmt:formatNumber type="number" maxFractionDigits="3" value="${dcPrice+3000}" var="applicable"/>
													</c:if>
													<c:if test="${dcPrice >= 40000}">
														<fmt:formatNumber type="number" maxFractionDigits="3" value="0" var="shippingFee"/>
														<fmt:formatNumber type="number" maxFractionDigits="3" value="${dcPrice}" var="applicable"/>
													</c:if>
													
													
													<dl class="amount">
														<dt class="tit">상품금액</dt>
														<dd class="price">
															<span id="total" class="num">${total}</span><span class="won">원</span>
														</dd>
													</dl>
													<dl class="amount">
														<dt class="tit">상품할인금액</dt>
														<dd class="price">
															<span id="discount" class="num">${discount}</span><span class="won">원</span>
														</dd>
													</dl>
													<dl class="amount">
														<dt class="tit">배송비</dt>
														<dd class="price">
															<span id="shippingFee" class="num">+${shippingFee}</span><span class="won">원</span>
														</dd>
													</dl>
													<dl class="amount lst">
														<dt class="tit">결제예정금액</dt>
														<dd class="price">
															<span id="applicable" class="num">${applicable}</span><span class="won">원</span>
														</dd>
													</dl>
													<div class="reserve"></div>
												</div>
												<div class="btn_submit">
													<button type="submit" class="btn active">상품을 담아주세요</button><!-- active -->
												</div>
												<div class="notice">
													<span class="txt"><span class="ico">·</span>
														‘입금확인’ 상태일 때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</span>
													<span class="txt">
													
													<span class="ico">·</span>‘입금확인’ 이후 상태에는 고객센터로 문의해주세요.</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</form>

							<form id="viewCart" name="frmCart" method="post" action="/shop/order/order.php">
								<input type="hidden" name="mode" value="setOrder">
							</form>

						</div>
					</div>


					<!-- 상품목록이 있을때 ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓-->
				<!-- 	<form>
						<div id="cartItemList" class="only_pc">
							<div class="">
								<div class="cart_item ">
									<div class="cart_select">
										<div class="inner_select">
											<label class="check"><input type="checkbox"
												name="checkAll" checked=""><span class="ico"></span>전체선택
												(5/5)</label><a href="#none" class="btn_delete">선택삭제</a>
										</div>
									</div>
									<div class="box cold">
										<div class="tit_box">
											<h4 class="tit">
												<span class="inner_tit"><span class="ico"></span>냉장
													상품</span>
											</h4>
											<button type="button" class="btn_dropup ">접기 / 펼치기</button>
										</div>
										<ul class="list ">
											<li><div class="item">
													<label class="check"
														for="chkItem9767a3b6-e65e-4d77-bcd7-2ff13b1e2cb6"><input
														type="checkbox"
														id="chkItem9767a3b6-e65e-4d77-bcd7-2ff13b1e2cb6"
														name="chkItem"
														data-item-id="9767a3b6-e65e-4d77-bcd7-2ff13b1e2cb6"
														data-item-no="30559" data-item-parent-no="30559"
														checked=""><span class="ico"></span></label>
													<div class="name">
														<div class="inner_name">
															<a href="#" class="package ">[KF365] 애호박 1개</a>
															<div class="info"></div>
														</div>
													</div>
													<div class="goods">
														<a href="#" class="thumb "
															style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1631668505211i0.jpg&quot;);">상품이미지</a>
														<div class="price">
															<div class="in_price">
																<span class="selling">1,650<span class="won">원</span></span>
																<p class="noti"></p>
															</div>
															<div class="stamper count">
																<button type="button" class="btn minus off"
																	data-item-id="9767a3b6-e65e-4d77-bcd7-2ff13b1e2cb6"
																	data-item-no="30559" data-opt="decrease">감소</button>
																<input type="number" id="stepperCounter" class="num"
																	readonly="" value="1">
																<button type="button" class="btn plus"
																	data-item-id="9767a3b6-e65e-4d77-bcd7-2ff13b1e2cb6"
																	data-item-no="30559" data-opt="increase">추가</button>
															</div>
														</div>
													</div>
													<button type="button" class="btn_delete"
														data-item-id="9767a3b6-e65e-4d77-bcd7-2ff13b1e2cb6"
														data-item-no="30559" data-type="cold">상품 삭제</button>
												</div></li>
											<li><div class="item">
													<label class="check"
														for="chkItem8f8ff416-87e9-4b3a-b08a-748a80dc9c68"><input
														type="checkbox"
														id="chkItem8f8ff416-87e9-4b3a-b08a-748a80dc9c68"
														name="chkItem"
														data-item-id="8f8ff416-87e9-4b3a-b08a-748a80dc9c68"
														data-item-no="63110" data-item-parent-no="63110"
														checked=""><span class="ico"></span></label>
													<div class="name">
														<div class="inner_name">
															<a href="#" class="package ">[연세우유 x 마켓컬리] 전용목장우유</a>
															<div class="info"></div>
														</div>
													</div>
													<div class="goods">
														<a href="#" class="thumb "
															style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1610086510346i0.jpg&quot;);">상품이미지</a>
														<div class="price">
															<div class="in_price">
																<span class="selling">1,850<span class="won">원</span></span>
																<p class="noti"></p>
															</div>
															<div class="stamper count">
																<button type="button" class="btn minus off"
																	data-item-id="8f8ff416-87e9-4b3a-b08a-748a80dc9c68"
																	data-item-no="63110" data-opt="decrease">감소</button>
																<input type="number" id="stepperCounter" class="num"
																	readonly="" value="1">
																<button type="button" class="btn plus"
																	data-item-id="8f8ff416-87e9-4b3a-b08a-748a80dc9c68"
																	data-item-no="63110" data-opt="increase">추가</button>
															</div>
														</div>
													</div>
													<button type="button" class="btn_delete"
														data-item-id="8f8ff416-87e9-4b3a-b08a-748a80dc9c68"
														data-item-no="63110" data-type="cold">상품 삭제</button>
												</div></li>
										</ul>
									</div>
									<div class="box frozen">
										<div class="tit_box">
											<h4 class="tit">
												<span class="inner_tit"><span class="ico"></span>냉동
													상품</span>
											</h4>
											<button type="button" class="btn_dropup ">접기 / 펼치기</button>
										</div>
										<ul class="list ">
											<li><div class="item">
													<label class="check"
														for="chkItem2fdb2390-1f15-451e-bfb3-4f5955e39ad3"><input
														type="checkbox"
														id="chkItem2fdb2390-1f15-451e-bfb3-4f5955e39ad3"
														name="chkItem"
														data-item-id="2fdb2390-1f15-451e-bfb3-4f5955e39ad3"
														data-item-no="27444" data-item-parent-no="27449"
														checked=""><span class="ico"></span></label>
													<div class="name">
														<div class="inner_name">
															<a href="#" class="package ">[남향푸드또띠아] 콤비네이션 피자 브리또</a><a
																href="#" class="product ">[남향푸드또띠아] 간편 간식 브리또 10종</a>
															<div class="info"></div>
														</div>
													</div>
													<div class="goods">
														<a href="#" class="thumb "
															style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1582679290204i0.jpg&quot;);">상품이미지</a>
														<div class="price">
															<div class="in_price">
																<span class="selling">2,900<span class="won">원</span></span>
																<p class="noti"></p>
															</div>
															<div class="stamper count">
																<button type="button" class="btn minus off"
																	data-item-id="2fdb2390-1f15-451e-bfb3-4f5955e39ad3"
																	data-item-no="27444" data-opt="decrease">감소</button>
																<input type="number" id="stepperCounter" class="num"
																	readonly="" value="1">
																<button type="button" class="btn plus"
																	data-item-id="2fdb2390-1f15-451e-bfb3-4f5955e39ad3"
																	data-item-no="27444" data-opt="increase">추가</button>
															</div>
														</div>
													</div>
													<button type="button" class="btn_delete"
														data-item-id="2fdb2390-1f15-451e-bfb3-4f5955e39ad3"
														data-item-no="27444" data-type="frozen">상품 삭제</button>
												</div></li>
											<li><div class="item">
													<label class="check"
														for="chkItemc35d890b-debc-4108-8612-54e53405cb3f"><input
														type="checkbox"
														id="chkItemc35d890b-debc-4108-8612-54e53405cb3f"
														name="chkItem"
														data-item-id="c35d890b-debc-4108-8612-54e53405cb3f"
														data-item-no="27448" data-item-parent-no="27449"
														checked=""><span class="ico"></span></label>
													<div class="name">
														<div class="inner_name">
															<a href="#" class="package ">[남향푸드또띠아] 핫 치킨 브리또</a><a
																href="#" class="product ">[남향푸드또띠아] 간편 간식 브리또 10종</a>
															<div class="info"></div>
														</div>
													</div>
													<div class="goods">
														<a href="#" class="thumb "
															style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1582679290204i0.jpg&quot;);">상품이미지</a>
														<div class="price">
															<div class="in_price">
																<span class="selling">2,900<span class="won">원</span></span>
																<p class="noti"></p>
															</div>
															<div class="stamper count">
																<button type="button" class="btn minus off"
																	data-item-id="c35d890b-debc-4108-8612-54e53405cb3f"
																	data-item-no="27448" data-opt="decrease">감소</button>
																<input type="number" id="stepperCounter" class="num"
																	readonly="" value="1">
																<button type="button" class="btn plus"
																	data-item-id="c35d890b-debc-4108-8612-54e53405cb3f"
																	data-item-no="27448" data-opt="increase">추가</button>
															</div>
														</div>
													</div>
													<button type="button" class="btn_delete"
														data-item-id="c35d890b-debc-4108-8612-54e53405cb3f"
														data-item-no="27448" data-type="frozen">상품 삭제</button>
												</div></li>
										</ul>
									</div>
									<div class="box room">
										<div class="tit_box">
											<h4 class="tit">
												<span class="inner_tit"><span class="ico"></span>상온
													상품</span>
											</h4>
											<button type="button" class="btn_dropup ">접기 / 펼치기</button>
										</div>
										<ul class="list ">
											<li><div class="item">
													<label class="check"
														for="chkItem9841183c-8365-4a52-ae1e-7eb831f25fff"><input
														type="checkbox"
														id="chkItem9841183c-8365-4a52-ae1e-7eb831f25fff"
														name="chkItem"
														data-item-id="9841183c-8365-4a52-ae1e-7eb831f25fff"
														data-item-no="48865" data-item-parent-no="48866"
														checked=""><span class="ico"></span></label>
													<div class="name">
														<div class="inner_name">
															<a href="#" class="package ">[아토앤오투] 바른 손소독제 500ml</a><a
																href="#" class="product ">[아토앤오투] 바른 손소독제 2종</a>
															<div class="info"></div>
														</div>
													</div>
													<div class="goods">
														<a href="#" class="thumb "
															style="background-image: url(&quot;https://img-cf.kurly.com/shop/data/goods/1581924872593i0.jpg&quot;);">상품이미지</a>
														<div class="price">
															<div class="in_price">
																<span class="selling">19,800<span class="won">원</span></span>
																<p class="noti"></p>
															</div>
															<div class="stamper count">
																<button type="button" class="btn minus off"
																	data-item-id="9841183c-8365-4a52-ae1e-7eb831f25fff"
																	data-item-no="48865" data-opt="decrease">감소</button>
																<input type="number" id="stepperCounter" class="num"
																	readonly="" value="1">
																<button type="button" class="btn plus"
																	data-item-id="9841183c-8365-4a52-ae1e-7eb831f25fff"
																	data-item-no="48865" data-opt="increase">추가</button>
															</div>
														</div>
													</div>
													<button type="button" class="btn_delete"
														data-item-id="9841183c-8365-4a52-ae1e-7eb831f25fff"
														data-item-no="48865" data-type="room">상품 삭제</button>
												</div></li>
										</ul>
									</div>
									<div class="cart_select">
										<div class="inner_select">
											<label class="check"><input type="checkbox"
												name="checkAll" checked=""><span class="ico"></span>전체선택
												(5/5)</label><a href="#none" class="btn_delete">선택삭제</a>
										</div>
									</div>
								</div>
								<div class="cart_result">
									<div class="inner_result" style="top: 60px;">
										<div class="cart_delivery">
											<h3 class="tit">배송지</h3>
											<div class="no_address">
												<span class="emph">배송지를 입력</span>하고<br>배송유형을 확인해 보세요!<a
													href="#" class="btn default"><span class="ico"></span>주소
													검색</a>
											</div>
										</div>
										<div class="amount_view">
											<dl class="amount">
												<dt class="tit">상품금액</dt>
												<dd class="price">
													<span class="num">29,100</span><span class="won">원</span>
												</dd>
											</dl>
											<dl class="amount">
												<dt class="tit">상품할인금액</dt>
												<dd class="price">
													<span class="num">0</span><span class="won">원</span>
												</dd>
											</dl>
											<div class="no_sale">로그인 후 할인 금액 적용</div>
											<dl class="amount">
												<dt class="tit">배송비</dt>
												<dd class="price">
													<span class="num plus">3,000</span><span class="won">원</span>
												</dd>
											</dl>
											<p class="free_limit">
												10,900원 추가주문 시, <strong>무료배송</strong>
											</p>
											<dl class="amount lst">
												<dt class="tit">결제예정금액</dt>
												<dd class="price">
													<span class="num">32,100</span><span class="won">원</span>
												</dd>
											</dl>
											<div class="reserve">
												<span class="bage">적립</span>로그인 후 회원등급에 따라 적립
											</div>
										</div>
										<div class="btn_submit">
											<button type="submit" class="btn disabled">배송지를
												입력해주세요</button>
										</div>
										<div class="notice">
											<span class="txt"><span class="ico">·</span>‘입금확인’ 상태일
												때는 주문 내역 상세에서 직접 주문취소가 가능합니다.</span><span class="txt"><span
												class="ico">·</span>‘입금확인’ 이후 상태에는 고객센터로 문의해주세요.</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form> -->


				</div>
			</div>
		</div>
		
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

		<a href="#top" id="pageTop">맨 위로가기</a>


		<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank" style="display: none; width: 100%; height: 600px;"></iframe>
<script>
$(document).ready(function(){
	$("button.minus").click(function(){
		var count=parseInt($(this).siblings("#cartCount").val());
		var serial=parseInt($(this).siblings("#goodsSerial").val());
		var part=$(this);
		
		var price=parseInt(part.closest("li").find("input#price").val());
		var oldPrice=parseInt(part.closest("li").find("input#oldPrice").val());
		
		var rootLi=$(this).closest("li");
		var totalPrice = parseInt($("div#cartItemList").find("input[name='totalPrice']").val());
		var dcPrice=parseInt($("div#cartItemList").find("input[name='dcPrice']").val());
		if(count>1){
			$.ajax({
				url:"cartUpdateCount.do",
				type:"post",
				data:{"category_goods_serial":serial,"goods_cart_count":count-1},
				datatype:"text",
				success:function(res){
					part.siblings("#cartCount").val(parseInt(res));
					rootLi.find("div.price").find("span.selling").text((price*parseInt(res)).toLocaleString("ko-KR")+"원");
					rootLi.find("div.price").find("span.cost").text((oldPrice*parseInt(res)).toLocaleString("ko-KR")+"원");
					
					$("div#cartItemList").find("input[name='totalPrice']").val(totalPrice-oldPrice);
					$("div#cartItemList").find("input[name='dcPrice']").val(dcPrice-price);
					$("div.cart_result").find("span#total").text((totalPrice-oldPrice).toLocaleString("ko-KR"));
					$("div.cart_result").find("span#discount").text(((dcPrice-price)-(totalPrice-oldPrice)).toLocaleString("ko-KR"));
					if((dcPrice-price)>40000){
						$("div.cart_result").find("span#applicable").text((dcPrice-price).toLocaleString("ko-KR"));
						$("div.cart_result").find("span#shippingFee").text("0");						
					}else{
						$("div.cart_result").find("span#applicable").text((dcPrice-price+3000).toLocaleString("ko-KR"));
						$("div.cart_result").find("span#shippingFee").text("+3,000");
					}
				},
				error:function(res){
					alert("예상치 못한 오류 발생");
				}
			});
		}
	});
	$("button.plus").click(function(){
		var count=parseInt($(this).siblings("#cartCount").val());
		var serial=parseInt($(this).siblings("#goodsSerial").val());
		var part=$(this);
		
		var price=parseInt(part.closest("li").find("input#price").val());
		var oldPrice=parseInt(part.closest("li").find("input#oldPrice").val());
		
		var rootLi=$(this).closest("li");
		var totalPrice = parseInt($("div#cartItemList").find("input[name='totalPrice']").val());
		var dcPrice=parseInt($("div#cartItemList").find("input[name='dcPrice']").val());
		$.ajax({
				url : "cartUpdateCount.do",
				type : "post",
				data : {
					"category_goods_serial" : serial,
					"goods_cart_count" : count + 1
				},
				datatype : "text",
				success : function(res) {
					part.siblings("#cartCount").val(parseInt(res));
					rootLi.find("div.price").find("span.selling").text((price*parseInt(res)).toLocaleString("ko-KR")+"원");
					rootLi.find("div.price").find("span.cost").text((oldPrice*parseInt(res)).toLocaleString("ko-KR")+"원");
					
					$("div#cartItemList").find("input[name='totalPrice']").val(totalPrice+oldPrice);
					$("div#cartItemList").find("input[name='dcPrice']").val(dcPrice+price);
					$("div.cart_result").find("span#total").text((totalPrice+oldPrice).toLocaleString("ko-KR"));
					$("div.cart_result").find("span#discount").text(((dcPrice+price)-(totalPrice+oldPrice)).toLocaleString("ko-KR"));
					if((dcPrice+price)>40000){
						$("div.cart_result").find("span#applicable").text((dcPrice+price).toLocaleString("ko-KR"));
						$("div.cart_result").find("span#shippingFee").text("0");
					}else{
						$("div.cart_result").find("span#applicable").text((dcPrice+price+3000).toLocaleString("ko-KR"));
						$("div.cart_result").find("span#shippingFee").text("+3,000");
					}
					
				},
				error : function(res) {
					alert("예상치 못한 오류 발생");
				}
			});

		});
	$("button.btn_delete").click(function(){
		if(confirm("상품을 장바구니에서 삭제하시겠습니까?")==true){
			var serial = parseInt($(this).siblings("#deleteSerial").val());
			var part=$(this);
			var list=$(this).closest("ul");
			$.ajax({
				url:"cartDelete.do",
				type:"post",
				data:{"category_goods_serial" : serial},
				datatype:"text",
				success:function(res){
					part.closest("li").remove();
					if(list.children().length==0){
						list.closest("div.box").remove();
					}
					if($("#cartItemList").find("ul").length==0){
						$(".inner_empty").html("<div class='inner_empty'><span class='bg'></span><p class='txt'>장바구니에 담긴 상품이 없습니다</p><div class='btn_submit'><button type='button' class='btn disabled'>상품을담아주세요</button></div></div>");
					}
				},
				error:function(res){
					alert("예상치 못한 오류 발생");
				}
			});
		}
	})
})
$("button.btn_dropup").click(function(){
		var partDiv = $(this).closest("div");
		if($(this).attr("class")=="btn_dropup"){
			partDiv.nextAll("ul").css("display","none");
			$(this).addClass("off");
		}
		else{
			partDiv.nextAll("ul").css("display","block");
			$(this).removeClass("off");
		}
});

</script>
</body>
</html>