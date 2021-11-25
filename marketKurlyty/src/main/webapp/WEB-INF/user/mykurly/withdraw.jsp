<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">
</head>

<script type="text/javascript">


function withdraw(){

   if(document.confirmWithdraw.user_pw.value == ""){
		alert("탈퇴를 위해서는 비밀번호 확인이 필요합니다.");
		document.confirmWithdraw.user_pw.focus();
		return false;
  	}
   if(document.confirmWithdraw.user_withdraw_reason.value == ""){
		alert("탈퇴를 위해서는 주요 탈퇴 사유 확인이 필요합니다.");
		document.confirmWithdraw.user_pw.focus();
		return false;
 	}
   if(document.confirmWithdraw.user_withdraw_reason_detail.value == ""){
		alert("고객님의 진심어린 충고의 말씀 입력을 부탁드립니다.");
		document.confirmWithdraw.user_pw.focus();
		return false;
		
	}
	if(confirm("정말 탈퇴하시겠습니까?") == true){//확인
	document.confirmWithdraw.submit();
	 document.form.submit();
	}else{//취소
		return;
	}
}

if(${FailMessage != null}){
	alert("${FailMessage}");
}


</script>


<style>
.tit_page {
	overflow: hidden;
	width: 1050px;
	margin: 0 auto;
	padding: 50px 0 51px;
}
</style>

<body class="main-index" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return !disableSelection">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
				<div class="tit_page">
					<h2 class="tit">회원탈퇴안내</h2>
				</div>

				<div id="main">
					<div id="content">

						<div class="page_aticle">
							<div class="type_form member_join member_hack">
							
								<form name="confirmWithdraw" method=get id="confirmWithdraw" action="checkPwWithdraw.do"><!-- SUBMIT만들기 -->
									<input type="hidden" name="act" value="Y">
									<input type="hidden" name="user_id" value="${userId}">
									
									<table class="tbl_comm">
										<tr>
											<th>회원탈퇴안내</th>
											<td class="info">고객님께서 회원 탈퇴를 원하신다니 저희 쇼핑몰의 서비스가 많이 부족하고
												미흡했나 봅니다. 불편하셨던 점이나 불만사항을 알려주시면 적극 반영해서 고객님의 불편함을 해결해 드리도록
												노력하겠습니다. <strong class="emph">아울러 회원 탈퇴시의 아래 사항을
													숙지하시기 바랍니다.</strong> 1. 회원 탈퇴 시 고객님의 정보는 상품 반품 및 A/S를 위해 전자상거래 등에서의
												소비자 보호에 관한 법률에 의거한 고객정보 보호정책에따라 관리 됩니다.<br> 2. 탈퇴 시
												고객님께서 보유하셨던 적립금은 모두 삭제 됩니다.<br> 3. 회원 탈퇴 후 30일간 재가입이
												불가능합니다.<br> 4. 회원 탈퇴 시 컬리패스 해지는 별도로 고객행복센터(1644-1107)를
												통해서 가능합니다. 직접 해지를 요청하지 않으면 해지 처리가 되지 않습니다.
											</td>
										</tr>
										
										<tr>
											<th>비밀번호 확인</th>
											<td>
											<input type="password" class="user_pw"  id="user_pw" name="user_pw" size="20">
											</td>
										</tr>
	<!-- 처음 글쓸때 -->
										<tr>
											<th>무엇이 불편하였나요?</th>
											<td>		
																	
											<label class="label_block"> 
											<input type="radio" name="user_withdraw_reason" value="고객서비스(상담,포장 등) 불만"> 
													<span class="ico"></span>고객서비스(상담,포장 등) 불만
											</label> 
											
											<label class="label_block"> 
											<input type="radio" name="user_withdraw_reason" value="배송불만"> 
													<span class="ico"></span>배송불만
											</label> 
											
											<label class="label_block"> 
											<input type="radio" name="user_withdraw_reason" value="교환/환불/반품 불만"> 
											<span class="ico"></span>교환/환불/반품 불만
											</label>
											
										 	<label class="label_block"> 
										 	<input type="radio" name="user_withdraw_reason" value="방문 빈도가 낮음"> 
										 	<span class="ico"></span>방문 빈도가 낮음
											</label> 
											
											<label class="label_block"> 
											<input type="radio" name="user_withdraw_reason" value="상품가격 불만"> 
											<span class="ico"></span>상품가격 불만
											</label> 
											
											<label class="label_block"> 
											<input type="radio" name="user_withdraw_reason" value="개인정보유출 우려"> 
													<span class="ico"></span>개인정보유출 우려
											</label> 
											
											<label class="label_block"> 
											<input type="radio"	name="user_withdraw_reason" value="쇼핑몰의 신뢰도 불만"> 
													<span class="ico"></span>쇼핑몰의 신뢰도 불만
											</label> 
											
											<label class="label_block"> 
											<input type="radio"	name="user_withdraw_reason" value="쇼핑 기능 불만"> 
													<span class="ico"></span>쇼핑 기능 불만
											</label> 
											
											<textarea name="user_withdraw_reason_detail" 
											rows="8" class="box" placeholder="고객님의 진심어린 충고 부탁드립니다."></textarea>
		  
											</td>
										</tr>
									</table>
									<div id="formSubmit" class="form_footer">
										<button type="button" class="btn default" onclick="location.href='infoModify1.do';">취소</button>
										<input type="button" class="btn active" onclick="withdraw()" value="탈퇴">
										
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>


</body>
</html>