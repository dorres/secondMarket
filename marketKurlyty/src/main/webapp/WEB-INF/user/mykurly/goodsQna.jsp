<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/mykurly/inquiry.css">
</head>
<style>
.btn {
    width:50%;
    height: 52px;
    border: 0;
    border-radius: 4px;
    font-weight: 600;
    font-size: 16px;
    line-height: 50px;
    text-align: center;
    outline: none;
}
</style>
<body class="main-index" oncontextmenu="return false" ondragstart="return false">

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">
			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->
			<div id="main">
				<div id="content">
					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- 오른쪽 스크롤메뉴 부분 -->
					<jsp:include page="default/mainTop.jsp"></jsp:include><!-- mypage상단부분 -->

					<div class="page_aticle aticle_type2">	<!-- Main 시작 -->
						<jsp:include page="default/mainLeft.jsp"></jsp:include>	<!-- Mainleft -->
						<div class="page_aticle aticle_type2">	<!-- MainCenter 시작 -->
							<div class="page_section section_review">
								<div class="head_aticle">
									<h2 class="tit">상품문의</h2>
									<input type="hidden" name="user_id" value="${userId}">
								</div>
								
								<div class="board-container">
									<div id="productInquiryBoard" data-boardpagesize="10" data-boardtype="my_kurly" data-devicetype="pc">
										
										<div class="board-header-container">
											<ul class="list-description">
												<li>상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당게시판으로 이동될 수 있습니다.</li>
												<li>
													배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 
													<a href="/shop/mypage/mypage_qna.php">1:1 문의</a>에 남겨주세요.
												</li>
											</ul>
										</div>
										
										<div class="board-item-container my_kurly">
											<div class="inquiry-board-header">
												<div></div>
												<div style="width: 520px;">제목</div>
												<div>작성일</div>
												<div>답변상태</div>
											</div>
											
											<!-- 문의내용이 있는경우 ↓↓↓↓↓↓↓↓↓-->

											<c:forEach var="goodsqna" items="${goodsqnaboard}"
												varStatus="num">
												<input type="hidden" name="qna_goods_serial"
													value="${goodsqna.qna_goods_serial}" />

												<ul class="board-list">
													<li class="inquiry-item">
														<div class="item-cell">
															<span class="frame-img"
																style="background-image: url(${goodsqna.category_goods_image_thumb});"></span>
														</div>
														<div class="product-detail">
															<span class="product-name">${goodsqna.qna_goods_name}</span>
															<strong>${goodsqna.qna_goods_title}</strong>
															<c:if test="${ goodsqna.qna_goods_lock }">
															<span
																class="icon-secret"> <span class="screen_out"></span>
															</span>
															</c:if>	
														</div>
														<div class="item-cell">
															<p class="txt_sub text_medium normal ">
																<fmt:formatDate value="${goodsqna.qna_goods_date}"
																	pattern="yyyy-MM-dd" />
															</p>
														</div>
														<div class="item-cell">
															<c:if test="${goodsqna.qna_goods_answer_status==0}">
																<p class="txt_sub text_medium normal">답변대기</p>
															</c:if>
															<c:if test="${goodsqna.qna_goods_answer_status==1}">
																<p class="txt_sub kurlyPurple normal">답변완료</p>
															</c:if>
														</div>
													</li>

													<c:if test="${goodsqna.qna_goods_answer != null}">
														<li class="inquiry-item-expand " style="display:none;">
															<div class="expand-question">
																<span class="icon-question"><span>질문</span></span>
																<p>
																	<span>${fn:replace(goodsqna.qna_goods_content,"ln","<br>")}<br></span>
																</p>
															</div>
															<div class="expand-answer">
																<span class="icon-answer"><span>답변</span></span>
																<p>
																	
																	${goodsqna.qna_goods_answer}
																	<!-- <br>늘 신선하고 최상의 상품을 통해
																	풍요로운 식탁이 되실 수 있도록 컬리가 함께하겠습니다.<br> <br>혹여 컬리
																	이용하심에 상품으로 불편을 겪으시거나 다른 어려움이 있으실 경우<br>언제든 컬리
																	고객행복센터 및 카카오톡, 1:1게시판으로 문의 부탁드립니다.<br> <br>마켓컬리
																	드림. -->
																</p>
																<span class="created-time">
																<fmt:formatDate value="${goodsqna.qna_goods_answer_date}" pattern="yyyy-MM-dd" /></span>
															</div>
														</li>
													</c:if>

													<c:if test="${goodsqna.qna_goods_answer == null}">
														<li class="inquiry-item-expand " style="display:none;">
															<div class="expand-question">
																<span class="icon-question"><span>질문</span></span>
																<p>
																	<span>${fn:replace(goodsqna.qna_goods_content,"ln","<br>")}<br></span>
																</p>

																<div class="inquiry-content-footer">
																	<button 
																	onclick="javascript:div_show_update('${goodsqna.qna_goods_serial }','${goodsqna.qna_goods_title}','${goodsqna.qna_goods_content}',${goodsqna.qna_goods_lock },'${goodsqna.category_goods_image_thumb }','${goodsqna.qna_goods_name}')">수정</button>
																	<button onclick="location.href='deleteGoodsQna.do?qna_goods_serial=${goodsqna.qna_goods_serial}'">삭제</button>
																</div>
															</div>
														</li>
													</c:if>
												</ul>
											</c:forEach>

											<!-- 문의내용이 없는경우 ↓↓↓↓↓↓↓↓↓-->
										<c:if test="${goodsqnaboard == null}">
											  <ul class="board-list">
												<li class="inquiry-empty">작성한 상품 문의가 없습니다.</li>
											</ul>
										</c:if>

											<div class="board-inquiry-area">
												<div class="paging-navigation">
													<button type="button" class="paging-prev">
														<span>이전</span>
													</button>
													<button type="button" class="paging-next">
														<span>다음</span>
													</button>
												</div>
											</div>
										</div>
										<div class="modal-container" id="write_div"
												style="display: none;">
												<form name="goodsQnaForm" id="updateGoodsQna" method="post"
													style="height: 100%;" action="updateGoodsQna.do">
													<input type="hidden" name="user_id" value="${userId}">
													<input type="hidden" name="user_name" value="${userName}">
													<input type="hidden" name="qna_goods_serial" value="0"/>
													<div class="dimmed-layer">
														<div class="inner-layer">
															<div class="inquiry-modal"
																style="margin-bottom: 20px; margin-top: 20px;">
																<div class="modal-header">
																	<strong>상품 문의하기</strong>
																	<button type="button" class="btn-close" onclick="javascript:div_hide()">
																		<span class="screen_out">닫기</span>
																	</button>
																</div>

																<div class="modal-body">
																	<div class="product-item">
																		<span class="frame-img" id="modalImage"></span>
																		<div class="cell">
																			<strong id="goodsName"></strong>
																		</div>
																	</div>
																	<div class="inquiry-form">
																		<div class="inquiry-row">
																			<span>제목</span>
																			<div class="inquiry-cell">
																				<div class="input-comm type_form">
																					<input type="text" placeholder="제목을 입력해주세요"
																						name="qna_goods_title" maxlength="50" value="">
																				</div>
																			</div>
																		</div>
																		<div class="inquiry-row">
																			<span>내용</span>
																			<div class="inquiry-cell">
																				<div class="inquiry-text-area ">
																					<span class="txt-byte"><span></span></span>
																					<div class="input-comm type_form">
																						<textarea name="qna_goods_content"
																							maxlength="5000" placeholder="상품문의를 작성해주세요."></textarea>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class="inquiry-row">
																			<span><span class="screen_out">비밀글 여부</span></span>
																			<div class="inquiry-cell">
																				<label class="check_agree label_block"> <input
																					type="checkbox" name="qna_goods_lock" value="true">
																					<!-- 기본값 false --> <span class="ico"></span>비밀글로
																					문의하기
																				</label>
																			</div>
																		</div>
																	</div>
																</div>

																<div class="modal-footer">
																	<input type="button" class="btn normal" style="float:left;"
																		onclick="javascript:div_hide();" value="취소">
																	<input type="button" class="btn active"
																		onclick="javascript:updateAction();" id="updateBt" value="수정">
																</div>
															</div>
														</div>
													</div>
												</form>
											</div>
										
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
$("li.inquiry-item").hover(function(){
	$(this).css("background-color","#ffffff");
});
$("li.inquiry-item").mouseleave(function(){
	$(this).css("background-color","#f7f7f7");
});
$("li.inquiry-item").click(function() {
	if($(this).nextAll("li.inquiry-item-expand").is(":visible")){
		$(this).nextAll("li.inquiry-item-expand").css("display","none");
	}else{
		$("li.inquiry-item-expand").css("display","none");
		$(this).nextAll("li.inquiry-item-expand").css("display","block");
	}
});
function div_show_update(serial,title,content,lock,image,goodsName) {
	var imgUrl = "url("+image+")";
	$("span#modalImage").css("background-image",imgUrl);
	$("input[name=qna_goods_serial]").val(serial);
	$("input[name=qna_goods_title]").val(title);
	$("textarea[name=qna_goods_content]").val(content.replaceAll("ln","\r\n"));
	$("input[name=qna_goods_lock]").prop('checked',lock);
	$("strong#goodsName").text(goodsName);
	$("#write_div").fadeIn(300);
}
	//숨기기
function div_hide() {
	$("input[name=qna_goods_title]").val("");
	$("textarea[name=qna_goods_content]").val("");
	$("#write_div").fadeOut(300);
	 //document.getElementById("write_div").style.display = "none";
}
function updateAction(){
	document.goodsQnaForm.submit();
}
</script>
		<a href="#top" id="pageTop">맨 위로가기</a>


		<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank" style="display: none; width: 100%; height: 600px;"></iframe>
</body>
</html>