<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/mykurly/destination_new.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style2.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style3.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style4.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/brn_qnbStyle.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/topButton.css">
</head>
<body>
	<div class="only_pc">
		<h2 class="pop_head">배송지 수정</h2>
	</div>
	<div class="section_destination">
		<div id="inputForm" class="">
			<div class="modify only_pc">
				<input type="hidden" name="addrNo" value="9955623"><input
					type="hidden" name="road_zonecode" value="05537"><input
					type="hidden" name="zipcode" value="138-879">
				<div class="field">
					<span class="badge_default">기본 배송지</span>
					<div id="addrMain" class="address"></div>
					<input type="text" id="addrSub" name="addrSub"
						placeholder="나머지 주소를 입력해주세요" data-max-length="74"
						data-format="text" value="${user_address2 }">
				</div>
				<div class="field">
					<label class="label_block" for="receiverName">받으실 분</label><input
						type="text" id="receiverName" name="receiverName"
						data-max-length="20" placeholder="이름을 입력해주세요" value="${user_name }">
				</div>
				<div class="field">
					<label class="label_block" for="receiverPhone">휴대폰</label><input
						type="text" id="receiverPhone" name="receiverPhone"
						data-max-length="11" data-format="number" pattern="[0-9]*"
						inputmode="decimal" placeholder="번호를 입력해주세요" value="${user_phone }">
				</div>
				<button type="button" class="btn active">저장</button>
			</div>
		</div>
	</div>
</body>
</html>