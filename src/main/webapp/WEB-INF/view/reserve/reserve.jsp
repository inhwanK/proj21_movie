<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>바로예매</title>
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
							<li><a href="#"><c:out value="${mov.movTitle }"/></a></li>
                     	</c:forEach>
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
						<c:forEach items="${getTheaterList }" var="tht">
							<li><a href="#"><c:out value="${tht.thtName }"/></a></li>
                     	</c:forEach>
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
					<span>20 : 00</span>
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
		$(document).on('click', '[class=date]', function(e){
			e.preventDefault();
			var currentClass = $(this).attr("class");
			
			$(this).addClass("active");
			$(this).parent().siblings().children().removeClass("active"); 
			
			$("#movie-list").empty();
			alert($(this).text());
			
			/* var contextPath = "${contextPath}";
			var newShow = {shwDate: '2021-06-18'};
			
			$.ajax({
				url: contextPath + "/api/showinfobydate",
				type: "GET",
				contentType: "application/json; charset=utf-8",
				datatype: "json",
				cache: false,
				data: JSON.stringify(newShow),
				success: function(res) {
					alert(res);
					var dataLength = json.length;
					if (dataLength >= 1) {
						var sCont = "";
						for(i = 0; i < dataLength; i++) {
							sCont += "<li>";
							sCont += "<a href=''>";
							sCont += json[i].movNo.movTitle;
							sCont += "</a></li>";
						}
						$("#movie-list-ul:last-child").append(sCont);
					}
				}, 
				error: function(request, status, error){
					alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			}); */
			
		});
		
	</script>
</body>
</html>