<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/mykurly/coupon.css">
<script type="text/javascript">
if(${FailMessage != null}){
	alert("${FailMessage}");
}

//판별문
function formLoginSubmit(){

	if (document.frmMember.user_id.value == "") {
		alert("아이디를 입력하세요.");
		document.frmMember.user_id.focus();
		return;
	}
	else if (document.frmMember.user_pw.value == "") {
		alert("비밀번호 입력하세요");
		document.frmMember.user_id.focus();
		return;
	}
	else{
		document.frmMember.submit();
	}
}
Kakao.init('e843248c5d13b454b09013d97687a1b6');
console.log(Kakao.isInitialized());
function KakaoLogin(){
	window.Kakao.Auth.login({
		success:(auth)=>{
			console.log("정상적으로 로그인 되었습니다.",auth)
			window.Kakao.API.request({
				url:'/v2/user/me',
				success:(res)=>{
					const kakao_account=res.id;
					console.log(kakao_account);
					console.log(res);
				}
			});
		},
		fail:(err)=>{
			console.error(err)
		}
	});
}
</script>
<style>
.btn_kakao{
	border: 1px solid;
    background-color: #F8DF00;
}
.btn_kakao .kakao_type{
	color: #000000;
	display: inline-block;
    height: 100%;
    font-weight: 500;
    font-size: 16px;
    line-height: 51px;
    text-align: right;
    padding:0px;
}
.kakaoLogo{
	float:left;
	width:50px;
	height:50px;
	overflow:hidden;
	margin-left:0px;
	margin-top:2px;
	margin-right:0px;
}
.kakaoLogo img{
	object-fit:cover;
}
</style>
</head>
<body class="main-index" oncontextmenu="return false" ondragstart="return false">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
					<div id="content">

						<div id="qnb" class="quick-navigation"></div>
						<div class="section_login">
							<h3 class="tit_login">로그인</h3>
							<div class="write_form">
								<div class="write_view login_view">
								
									<form method="post" name="frmMember" action="login.do">
									
										<input type="text" name="user_id" size="20" tabindex="1" placeholder="아이디를 입력해주세요">
										<input type="password" name="user_pw" size="20" tabindex="2" placeholder="비밀번호를 입력해주세요">
										
										<div class="checkbox_save">
											<div class="login_search">
												<a href="/shop/member/find_id.php" class="link">아이디 찾기</a>
												<span class="bar"></span>
												<a href="/shop/member/find_pwd.php" class="link">비밀번호 찾기</a>
											</div>
										</div>
										<a class="btn_type1" onclick="javascript:formLoginSubmit()" href="#">
											<span class="txt_type">로그인</span>
										</a>
									</form>
									<a href="join.do" class="btn_type2 btn_member">
									<span class="txt_type">회원가입</span></a>
									<a href="" onclick="javascript:kakaoLogin()" class="btn_type2 btn_kakao">
										<span class="kakaoLogo"><img src="${pageContext.request.contextPath }/resources/images/kakaoLogo.png"></span>
										<span class="kakao_type">카카오 로그인</span>
									</a>
								</div>
							</div>
						</div>
						
					</div>


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