<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>쿠폰 발행</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>

<style type="text/css">
</style>

<script type="text/javascript">
$("#coupon_button").click(function(){
    var coupon_data = $("#coupon_data").serialize(); // 해당하는 frm을 serialize를 해줍니다. ajax로 데이터를 보내기위해서 하는 작업입니다.
     // id값은 기본키이자 바뀌면안되는것이고 id값으로 조건을 줄꺼라서 고유 id 값을 받아옵니다.
    $.ajax({
        type : "post", // post방식으로 전송
        url : "admin_couponpub.mdo", // controller로 보낼 url
        data : coupon_data, // data로는 위에서 se	rialize한 frm을 보냅니다.
        async : false, // 전역변수 사용을 위해서 설정해준다
         // serialize하면 json형태로 값을 보내줘야합니다.
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", // 인코딩 설정
        success : function(data){
        	alert("완료");
           window.opener.location.replace("admin_couponpub.mdo");
        },
        error:function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           }

    });
});
</script>
<body class="sb-nav-fixed">
	<div id="layoutSidenav">
		<jsp:include page="../default/top.jsp"></jsp:include>
		<jsp:include page="../default/sideMenu.jsp"></jsp:include>

		<!-- Main -->
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">

					<!-- 여기만 수정해서 사용하세요!! -->
					<h1 class="mt-4">쿠폰 발급</h1>
					<form id="coupon_data" name="coupon_data" method="post" action="admin_insertCoupon.mdo" novalidate="">
					</form>
					
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i>발행 쿠폰 목록
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th width="70">번호</th>
										<th width="250">쿠폰 이름</th>
										<th width="100">쿠폰 코드</th>
										<th width="100">만료일</th>
										<th width="100">할인금액</th>
										<th width="150">사용 최저금액</th>
										<th width="150">사용 최대할인</th>
										<th>비고</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>번호</th>
										<th>쿠폰 이름</th>
										<th>쿠폰 코드</th>
										<th>만료일</th>
										<th>할인금액</th>
										<th>사용 최저금액</th>
										<th>사용 최대할인</th>
										<th>비고</th>
									</tr>
								</tfoot>
								<tbody>
								<c:forEach var="coupon" items="${getcoupon }">
									<tr>
										<td><a onclick="textSubmit()">${coupon.coupon_serial }</a></td>
										<td><a onclick="textSubmit()">${coupon.coupon_name }</a></td>
										<td><a href="javascript:alert('클릭');">${coupon.coupon_code }</a></td>
										<td>${coupon.coupon_expiry }</td>
										<td>${coupon.coupon_discount_price }</td>
										<td>${coupon.coupon_min_use }</td>
										<td>${coupon.coupon_max_bargain }</td>
										<td>${coupon.coupon_note }</td>
									</tr>
									</c:forEach>
									<input type="button" value="닫기" href="#" onclick="closeLayer('layerPop')"class="close"/>
								</tbody>
							</table>
						</div>
					</div>
					<div>
					<input type="button" name="" value="쿠폰 삭제"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" onclick="openLayer('layerPop',100,200)" name="" value="쿠폰 발급"/>
					</div>
					<!-- 레이어 팝업 -->
					<div id="layerPop">
			<jsp:include page="../coupon/admin_couponpop.jsp"></jsp:include>
	</div>
					<!-- 레이어 팝업 -->
					<!-- 여기만 수정해서 사용하세요!! -->
				</div>
			</main>
			<jsp:include page="../default/footer.jsp"></jsp:include>
		</div>
	</div>
	<!-- Main -->

	<!-- 건들지마세요 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath }/resources/js/datatables-simple-demo.js"></script>
	<!-- 건들지마세요 -->
</body>
</html>