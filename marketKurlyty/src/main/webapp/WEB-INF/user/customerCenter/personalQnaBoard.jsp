<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="styleSheet" href="style/ItemListStyle.css">
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->
<style>
element.style {
    border-top: 1px solid #e6e6e6;
    border-bottom: 1px solid #e6e6e6;
}
.page_aticle .no_data {
    padding: 50px 0;
    font-size: 13px;
    color: #757575;
    text-align: center;
}
.page_aticle button, .page_aticle input, .page_aticle select, .page_aticle * {
    font-family: noto sans;
    font-weight: 400;
    letter-spacing: 0;
}
div, th, td, li, dt, dd, p {
    word-break: break-all;
}
</style>
</head>
<body class="main-index" oncontextmenu="return false" ondragstart="return false" >
	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->

					<div class="page_aticle aticle_type2">	<!-- Main 시작 -->
						<jsp:include page="default/mainLeft.jsp"></jsp:include>	<!-- Mainleft -->
						<div class="page_aticle aticle_type2">	<!-- MainCenter 시작 -->
							<div class="page_section section_qna">
								<div class="head_aticle">
									<h2 class="tit">1:1 문의</h2>
								</div>
								<form name="delete" id="deleteform" method="get" action="deletePersonalQna.do">
									<input type="hidden" name="deletePersonalQna" value="delete"/>
										<table class="xans-board-listheader" width="100%" style="table-layout:fixed;">
											<tr class="input_txt">
												<th width="8%">번호</th>
												<th width="15%">카테고리</th>
												<th>제목</th>
												<th width="12%">작성자</th>
												<th width="12%">작성일</th>
											</tr>									
											
											<c:forEach var="personalqna" items="${personalqnaboard}" varStatus="num">
<<<<<<< HEAD
												<input type="hidden" name="qna_personal_serial" value="${personalqna.qna_personal_serial}"/>													<tr class="menu">
=======
												<input type="hidden" name="qna_personal_serial" value="${personalqna.qna_personal_serial}"/>
												<tr class="menu">
>>>>>>> bc261849dbb821747c283345c1b36e853be526a3
													<td>${num.index+1}</td>
													<td>${personalqna.qna_personal_category}</td>
													<td>${personalqna.qna_personal_title}</td>
													<td>${personalqna.user_id}</td>
													<td><fmt:formatDate value="${personalqna.qna_personal_date}" pattern="yyyy-mm-dd"/> </td>
												</tr>
<<<<<<< HEAD
											
=======
												<c:if test="${personalqna.qna_personal_image1 != null}">
												<tr>
													<td align="center" colspan="3" class="sub" style="align:center; display:none; width:100%;">
														<img alt="문의 이미지" src="${personalqna.qna_personal_image1 }" width="700" height="500">
													</td>
												</tr>
												</c:if>
													
												<c:if test="${personalqna.qna_personal_image2 != null}">
												<tr>
													<td align="center" colspan="3" class="sub" style="align:center; display:none; width:100%;">
														<img alt="문의 이미지2" src="${personalqna.qna_personal_image2 }" width="700" height="500">
													</td>
												</tr>
												</c:if>
												
>>>>>>> bc261849dbb821747c283345c1b36e853be526a3
												<tr>
													<td align="center" colspan="3" class="sub" style="align:center; display:none; width:100%;"> ${personalqna.qna_personal_content}
														<input type="button" class="bhs_button yb" value="삭제" onclick="location.href='deletePersonalQna.do?qna_personal_serial=${personalqna.qna_personal_serial}'" style="align:center; line-height: 24px; width: 70px;">
														<input type="button" class="bhs_button yb" value="수정" onclick="location.href='updatePersonalQna.do?qna_personal_serial=${personalqna.qna_personal_serial}'" style="align:center; line-height: 24px; width: 70px;">
													</td>
												</tr>
												
												<c:if test="${personalqna.qna_personal_answer_date == null}">
													<tr class="menu"> </tr>
												</c:if>				
												
												<c:if test="${personalqna.qna_personal_answer_date != null}">
													<tr class="menu">
														<td></td>
														<td> ┖ 답변</td>
