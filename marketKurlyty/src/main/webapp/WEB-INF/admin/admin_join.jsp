<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../user/default/top.jsp"></jsp:include>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" /> -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/tstyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/tstyle2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/tstyle3.css">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script> 
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
.page_aticle {
    width: 1050px;
    margin: 70px auto;
    padding-left: 80px;
}
#form h2{
text-align: center;
}
.member_join .tbl_comm {
    width: 100%;
    border-top: 2px solid #fff;
}
</style>
</head>
<script>
function zip(){
	var myAddress;
	var myZipcode;
	new daum.Postcode({
		oncomplete:function(data){
			myAddress=data.address;
			myZipcode=data.zonecode;
			$("#zip").val(myZipcode)
			$("#addr1").val(myAddress);
			$(".hid").attr("class",".addressShow");
		}
	}).open();
}
function validateEmail(email){
	var emailReg = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
	return emailReg.test(email);
}
function formJoinSubmit(){

	if(document.frmAdmin.admin_id.value==""){
		alert("아이디를 입력하세요.");
		document.frmAdmin.admin_id.focus();
		return;
	}
	
	if(document.frmAdmin.chk_id.value=="불가능"){
		alert("중복된 아이디는 사용할 수 없습니다.");
		document.frmAdmin.user_id.focus();
		return;
	}

	if(document.frmAdmin.admin_pw.value==""){
		alert("비밀번호를 입력하세요.");
		document.frmAdmin.admin_pw.focus();
		return;
	}
	
	if(document.frmAdmin.admin_pw_check.value==""){
		alert("비밀번호 확인을 입력하세요.");
		document.frmAdmin.admin_pw_check.focus();
		return;
	}
	
	if(document.frmAdmin.admin_pw.value!=document.frmAdmin.admin_pw_check.value){
		alert("비밀번호를 다시 확인해 주세요.");
		document.frmAdmin.admin_pw_check.focus();
		return;
	}
	
	if(document.frmAdmin.admin_name.value==""){
		alert("이름을 입력하세요.");
		document.frmAdmin.admin_name.focus();
		return;
	}
	
	if(document.frmAdmin.admin_email.value==""){
		alert("이메일을 입력하세요.");
		document.frmAdmin.admin_email.focus();
		return;
	}
	
	if(!validateEmail(document.frmAdmin.admin_email.value)){
		alert("올바른 이메일을 입력해 주세요.");
		document.frmAdmin.admin_email.focus();
		return;
	}
	
	if(document.frmAdmin.admin_phone.value==""){
		alert("전화번호를 입력하세요.");
		document.frmAdmin.admin_phone.focus();
		return;
	}
	
	if(document.frmAdmin.admin_address1.value==""){
		alert("주소를 입력하세요.");
		document.frmAdmin.admin_address1.focus();
		return;
	}

	if(document.frmAdmin.admin_address2.value==""){
		alert("상세주소를 입력하세요.");
		document.frmAdmin.admin_address2.focus();
		return;
	}

	document.frmAdmin.submit();
}
function chkId(){
	var id = document.frmAdmin.admin_id.value;
	$.ajax({
		url:"idCheck.mdo?admin_id="+id,
		datatype:"json",
		success:function(res){
			const data = JSON.parse(res);
			alert(data.message);
			$("#posibleId").val(data.usedId);
		}
	})
}

