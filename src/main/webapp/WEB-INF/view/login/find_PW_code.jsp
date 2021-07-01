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
		<span style="color: green; font-weight: bold;">입력한 이메일로 받은 인증번호를 입력하세요. (인증번호가 맞아야 비밀번호를 변경하실 수 있습니다.)</span>
		<tr>
			<td>
				<form action="pass_injeung.do${dice},${e_mail}" method="post"></form>
				<div>인증번호 입력 : <input type="number" name="pass_injeung" placeholder="  인증번호를 입력하세요. "></div>
				<button type="submit" name="submit">인증번호 전송</button>
			</td>
		</tr>
	</table>
</body>
</html>
