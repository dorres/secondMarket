<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="/resources/style/ItemListStyle.css">

<script type="text/javascript">
  function mySubmit(index) {
    if (index == 1) {
      document.insert.action='insertPersonalQna.do';
    }
    if (index == 2) {
      document.insert.action='updatePersonalQna.do';
    }
    document.insert.submit();
  }
</script>

<style>
#qnaNotice.qna_goods {
	display: none
}
</style>

</head>
<body class="main-index" oncontextmenu="return false" ondragstart="return false" onselectstart="return !disableSelection">
	<div id="wrap" class="personal">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
				
					<div class="page_aticle aticle_type2">
						<!-- Main 시작 -->
						<jsp:include page="default/mainLeft.jsp"></jsp:include>
						<!-- Mainleft -->
						<div class="page_aticle aticle_type2">
							<!-- MainCenter 시작 -->
							<div class="page_section section_qna">
								<div class="head_aticle">
									<h2 class="tit">1:1 문의</h2>
								</div>

								<div class="xans-board-write">
									
									
							<form name="insert" id="insertform" method="post" style="height: 100%;">
										
							<!-- 
									<form name="insert" id="insertform" method="post"
										action="insertPersonalQna.do" style="height: 100%;">  -->
							           
										<input type="hidden" name="user_id" value="${userId}">
										<input type="text" name="user_name" value="${userName}">
								<c:if test="${getPersonalQna != null }">
										<input type="hidden" name="qna_personal_serial" value="${getPersonalQna.qna_personal_serial}"/>
								</c:if>
								
										<table id="table_after" class="boardWrite2" width="100%">
										
											<colgroup>
												<col width="15%" align="right">
											</colgroup>
											<tbody>
												<tr>
													<!-- UPDATE -->
													<th class="input_txt">제목</th>
													<!-- UPDATE -->
													
													<td>
													<!-- 처음 글쓸때 -->
													<c:if test="${getPersonalQna == null }">
														<select name="qna_personal_category" label="질문유형" class="select">
																<option value="">선택해주세요.</option>
																<option value="배송지연/불만">배송지연/불만</option>
																<option value="컬리패스(무료배송)">컬리패스(무료배송)</option>
																<option value="반품문의">반품문의</option>
																<option value="A/S문의">A/S문의</option>
																<option value="환불문의">환불문의</option>
																<option value="주문결제문의">주문결제문의</option>
																<option value="회원정보문의">회원정보문의</option>
																<option value="취소문의">취소문의</option>
																<option value="교환문의">교환문의</option>
																<option value="상품정보문의">상품정보문의</option>
																<option value="기타문의">기타문의</option>
														</select><br>
														<input type="text" name="qna_personal_title"
															style="width: 100%" label="제목" value=""/>
													</c:if>
													
													<!-- 글 상세보기로 왔을때 -->
													<c:if test="${getPersonalQna != null }">
														<select name="qna_personal_category" label="질문유형" class="select">
																<option value="${getPersonalQna.qna_personal_category}">"${getPersonalQna.qna_personal_category}"</option>
																<option value="">--------------------</option>
																<option value="배송지연/불만">배송지연/불만</option>
																<option value="컬리패스(무료배송)">컬리패스(무료배송)</option>
																<option value="반품문의">반품문의</option>
																<option value="A/S문의">A/S문의</option>
																<option value="환불문의">환불문의</option>
																<option value="주문결제문의">주문결제문의</option>
																<option value="회원정보문의">회원정보문의</option>
																<option value="취소문의">취소문의</option>
																<option value="교환문의">교환문의</option>
																<option value="상품정보문의">상품정보문의</option>
																<option value="기타문의">기타문의</option>
														</select><br>
														<input type="text" name="qna_personal_title" style="width: 100%" label="제목" 
														value="${getPersonalQna.qna_personal_title}"/>
													</c:if>
													</td>
												</tr>
													<!-- UPDATE -->
											
												
														
									
												<c:if test="${getPersonalQna == null }">
												<tr>												 
													<th class="input_txt">주문번호</th>
													<td>
													<input type="text" name="order_details_order_serial" style="width: 25%"
														value="${order_merchant_serial.order_merchant_serial }">
														<input type="button" class="bhs_button yb"
														value="주문조회"
														style="float: none; line-height: 27px; width: 100px;"/>
													</td>
												</tr>
												<tr>
													<th class="input_txt">이메일</th>
													<td><input type="text" name="qna_personal_email"
														value="${UserData.user_email}" readonly="readonly"
														class="read_only" label="이메일"/></td>
												</tr>

												<tr>
													<th class="input_txt">문자메시지</th>
													<td><input type="text" name="qna_personal_phone"
														value="${UserData.user_phone }" readonly="readonly"
														class="read_only" label="문자메세지"/></td>
												</tr>
								             	</c:if>			
										
										
												<c:if test="${getPersonalQna != null }">
												
												<tr>												 
													<th class="input_txt">주문번호</th>
													<td><input type="text"
														name="order_details_order_serial" style="width: 25%"
														value="${getPersonalQna.order_details_order_serial}">
														<input type="button" class="bhs_button yb"
														value="주문조회"
														style="float: none; line-height: 27px; width: 100px;">
													</td>
												</tr>
												<tr>
													<th class="input_txt">이메일</th>
													<td><input type="text" name="qna_personal_email"
														value="${getPersonalQna.qna_personal_email}" readonly="readonly"
														class="read_only" label="이메일"></td>
												</tr>

												<tr>
													<th class="input_txt">문자메시지</th>
													<td><input type="text" name="qna_personal_phone"
														value="${getPersonalQna.qna_personal_phone}" readonly="readonly"
														class="read_only" label="문자메세지"></td>
												</tr>
								
												</c:if>			
									
													
												<!-- 내용이하공통--> 			
												<tr>
													<th class="input_txt">내용</th>
													<td class="edit_area" style="position: relative;">
														<!-- 기본 출력문구 -->

														<div id="qnaNotice">
															<div class="inner_qnaNotice">
																<div class="notice_qna">
																	
																	<strong class="tit qna_goods">상품문의 작성 전 확인해 주세요!</strong>

																	<dl class="list qna_goods">
																		<dd>
																			<span>답변은 영업일 기준 2~3일 소요됩니다.</span> <span>해당
																				게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</span> <span>배송관련,
																				주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.</span>
																		</dd>
																	</dl>

																	<dl class="list qna_goods">
																		<dt>제품</dt>
																		<dd>
																			<span>입고일: 품절 상품 입고 일이 확정된 경우, 섬네일에
																				기재되어있습니다.(종 모양을 클릭하여, 재입고 알람 설정 가능)</span> <span>제품
																				상세정보: 영양성분 및 함량, 용량, 보관 및 취급 방법 등 제품 정보는 상세 이미지 또는
																				상세정보에서 확인 가능합니다.</span>
																		</dd>
																	</dl>

																	<dl class="list qna_public">
																		<dt>반품 / 환불</dt>
																		<dd>
																			<span>제품 하자 혹은 이상으로 반품 (환불)이 필요한 경우 사진과 함께
																				구체적인 내용을 남겨주세요.</span>
																		</dd>
																	</dl>

																	<dl class="list" id="branchByVersion15">
																		<dt>주문취소</dt>
																		<dd class="old" style="display: none">
																			구버전 분기처리
																			<span>샛별 지역 : 배송일 전날 19시까지 <br> 택배 지역 :
																				배송일 전날 18시까지 <br> 고객행복센터(1644-1107)/ 1:1문의 게시판/
																				카카오톡(마켓컬리) 으로 취소 요청 바랍니다.
																			</span> <span>생산이 시작된 이후에는 취소가 불가능 한 점 고객님의 양해부탁드립니다.</span>
																			<span>일부 예약상품은 배송 3~4일 전에만 취소 가능합니다.</span> <span>주문상품의
																				부분 취소는 불가능합니다. 전체 주문 취소 후 재구매해주세요.</span> <span>비회원
																				주문건의 경우 1:1문의 게시판 접수가 불가하기에 고객행복센터(1644-1107),
																				카카오톡(마켓컬리) 로 취소 요청 부탁드립니다.</span>
																		</dd>
																		<dd class="new">
																			<span> 배송 단계별로 주문취소 방법이 상이합니다. <br>
																				[입금확인] 단계 : [마이컬리 &gt; 주문내역 상세페이지] 에서 직접 취소 가능 <br>
																				[입금확인] 이후 단계 : 고객행복센터로 문의
																			</span> <br> <span>생산이 시작된 [상품 준비중] 이후에는 취소가
																				제한되는 점 고객님의 양해 부탁드립니다.</span> <span>비회원은 모바일 App 또는
																				모바일 웹사이트에서 [마이컬리 &gt; 비회원 주문 조회 페이지] 에서 취소가 가능합니다.</span> <span>일부
																				예약상품은 배송 3~4일 전에만 취소 가능합니다.</span> <span>주문상품의 부분
																				취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.</span>
																		</dd>
																	</dl>

																	<dl class="list">
																		<dt>배송</dt>
																		<dd>
																			<span>주문 완료 후 배송 방법(샛별 / 택배)은 변경이 불가능합니다.</span> <span>배송일
																				및 배송시간 지정은 불가능합니다. (예약배송 포함)</span>
																			<p class="info">※ 전화번호, 이메일, 주소, 계좌번호 등의 상세 개인정보가
																				문의 내용에 저장되지 않도록 주의해 주시기 바랍니다.</p>
																		</dd>
																	</dl>
																</div>
															</div>
														</div> 
														<!-- 위에 자바스크립트가 원래 있던 부분 --> 
														
														<c:if test = "${getPersonalQna == null}" >
														<textarea name="qna_personal_content" class="editing_area"
															style="width: 100%; height: 474px;"> </textarea>
														</c:if>
														
														<c:if test = "${getPersonalQna != null}" >
														<textarea name="qna_personal_content" class="editing_area"
															style="width: 100%; height: 474px;">${getPersonalQna.qna_personal_content}</textarea>
														</c:if>
														
													</td>
												</tr>

												<tr>
													<th class="input_txt">이미지</th>
													<td>
														<table width="95%" id="table" cellpadding="0" cellspacing="0" border="0" style="border: solid 1px #f4f4f4; border-collapse: collapse;">
															<tbody>
																<tr id="tr_0">
																	<td width="20" nowrap="" align="center">1</td>
																	<td width="100%"><input type="file" name="file[]" style="width: 50%" class="linebg">
																		<a href="javascript:add()">
																			<img src="${pageContext.request.contextPath }/resources/images/customerCenter/upload.gif" align="absmiddle">
																		</a>
																	</td>
																</tr> 
															</tbody>
														</table>
														<table>
															<tbody>
																<tr>
																	<td height="2"></td>
																</tr>
															</tbody>
														</table>
														<div width="100%" style="padding: 5px;" class="stxt">
															- 파일은 최대 5개까지 업로드가 지원됩니다.<br>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
												<tr>
													<td 
												  		align="LEFT" style="padding-top: 5px; border: none;" id="avoidDbl">
							 						</td>
													<td align="right" style="padding-top: 5px; border: none;">
													
													<input type="button" class="bhs_button yb" value="저장" onclick='mySubmit(1)' style="float: none;"> 
													<input type="button" class="bhs_button yb" value="수정하기" onclick='mySubmit(2)' style="float: none;"> 
												
													<!-- 	<c:if test = "${getPersonalQna == null}">
														<input type="submit" class="bhs_button yb" value="저장" style="float: none;"> 
														</c:if>
														
														<c:if test = "${getPersonalQna != null}">
														<input type="submit" class="bhs_button yb" value="수정하기" style="float: none;"> 
														</c:if> 
													-->
														
													</td>
												</tr>
											</tbody>
										</table>
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
