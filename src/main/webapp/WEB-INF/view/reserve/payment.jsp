<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결제</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/reserve/payment.css">
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
		<img id="header_ci" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png">
		<div>
			<a href="#">로그인</a>
			<a href="#">회원가입</a>
			<a href="#">바로예매</a>
		</div>

	</header>
	
	<nav>
		<ul>
			<li class="nav"><a href="${contextPath}/movielist">영화</a></li>
			<li class="nav"><a href="${contextPath}/reserve">예매</a></li>
			<li class="nav"><a href="${contextPath}/theaterlist">극장</a></li>
			<li class="nav"><a href="#">이벤트</a></li>
			<li class="nav"><a href="${contextPath}/noticelist">고객센터</a></li>
			<li id="mypagebtn"><a href="${contextPath}/mypage"><i class="far fa-user"></i></a></li>
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
			<h2 id="title">할인 적용</h2>
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
					<dl>
						<dt id="mov-title"></dt>
						<dd id="mov-date"></dd>
						<dd id="mov-time"></dd>
						<dd id="mov-type"></dd>
					</dl>
				</div>
				<div id="time-info">
					<dl>
						<dt>상영관</dt>
						<dd id="cinema"></dd>
						<dd></dd>
					</dl>
				</div>
				<!-- <div id="discount-info">
					<dl>
						<dt>할인 금액</dt>
						<dd>1,000 원</dd>
					</dl>
				</div> -->
				<div id="price-info">
					<dl>
						<dt>최종결제금액</dt>
						<dd><span id="price"></span> 원</dd>
					</dl>
				</div>

				<div id="button-group">
					<span id="before">이전</span> <span id="next">결제</span>
				</div>
			</div>
		</div>
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
	
	<script type="text/javascript">
		$(function(){
			var contextPath = "${contextPath}";
			var showNo = ${param.shwNo};
			var reservingNo = ${param.reservingNo};
			var seat = "";
			
			$.ajax({
				type:"GET",
				url: contextPath + "/api/showinfo/" + showNo,
				contentType: "application/json; charset=utf-8",
				async: false,
				success: function(json){
					$("#mov-title").text(json.movNo.movTitle);			
					$("#mov-date").text("상영일 : " + json.shwDate);
					$("#mov-time").text("상영시간 : " + json.shwStarttime);
					$("#mov-type").text("상영타입 : " + json.cinNo.cinType);
					$("#cinema").text(json.thtNo.thtName);
				}
			});
			
			$.ajax({
				type:"GET",
				url: contextPath + "/api/reserving/" + reservingNo,
				contentType: "application/json; charset=utf-8",
				async: false,
				success: function(json) {
					$("#price").text(json.ingPrice);
					seat = json.ingSeat;
				}
			});
			
			var arrSeat = seat.split(" ");	// 공백 기준으로 나눠서 배열화
			arrSeat.pop();	// 마지막 공백 제거
			
			var row = [];
			var col = [];
			
			for (i = 0; i < arrSeat.length; i++) {
				row.push(arrSeat[i].charAt(0).charCodeAt(0)-64);
				col.push(Number(arrSeat[i].charAt(1)));
			}
			console.log(row);
			console.log(col);
		});
	</script>
</body>
</html>