<<<<<<< HEAD
														<td>안녕하세요. 고객님! 답변드립니다.</td>
=======
														<td>${ personalqna.qna_personal_answer_title}</td>
>>>>>>> bc261849dbb821747c283345c1b36e853be526a3
														<td>Kurlyty</td>
														<td><fmt:formatDate value="${personalqna.qna_personal_answer_date}" pattern="yyyy-mm-dd"/> </td>
													</tr>
													<tr>
														<td align="center" colspan="3" class="sub" style="align:center; display:none; width:100%;">${personalqna.qna_personal_answer}
															<input type="hidden" class="bhs_button yb" value="삭제" onclick="location.href='deletePersonalQna.do?qna_personal_serial=${personalqna.qna_personal_serial}'" style="align:center; line-height: 24px; width: 70px;">
															<input type="hidden" class="bhs_button yb" value="수정" onclick="location.href='updatePersonalQna.do?qna_personal_serial=${personalqna.qna_personal_serial}'" style="align:center; line-height: 24px; width: 70px;">
														</td>
													</tr>
												</c:if>
											
											</c:forEach>		
										</table>	
									</form>		
<<<<<<< HEAD
=======
						
>>>>>>> bc261849dbb821747c283345c1b36e853be526a3
						
							<c:if test="${personalqnaboard == null}">
							<div class="no_data" style="border-top:1px solid #e6e6e6;border-bottom:1px solid #e6e6e6">
								 문의 하신 내역 존재하지 않습니다. </div>
							</c:if>
			 
					<div class="no_data" style="border-top:1px solid #e6e6e6">
								</div>
								<div style="position: relative">
									<div style="position: absolute; right: 0; top: 60px;">
										<a href="/kurlyty/personalQnaWrite.do">
									<!-- <a href="javascript:popup_register( '/personalQnaWrite.jsp' );">-->
											<span class="bhs_buttonsm yb" style="float: none;">글쓰기</span>
										</a>
									</div>
								</div>
								<div class="layout-pagination">
									<div class="pagediv">
										<a href="/shop/mypage/mypage_qna.php?&amp;page=1" class="layout-pagination-button layout-pagination-first-page">맨  처음 페이지로 가기</a>
										<a href="/shop/mypage/mypage_qna.php?&amp;page=1"class="layout-pagination-button layout-pagination-prev-page">이전페이지로 가기</a>
										<strong class="layout-pagination-button layout-pagination-number __active">1</strong>
										<a href="/shop/mypage/mypage_qna.php?&amp;page=1" class="layout-pagination-button layout-pagination-next-page">다음페이지로 가기</a>
										<a href="/shop/mypage/mypage_qna.php?&amp;page=1" class="layout-pagination-button layout-pagination-last-page">맨 끝 페이지로 가기</a>
									</div>
								</div>
							</div>
						</div> <!-- MainCenter 끝 -->
					</div> <!-- Main 끝 -->
				</div>
			</div>
		</div>	
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>
<script>
	$(".menu").click( function() {
<<<<<<< HEAD
		if ($(this).nextAll("tr:eq(0)").find(".sub").is(":visible")) {
			$(this).nextAll("tr:eq(0)").find(".sub").css("display","none");
		} else {
			$(this).nextAll("tr:eq(0)").find(".sub").css("display","table-cell");
=======
		if ($(this).nextAll("tr").find(".sub").is(":visible")) {
			$(this).nextAll("tr").find(".sub").css("display","none");
		} else {
			$(this).nextAll("tr").find(".sub").css("display","table-cell");
>>>>>>> bc261849dbb821747c283345c1b36e853be526a3
		}
	})
</script>
</body>
</html>