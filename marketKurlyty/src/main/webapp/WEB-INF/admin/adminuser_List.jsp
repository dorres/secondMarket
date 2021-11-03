<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminuserList</title>
</head>
<body>
<h1>유저목록</h1>
<form method="post">
	<table border="1">
	<tr>
		<th>유저목록</th><th><input type="button" value="등록" align="right"/></th>
	</tr>
		<tr>
			<th>회원번호</th><th>아이디</th><th>이름</th><th>폰번</th><th>회원등급</th><th>마지막로그인</th>
			<th>포인트</th><th>총금액</th><th>상태</th><th>수정/삭제</th>
		</tr>
		<tbody>
		<c:forEach var="adminuserList" items="${adminuserList }">
			<tr>
				<td>${adminuserList.user_serial }</td>
				<td>${adminuserList.user_id }</td>
				<td>${adminuserList.user_name }</td>
				<td>${adminuserList.user_phone }</td>
				<td>${adminuserList.user_membership_name }</td>
				<td>${adminuserList.user_last_login }</td>
				<td>${adminuserList.user_point }</td>
				<td>${adminuserList.user_total_purchase }</td>
				<td>${adminuserList.user_status }</td>
				<td><input type="button" value="수정"><input type="button" value="삭제"></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</form>
</body>
</html>