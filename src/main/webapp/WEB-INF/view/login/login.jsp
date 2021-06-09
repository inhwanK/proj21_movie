<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="css/login.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<header>
		<img id="header_ci" alt="" src="image/logow1_2.png">
		<ul>
			<li><a class="sub_menu" href="#">로그인</a></li>
			<li><a class="sub_menu" href="#">회원가입</a></li>
			<li><a class="sub_menu" href="#">바로예매</a></li>
		</ul>
	</header>
	<nav role="navigation">
		<ul id="main-menu">
			<li><a href="#">영화</a>
				<ul id="sub-menu">
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
				</ul>
			</li>
			<li><a href="#">예매</a>
				<ul id="sub-menu">
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
				</ul>
			</li>
			<li><a href="#">극장</a>
				<ul id="sub-menu">
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
				</ul>
			</li>
			<li><a href="#">고객센터</a></li>
		</ul>
	</nav>

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
						<a href="#">ID/PW 찾기</a> | <a href="#">회원가입</a>
					</div>
				</div>
			</fieldset>
		</form>
	</section>

	<footer>
		<div>
			<img id="footer_ci" alt="" src="image/logow1_2.png">
			<p>COPYRIGHT © MegaboxJoongAng, Inc. All rights reserved</p>
		</div>
	</footer>
</body>
</html>