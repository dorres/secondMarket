<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Index</title>
<%-- <jsp:include page="../user/default/top.jsp"></jsp:include> --%>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/style/admin/styles.css"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
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
  width: 350px;
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
		alert("???????????? ???????????????.");
		document.frmAdmin.admin_id.focus();
		return;
	}
	
	if(document.frmAdmin.chk_id.value=="?????????"){
		alert("????????? ???????????? ????????? ??? ????????????.");
		document.frmAdmin.user_id.focus();
		return;
	}

	if(document.frmAdmin.admin_pw.value==""){
		alert("??????????????? ???????????????.");
		document.frmAdmin.admin_pw.focus();
		return;
	}
	
	if(document.frmAdmin.admin_pw_check.value==""){
		alert("???????????? ????????? ???????????????.");
		document.frmAdmin.admin_pw_check.focus();
		return;
	}
	
	if(document.frmAdmin.admin_pw.value!=document.frmAdmin.admin_pw_check.value){
		alert("??????????????? ?????? ????????? ?????????.");
		document.frmAdmin.admin_pw_check.focus();
		return;
	}
	
	if(document.frmAdmin.admin_name.value==""){
		alert("????????? ???????????????.");
		document.frmAdmin.admin_name.focus();
		return;
	}
	
	if(document.frmAdmin.admin_email.value==""){
		alert("???????????? ???????????????.");
		document.frmAdmin.admin_email.focus();
		return;
	}
	
	if(!validateEmail(document.frmAdmin.admin_email.value)){
		alert("????????? ???????????? ????????? ?????????.");
		document.frmAdmin.admin_email.focus();
		return;
	}
	
	if(document.frmAdmin.admin_phone.value==""){
		alert("??????????????? ???????????????.");
		document.frmAdmin.admin_phone.focus();
		return;
	}
	
	if(document.frmAdmin.admin_address1.value==""){
		alert("????????? ???????????????.");
		document.frmAdmin.admin_address1.focus();
		return;
	}

	if(document.frmAdmin.admin_address2.value==""){
		alert("??????????????? ???????????????.");
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
<%-- <div id="layoutSidenav">
	<jsp:include page="default/top.jsp"></jsp:include>
	<jsp:include page="default/sideMenu.jsp"></jsp:include> --%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">

				<div class="page_aticle">
					<div class="type_form member_join ">
						<form id="form" name="frmAdmin" method="post" action="updateUser.mdo">
							<br>
							<br>
							<h2 align="center">?????? ??????</h2>
							<table class="tbl_comm">
								<tr class="type02">
								<tr>
									<th scope="row">?????????</th>
									<td><input type="text" name="user_id" readonly="readonly" value="${getUser.user_id}"></td>  
								</tr>
															
								<tr>
									<th scope="row">??????</th>
									<td><input type="text" name="user_name" readonly="readonly" value="${getUser.user_name}"></td>
								</tr>
								
								<tr>
									<th scope="row">????????????</th>
									<td><input type="text" name="user_phone" readonly="readonly" value="${getUser.user_phone }"></td>
								</tr>

								<tr>
									<th scope="row">????????????</th>
									<td><input type="text" name="user_membersip_name" readonly="readonly" value="${getUser.user_membership_name }"></td>
								</tr>
								
								<tr>
									<th scope="row">??????</th>
									<td><input type="text" name="user_status" placeholder="????????? ?????? ????????????."></td>
								</tr>
							</table>
							<div id="formSubmit" class="form_footer">
								<input type="submit" class="btn active btn_join" value="????????????"/>
							</div>
						</form>
					</div>
				</div>
			</div>
		</main>
<%-- 		<jsp:include page="default/footer.jsp"></jsp:include> --%>
	</div>
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