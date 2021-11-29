<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->


<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/default/style.css">
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/default/style2.css">
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/default/style3.css">
<link rel="styleSheet"
	href="${pageContext.request.contextPath }/resources/style/default/style4.css">
<style type= "text/css">
#photoZone {
    display: block;
    width: 80px;
    height: 80px;
    background-repeat: no-repeat;
    background-position: 50% 50%;
    background-size: cover;
}
</style>
</head>
<body class="main-index" oncontextmenu="return false"
	ondragstart="return false" >

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
							<div class="page_section section_write">
								<div class="head_aticle">
									<h2 class="tit">후기 작성</h2>
								</div>
								<div class="head_section layer_type">
									<span class="link"> <a href="#none">작성 시 유의 사항</a>
									</span>
									<div class="layer">
										<h4 class="tit_layer">후기 작성 시 유의사항</h4>
										<p class="desc_layer">
											마켓컬리는 믿을 수 있는 후기문화를 함께 만들어 가고자<br> 합니다. 따라서 후기 내용이 아래에
											해당하는 경우에는 검토 후<br> 비공개 조치될 수 있습니다.
										</p>
										<ul class="list_layer">
											<li>1. 욕설, 비난 등 업체나 타인에게 불쾌한 내용을 작성한 경우</li>
											<li>2. 해당 상품과 무관한 내용이나 동일 문자의 반복 등 부적합한<br> 내용을 작성한
												경우
											</li>
											<li>3. 상품의 기능이나 효과 등에 오해의 소지가 있는 내용을<br> 작성한 경우
											</li>
											<li>4. 저작권, 초상권 등 타인의 권리를 침해하는 이미지 사용한<br> 경우
											</li>
										</ul>
										<button type="button" class="btn_ok">확인</button>
										<button type="button" class="btn_close">
											<span class="screen_out">레이어 닫기</span>
										</button>
									</div>
								</div>
								<form action="reviewProc.do" method="post" enctype="multipart/form-data">
									<input type="hidden" name="user_id" value="${goods.user_id }">
									<input type="hidden" name="category_goods_serial" value="${goods.category_goods_serial }">
									<input type="hidden" name="review_serial1" value="${update.review_serial }">
									<input type="hidden" name="order_details_serial" value="${goods.order_details_serial }">
									<div class="write_board">
										<div class="goods_info">
											<div class="thumb">
											<c:choose>
											<c:when test="${goods.category_goods_image_thumb ne null }">
												<img src="${goods.category_goods_image_thumb}" onerror="" alt="상품 이미지">
											</c:when>
											<c:otherwise>
												<img src="${update.category_goods_image_thumb}" onerror="" alt="상품 이미지">
											</c:otherwise>
											</c:choose>
											</div>
											<div class="desc">
												<div class="inner_desc">
													<div class="name_desc">${goods.category_goods_detail_name2 }${update.category_goods_detail_name2 }</div>
													<div class="name_main">${goods.category_goods_detail_name1 }${update.category_goods_detail_name1 }</div>
												</div>
											</div>
										</div>
										<table class="tbl">
											<caption style="display: none">후기 작성 입력상자</caption>
											<colgroup>
												<col style="width: 110px;">
												<col style="width: auto">
											</colgroup>
											<tbody>
												<tr>
													<th>제목</th>
													<td><input type="text" name="review_title" placeholder="제목을 입력해주세요." class="inp " value="${update.review_title }"></td>
												</tr>
												<tr>
													<th>후기작성</th>
													<td>
														<div class="field_cmt">
															<textarea id="fieldCmt" name="review_content" cols="100" rows="10" 
															placeholder="자세한 후기는 다른 고객의 구매에 많은 도움이 되며, 일반식품의 효능이나 효과 등에 오해의 소지가 있는 내용을 작성 시 검토 후 비공개 조치될 수 있습니다. 반품/환불 문의는 1:1문의로 가능합니다.">${update.review_content }</textarea>
															<p class="txt_count">
																<span class="num">0</span>자 / 최소 10자
															</p>
														</div>
													</td>
												</tr>
												<tr>
													<th>사진등록</th>
													<td>
														<div class="photo_add">															
														<div class="inner_photo"  >
														<div class="item_photo" id="photoZone" style="display: block;" ><img src="${update.review_image_main }"></div>		
														<span class=" id="thisPoto"></span> 
														</div>
														<label for="image"></label>
														<input type="file" name="image" class="btn_upload" onchange="setThumbnail(event)">
														
														</div>
														
														<div class="file_count">
															<p class="txt_count">
																<span class="num">0</span>장 / 최대 8장
															</p>
														</div>
														<p class="photo_notice">구매한 상품이 아니거나 캡쳐 사진을 첨부할 경우,
															통보없이 삭제 및 적립 혜택이 취소됩니다.</p>
													</td>
												</tr>
											</tbody>
										</table>
										<p class="link_inquire">
											혹시 상품에 문제가 있으셨나요?<a
												href="/shop/mypage/mypage_qna_register.php?mode=add_qna&amp;ordno=1637132460375">1:1
												문의하기</a>
										</p>
										<button type="submit"  id="btnSubmit" class="btn_reg" >등록하기</button>
										
									</div>
								</form>
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
	<script>
		function setThumbnail(event) {
			var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img");
				img.setAttribute("src", event.target.result);
				document.querySelector("div#photoZone").appendChild(img);
			};
			reader.readAsDataURL(event.target.files[0]);
		}		

	</script>




	<a href="#top" id="pageTop">맨 위로가기</a>


	<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank"
		style="display: none; width: 100%; height: 600px;"></iframe>
</body>
</html>