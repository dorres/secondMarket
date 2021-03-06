<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
	<form id="frm">
	<div class="section_destination">
		<div id="inputForm" class="">
			<div class="modify only_pc">
				<input type="hidden" name="address_serial" value="${address_serial }">
				<input type="hidden" name="user_address1" value="${user_address1 }">
				<div class="field">
					<span class="badge_default">기본 배송지</span>
					<div id="addrMain" class="address"  >${user_address1 }</div>
					<input type="text" id="addrSub" name="user_address2"
						placeholder="나머지 주소를 입력해주세요" data-max-length="74"
						data-format="text" value="${user_address2 }">
				</div>
				<div class="field">
					<label class="label_block" for="receiverName">받으실 분</label><input
						type="text" id="receiverName" name="user_name"
						data-max-length="20" placeholder="이름을 입력해주세요" value="${user_name }">
				</div>
				<div class="field">
					<label class="label_block" for="receiverPhone">휴대폰</label><input
						type="text" id="receiverPhone" name="user_phone"
						data-max-length="11" data-format="number" pattern="[0-9]*"
						inputmode="decimal" placeholder="번호를 입력해주세요" value="${user_phone }">
				</div>
				<button type="submit" class="btn active" id="UUpdate">저장</button>
				<c:if test="${!address_default }">
					<button type="button" class="btn normal" id="deleteBt">삭제</button>
				</c:if>
			</div>
		</div>
	</div>
	</form>
	<script type="text/javascript">
    $("#UUpdate").click(function(){
        var frm = $("#frm").serialize(); // 해당하는 frm을 serialize를 해줍니다. ajax로 데이터를 보내기위해서 하는 작업입니다.
         // id값은 기본키이자 바뀌면안되는것이고 id값으로 조건을 줄꺼라서 고유 id 값을 받아옵니다.
        $.ajax({
            type : "post", // post방식으로 전송
            url : "user_address_list_update.do", // controller로 보낼 url
            data : frm, // data로는 위에서 serialize한 frm을 보냅니다.
            async : false, // 전역변수 사용을 위해서 설정해준다
             // serialize하면 json형태로 값을 보내줘야합니다.
            contentType: "application/x-www-form-urlencoded; charset=UTF-8", // 인코딩 설정
            success : function(data){
            	
            	window.opener.location.replace("user_address_list.do");
            	self.close();
            },
            error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
               }

        });
    });
    $("button#deleteBt").click(function(){
    	var serial = $("input[name=address_serial]").val();
    	$.ajax({
    		url:"deleteAddress.do",
    		data:{"address_serial":serial},
    		type:"post",
    		dataType:"text",
    		success:function(res){
    			alert(res);
    			window.opener.location.replace("user_address_list.do");
            	self.close();
    		},
    		error:function(request,status,error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
    	})
    });
</script>
</body>
</html>