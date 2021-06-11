<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정/탈퇴</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/checkpassword.css">
</head>
<body>
	<header>
		<img id="header_ci" alt="브랜드 로고" src="<%=request.getContextPath()%>/resources/images/ci.png">
		<div>
			<a href="#">로그인</a>
			<a href="#">회원가입</a>
			<a href="#">바로예매</a>
		</div>

	</header>
	
	<nav>
		<ul>
			<li class="nav"><a href="#">영화</a></li>
			<li class="nav"><a href="#">예매</a></li>
			<li class="nav"><a href="#">극장</a></li>
			<li class="nav"><a href="#">이벤트</a></li>
			<li class="nav"><a href="#">고객센터</a></li>
			<li id="mypagebtn"><a href="#"><i class="far fa-user"></i></a></li>
		</ul>
	</nav>
	
	
	<section>
		<div id="container">
			<div id="mypage-menubar">
			
				<ul>
					<li><a href="#"><h2>My Page</h2></a></li>
					<li><a href="#">예매내역</a></li>
					<li><a href="#">한줄평 내역</a></li>
					<li><a href="#">1대1 문의 내역</a></li>
					<li><a href="#">개인정보 수정</a></li>
					<li><a href="#">회원탈퇴</a></li>
				</ul>
			</div>
			
			<div id="myinfo-wrap">
				<div id="textarea">
					<h2>개인정보 수정</h2>
					<p>회원님의 개인정보 보호를 위해 비밀번호를 입력해야 합니다.</p>
					<p>박스무비 로그인 시 사용하는 비밀번호를 입력해주세요.</p>
				</div>
				
				<div id="input">
					<input type="password">
				</div>
				
				<div id="button-group">
					<span><a herf="#">취소</a></span>
					<span id="confirm"><a herf="#">확인</a></span>
				</div>
			</div>
		</div>
		
	</section>

	<footer>
		<div id="content">
			<img id="footer_ci" alt="브랜드 로고" src="<%=request.getContextPath()%>/resources/images/ci.png">
			<div id="textarea">
				<p>COPYRIGHT © BoxMovie, Inc. All rights reserved</p>
				<p>대구광역시 서구 서대구로 7길2 (내당동 245-4번지 2층) ARS 053-555-1333</p>
			</div>
		</div>
	</footer>
</body>
</html>