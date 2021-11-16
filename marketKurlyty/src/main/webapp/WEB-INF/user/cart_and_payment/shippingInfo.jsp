<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style2.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style3.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style4.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/style/cart_and_payment/shippingInfo.css">
<title>Insert title here</title>
<script src="jquery-3.6.0.min.js"></script>
</head>
<body>
	<input type="hidden" id="userName" value="${userName }"/>
	<input type="hidden" id="phone" value="${phone }"/>
	<article id="kurlyWrap" class="page_order">
		<header id="kHead" class="header">
			<h1 class="tit_logo screen_out">
				<img
					src="https://res.kurly.com/images/marketkurly/logo/logo_purple.png"
					alt="마켓컬리 로고">
			</h1>
			<h2 class="tit_header screen_out">주문서</h2>
			<a herf="#none" class="btn"><span class="screen_out">뒤로가기</span></a>
		</header>
		<section id="kAticle">
			<div id="kMain">
				<div id="root">
					<div class="top_scrollcheck"></div>
					<div id="header" class="header only_pc scroll_on">
						<h2 class="tit_header">배송정보</h2>
						<a id="headerLinkGoBack" href="#none" class="btn " style="display:none">뒤로가기</a>
					</div>
					<div class="receive_info reception_info only_pc">
						<form>
							<input type="hidden" id="addressID" name="addressID"
								value="12223986">
							<div class="info info_same">
								<label class="label_block"><input name="putUserInfo"
									id="putUserInfo" type="checkbox"><span class="ico"></span>주문자
									정보와 동일</label>
							</div>
							<div class="info">
								<h3 class="tit">
									<label for="receiverName">받으실 분<span class="ico">*</span></label>
								</h3>
								<div class="field">
									<input type="text" id="receiverName" name="receiverName"
										data-max-length="20" class="inp" placeholder="이름을 입력해 주세요"
										value="">
								</div>
							</div>
							<div class="info">
								<h3 class="tit">
									<label for="receiverPhoneNumber">휴대폰<span class="ico">*</span></label>
								</h3>
								<div class="field">
									<input type="text" id="receiverPhoneNumber"
										name="receiverPhoneNumber" class="inp" data-max-length="11"
										data-format="number" pattern="[0-9]*" inputmode="decimal"
										placeholder="숫자만 입력해주세요" value="">
								</div>
							</div>
							<div class="info info_place">
								<h3 class="tit">
									<label for="pickUpType">받으실 장소<span class="ico">*</span></label>
								</h3>
								<div class="field">
									<label class="label_block"><input type="radio"
										name="pickUpType" value="1" checked=""><span
										class="ico"></span>문 앞</label>
								</div>
								<div class="field">
									<label class="label_block"><input type="radio"
										name="pickUpType" value="2"><span class="ico"></span>경비실</label>
								</div>
								<div class="field">
									<label class="label_block"><input type="radio"
										name="pickUpType" value="4"><span class="ico"></span>기타
										장소</label>
								</div>
							</div>
							<div class="info place_doorstep">
								<h3 class="tit">
									<label for="">공동현관 출입방법<span class="ico">*</span></label>
								</h3>
								<div class="field">
									<label class="label_block"><input type="radio"
										name="meansType" value="1" checked=""><span
										class="ico"></span>공동현관 비밀번호</label>
									<div class="menas">
										<input type="text" id="means" name="means" maxlength="100"
											data-max-length="100" data-format="text" class="inp"
											placeholder="예: #1234*" value="">
										<p class="notice">특수문자를 포함한 정확한 비밀번호를 입력해 주세요.</p>
									</div>
									<label class="label_block"><input type="radio"
										name="meansType" value="6"><span class="ico"></span>자유
										출입 가능</label><label class="label_block"><input type="radio"
										name="meansType" value="7"><span class="ico"></span>기타</label>
									<div class="notcie_field">
										<strong class="tit_notice">확인해주세요!</strong>
										<ul class="list_notice ">
											<li>비밀번호가 정확하지 않을 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수
												있습니다.</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="info info_msg">
								<h3 class="tit">
									<label for="deliveryMessageSendAt">배송 완료 메시지 전송<span
										class="ico">*</span></label>
								</h3>
								<div class="field">
									<div class="half">
										<div class="halve">
											<label><input type="radio"
												name="deliveryMessageSendAt" value="0" checked=""><span
												class="ico"></span>배송 직후</label>
										</div>
										<div class="halve">
											<label><input type="radio"
												name="deliveryMessageSendAt" value="2"><span
												class="ico"></span>오전 8시</label>
										</div>
									</div>
								</div>
							</div>
							<div class="submit double">
								<button type="button" class="btn default" onclick="javascript:self.close();">취소</button>
								<button id="btnSubmit" class="btn active">저장</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div id="kSub"></div>
		</section>
		<footer id="kFoot"></footer>
		<div class="bg_loading" id="bgLoading" style="display: none;">
			<div class="loading_show"></div>
		</div>
	</article>
<script>
$("input#putUserInfo").click(function(){
	var name = '${userName}'
	var phone = '${phone}'
	if($(this).is(":checked")){
		$("input#receiverName").val(name);
		$("input#receiverPhoneNumber").val(phone)
	}else{
		$("input#receiverName").val("");
		$("input#receiverPhoneNumber").val("")
	}
})
</script>
</body>
</html>