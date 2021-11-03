<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<h1>유저 목록</h1>
<form method="post">
	<table border="1">
	<tr>
		<th>유저목록</th><th><input type="button" value="등록" span="10"></th>
	</tr>
		<tr>
			<th>아이디</th><th>비밀번호</th><th>이름</th><th>이메일</th><th>핸드폰번호</th><th>주소</th><th>상세주소</th><th>우편번호</th><th>성별</th><th>생년월일</th><th>수정/삭제</th>
		</tr>
		<tbody>
		<c:forEach var="userList" items="${userList }">
			<tr>
				<td>${userList.user_id }</td>
				<td>${userList.user_pw }</td>
				<td>${userList.user_name }</td>
				<td>${userList.user_email }</td>
				<td>${userList.user_phone }</td>
				<td>${userList.user_address1 }</td>
				<td>${userList.user_address2 }</td>
				<td>${userList.user_zipcode }</td>
				<td>${userList.user_sex }</td>
				<td>${userList.user_birth }</td>
				<td><input type="button" value="수정"><input type="button" value="삭제"></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</form>
</body>
</html>