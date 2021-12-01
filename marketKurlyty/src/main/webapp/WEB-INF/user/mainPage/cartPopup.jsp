<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="cartPut">
	<div class="cart_option cartList cart_type3"
		style="opacity: 0; display: none;">
		<!--  -->
		<form name="cartInput" action="cartInput.do">
			<div class="inner_option">
				<input type="button" class="btn_close1" value="레이어닫기" />
				<!---->
				<div class="in_option">
					<div class="list_goods">
						<ul class="list list_nopackage">
							<li class="on"><span class="btn_position"><button
										type="button" class="btn_del">
										<span class="txt">삭제하기</span>
									</button></span> <span class="name"> </span> <!---->
								<div class="option">
									<input type="hidden" class="hprice" />
									<input type="hidden" class="hdiscount" />
									<input type="hidden" class="hserial" name="category_goods_serial" value="" />
									<span class="count">
										<input type="button" class="btn down on"
											onclick="javascript:quantity(-1)" value="수량내리기" />
										<input type="number" value="1" name="goods_cart_count"
											readonly="readonly" onfocus="this.blur()" class="inp">
										<input type="button" class="btn up on" 
											onclick="javascript:quantity(1)" value="수량올리기" />
									</span>
									<span class="price"> <!----> <span class="dc_price"></span>
									</span>
								</div>
							</li>
						</ul>
					</div>
					<div class="total">
						<div class="price">
							<strong class="tit">합계</strong>
							<!---->
							<span class="sum"><span class="num"></span> <span
								class="won">원</span></span>
						</div>
						<p class="txt_point">
							<span class="ico">적립</span> <span class="no_login"> <span>로그인
									후, 적립혜택 제공</span>
							</span>
						</p>
					</div>
				</div>
				<div class="group_btn off layer_btn2">
					<span class="btn_type2">
						<button type="button" class="txt_type"
							onclick="javascript:cancelCart()">취소</button>
					</span> <span class="btn_type1"> <input type="button"
						class="txt_type" value="장바구니 담기" onclick="javascript:inputCart()" />
						<!---->
					</span>
				</div>
			</div>
		</form>
		<!--  -->
	</div>
</div>