</script>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="ben_index.jsp">Admin_kurlyty</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="검색"
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="#!">셋팅</a></li>
					<li><a class="dropdown-item" href="#!">활동로그</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="#!">로그아웃</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">
							Market관리
							</h3>
						</div>
						<a class="nav-link collapsed" href="" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 상품관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">상품조회/수정</a> <a
									class="nav-link" href="layout-sidenav-light.html">상품등록</a> <a
									class="nav-link" href="*">템플릿관리</a>
							</nav>
						</div>

						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts2" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 판매관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts2"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">상품통합관리</a> <a
									class="nav-link" href="layout-sidenav-light.html">취소관리</a> <a
									class="nav-link" href="*">환불관리</a>
							</nav>
						</div>

						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts3" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 정산관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts3"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="layout-static.html">정산내역</a> <a
									class="nav-link" href="layout-sidenav-light.html">주별정산</a> <a
									class="nav-link" href="*">월별정산</a>
							</nav>
						</div>

						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts4" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 카테고리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts4"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="*">상위 카테고리</a> <a class="nav-link"
									href="*">중위 카테고리</a> <a class="nav-link" href="*">하위 카테고리</a>
							</nav>
						</div>

						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts5" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 회원관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts5"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="*">회원관리</a> <a class="nav-link"
									href="*">회원등급 관리</a> <a class="nav-link" href="*">약관관리</a>
							</nav>
						</div>
						
						<a class="nav-link collapsed" href="join.mdo" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts10" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div>매니저관리</a>

						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts7" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 리뷰/문의관리
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts7"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="*">리뷰</a> <a class="nav-link" href="*">문의</a>
							</nav>
						</div>

						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts6" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 게시글
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts6"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="*">공지사항</a> <a class="nav-link"
									href="*">자주하는 질문</a> <a class="nav-link" href="*">1:1문의</a>
							</nav>
						</div>

					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					First Group
				</div>
			</nav>
		</div>
	</div>
		<!-- 바디바디바디바디바디바디바디바디바디바디바디바디바디바디바디바디바디바디바디바디바디바디바디 -->
		
	<div class="page_aticle">
		<div class="type_form member_join ">
			<form id="form" name="frmAdmin" method="post" action="joinProc.mdo" novalidate="">
					<h2>매니저 등록</h2>
				<table class="tbl_comm">
						<tr class="fst">
							<th>아이디</th>
							<td>
								<input type="text" name="admin_id" value="" maxlength="16" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
								<input id="posibleId" type="hidden" name="chk_id" value="불가능">
								<a class="btn default" href="javascript:chkId()">중복확인</a>
							</td>
						</tr>

						<tr>
							<th>비밀번호</th>
							<td>
								<input type="password" name="admin_pw" label="비밀번호" maxlength="16" class="reg_pw" placeholder="비밀번호를 입력해주세요">
							</td>
						</tr>

						<tr class="member_pwd">
							<th>비밀번호확인</th>
							<td>
								<input type="password" name="admin_pw_check" maxlength="16" class="confirm_pw" placeholder="비밀번호를 한번 더 입력해주세요">
							</td>
						</tr>

						<tr>
							<th>이름</th>
							<td>
								<input type="text" name="admin_name" value="" placeholder="이름을 입력해주세요">
							</td>
						</tr>

						<tr>
							<th>이메일</th>
							<td>
								<input type="text" name="admin_email" value="" data-email="" size="30" label="이메일" placeholder="">
							</td>
						</tr>
						
						<tr class="field_phone">
							<th>휴대폰</th>
							<td>
								<div class="phone_num">
									<input type="text" value="" pattern="[0-9]*" name="admin_phone" placeholder="숫자만 입력해주세요" class="inp">
								</div>
							</td>
						</tr>

					<tr class="fst">
						<th>주소</th>
						<td>
							<input id="addr1" type="text" name="admin_address1" value="" >
							<a class="btn default" href="javascript:zip()">주소검색</a><br><br>
							<input id="addr2" type="text" name="admin_address2" value="" placeholder="나머지 주소를 입력해주세요" >
							
						</td>
						
					</tr>
					<tr class="select_sex">
						<th>직급</th>
						<td>
							<label class="">
								<input type="radio" name="admin_position" value="master">
								<span class="ico"></span>Master
							</label>
							
							<label class="">
								<input type="radio" name="admin_position" value="senior" >
								<span class="ico"></span>Senior
							</label>
							
							<label class="checked">
								<input type="radio" name="admin_position" value="junior" checked="checked">
								<span class="ico"></span>Junior
							</label>
						</td>
					</tr>
				</table>
				<div id="formSubmit" class="form_footer">
					<button type="button" class="btn active btn_join" onclick="formJoinSubmit()">가입하기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>