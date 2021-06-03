<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>좌석 선택</title>
	<link rel="stylesheet" href="css/seat.css">
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
			<h2>바로예매</h2>
			<div id="menubar">
				<ul>
					<li id="selected">인원 / 좌석</li>
					<li>결제</li>
					<li>결제완료</li>
				</ul>
			</div>

		<div id="container">
			<h2>관람 인원 선택</h2>
			<div id="count">
				<span>일반</span> <span><a href="#"> + </a><a href="#"> 0 </a><a href="#"> - </a></span> <span>청소년</span> <span><a href="#"> + </a><a href="#"> 0 </a><a href="#"> - </a></span> <span>우대</span> <span><a href="#"> + </a><a href="#"> 0 </a><a href="#"> - </a></span>
			</div>

			<div id="seat-choice">

				<div id="seat-area">
					<img alt="스크린 이미지" src="img/screen.png"> <br> <br>
					<c:forEach var="i" begin="1" end="50">
						<span>${i }</span>
						<c:if test="${i % 10 eq 0}">
							<br>
						</c:if>

						<c:if test="${i % 10 eq 3}">
							<span id="hiddenseat"></span>
						</c:if>

						<c:if test="${i % 10 eq 7}">
							<span id="hiddenseat"></span>
						</c:if>
					</c:forEach>

				</div>

				<div id="seat-info">
					<div id="movie-info">
						<dt>크루엘라</dt>
						<dd>영화시간 영화시간</dd>
						<dd>영화정보 영화정보</dd>
					</div>
					<div id="select-info">
						<dt>좌석번호</dt>
						<dd>14</dd>
					</div>
					<div id="price-info">
						<dt>최종결제금액</dt>
						<dd>10,000 원</dd>
					</div>
					
					<div id="button-group"> 
						<span id="before">이전</span>
						<span id="next">다음</span>
					</div>
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