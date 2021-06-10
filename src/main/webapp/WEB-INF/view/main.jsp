<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>메인화면</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
</head>
<body>
	<header>
		<img id="header_ci" alt="브랜드 로고" src="<%=request.getContextPath()%>/resources/images/ci_bw.png">
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
	<div id="slide">
		<ul>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	
	<div class="contentsBox">
			<div class="boxoffice">
				<h1>BOX OFFICE</h1>
			</div>
			
			<div class="main-movie-list">
				<ul>
					<li>
						<img src="https://img.megabox.co.kr/SharedImg/2021/05/12/J7vthd2FWEXswHD67dL2rQrMW4uhJQUF_420.jpg">
						<div class="reserve-boxoffice">
								<a href="#">예매</a>
						</div>
					</li>
					<li>
						<img src="https://img.megabox.co.kr/SharedImg/2021/04/20/Pg9xMYRfMNouXwkqG2PeOGGqyUaQ9skl_420.jpg">
						<div class="reserve-boxoffice">
								<a href="#">예매</a>
						</div>
					</li>
					<li>
						<img src="https://img.megabox.co.kr/SharedImg/2021/05/24/OPZRLPUEwlEliCfy6Li4gfhUFCJ52AE1_420.jpg">
						<div class="reserve-boxoffice">
								<a href="#">예매</a>
						</div>
					</li>
				</ul>
			</div>
			
			<div class="search">
				<ul>
					<li id="search-box">
						<input type="text" placeholder="영화제목" style="color:white">
					</li>
					<li><i class="far fa-calendar-alt"></i><a href="#"><h2>상영시간표</h2></a></li>
					<li><i class="fas fa-film"></i><a href="#"><h2>박스오피스</h2></a></li>
					<li><i class="fas fa-ticket-alt"></i><a href="#"><h2>바로예매</h2></a></li>
				</ul>
			</div>
		</div>
	
	
	</section>
	
	<footer>
		<div id="content">
			<img id="footer_ci" alt="브랜드 로고" src="<%=request.getContextPath()%>/resources/images/ci_bw.png">
			<div id="textarea">
				<p>COPYRIGHT © BoxMovie, Inc. All rights reserved</p>
				<p>대구광역시 서구 서대구로 7길2 (내당동 245-4번지 2층) ARS 053-555-1333</p>
			</div>
		</div>
	</footer>
	
	
</body>
</html>