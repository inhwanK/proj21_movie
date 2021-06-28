<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">	<!-- 파비콘 오류 메세지 해결 -->
	<meta charset="UTF-8">
	<title>예매</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/reserve/reserve.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
	<script type="text/javascript">
		$(function(){
			var week = ['일', '월', '화', '수', '목', '금', '토'];
			var today = new Date();
			
			var year = today.getFullYear();
			var month = today.getMonth() + 1;
			var date = today.getDate();
			var day = today.getDay();

			for (i = 0; i < 5; i++){
								
				var addDate = date + i;
				
				var today2 = new Date(year, month, addDate);
				var month2 = today2.getMonth();
				var date2 = today2.getDate();

				var dayOfWeek = week[(day + i) % 7]; 
				
				$("#calendar").append("<span><a href='' class='date'>"+ month2 + "월" + date2 + "일("+ dayOfWeek + ")</a></span>");
			}
		});
	
	</script>
<!-- 	<script type="text/javascript">
		$(function(){
			var contextPath = "${contextPath}";
			var no = ${param.no};
			
			$.ajax({
				type:"GET",
				url: contextPath + "/api/movies/boxOffice/" + no,
				contentType: "application/json; charset=utf-8",
				async: false,
				success: function(json){
					var poster = "";
						poster += "<input id='hidden-title' type='hidden' value='" + json.movTitle + "'/>";
						poster += "<img alt='' src='${contextPath}/resources/images/movie/box-office/" + json.movPoster + "'>";
					$("#movie-poster").append(poster);
					
					/* var pa = $("#movie-list-ul").parent();
					var ch = pa.children();
					var mTitle = ch.eq(0).text();
					
					var pTitle = $("#hidden-title").val();
					
					console.log(mTitle);
					console.log(pTitle); */
				},
				error : function(){
					alert("해당 영화는 없습니다.");
					window.location.href = contextPath + "/reserve";
					console.log("error > ");
				}	
			});
		});
	</script> -->
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
		<div id="containter">
		
			<h2>바로예매</h2>
			
			<div id="calendar" class="calendar">
			</div>
			
			<div id="reserve-table">
			<div id="movie-choice">
				<h3>영화</h3>
				<div id="movie-list">
					<ul id="movie-list-ul">
						<c:forEach items="${getMovieList }" var="mov">
							<li><a href="" class="movie"><c:out value="${mov.movTitle }"/>
							<input type="hidden" value="${mov.movNo }"/></a></li>
                     	</c:forEach>
					</ul>
				</div>
				<!-- 영화 포스터 - 영화에서 받아옴  -->
				<div id="movie-poster">
				</div>
				<!-- <p>
					영화를 선택해 주세요.
				</p> -->
				
			</div>
			
			<div id="theater-choice">
				<h3>극장</h3>
				<div id="theater-list">
					<ul>
						<c:forEach items="${getTheaterList }" var="tht">
							<li><a href="" class="theater"><c:out value="${tht.thtName }"/>
							<input type="hidden" value="${tht.thtNo }"/></a></li>
                     	</c:forEach>
					</ul>
				</div>	
				<div class="btntimediv">
					<button class="btntime">시간 확인하기</button>
				</div>
				<!-- <p>
					극장을 선택해 주세요.
				</p> -->	
			</div>
	
			<div id="time-choice">
				<h3>시간</h3>
				
				<div id="time-select">
					<div id="time-select-2D">123</div>
					<div id="time-select-3D">123</div>
					<div id="time-select-4D">12</div>
					<!-- <strong>크루엘라</strong>
					<br> <br>
					<span>10 : 00</span>
					<span>14 : 00</span>
					<span>20 : 00</span> -->
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
		var contextPath = "${contextPath}";
		var dateIdx = 0;
		var movieNo = 0;
		var theaterNo = 0;
		var time = "";
		var showInfoNo = 0;
		
		// 날짜 선택했을 시 효과 & 선택된 날짜 인덱스 리턴
		$("#calendar").on('click', 'a', function(e){
			e.preventDefault();
			
			$(this).toggleClass("active");
			$(this).parent().siblings().children().removeClass("active"); 
			
			/* alert($(this).text()); */
			
			var idx = $("#calendar span a").index(this);
			/* alert("날짜 인덱스 >> " + idx); */
			
			dateIdx = idx;
		});
		
		// 영화 선택 시 효과 & 영화 번호 리턴
		$("#movie-list").on('click', 'a', function(e){
			e.preventDefault();
			
			$(this).toggleClass("active");
			$(this).parent().siblings().children().removeClass("active"); 
			
			/* alert($(this).text()); */
			/* alert("movNo >> " + $(this).children().val()); */
			
			movieNo = $(this).children().val();
		});
		
		// 극장 선택 시 효과 & 극장 번호 리턴
		$("#theater-list").on('click', 'a', function(e){
			e.preventDefault();
			
			$(this).toggleClass("active");
			$(this).parent().siblings().children().removeClass("active"); 
			
			/* alert($(this).text()); */
			/* alert("thtNo >> " + $(this).children().val()); */
			
			theaterNo = $(this).children().val();
		});
		
		// 시간확인 버튼. 날짜, 영화, 극장으로 찾아서 상영시간을 출력
		$(document).on('click', '[class=btntime]', function(e){
			$("#time-select").empty();
			$("#time-select-2D").empty();
			$("#time-select-3D").empty();
			$("#time-select-4D").empty();
			/* alert("dateIdx >> " + dateIdx + "\nmovieNo >> " + movieNo + "\ntheaterNo >> " + theaterNo); */
			
 			var contextPath = "${contextPath}";
 			
 			var shwDate = date(dateIdx);
 			
 			$.ajax({
				type:"GET",
				url: contextPath + "/api/showinfobycondition/" + movieNo + "/" + theaterNo + "/" + shwDate,
				contentType: "application/json; charset=utf-8",
				async: false,
				success: function(json){
					var dataLength = json.length;
					if (dataLength >= 1) {
						var sCont = "";
						var cinemaNo = 1;
						for (i = 0; i < dataLength; i++) {
							if (json[i].cinNo.cinNo != cinemaNo) {
								sCont += "<br><br><br><br>";
								cinemaNo = json[i].cinNo.cinNo;
							}
							sCont += "<span class='time'>" + json[i].cinNo.cinType;
							sCont += json[i].shwStarttime;
							sCont += "</span>";
							sCont += "<input type='hidden' value='" + json[i].shwNo + "'/>";
						}
						sCont += "<br><br><br><button id='btn-seat' class='btn-seat'>좌석 선택</button>";
						$("#time-select:last-child").append(sCont);
					}
				}
			});
 			
			/* $.get(contextPath + "/api/showinfobycondition/" + movieNo + "/" + theaterNo + "/" + shwDate,
					function(json) {
						var dataLength = json.length;
						if (dataLength >= 1) {
							var sCont = "";
							for (i = 0; i < dataLength; i++) {
								var selTime = "";
								if (i % 3 == 0 && i != 0) {
									selTime += "<br><br><br><br>";									
								}
								selTime += "<span class='time'>";
								selTime += json[i].shwStarttime;
								selTime += "</span>";
								selTime += "<input type='hidden' value='" + json[i].shwNo + "'/>";
								$("#2D:last-child").append(selTime);
							}
							sCont += "<br><br><br><button id='btn-seat' class='btn-seat'>좌석 선택</button>";
							$("#time-select").append(selTime);
						}
					}); */
		});
		
		// 시간 선택 시 효과
		$(document).on('click', '[class=time]', function(e){
			e.preventDefault();
			
			$(this).addClass("active");
			$(this).siblings().removeClass("active"); 
			
			time = $(this).text();
			showInfoNo = $(this).next().val();
		});
		
		// 좌석 선택 버튼 기능
		$(document).on('click', '[class=btn-seat]', function(e){
			var shwDate = date(dateIdx);
			alert("shwDate >> " + shwDate + 
					"\nmovieNo >> " + movieNo + 
					"\ntheaterNo >> " + theaterNo +
					"\ntime >> " + time);
			
			window.location.href = contextPath + "/seat?no=" + showInfoNo;
		});
		
		// 인덱스를 넣으면 해당 인덱스만큼 +된 날짜를 계산하여 "yyyy-MM-dd" 형식으로 리턴해주는 함수 
		function date(idx){
			var today = new Date();
			
			var year = today.getFullYear();
			var month = today.getMonth() + 1;
			var date = today.getDate();
			
			var addDate = date + idx;
			
			var today2 = new Date(year, month, addDate);
			var year2 = today2.getFullYear();
			var month2 = today2.getMonth();
			var date2 = today2.getDate();
			
			if (month2 < 10) month2 = "0" + month2;
			if (date2 < 10) date2 = "0" + date2;
			
			return year2 + "-" + month2 + "-" + date2;
		}
	</script>
</body>
</html>