<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원탈퇴</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/withdrawal.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet"> <!-- fontawesome 링크 -->
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
			
			<div id="mypage-wrap">
				<h2>회원탈퇴</h2>
				<div id="textarea">
					<i class="fas fa-square"></i>
					<h3>유의사항</h3>
					<p>사용하신 계정은 회원 탈퇴 후 복구가 불가합니다.</p>
					<p>탈퇴 후 회원정보가 모두 삭제됩니다.</p>
	 			 	<p>예매내역, 메일주소, 핸드폰 번호/기타 연락처 등 회원정보가 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</p>
 			 	</div>
 			 	
 			 	<div id="passwordarea">
 			 		<label>비밀번호</label>
 			 		<input type="password">
 			 		<br>
 			 		<label>비밀번호 확인</label>
 			 		<input type="password">
 			 	</div>
 			 	
 			 	<div id="button-group">
 			 		<span><a herf="#">취소</a></span>
					<span id="delete"><a herf="#">탈퇴</a></span>
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