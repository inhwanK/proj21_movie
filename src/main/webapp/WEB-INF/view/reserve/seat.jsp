<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>좌석 선택</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/reserve/seat.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
	<script type="text/javascript">
		$(function(){
			var contextPath = "${contextPath}";
			var no = ${param.no};
			var row = 0;
			var col = 0;
			
			$.ajax({
				type:"GET",
				url: contextPath + "/api/showinfo/" + no,
				contentType: "application/json; charset=utf-8",
				async: false,
				success: function(json){
					$("#mov-title").text(json.movNo.movTitle);			
					$("#mov-date").text("상영일 : " + json.shwDate);
					$("#mov-time").text("상영시간 : " + json.shwStarttime);
					$("#priceAdult").val(json.cinNo.cinAdultPrice);
					$("#priceTeen").val(json.cinNo.cinTeenPrice);
					$("#pricePref").val(json.cinNo.cinPrefPrice);
					row = json.cinNo.cinRow;
					col = json.cinNo.cinCol;
				}
			});
			
			console.log("row >> " + row + ", col >> " + col);
		});
		
		
	</script>
</head>
<body>
	<header>
		<a href="main" title="박스무비 메인으로 가기">
			<img id="header_ci" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png">
		</a>
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
					<li id="selected">인원 / 좌석</li>
					<li>결제</li>
					<li>결제완료</li>
				</ul>
			</div>

		<div id="container">
			<h2 id="title">관람 인원 선택</h2>
			<div id="count">
				<span>일반</span>
				<span>
					<a href="#" class="countMinus"><i class="fas fa-chevron-left"></i></a>
					<label id="countAdult">0</label> 
					<a href="#" class="countPlus"><i class="fas fa-chevron-right"></i></a>
					<input type="hidden" id="priceAdult" value="0">
				</span>
				<span>청소년</span>
				<span>
					<a href="#" class="countMinus"><i class="fas fa-chevron-left"></i></a>
					<label id="countTeen">0</label>
					<a href="#" class="countPlus"><i class="fas fa-chevron-right"></i></a>
					<input type="hidden" id="priceTeen" value="0">
				</span>
				<span>우대</span>
				<span>
					<a href="#" class="countMinus"><i class="fas fa-chevron-left"></i></a>
					<label id="countPref">0</label>
					<a href="#" class="countPlus"><i class="fas fa-chevron-right"></i></a>
					<input type="hidden" id="pricePref" value="0">
				</span>
			</div>

			<div id="seat-choice">

				<div id="seat-area">
					<img alt="스크린 이미지" src="${contextPath}/resources/images/screen.png"> <br> <br>
					<c:forEach var="row" begin="1" end="5">
					
						<!-- 하드코딩 ... 무조건 수정 필요함. -->
						<c:if test="${row eq 1 }">
							A 
						</c:if>
						<c:if test="${row eq 2 }">
							B 
						</c:if>
						<c:if test="${row eq 3 }">
							C 
						</c:if>
						<c:if test="${row eq 4 }">
							D 
						</c:if>
						<c:if test="${row eq 5 }">
							E 
						</c:if>
						<c:forEach var="i" begin="1" end="10">
						
							<span class="select-seat">${i }</span>
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
					</c:forEach>
				</div>

				<div id="seat-info">
					<div id="movie-info">
						<dl>
							<dt id="mov-title"></dt>
							<dd id="mov-date"></dd>
							<dd id="mov-time"></dd>
						</dl>
					</div>
					<div id="select-info">
						<dl>
							<dt>좌석번호</dt>
							<dd></dd>
						</dl>
					</div>
					<div id="price-info">
						<dl>
							<dt>결제금액</dt>
							<dd><span id="price">0</span> 원</dd>
						</dl>
					</div>
					
					<div id="button-group"> 
						<!-- <span id="before">이전</span> -->
						<span id="next">다음</span>
					</div>
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
		// 인원 수 늘리기
		$(document).on('click', '[class=countPlus]', function(e){
			e.preventDefault();
			
			var cnt = Number($(this).prev().text());
			var price = Number($(this).next().val());
			var resPrice = Number($("#price").text());
			
			if (cnt < 5) {
				$(this).prev().text(cnt+1);
				$("#price").text(price + resPrice);
			}
		});
		
		// 인원 수 줄이기
		$(document).on('click', '[class=countMinus]', function(e){
			e.preventDefault();
			
			var cnt = Number($(this).next().text());
			var price = Number($(this).next().next().next().val());
			var resPrice = Number($("#price").text());

			if (cnt > 0) {
				$(this).next().text(cnt-1);
				$("#price").text(resPrice - price);
			}
		});
		
		// 좌석 선택
		$("#seat-area").on('click', 'span', function(e){
			var cntAdult = Number($("#countAdult").text());
			var cntTeen = Number($("#countTeen").text());
			var cntPref = Number($("#countPref").text());
			var cntTotal = cntAdult + cntTeen + cntPref; // 선택한 인원 총합
			
			var activeLength = $(".select-seat.active").length; // 선택된 좌석 개수
			
			/* alert("cntTotal >> " + cntTotal + "\nactiveLength >> " + activeLength); */
			
			if (cntTotal <= activeLength) {
				if ($(this).hasClass("active")){
					$(this).removeClass("active");
				} else {
					alert("관람인원을 확인하세요.");
				}
			} else {
				$(this).toggleClass("active");
			}
		});
	</script>
</body>
</html>