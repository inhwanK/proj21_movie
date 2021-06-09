<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<link rel="stylesheet" href="css/mypage.css">
</head>
<body>

	<header>
		<img id="header_ci" alt="브랜드 로고" src="img/ci.png">
		<div>
			<a href="#">로그인</a>
			<a href="#">회원가입</a>
			<a href="#">바로예매</a>
		</div>

	</header>
	
	<nav>
		<ul>
			<li><a href="#">영화</a></li>
			<li><a href="#">예매</a></li>
			<li><a href="#">극장</a></li>
			<li><a href="#">이벤트</a></li>
			<li><a href="#">고객센터</a></li>
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
			
				<div id="user-info">
					<div id="profile">
						<img alt="프로필사진" src="img/profile-photo.png">
						<div id="textbox">
							<p id="user">user님,</p>
							<p id="welcome">환영합니다.</p>
						</div>
					</div>
					
					<a href="#">개인정보 수정</a>
				</div>
				
				<div id="reserve-history">
					<h2>예매내역</h2>
					<ul id="reserve-list">
						<li>예매 내역이 없습니다.</li>
					</ul>
				</div>

				<div id="qna-history">
					<h2>문의내역</h2>
					<ul id="qna-list">
						<li>예매 내역이 없습니다.</li>
					</ul>
				</div>
			</div>
		</div>
		
	</section>

	<footer>
		<div>
			<img id="footer_ci" alt="브랜드 로고" src="img/ci.png">
			<p>
			제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다.
			<br>
			재판의 전심절차로서 행정심판을 할 수 있다. 행정심판의 절차는 법률로 정하되, 사법절차가 준용되어야 한다.
			</p>
		</div>
	</footer>
	
	
</body>
</html>