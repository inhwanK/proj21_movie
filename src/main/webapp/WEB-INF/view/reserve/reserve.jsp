<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>바로예매</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reserve/reserve.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
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
		<div id="containter">
			<h2>바로예매</h2>
			<div id="calendar">
				<span><a href="#">6 / 1</a></span>
				<span><a href="#">6 / 2</a></span>
				<span><a href="#">6 / 3</a></span>
				<span><a href="#">6 / 4</a></span>
				<span><a href="#">6 / 5</a></span>
				<span><a href="#">6 / 6</a></span>
				<span><a href="#">6 / 7</a></span>
			</div>
			<div id="reserve-table">
			<div id="movie-choice">
				<h3>영화</h3>
				<div id="movie-list">
					<ul>
						<li><a href="#">크루엘라</a></li>
						<li><a href="#">캐시트럭</a></li>
						<li><a href="#">미스피츠</a></li>
						<li><a href="#">극장판 귀멸의 칼날:무한열차편</a></li>
						<li><a href="#">컨져링3:악마가 시켰다</a></li>
						<li><a href="#">분노의 질주: 더 얼티메이트</a></li>
						<li><a href="#">파이프라인</a></li>
						<li><a href="#">크루엘라</a></li>
						<li><a href="#">캐시트럭</a></li>
						<li><a href="#">미스피츠</a></li>
						<li><a href="#">극장판 귀멸의 칼날:무한열차편</a></li>
						<li><a href="#">컨져링3:악마가 시켰다</a></li>
						<li><a href="#">분노의 질주: 더 얼티메이트</a></li>
						<li><a href="#">파이프라인</a></li><li><a href="#">크루엘라</a></li>
						<li><a href="#">캐시트럭</a></li>
						<li><a href="#">미스피츠</a></li>
						<li><a href="#">극장판 귀멸의 칼날:무한열차편</a></li>
						<li><a href="#">컨져링3:악마가 시켰다</a></li>
						<li><a href="#">분노의 질주: 더 얼티메이트</a></li>
						<li><a href="#">파이프라인</a></li>
					</ul>
				</div>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
					Etiam hendrerit magna sit amet neque mattis porta. Nulla congue, 
					
				</p>
				
			</div>
			
			<div id="theater-choice">
				<h3>극장</h3>
				<div id="theater-list">
					<ul>
						<li><a href="#">대구(칠성로)</a></li>
						<li><a href="#">대구신세계(동대구)</a></li>
						<li><a href="#">대구이시아</a></li>
					</ul>
				</div>	
				<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
					Etiam hendrerit magna sit amet neque mattis porta. Nulla congue, 
				</p>	
			</div>
	
			<div id="time-choice">
				<h3>시간</h3>
				<div id="time-select">
					<strong>크루엘라</strong>
					<br> <br>
					<span>10 : 00</span>
					<span>14 : 00</span>
					<span>20: 00</span>
				</div>
	
				<div id="time-select">
					<strong>캐시트럭</strong>
					<br> <br>
					<span>10 : 00</span>
					<span>14 : 00</span>
					<span>20: 00</span>
				</div>
				
			</div>
			</div>
		</div>
	</section>
	
	<footer>
		<div id="content">
			<img id="footer_ci" alt="브랜드 로고" src="img/ci.png">
			<div id="textarea">
				<p>COPYRIGHT © BoxMovie, Inc. All rights reserved</p>
				<p>대구광역시 서구 서대구로 7길2 (내당동 245-4번지 2층) ARS 053-555-1333</p>
			</div>
		</div>
	</footer>
</body>
</html>