<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
</head>
<body class="main-index" oncontextmenu="return false"
	ondragstart="return false">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
					<div id="content">
						<c:if test="${type=='get' }">
							<div class="section_login">
								<h3 class="tit_login">아이디 찾기</h3>
								<div class="write_form find_view">
									<form id="form" name="fm" method="post" action="idFind.do">
										<strong class="tit_label">이름</strong>
										<input type="text" name="user_name" tabindex="2" size="29" required="required" placeholder="고객님의 이름을 입력해주세요">
										<strong class="tit_label">이메일</strong>
										<input type="text" name="user_email" size="29" tabindex="5" required="required" placeholder="가입 시 등록하신 이메일 주소를 입력해주세요">
										<button type="submit" class="btn_type1">
											<span class="txt_type">확인</span>
										</button>
									</form>
								</div>
							</div>
						</c:if>
						<c:if test="${type=='post' }">
							<c:if test="${findId !=null }">
								<!-- 아이디 찾기 성공했을경우 ↓↓↓↓↓↓↓↓ㅍ-->
								<div class="section_login">
									<h3 class="tit_login">아이디 찾기</h3>
									<div class="write_form find_view">
										<img class="thumb"
											src="https://res.kurly.com/pc/service/member/1908/img_id_find_succsess_v2.png"
											alt="아이디찾기완료">
										<p class="desc">
											고객님의 <br> 아이디 찾기가 완료되었습니다!
										</p>
										<c:if test="${fn:length(findId)>=4 }">
											<p class="info">아이디 : ${fn:substring(findId,0,fn:length(findId)-3) }***</p>
										</c:if>
										<c:if test="${fn:length(findId)<4 }">
											<p class="info">아이디 : ${fn:substring(findId,0,fn:length(findId)/2) }***</p>
										</c:if>
										<a href="login.do" class="btn_type1"><span
											class="txt_type">로그인 하기</span></a>
									</div>
								</div>
							</c:if>
							<c:if test="${findId ==null }">
								<!-- 아이디 찾기 실패했을경우 ↓↓↓↓↓↓↓↓  -->
								<div class="section_login">
									<h3 class="tit_login">아이디 찾기</h3>
									<div class="write_form find_view">
										<img class="thumb"
											src="https://res.kurly.com/pc/service/member/1908/img_id_find_succsess_v2.png"
											alt="아이디찾기완료">
										<p class="desc">
											고객님께서 입력하신 정보가 <br> 정확한지 확인 후 다시 시도해주세요.
										</p>
										<a href="idFind.do" class="btn_type1"><span
											class="txt_type">아이디 다시 찾기</span></a>
									</div>
								</div>
							</c:if>
						</c:if>

					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>

	<a href="#top" id="pageTop">맨 위로가기</a>
</body>
</html>