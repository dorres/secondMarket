<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<h1>매니저 목록</h1>
<form method="post">
	<table border="1">
	<tr>
		<th>매니저목록</th><th><input type="button" value="등록" align="right"/></th>
	</tr>
		<tr>
			<th>아이디</th><th>이름</th><th>직급</th><th>수정/삭제</th>
		</tr>
		<tbody>
		<c:forEach var="adminmember" items="${adminmember }">
			<tr>
				<td>${adminmember.admin_id }</td>
				<td>${adminmember.admin_name }</td>
				<td>${adminmember.admin_position }</td>
				<td><input type="button" value="수정"><input type="button" value="삭제"></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</form>
</body>
</html>