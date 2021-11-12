<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/js/common.js"></script> -->


<jsp:include page="../default/top.jsp"></jsp:include><!-- 기본 필요 meta, css는 include로 받아옴 -->

<!-- 여기부터 해당 페이지의 css 추가하면 됨-->
<link rel="styleSheet" href="style/ItemListStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/mykurly/destination.css">
</head>

<body class="main-index" oncontextmenu="return false" ondragstart="return false" >

	<div id="wrap" class="">
		<div id="pos_scroll"></div>
		<div id="container">

			<jsp:include page="../default/header.jsp"></jsp:include><!-- header부분 -->

			<div id="main">
				<div id="content">

					<jsp:include page="../default/sidemenu.jsp"></jsp:include><!-- sidemenu부분 -->
					<jsp:include page="default/mainTop.jsp"></jsp:include><!-- mypage상단부분 -->

					<div class="page_aticle aticle_type2"> <!-- Main시작 -->
						<jsp:include page="default/mainLeft.jsp"></jsp:include> <!-- Mainleft -->
						
						<div id="" class="page_section section_destination"> <!-- MainCenter  -->
							<div class="head_aticle">
								<h2 class="tit">
									배송지 관리 
									<span id="addrListInfo" class="tit_sub"> 배송지에 따라상품정보가 달라질 수 있습니다. </span>
								</h2>
								<div class="new_address">
									<button onclick="hi_zip();" target="_self">
										<img src="https://res.kurly.com/pc/ico/2006/ico_add_16x16.svg" alt="" class="ico"> 새 배송지 추가
									</button>
								</div>
							</div>

							<span class="destination_add screen_out"></span>

							<div id="tblParent" class="type_select">
								<table class="tbl tbl_type1"  >
									<thead>
										<tr>
											<th class="tit_select">선택</th>
											<th class="tit_address">주소</th>
											<th class="tit_receive">받으실 분</th>
											<th class="tit_phone">연락처</th>
											<th class="tit_delivery">배송유형</th>
											<th class="tit_modify">수정</th>
										</tr>
									</thead>
									<c:forEach var="list" items="${list }">
									<tbody id="addrList"> <!-- 저장된 주소지가 있는경우인데 처음 회원가입할 경우 주소를 입력하므로 주문 내역처럼 db가 없는 html은 따로 없다 -->
										<tr>
											<td class="select type_radio">
												<label class="skin_checkbox"> 
													<input type="radio" name="addrNo" data-delivery-type="direct" value="9622171" > 
													<span class="ico"  >
													
													</span> 
													<span class="screen_out">선택하기</span>
												</label>
											</td>
											
											<td class="address">
												<span class="badge_default"><c:set var="base" value="기본배송지"/>
													<c:if test="${list.address_default eq true }" >
													<c:out value="${base }"/>
													</c:if></span>
												<p class="addr">${list.user_address1 } &nbsp; ${list.user_address2 }</p>
											</td>
											<td >${list.user_name }</td>
											<td class="phone">${list.user_phone }</td>
											<td><span class="delivery star"></span></td>
											<td>
												<button type="button" class="ico modify" onclick="upDate(); return false;">수정하기</button>
											</td>
										</tr>
									</tbody>
									</c:forEach>
								</table>
							</div>
						</div> <!-- MainCenter 끝 -->

					</div> <!-- Main 끝 -->
				</div>
			</div>
		</div>
		<jsp:include page="../default/footer.jsp"></jsp:include><!-- footer부분 -->
	</div>
<script>

function hi_zip(){
	var myAddress;
	var myZipcode;
	var star;
	new daum.Postcode({
		oncomplete:function(data){
			myAddress=data.address;
			myZipcode=data.zonecode;
			$("#zip").val(myZipcode)
			$("#addr1").val(myAddress);
			$(".hid").attr("class",".addressShow");
			
	
			if(myAddress.includes("서울")){
				star="샛별배송";
			}else if(myAddress.includes("대전")){
				star="샛별배송";
			}else star="택배배송";
			popUp(myZipcode,myAddress,star);
			
		}
	}).open();
}
function popUp(myZipcode,myAddress,star){
	
	var url="destination_new.do?myZipcode="+myZipcode+"&myAddress="+myAddress+"&star="+star;
	window.open(url,'update','width=450,height=500,location=no,status=no,scrollbars=yes');
}
</script>
	<a href="#top" id="pageTop">맨 위로가기</a>


	<iframe name="ifrmHidden" id="ifrmHidden" src="about:blank" style="display: none; width: 100%; height: 600px;"></iframe>
</body>
</html>