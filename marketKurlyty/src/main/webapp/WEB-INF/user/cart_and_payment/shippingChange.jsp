<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style2.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style3.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style4.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/style/cart_and_payment/shippingAddress.css">
<script src="jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
#header-bottom {
	height: calc(49px + env(safe-area-inset-bottom));
}

#goods-view-form {
	padding-bottom: calc(13px + env(safe-area-inset-bottom));
}
</style>
<style>
#bgLoading {
	display: block;
}

#destinationList {
	position: fixed;
	z-index: 9999;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
}

#destinationListLoading {
	position: fixed;
	z-index: 10000;
	top: 50%;
	left: 50%;
	margin: -16px 0 0 -16px;
	width: 32px;
	height: 32px;
	background:
		url(https://res.kurly.com/pc/img/1909/img_loading_128x128.gif)
		no-repeat 50% 50%;
	background-size: 16px 16px;
}
</style>
<style>
#header {
	display: none
}

#header-bottom {
	display: none
}

#appBanner, #addrListInfo {
	display: none !important
}

#wrap {
	padding: 0 !important
}

.section_destination {
	padding-bottom: 0
}
</style>
<body>
	<div id="wrap" class="layout-main-wrapper"
		style="padding-top: 50px; opacity: 1;">

		<div class="only_pc fixed_head">
			<h2 class="pop_head">
				배송지 <span class="sub">배송지에 따라 상품 정보가 달라질 수 있습니다.</span>
			</h2>
			<div class="pop_list">
				<span class="select">선택</span> <span class="delivery">배송 정보</span> <span
					class="modify">수정</span>
			</div>
		</div>
		<div class="section_destination">
			<div class="only_pc">
				<ul id="addrList" class="list type_select">
					<c:forEach var="address" items="${addressList }">
						<li>
							<input type="hidden" id="addr1" value="${address.user_address1 }"/>
							<input type="hidden" id="addr2" value="${address.user_address2 }"/>
							<input type="hidden" id="zipcode" value="${address.user_zipcode }"/>
							<input type="hidden" id="name" value="${address.user_name }"/>
							<input type="hidden" id="phone" value="${address.user_phone }"/>
							<input type="hidden" id="serial" value="${address.address_serial }"/>
							<label class="skin_checkbox">
							<input type="radio" name="addrNo" data-delivery-type="direct" value="12223986"
								${address.address_serial==addressSerial ? 'checked':'' }>
							<span class="ico"></span>
							<span class="screen_out">선택하기</span></label>
							<div class="address">
								<c:if test="${address.address_default }">
									<span class="badge_default">기본 배송지</span>
								</c:if>
								<p class="addr">${address.user_address1} &nbsp;&nbsp; ${address.user_address2}</p>
							</div>
							<div class="user">
								<span class="name">${address.user_name }</span><span class="phone"><span
									class="middot"></span>${address.user_phone }</span><span class="delivery star">샛별배송</span>
							</div>
							<div class="btn_modify">
								<button type="button" class="ico modify" data-addr-no="12223986"
									data-addr-type="D" data-is-current-addr="true">수정하기</button>
							</div>
						</li>
					</c:forEach>
				</ul>
				<a id="newAddressAddBtn" class="new_address" href="#none" onclick="javascript:hi_zip()"> <img
					src="https://res.kurly.com/pc/ico/2006/ico_add_16x16.svg" alt=""
					class="ico"> 새 배송지 추가
				</a>
			</div>
		</div>

		<a href="#top" id="pageTop">맨 위로가기</a>
	</div>
<script>
$("input[name=addrNo]").click(function(){
	var address1=$(this).closest("li").find("input#addr1").val();
	var address2=$(this).closest("li").find("input#addr2").val();
	var zipcode=$(this).closest("li").find("input#zipcode").val();
	var name=$(this).closest("li").find("input#name").val();
	var phone=$(this).closest("li").find("input#phone").val();
	var serial=$(this).closest("li").find("input#serial").val();
	opener.document.querySelector("p.addr").innerHTML=address1+"<br>"+address2;
	
	opener.$("input#user_address1").val(address1);
	opener.$("input#user_address2").val(address2);
	opener.$("input#user_zipcode").val(zipcode);
	opener.$("input#user_name").val(name);
	opener.$("input#user_phone").val(phone);
	opener.$("input#address_serial").val(serial);
	
	self.close();
})
var myZipcode;
var myAddress
function hi_zip(){
	var star;
	new daum.Postcode({
		oncomplete:function(data){
			myAddress=data.address;
			myZipcode=data.zonecode;
			
			if(myAddress.includes("서울")){
				star="샛별배송";
			}else if(myAddress.includes("대전")){
				star="샛별배송";
			}else star="택배배송";
			popUp(myZipcode,myAddress,star);
			
		}
	}).open();
}
function popUp(myZipcode,myAddress,star){
	var user_id = '${user_id}';
	var url="destination_new.do?myZipcode="+myZipcode+"&myAddress="+myAddress+"&star="+star+"&user_id="+user_id+"&whatsPage=cartPage";
	window.location.href=url;
}
</script>
</body>
</html>