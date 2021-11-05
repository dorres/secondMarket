<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Index</title>
<jsp:include page="../user/default/top.jsp"></jsp:include>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
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
	<jsp:include page="default/top.jsp"></jsp:include>
	<jsp:include page="default/sideMenu.jsp"></jsp:include>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<div class="page_aticle">
					<div class="type_form member_join ">
						<form id="form" name="frmAdmin" method="post" action="updateProc.mdo">
							<br>
							<br>
							<h2 align="center">매니저 수정</h2>
							<table class="tbl_comm">
								<tr class="fst">
								<tr>
									<th>아이디</th>
									<td><input type="text" name="admin_id" value="${update.admin_id}"></td>  
								</tr>
															
								<tr>
									<th>이름</th>
									<td>${update.admin_name}</td>
								</tr>

								<tr>
									<th>직급</th>
									<td><input type="text" name="admin_position" placeholder="직급을 수정 해주세요."></td>
								</tr>

								
							</table>
							<div id="formSubmit" class="form_footer">
								<button class="btn active btn_join" onclick="location.href='updateProc.mdo'">수정하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</main>
		<jsp:include page="default/footer.jsp"></jsp:include>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"> </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>