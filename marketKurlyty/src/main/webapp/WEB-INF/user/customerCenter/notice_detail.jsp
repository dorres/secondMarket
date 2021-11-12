<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
request.setAttribute("notice_serial", "30");
%>
<!DOCTYPE html>

<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">
<style type="text/css">
.notice .layout-pagination {
	margin: 0
}

.eng2 {
	color: #939393
}

.xans-board-listheader {
	font-size: 12px
}
</style>
</head>
<body>
	<div class="tit_page">
		<h2 class="tit">공지사항</h2>
		<p class="sub">컬리의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.</p>
	</div>
	<div id="main">
			<div class="layout-wrapper">
				<div class="xans-element- xans-myshop xans-myshop-couponserial ">
					<table width="100%" align="center" cellpadding="0" cellspacing="0">
						<tbody>
							<tr>
								<td>
									<table width="100%">
										<tbody>
											<tr>
												<td>
													<table class="boardView" width="100%">
														<tbody>


															<tr>
																<th scope="row" style="border: none;">제목</th>
																<td>${board.notice_title }</td>
															</tr>
															<tr>
																<th scope="row">작성자</th>
																<td>${board.notice_id }</td>
															</tr>
															<tr class="etcArea">
																<td colspan="2">
																	<ul>
																		<li class="date "><strong class="th">작성일</strong>
																			<span class="td"><fmt:formatDate value="${board.notice_date }" pattern="yy-MM-dd"/></span></li>
																		<li class="hit "><strong class="th">조회수</strong>
																			<span class="td">${board.notice_hit }</span></li>
																	</ul>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td align="right" class="eng" style="padding: 5px;"></td>
											</tr>
											<tr>
												<td style="padding: 10px;" height="200" valign="top"
													id="contents">
													<table width="100%" style="table-layout: fixed">
														<tbody>
															<tr>
																<td class="board_view_content"
																	style="word-wrap: break-word; word-break: break-all"
																	id="contents_1119" valign="top"><div>
																		<span
																			style="font-family: Arial; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);">
																		</span>
																	</div>
																	<div>${board.notice_content }
																		<span
																			style="font-family: Arial; font-size: 12px; white-space: pre-wrap; background-color: rgb(255, 255, 255);"><br></span>
																	</div></td>
															</tr>

														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td height="1" bgcolor="#f4f4f4"></td>
											</tr>
										</tbody>
									</table>
									<br>
									<table width="100%" style="table-layout: fixed" cellpadding="0"
										cellspacing="0">
										<tbody>
											<tr>
												<td align="center" style="padding-top: 10px;">
													<table width="100%">
														<tbody>
															<tr>
																<td align="right"><a href="notice.do"><span
																		class="bhs_button yb" style="float: none;">목록</span></a></td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
									<div
										class="xans-element- xans-board xans-board-movement-1002 xans-board-movement xans-board-1002 ">
										<ul>
											<li class="prev "><strong>이전글</strong><a
												href="/board/free/read.html?no=27121&amp;board_no=1&amp;page="></a><a
												href="view.php?id=notice&amp;no=1118">[마켓컬리] 수퍼세이브위크
													10/30 11시 ~ 10/31 11시 추가 적립금 응모자 대상 이벤트 당첨 안내</a></li>
										</ul>
									</div>
									
</body>
<jsp:include page="../default/footer.jsp"></jsp:include>
</html>