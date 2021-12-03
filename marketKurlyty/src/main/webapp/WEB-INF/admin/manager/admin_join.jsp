<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Index</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
table.type02 {
  border-collapse: separate;
  border-spacing: 0;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 1px solid #ccc;
  margin : 20px 10px;
}
table.type02 th {
  width: 200px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  border-top: 1px solid #fff;
  border-left: 1px solid #fff;
  background: #eee;
}
table.type02 td {
  width: 400px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
table.type02 td >input{
	width: 100%;
	height: 100%;
	border: none;
	resize: none;
}
#inpupu{
	width: 100%;
	height: 100%;
	border: none;
	resize: none;
} 
textarea {
	width: 100%;
	height: 100%;
	border: none;
	resize: none;
}
textarea:focus, input:focus{
    outline: none;
} 
</style>
</head>

<body class="sb-nav-fixed">
<div id="layoutSidenav">
	<jsp:include page="../default/top.jsp"></jsp:include>
	<jsp:include page="../default/sideMenu.jsp"></jsp:include>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">


				<!-- 여기만 수정해서 사용하세요!! -->
				<h1 class="mt-4">매니저 관리</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item">관리자에서 매니저관리를 하는 페이지 입니다.</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						<div class="col three">
							<div style="font-size: 25px; color: #5f0080; font-weight: bold; ">
									매니저 등록
								</div>
						</div>
					</div>
					<div class="card-body">
						<form name="frmAdmin" action="joinProc.mdo" method="POST">
							<table class="type02">
									<tr>
										<th scope="row">아이디<input type="button" value="중복체크" onclick="javascript:chkId()" style="float: right;"></th>
										<td>
											<input id="posibleId" type="hidden" name="chk_id" label="아이디중복체크" value="불가능">
											<input type="text" name="admin_id" maxlength="16" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합">
										</td>
									</tr>
									
									<tr>
										<th scope="row">비밀번호</th>
										<td>
											<input type="password" name="admin_pw" maxlength="16" placeholder="비밀번호를 입력해주세요">
										</td>
									</tr>
									
									<tr class="member_pwd">
										<th>비밀번호확인</th>
										<td>
											<input type="password" name="admin_pw_check" maxlength="16"  placeholder="비밀번호를 한번 더 입력해주세요">
										</td>
									</tr>
									
									<tr>
										<th scope="row"> 이름</th>
										<td>
											<input type="text" name="admin_name" placeholder="이름을 입력해주세요">
										</td>
									</tr>
									
									<tr>
										<th scope="row">이메일</th>
										<td>
											<input type="text" name="admin_email" value="" data-email="" size="30" placeholder="">
										</td>
									</tr>
									
									<tr>
										<th scope="row">휴대폰</th>
										<td>
											<input type="text" pattern="[0-9]*" name="admin_phone" placeholder="숫자만 입력해주세요">
										</td>
									</tr>
									
									<tr>
										<th scope="row">매니저 직급</th>
										<td >
										<select id="admin_position" name="admin_position" style="width: 150px">
											<option value="master" >Master</option>
											<option value="senior" >Senior</option>
											<option value="junior" >Junior</option>
										</select>
										</td>
									</tr>
									
									<tr>
										<th scope="row">매니저 주소<input type="button" value="검색" onclick="javascript:zip()" style="float: right;"></th>
										<td>
											<input type="text" name="admin_address1" id="admin_address1" readonly="readonly"/>
										</td>
									</tr>
									
									<tr>
										<th scope="row">매니저 상세주소</th>
										<td><input type="text" name="admin_address2" id="admin_address2"/></td>
									</tr>									
								</table>
							<input type="button" onclick="formJoinSubmit()" value="등록하기" style="margin-left: 10px"/>
							<input type="button" value="목록보기" onclick="location.href='admin_adminList.mdo'"/>
						</form>
					</div>
				</div>
				<!-- 여기만 수정해서 사용하세요!! -->
			</div>
		</main>
		<jsp:include page="../default/footer.jsp"></jsp:include>
	</div>
	</div>
<script>
function zip(){
	var myAddress;
	var myZipcode;
	new daum.Postcode({
		oncomplete:function(data){
			myAddress=data.address;
			myZipcode=data.zonecode;
			$("#zip").val(myZipcode)
			$("#admin_address1").val(myAddress);
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
		document.frmAdmin.admin_id.focus();
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
	alert('등록하시겠습니까?');
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"> </script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>