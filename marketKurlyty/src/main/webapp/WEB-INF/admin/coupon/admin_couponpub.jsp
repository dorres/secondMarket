<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>쿠폰 발행</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/style/admin/styles.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
</head>
<script type="text/javascript">
function RandomCode(){ // 쿠폰번호 자동 생성
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    for( var i=0; i < 8; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    document.getElementById("coupon_code").value = text;
}

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

function couponpubSubmit(){
if(document.coupon_data.coupon_name.value==""){
	alert("쿠폰 이름을 입력하세요.");
	document.coupon_data.coupon_name.focus();
	return;
	}
if(document.coupon_data.coupon_code.value==""){
	alert("쿠폰 코드를 입력하세요.");
	document.coupon_data.coupon_code.focus();
	return;
	}
if(document.coupon_data.coupon_expiry.value==""){
	alert("쿠폰 사용기간을 입력하세요.");
	document.coupon_data.coupon_expiry.focus();
	return;
	}
if(document.coupon_data.coupon_discount_price.value==""){
	alert("쿠폰 할인금액을 입력하세요.");
	document.coupon_data.coupon_discount_price.focus();
	return;
	}
if(document.coupon_data.coupon_min_use.value==""){
	alert("쿠폰사용 제한금액을 입력하세요.");
	document.coupon_data.coupon_min_use.focus();
	return;
	}
if(document.coupon_data.coupon_max_bargain.value==""){
	alert("쿠폰할인 제한금액을 입력하세요.");
	document.coupon_data.coupon_max_bargain.focus();
	return;
	}
if(document.coupon_data.coupon_note.value==""){
	alert("쿠폰 설명(비고)을 입력하세요.");
	document.coupon_data.coupon_note.focus();
	return;
	}
document.coupon_data.submit();
}

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
					<h1 class="mt-4">쿠폰 발행</h1>
					<form id="coupon_data" name="coupon_data" method="post" action="admin_insertCoupon.mdo" novalidate="">
					<div class="card mb-4">
					<table class="tbl_comm">
												<tbody>
													<tr class="fst">
														<th>쿠폰 이름<input type="text" value="" class="coupon_name" id="coupon_name" name="coupon_name" placeholder="Coupon name">
														<th>쿠폰 코드　<input type="button" value="랜덤 번호" class="" onclick="RandomCode()" style="width:70px;height:20px;font-size:12px;"><input type="text" value="" class="coupon_code" id="coupon_code" name="coupon_code" placeholder="Coupon code">
														<th>쿠폰 사용기간<input type="text" value="" class="coupon_expiry" id="coupon_expiry" name="coupon_expiry" placeholder="1 = 1일" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
														<th>쿠폰할인 금액<input type="text" value="" class="coupon_discount_price" id="coupon_discount_price" name="coupon_discount_price" placeholder="쿠폰 할인 금액" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
														<th>쿠폰사용 제한금액<input type="text" value="" class="coupon_min_use" id="coupon_min_use" name="coupon_min_use" placeholder="최소 사용 금액" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
														<th>쿠폰할인 제한금액<input type="text" value="" class="coupon_max_bargain" id="coupon_max_bargain" name="coupon_max_bargain" placeholder="최대 할인 금액" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
														<th>쿠폰 설명(비고)<input type="text" value="" class="coupon_note" id="coupon_note" name="coupon_note" placeholder="Coupon note" size=50>
														<th>　<input type="button" value="쿠폰 발행" id="coupon_button" onclick="couponpubSubmit()" style=width:70px;height:30px;font-size:13px>
														</tr>
												</tbody>
											</table>
					</div>
					</form>
					<div class="card mb-4">
						<div class="card-header">
							<i class="fas fa-table me-1"></i>발행 쿠폰 목록
						</div>
						<div class="card-body">
							<table id="datatablesSimple">
								<thead>
									<tr>
										<th>번호</th>
										<th>쿠폰 이름</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>Name</th>
										<th>Position</th>
										<th>Office</th>
										<th>Age</th>
										<th>Start date</th>
										<th>Salary</th>
									</tr>
								</tfoot>
								<tbody>
									<tr>
										<td>Michael Bruce</td>
										<td>Javascript Developer</td>
										<td>Singapore</td>
										<td>29</td>
										<td>2011/06/27</td>
										<td>$183,000</td>
									</tr>
									<tr>
										<td>Donna Snider</td>
										<td>Customer Support</td>
										<td>New York</td>
										<td>27</td>
										<td>2011/01/25</td>
										<td>$112,000</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
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