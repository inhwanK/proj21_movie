<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="300" height="300" align="center">
	<span style="color: green; font-weight: bold;">변경할 비밀번호를 입력해주세요.</span>
	<tr>
		<td>
			<form action="pass_change.do${e_mail}" method="post"></form>
			<div>변경할 비밀번호 입력 : <input type="number" name="member_pass"	placeholder="비밀번호를 입력하세요."></div>
			<button type="submit" name="submit">비밀번호 변경</button>
		</td>
	</tr>
</table>
</body>
</html>
