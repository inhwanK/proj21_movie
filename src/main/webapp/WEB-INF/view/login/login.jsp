<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${contextPath}/resources/css/login/login.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

</head>
<body>
	<header>
		<a href="${contextPath}/main"> 
		<img id="header_ci" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png"></a>
		<div>
			<a href="${contextPath}/login">로그인</a> 
			<a href="${contextPath}/join">회원가입</a>
			<a href="#">바로예매</a>
		</div>

	</header>

	<nav>
		<ul>
			<li class="nav"><a href="${contextPath}/movielist">영화</a></li>
			<li class="nav"><a href="${contextPath}/reserve">예매</a></li>
			<li class="nav"><a href="${contextPath}/theaterlist">극장</a></li>
			<li class="nav"><a href="${contextPath}/inquiry">이벤트</a></li>
			<li class="nav"><a href="${contextPath}/noticelist">고객센터</a></li>
			<li id="mypagebtn"><a href="${contextPath}/mypage"><i class="far fa-user"></i></a></li>
		</ul>
	</nav>

	<section id="loginFormArea">
		<form action="login">
			<fieldset>
				<div class="fm_box">
					<table>
						<tr>
							<td>
								<div class="title"><h1>로그인</h1></div>
							</td>
						</tr>
						<tr>
							<td>
								<input class="form" type="text" name="id" id="memEmail" placeholder="아이디" required />
							</td>
						</tr>
						<tr>
							<td>
								<input class="form" type="password" name="passwd" id="memPasswd" placeholder="비밀번호" required />
							</td>
						</tr>
					</table>
						<label class="chbox"> 
						<input type="checkbox" name="chek_box" value="id_check" id="coki">아이디 저장</label> 
						<br> 
						<input class="bt" type="submit" value="로그인" id="selButton" /> 
						<br><br>
					<div class="text_h">
						<a href="#">ID/PW 찾기</a> | <a href="${contextPath}/join">회원가입</a>
					</div>
				</div>
			</fieldset>
		</form>
	</section>
	
	<footer>
		<div id="content">
			<img id="footer_ci" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png">
			<div id="textarea">
				<p>COPYRIGHT © BoxMovie, Inc. All rights reserved</p>
				<p>대구광역시 서구 서대구로 7길2 (내당동 245-4번지 2층) ARS 053-555-1333</p>
			</div>
		</div>
	</footer>
</body>
</html>