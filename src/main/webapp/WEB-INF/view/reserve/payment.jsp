<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결제</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/reserve/payment.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script type="text/javascript">
		$(function(){
			$(".title").click(function() {
				$(this).addClass("active");
				$(this).siblings(".title").removeClass("active");
				
				$(this).siblings(".desc").stop().slideUp();
				$(this).next().stop().slideDown();
				
			})
		});
	</script>
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
		<h2>바로예매</h2>
			<div id="menubar">
				<ul>
					<li>인원 / 좌석</li>
					<li id="selected">결제</li>
					<li>결제완료</li>
				</ul>
			</div>

		<div id="container">
			<h2>할인 적용</h2>
			<div id="seat-result">
				<div id="accordian">
				<div class="title">박스무비 포인트 / 쿠폰</div>
					<div class="desc">
						<span><a href="#">포인트</a></span>
						<span><a href="#">쿠폰</a></span>
					</div>
				<div class="title">결제 수단 선택</div>
					<div class="desc">
						<span><a href="#">신용 / 체크카드</a></span>
						<span><a href="#">휴대폰 결제</a></span>
					</div>
				</div>
			</div>

			<div id="payment-result">
				<div id="movie-info">
					<dt>크루엘라</dt>
					<dd>영화시간 영화시간</dd>
					<dd>영화정보 영화정보</dd>
				</div>
				<div id="time-info">
					<dt>상영관</dt>
					<dd>대구이시아</dd>
					<dd>10:00 ~ 12:00</dd>
				</div>
				<div id="discount-info">
					<dt>할인 금액</dt>
					<dd>1,000 원</dd>
				</div>
				<div id="price-info">
					<dt>최종결제금액</dt>
					<dd>9,000 원</dd>
				</div>

				<div id="button-group">
					<span id="before">이전</span> <span id="next">결제</span>
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