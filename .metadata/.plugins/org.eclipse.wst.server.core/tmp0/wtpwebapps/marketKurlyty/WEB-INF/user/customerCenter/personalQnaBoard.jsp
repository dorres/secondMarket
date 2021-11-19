<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">

<style>
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
										<input type="hidden" name="qna_personal_serial" value="${personalqna.qna_personal_serial}" />
										<tr class="menu">
											<td>${num.index+1}</td>
											<td>${personalqna.qna_personal_category}</td>
											<td>${personalqna.qna_personal_title}</td>
											<td>${personalqna.user_id}</td>
											<td><fmt:formatDate value="${personalqna.qna_personal_date}" pattern = "yyyy-mm-dd"/> </td>
										</tr>
										<tr>
											<td align="center" colspan="3" class="sub" style="align:center; display:none; width:100%;">${personalqna.qna_personal_content}
												<input type="button" class="bhs_button yb" value="삭제" onclick="location.href='deletePersonalQna.do?qna_personal_serial=${personalqna.qna_personal_serial}'" style="align:center; line-height: 24px; width: 70px;">
												
												
												<input type="button" class="bhs_button yb" value="수정" onclick="location.href='updatePersonalQna.do?qna_personal_serial=${personalqna.qna_personal_serial}'" style="align:center; line-height: 24px; width: 70px;">
												
												</a>
											</td>
										</tr>
									</c:forEach>
								</table>
							</form>
<!--  글을 클릭하면 아래에 게시글 내용이 내려옴.  -->
								<!-- <div style="display: block; padding: 30px; border-top: 1px solid rgb(230, 230, 230);">
									<div width="100%" style="padding-left: 55px;">
										<tr> 
										<td>${personalqna.qna_personal_content}</td>
										</tr>
									</div>
									
								</div> --!>

								<!-- 문의 내역이 없을때 ↓↓↓↓↓↓↓↓↓-->
								<!--  <div class="no_data" style="padding: 150px 0 148px; border-top: 1px solid #e6e6e6; border-bottom: 1px solid #e6e6e6; font-size: 12px; color: #4c4c4c">
									1:1 문의 내역이 존재하지 않습니다.
								</div>
								<div style="position: relative">
									<div style="position: absolute; right: 0; top: 60px;">
										<a href="javascript:popup_register( 'add_qna' );">
											<span class="bhs_buttonsm yb" style="float: none;">글쓰기</span>
										</a>
									</div>
								</div>
								<div class="layout-pagination">
									<div class="pagediv"></div>
								</div> -->
								
								<!-- 문의 내역이 있을때 ↓↓↓↓↓↓↓↓↓-->
					<!--			<div class="mypage_wrap" style="float: none; width: 100%">
									<table class="table_faq" width="100%" onclick="view_content(this, event)">
										<tbody>
											<tr>
												<td width="8%" align="center">1</td>
												<td width="15%" align="center" class="stxt">
													<b>[컬리패스(무료배송)]</b>
												</td>
												<td style="padding-top: 5px; padding-bottom: 5px;">
													컬리패스가뭐에요? <span style="color: #007FC8;" class="stxt">[0]</span>
												</td>
												<td width="12%" align="center">rudtjr313</td>
												<td width="12%" align="center">2021-10-25</td>
											</tr>
										</tbody>
									</table>
									<div style="display: none; padding: 30px; border-top: 1px solid #e6e6e6">
										<div width="100%" style="padding-left: 55px;">컬리패스가 뭐에요?</div>
										<div class="goods-review-grp-btn" style="text-align: right;">
											<button type="button" class="styled-button" onclick="popup_register( 'mod_qna', '5098622' );">수정</button>
											<button type="button" class="styled-button" onclick="popup_register( 'del_qna', '5098622' );">삭제</button>
										</div>
									</div>
								</div>
								
								 -->
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
		$(".menu")
				.click(
						function() {
							if ($(this).nextAll("tr:eq(0)").find(".sub").is(
									":visible")) {
								$(this).nextAll("tr:eq(0)").find(".sub").css(
										"display", "none");
							} else {
								$(this).nextAll("tr:eq(0)").find(".sub").css(
										"display", "table-cell");
							}
						})
	</script>

	<a href="#top" id="pageTop">맨 위로가기</a>


		<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank" style="display: none; width: 100%; height: 600px;"></iframe>
</body>
</html>