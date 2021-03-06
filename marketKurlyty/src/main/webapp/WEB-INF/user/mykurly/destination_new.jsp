<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

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

<form id="frm" >
	<div class="section_destination">
		<div id="inputForm" class="">
			<div class="modify only_pc">
				<input type="hidden" id="id" name="user_id" value="${user_id }">
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
				<button type="button" id="update_btn" class="btn active" onclick="" >저장</button>
			</div>
		</div>
	</div>
	</form>
	<script type="text/javascript">
    $("#update_btn").click(function(){
        var frm = $("#frm").serialize(); // 해당하는 frm을 serialize를 해줍니다. ajax로 데이터를 보내기위해서 하는 작업입니다.
         // id값은 기본키이자 바뀌면안되는것이고 id값으로 조건을 줄꺼라서 고유 id 값을 받아옵니다.
        $.ajax({
            type : "post", // post방식으로 전송
            url : "user_address_list_new.do", // controller로 보낼 url
            data : frm, // data로는 위에서 serialize한 frm을 보냅니다.
            async : false, // 전역변수 사용을 위해서 설정해준다
             // serialize하면 json형태로 값을 보내줘야합니다.
            contentType: "application/x-www-form-urlencoded; charset=UTF-8", // 인코딩 설정
            dataType:"text",
            success : function(data){
            	var userId='${user_id}';
            	var shippingUrl="shippingAddressPage.do?user_id="+userId+"&addressSerial=0";
            	if(${whatsPage=="cartPage"}){
            		window.location.href=shippingUrl;
            	}else{
            		window.opener.location.replace("user_address_list.do");
            		self.close();
            	}
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
               }

        });
      
    });
</script>

</body>
</html>