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
										value="${shippingName }">
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
										placeholder="숫자만 입력해주세요" value="${shippingPhone }">
								</div>
							</div>
							<div class="info info_place">
								<h3 class="tit">
									<label for="pickUpType">받으실 장소<span class="ico">*</span></label>
								</h3>
								<div class="field">
									<label class="label_block">
										<input type="radio" name="pickUpType" value="1" checked="">
										<span class="ico"></span>
										문 앞
									</label>
								</div>
								<div class="field">
									<label class="label_block">
										<input type="radio" name="pickUpType" value="2">
										<span class="ico"></span>
										경비실
									</label>
								</div>
								<div class="field">
									<label class="label_block">
										<input type="radio"	name="pickUpType" value="4">
										<span class="ico"></span>
										기타	장소
									</label>
								</div>
							</div>
							<div class="info place_doorstep">
								<div class="moreInfo" id="door">
									<h3 class="tit">
										<label for="">공동현관 출입방법<span class="ico">*</span></label>
									</h3>
									<div class="field">
										<label class="label_block">
											<input type="radio"
											name="meansType" value="1" checked="">
											<span class="ico"></span>
										공동현관 비밀번호</label>
										<div class="menas">
											<input type="text" id="means" name="means" maxlength="100"
												data-max-length="100" data-format="text" class="inp"
												placeholder="예: #1234*" value="">
											<p class="notice">특수문자를 포함한 정확한 비밀번호를 입력해 주세요.</p>
										</div>
										<label class="label_block">
											<input type="radio" name="meansType" value="6">
											<span class="ico"></span>
											자유 출입 가능
										</label>
										<label class="label_block">
											<input type="radio" name="meansType" value="7">
											<span class="ico"></span>
											기타
										</label>
										<div class="subRadio" style="display:none;">
											<textarea id="means" name="means" maxlength="100"
												data-max-length="100" data-format="text"
												placeholder="예: 연락처로 전화, 경비실로 호출  (배송 시간은 별도로 지정할 수 없습니다)"></textarea>
										</div>
									</div>
								</div>
								<div class="moreInfo" id="security" style="display:none;">
									<h3 class="tit">
										<label for="pickUpDetail">경비실 특이사항</label>
									</h3>
									<div class="field">
										<textarea id="pickUpDetail" maxlength="100"
											name="pickUpDetail" data-max-length="100" data-format="text"
											placeholder="경비실 위치 등 특이사항이 있을 경우 작성해주세요"></textarea>
									</div>
								</div>
								<div class="moreInfo" id="other" style="display:none;">
									<h3 class="tit">
										<label for="pickUpDetail">기타 장소 세부 사항<span class="ico">*</span></label>
									</h3>
									<div class="field">
										<textarea id="pickUpDetailOther" maxlength="100"
											name="pickUpDetail" data-max-length="100" data-format="text"
											placeholder="예 : 계단 밑, 주택단지 앞 경비초소를 지나 A동 출입구 (배송 시간은 별도로 지정할 수 없습니다)"></textarea>
									</div>
								</div>
							</div>
							<div class="info">
								<div class="notcie_field">
									<strong class="tit_notice">확인해주세요!</strong>
									<ul class="list_notice " id="door">
										<li>비밀번호가 정확하지 않을 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수
											있습니다.</li>
									</ul>
									<ul class="list_notice " id="security" style="display: none;">
										<li>경비 부재로 출입이 불가능한 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수
											있습니다.</li>
									</ul>
									<ul class="list_notice multiple" id="other"
										style="display: none;">
										<li>정확한 배송을 위해 장소의 특징 또는 출입 방법 등을 자세하게 작성해주세요.</li>
										<li>보일러 실, 양수기 함, 소화전 앞 또는 위탁배송은 불가능 합니다.</li>
										<li>요청하신 장소로 배송이 어려운 경우, 부득이하게 1층 공동현관 앞 또는 경비실 앞에 배송될 수
											있습니다.</li>
										<li>배송 받으실 시간은 별도로 지정하실 수 없으며, 밤 8시까지 주문 시 오전 8시까지 배송이
											완료됩니다.</li>
									</ul>
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
								<button type="button" id="btnSubmit" class="btn active" onclick="javascript:finish()">저장</button>
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
function finish(){
	
	if($("input#receiverName").val().trim()==""){
		alert("받는 분 이름을 입력해주세요.");
		return;
	}
	if($("input#receiverPhoneNumber").val().trim()==""){
		alert("받는 분 전화번호를 입력해주세요.");
		return;
	}
	var name = $("input#receiverName").val();
	var phone = $("input#receiverPhoneNumber").val();
	var pickUpType = $("input[name=pickUpType]:checked").val();
	var meansType=$("input[name=meansType]:checked").val();
	
	if(pickUpType==1){
		if(meansType==1){
			if($("input#means").val().trim()==""){
				alert("현관 비밀번호를 입력해주세요.")
				return false;
			}
		}else if(meansType==7){
			if($("textarea#means").val().trim()==""){
				alert("기타사항을 기재헤주세요.")
				return false;
			}
		}
	}else if(pickUpType==2){
		if($("textarea#pickUpDetail").val().trim()==""){
			alert("경비실 특이사항을 기재해주세요.");
			return false;
		}
	}else{
		if($("textarea#pickUpDetailOther").val().trim()==""){
			alert("기타장소의 정보를 입력해주세요.")
			return false;
		}
	}
	
	var typeMessage="";
	var pickUpDetail="";
	
	var shippingMessageType=$("input[name=deliveryMessageSendAt]:checked").val();
	var shippingMessageTime="";
	var password="";
	if(pickUpType==1){
		typeMessage="문 앞";
		if(meansType==1){
			pickUpDetail="공동현관 비밀번호";
			password=$("input#means").val();
		}else if(meansType==6){
			pickUpDetail="자유 출입 가능";
		}else{
			pickUpDetail="기타("+$("textarea#means").val()+")";
		}
	}else if(pickUpType==2){
		typeMessage="경비실";
		pickUpDetail=$("textarea#pickUpDetail").val();
	}else{
		typeMessage="기타 장소";
		pickUpDetail=$("textarea#pickUpDetailOther").val();
	}
	
	if(shippingMessageType==0){
		shippingMessageTime="배송 직후";
	}else{
		shippingMessageTime="오전8시";
	}
	//화면에 띄우기
	opener.document.querySelector("div#receiverInfo").innerText=name;
	opener.document.querySelector("span#areaInfo").innerText=typeMessage;
	opener.document.querySelector("span#meanType").innerText=pickUpDetail;
	opener.document.querySelector("span#deliveryMessageDetail").innerText=shippingMessageTime;
	
	//input hidden 데이터 담기
	opener.$("input#pickUpType").val(typeMessage);
	opener.$("input#pickUpDetail").val(pickUpDetail);
	opener.$("input#shippingMessageTime").val(shippingMessageTime);
	opener.$("input#recipientName").val(name);
	opener.$("input#recipientPhone").val(phone);
	opener.$("input#doorPassword").val(password);
	opener.$("input#isShipping").val("true");
	
	
	
	opener.$("div#receiverInfo").removeClass("off");
	opener.$("span#meanType").removeClass("off");
	opener.$("span#areaInfo").css("display","block");
	opener.$("div#wayPlace").css("display","block");
	opener.$("div#deliveryMessage").css("display","block");
	self.close();
}
$("input[name=pickUpType]").click(function(){
	$("div.notcie_field").find("ul").css("display","none");
	$("div.moreInfo").css("display","none");
	if($(this).val()==1){
		$("div.notcie_field").find("ul#door").css("display","block");
		$("div.moreInfo#door").css("display","block");
	}else if($(this).val()==2){
		$("div.notcie_field").find("ul#security").css("display","block");
		$("div.moreInfo#security").css("display","block");
	}else{
		$("div.notcie_field").find("ul#other").css("display","block");
		$("div.moreInfo#other").css("display","block");
	}
})
$("input[name=meansType]").click(function(){
	if($(this).val()==1){
		$("div.menas").css("display","block");
	}else{
		$("div.menas").css("display","none");
	}
	if($(this).val()==7){
		$("div.subRadio").css("display","block");
	}else{
		$("div.subRadio").css("display","none");
	}
})
</script>
</body>
</html>