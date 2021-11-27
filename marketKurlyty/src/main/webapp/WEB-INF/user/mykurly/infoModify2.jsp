<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">
</head>
<script type="text/javascript">
function validateEmail(email){
	var emailReg = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
	return emailReg.test(email);
}
function formUpdateSubmit(){
	//판별문
	var year = $("#user_year").val();
	var mon = $("#user_month").val();
	var day = $("#user_day").val();
	$("#totalbirth").val(year+mon+day);
	
	
	if(document.frmMember.user_new_pw.value!=""){
		if(document.frmMember.user_new_pw_check.value==""){
		alert("비밀번호 확인을 입력하세요.");
		document.frmMember.user_pw_check.focus();
		return;
		}
		if(document.frmMember.user_new_pw.value!=document.frmMember.user_new_pw_check.value){
			alert("비밀번호를 다시 확인해 주세요.");
			document.frmMember.user_pw_check.focus();
			return;
			}
	}
	
	if(document.frmMember.user_name.value==""){
		alert("이름을 입력하세요.");
		document.frmMember.user_name.focus();
		return;
	}
	if(document.frmMember.user_email.value!=""){
		if(!validateEmail(document.frmMember.user_email.value)){
			alert("올바른 이메일을 입력해 주세요.");
			document.regForm.email.focus();
			return;
			}
		if(document.frmMember.user_email.value!=document.frmMember.orgEmail.value){
			if(document.frmMember.chk_email.value=="불가능"){
				alert("중복된 이메일은 사용할 수 없습니다.");
				document.frmMember.user_email.focus();
				return;
			}
		}
	}
	
	/* if(document.frmMember.okCerCheck.value=="불가능"){
		alert("문자 인증을 해주세요.");
		return;
	} */
	if(document.frmMember.user_year.value==""){
		alert("생년월일을 입력하세요.");
		document.frmMember.user_year.focus();
		return;
	}
	if(document.frmMember.user_month.value==""){
		alert("생년월일을 입력하세요.");
		document.frmMember.user_month.focus();
		return;
	}
	if(document.frmMember.user_day.value==""){
		alert("생년월일을 입력하세요.");
		document.frmMember.user_day.focus();
		return;
	}
	if(document.frmMember.user_year.value>2030){
		alert("생년월일을 다시 확인해주세요.");
		document.frmMember.user_year.focus();
		return;
	}
	if(document.frmMember.user_month.value>12){
		alert("생년월일을 다시 확인해주세요.");
		document.frmMember.user_month.focus();
		return;
	}
	if(document.frmMember.user_day.value>31){
		alert("생년월일을 다시 확인해주세요.");
		document.frmMember.user_day.focus();
		return;
	}
	document.frmMember.submit();
}
function chkEmail(){
	var email = document.frmMember.user_email.value;
	$.ajax({
		url:"emailCheck.do?user_email="+email,
		datatype:"json",
		success:function(res){
			const data = JSON.parse(res);
			alert(data.message);
			$("#posibleEmail").val(data.usedEmail);
		}
	})
}
function smsResponse(){
	alert("문자 ㄱㄱ");
	var phone = document.frmMember.user_phone.value;
	$.ajax({
		url:"smsCheck.do?user_phone="+phone,
		datatype:"json",
		success:function(res){
			const data = JSON.parse(res);
			$("#checkNum").val(data.checkNum);
			$(".phoneHid").attr("class","addressShow");
		}
	});
	
}
function certCheck(){
	var smsCheck = $("#smsCheck").val();
	var checkNum = $("#checkNum").val();
	if(smsCheck==checkNum){
		alert("인증이 성공적으로 되었습니다.");
		$("#okCerCheck").val("가능");
	}
	else{
		alert("인증에 실패했습니다. 다시 입력해주세요.");
		$("#okCerCheck").val("불가능");
	}
}
function zip(){
	var myAddress;
	var myZipcode;
	new daum.Postcode({
		oncomplete:function(data){
			myAddress=data.address;
			myZipcode=data.zonecode;
			$("#zip").val(myZipcode)
			$("#addr1").val(myAddress);
			$(".hid").attr("class",".addressShow");
		}
	}).open();
}
</script>
<body class="main-index" oncontextmenu="return false" ondragstart="return false" onselectstart="return !disableSelection">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
					<jsp:include page="default/mainTop.jsp"></jsp:include><!-- mypage상단부분 -->

					<div class="page_aticle aticle_type2">
						<!-- Main 시작 -->
						<jsp:include page="default/mainLeft.jsp"></jsp:include>
						<!-- Mainleft -->
						<div class="page_aticle aticle_type2">
							<!-- MainCenter 시작 -->

							<div class="page_section section_myinfo">
								<div class="head_aticle">
									<h2 class="tit">개인 정보 수정</h2>
								</div>
								
								<div class="type_form member_join member_mod">
									<form id="form" name="frmMember" method="post" action="updateProc.do"
										onsubmit="return chkForm2(this)" novalidate="">
										<input type="hidden" value="${userData.user_email }" name="orgEmail">
										<input id="posibleEmail" type="hidden" name="chk_email" value="불가능">
										<table class="tbl_comm">
											<tbody>
												<tr class="fst">
													<th>아이디</th>
													<td><input type="text" value="${userData.user_id }" readonly="" name="user_id" id="user_id"	class="user_id"></td>
												</tr>

												<tr class="member_pwd">
													<th>새 비밀번호</th>
													<td><input type="password" name="user_new_pw" id="user_new_pw" label="새 비밀번호" option="regPass"
														maxlength="16" class="reg_pw" placeholder="비밀번호를 변경 할 시 입력하세요."> 
														<input type="hidden" name="newPasswordCheck" value="0">
														<p class="txt_guide square">
															<span class="txt txt_case4">현재 비밀번호와 다르게 입력</span> <span
																class="txt txt_case1">10자 이상 입력</span> <span
																class="txt txt_case2">영문/숫자/특수문자(공백 제외)만 허용하며,
																2개이상 조합</span> <span class="txt txt_case3">동일한 숫자 3개 이상
																연속사용 불가</span>
														</p></td>
												</tr>

												<tr class="member_pwd">
													<th>새 비밀번호 확인</th>
													<td><input type="password" name="user_new_pw_check"	id="user_new_pw_check" label="새 비밀번호" option="regPass"
														maxlength="16" class="user_new_pw_check" placeholder="새 비밀번호를 다시 입력하세요.">
														<p class="txt_guide square">
															<span class="txt txt_case1">동일한 비밀번호를 입력해주세요.</span>
														</p></td>
												</tr>

												<tr>
													<th>이름 <span class="ico"> *<span
															class="screen_out">필수항목</span>
													</span>
													</th>
													<td><input type="text" id="user_name" name="user_name" value="${userData.user_name }"
														required="" fld_esssential="" label="이름" placeholder="이름을 입력해주세요"></td>
												</tr>

												<tr>
													<th>이메일 <span class="ico"> *<span
															class="screen_out">필수항목</span>
													</span>
													</th>
													<td><input type="text" id="user_email" name="user_email" value="" data-email="" size="30"
														required="" option="regEmail" label="이메일" placeholder="이메일을 수정할 시 입력하세요." onblur="chkEmailChange($(this))">
														<a href="javascript:void(0)" onclick="chkEmail()" class="btn default">중복확인</a></td>
												</tr>

												<tr class="field_phone">
											<th>휴대폰<span class="ico">*<span
													class="screen_out">필수항목</span></span></th>
											<td>
												<div class="phone_num">
													<input type="text" value="" pattern="[0-9]*" id="user_phone" name="user_phone" placeholder="휴대폰 번호를 바꿀시 입력하세요." class="inp">
													<button id="btn_cert" class="btn default enabled" onclick="smsResponse()" type="button">인증번호 받기</button>
												</div>
												<!-- <div id="codeNum" class="code_num">
													<input type="text" name="auth_code" id="auth_code" value=""
														size="6" maxlength="6" pattern="[0-9]*" label="인증번호 확인"
														disabled="" class="inp_confirm"
														oninput="if(value.length>6)value=value.slice(0,6);$(this).val($(this).val().replace(/[^0-9]/g,''));">

													<button id="btn_cert_confirm" class="btn default disabled"
														type="button">인증번호 확인</button>
													<p id="countdown" class="count_down"></p>
												</div> -->
												<p class="txt_guide">
													<span class="txt txt_case1"></span>
												</p>
											</td>
										</tr>
												<tr>
											<th></th>
											<td>
												<div class="phoneHid">
													<input type="text" id="smsCheck" name="smsCheck" size="6" maxlength="6" value="" />
													<button id="btn_cert" class="btn default enabled" onclick="certCheck()" type="button">인증번호 확인</button>
													<input type="hidden" id="posiblePhone"/>
													<input type="hidden" id="checkNum"/>
													<input type="hidden" id="okCerCheck" value="불가능"/> 
												</div>
											</td>
										</tr>
												<tr class="select_sex">
											<th>성별</th>
											<td>
												<label class="">
													<input type="radio" name="user_sex" value="M">
													<span class="ico"></span>남자
												</label>
												<label class="">
													<input type="radio" name="user_sex" value="W">
													<span class="ico"></span>여자
												</label>
												<label class="checked">
													<input type="radio" name="user_sex" value="N" checked="checked">
													<span class="ico"></span>선택안함
												</label></td>
										</tr>
										
												<tr class="birth field_birth">
											<th>생년월일</th>
											<td>
												<div class="birth_day">
													<input type="text" name="user_year" id="user_year"
														pattern="[0-9]*" value="${userData.user_year }" label="생년월일" size="4"
														maxlength="4" placeholder="YYYY">
														<span class="bar"></span>
														<input type="text" name="birth[]"
														id="user_month" pattern="[0-9]*" value="${userData.user_month }" label="생년월일"
														size="2" maxlength="2" placeholder="MM">
														<span class="bar"></span>
														<input type="text" name="birth[]"
														id="user_day" pattern="[0-9]*" value="${userData.user_day }" label="생년월일"
														size="2" maxlength="2" placeholder="DD">
														
													<input id="totalbirth" type="hidden" name="user_birth"/>
												</div>
												<p class="txt_guide">
													<span class="txt bad"></span>
												</p>
											</td>
										</tr>
												
												<tr style="display: none">
													
												</tr>
												<tr class="reg_agree">
													<th>이용약관동의 <span class="ico">*<span
															class="screen_out">필수항목</span></span>
													</th>
													<td>
														<div class="bg_dim"></div>
														<div class="check_view">
															<label class="label_block check_agree checked"> <input
																type="checkbox" name="marketing" value="y"
																checked="checked"> <span class="ico"></span>무료배송,
																할인쿠폰 등 혜택/정보 수신 동의 <span class="sub">(선택)</span>
															</label>
															<div class="check_event email_sms">
																<label class="label_block check_agree checked">
																	<input type="checkbox" name="sms" value="y"
																	checked="checked"> <span class="ico"></span>SMS
																</label> <label class="label_block check_agree checked">
																	<input type="checkbox" name="mailling" value="y"
																	checked="checked"> <span class="ico"></span>이메일
																</label>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
										<div id="formSubmit" class="form_footer">
											<a href="withdraw.do" class="btn default">탈퇴하기</a>
											<button type="button" class="btn active" 
											onclick="formUpdateSubmit()">회원정보수정</button>
										</div>
									</form>
								</div>
								</div>
						</div>
						<!-- MainCenter 끝 -->
					</div>
					<!-- Main 끝 -->
				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

	<a href="#top" id="pageTop">맨 위로가기</a>


	<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank"
		style="display: none; width: 100%; height: 600px;"></iframe>
</body>
</html>