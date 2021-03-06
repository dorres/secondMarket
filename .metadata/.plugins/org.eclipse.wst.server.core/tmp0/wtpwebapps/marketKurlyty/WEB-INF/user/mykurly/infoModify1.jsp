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
function formCheck(){
   
   if(document.confirmForm.user_id.value==""){
		alert("아이디를 입력하세요.");
		document.confirmForm.user_id.focus();
		return;
	}
   if(document.confirmForm.user_pw.value==""){
		alert("비밀번호를 입력하세요.");
		document.confirmForm.user_pw.focus();
		return;
	}
   document.confirmForm.submit();
}
</script>

<body class="main-index" oncontextmenu="return false"
	ondragstart="return false" onselectstart="return !disableSelection">

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
								<!-- 비밀번호 입력전 -->
								<div class="head_aticle">
									<h2 class="tit">개인 정보 수정</h2>
								</div>


								<div class="type_form member_join member_pw">
									<div class="field_pw">
										<h3 class="tit">비밀번호 재확인</h3>
										<p class="sub">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인해주세요.</p>

										<form name="confirmForm" method="post" action="infoModify2.do">
											<table class="tbl_comm">
												<tbody>
													<tr class="fst">
														<th>아이디</th>
														<td><input type="text" value="${userId }" class="user_id" id="user_id" name="user_id"
																readonly="readonly">
															<!-- readonly="" --></td>
													</tr>
													<tr>
														<th>비밀번호</th>
														<td> <input type="password"	class="user_pw" id="user_pw" name="user_pw"></td>
													</tr>
												</tbody>
											</table>
											<button type="button" class="btn active" onclick="formCheck()">확인</button>
										</form>
									</div>
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