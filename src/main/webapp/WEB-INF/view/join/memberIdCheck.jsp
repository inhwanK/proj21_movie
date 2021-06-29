<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복검사</title>
</head>
<body>
	<h1>아이디 중복 검사</h1>
	<h5>${alert }</h5>
		<form action="memberIdCheck" method="post">
			메일 : <input type="email" name="memEmail" id="memEmail">
			<button type="submit">check</button>
		</form>
</body>
</html>