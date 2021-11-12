<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>새 배송지 추가</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/mykurly/destination_new.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style2.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style3.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/style4.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/brn_qnbStyle.css">
<link rel="styleSheet" href="${pageContext.request.contextPath }/resources/style/default/topButton.css">
</head>
<body>

<form action="user_address_list_new.do" method="post">
	<div class="section_destination">
		<div id="inputForm" class="">
			<div class="modify only_pc">
				<input type="hidden" name="user_id" value="${user_id }">
				<input type="hidden" name="user_zipcode" value="${myZipcode }">
				<p class="tit_result">
					${star} 지역입니다.
					<span class="desc">더 많은 곳에 배송될 수 있게 최선을 다하겠습니다.</span>
				</p>
				<span class="desc">매일 아침, 문 앞까지 신선함을 전해드려요.</span>
				<div class="field">
					<div class="address_search">
						<input  type="text" id="addr1" class="address" readonly="" name="user_address1"
							value="${myAddress }">
						
					</div>
					<input type="text" id="addrSub" name="user_address2"
						placeholder="나머지 주소를 입력해주세요" data-max-length="78"
						data-format="text" value="">
				</div>
				<label class="label_default"><input type="checkbox"
					id="isDefault" name="isDefault"><span class="ico"></span>기본
					배송지로 저장</label>
				<button type="submit" class="btn active" onclick="close();" >저장</button>
			</div>
		</div>
	</div>
	</form>
	<script>
		function close(){
			self.close();
		}
	</script>
</body>
</html>