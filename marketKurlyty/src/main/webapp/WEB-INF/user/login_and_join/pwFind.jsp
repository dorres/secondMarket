<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">
</head>
<body class="main-index" oncontextmenu="return false" ondragstart="return false">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
					<c:if test="${type=='get' }">
						<div class="section_login">
							<h3 class="tit_login">비밀번호 찾기</h3>
							<div class="write_form find_view">
								<form method="post" id="form" name="fm" action="pwFind.do">
									<strong class="tit_label">이름</strong>
									<input name="user_name" type="text" size="29" required="" label="이름" tabindex="2">
									
									<strong class="tit_label">아이디</strong>
									<input name="user_id" value="" type="text" size="29" required="" label="아이디" tabindex="2">
									<p></p>
									<strong class="tit_label">이메일</strong>
									<input name="user_email" type="text" size="29" required="" label="메일주소" tabindex="5">
									<p></p>
									<button type="submit" class="btn_type1">
										<span class="txt_type">찾기</span>
									</button>
								</form>
							</div>
						</div>
					</c:if>
					<c:if test="${type=='post' }">
						<c:if test="${sendPassword }">
							<c:if test="${sendEmailSuccess }">
								<!-- 비번찾기 성공↓↓↓↓↓↓↓ -->
								<div class="section_login">
									<h3 class="tit_login">비밀번호 찾기</h3>
									<div class="layer_parent">
										<div id="certPopLayer">
											<div id="certFrameLayer">
												<iframe id="certFrame" name="certFrame" src="about:blank" scrolling="no" frameborder="0"></iframe>
											</div>
											<div id="certPopLayerBG"></div>
										</div>
									</div>
									<div class="write_form find_view">
										<form name="certForm" method="post" action="">
											<img class="thumb" src="https://res.kurly.com/mobile/service/member/1908/img_pw_find_email.png" alt="이메일 찾기">
											<p class="desc">
												이메일로 인증 완료후 <br> 비밀번호를 재발급 받으세요!
											</p>
											<p class="info">입력하신 ${userEmail } 으로 인증번호가 발송되며, 인증
												후 비밀번호가 재발급됩니다. 전송량이 많은 경우 이메일 전송이 지연될 수 있습니다.</p>
											<a href="login.do" class="btn_type1"><span class="txt_type">로그인으로 가기</span></a>
										</form>
									</div>
								</div>
							</c:if>
							<c:if test="${!sendEmailSuccess }">
								<div class="section_login">
									<h3 class="tit_login">예상치 못한 에러발생</h3>
									<div class="write_form find_view">
										<img class="thumb"
											src="https://res.kurly.com/pc/service/member/1908/img_id_find_succsess_v2.png"
											alt="아이디찾기완료">
										<p class="desc">
												인터넷 연결상태를 확인 후 다시 시도해주세요.
										</p>
										<a href="pwFind.do" class="btn_type1"><span
												class="txt_type">정보 다시 입력하기</span></a>
									</div>
								</div>
							</c:if>
						</c:if>
						<c:if test="${!sendPassword}">
							<div class="section_login">
								<h3 class="tit_login">비밀번호 찾기</h3>
								<div class="write_form find_view">
									<img class="thumb"
										src="https://res.kurly.com/pc/service/member/1908/img_id_find_succsess_v2.png"
										alt="아이디찾기완료">
									<p class="desc">
											고객님께서 입력하신 정보가 <br> 정확한지 확인 후 다시 시도해주세요.
									</p>
									<a href="pwFind.do" class="btn_type1"><span
											class="txt_type">정보 다시 입력하기</span></a>
								</div>
							</div>
						</c:if>
					</c:if>
				</div>
			</div>
		</div>	
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

		<a href="#top" id="pageTop">맨 위로가기</a>
</body>
</html>