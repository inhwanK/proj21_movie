<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/login.css">
</head>
<body>
	<header></header>

	<nav></nav>

	<section id="loginFormArea">
		<form action="login">
			<fieldset>
				<div class="fm_box">
					<table>
						<tr>
							<td><div class="title"><h1>로그인</h1></div></td>
						</tr>
						<tr>
							<td><input class="form" type="text" name="id" id="id" placeholder="아이디" /></td>
						</tr>
						<tr>
							<td><input class="form" type="password" name="passwd" id="passwd" placeholder="비밀번호" /></td>
						</tr>
					</table>
					<label class="chbox"><input type="checkbox" name="chek_box" value="id_coki">아이디 저장</label> 
						<br> 
					<input class="bt" type="submit" value="로그인" id="selectButton" /> 
						<br>
						<br>
					<div class="text_h">
						<a href="#">ID/PW 찾기</a> | <a href="#">회원가입</a> | <a href="#">비회원 조회</a>
					</div>
				</div>
			</fieldset>
		</form>
	</section>

	<footer></footer>
</body>
</html>