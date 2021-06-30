<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
<link rel="stylesheet" href="${contextPath}/resources/css/reserve/resultpay.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
</head>
<body>
	<%-- <header>
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
	</nav> --%>
	
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<section>
		<h2 id="menu-title">바로예매</h2>
			<div id="menubar">
				<ul>
					<li>인원 / 좌석</li>
					<li>결제</li>
					<li id="selected">결제완료</li>
				</ul>
			</div>

		<div id="container">
			<h2 id="title">결제 완료</h2>
			<h1>예매가 완료되었습니다.</h1>
			<div id="table-div">
				<table id="result-table">
					<tr>
						<td class="info">영화명</td>
						<td class="result" id="mov-title"></td>
					</tr>
					<tr>
						<td class="info">영화관</td>
						<td class="result" id="theater-name"></td>
					</tr>
					<tr>
						<td class="info">관람일시</td>
						<td class="result" id="show-date"></td>
					</tr>
					<tr>
						<td class="info">관람인원</td>
						<td class="result" id="people"></td>
					</tr>
					<tr>
						<td class="info">선택좌석</td>
						<td class="result" id="seat"></td>
					</tr>
					<tr>
						<td class="info">결제금액</td>
						<td class="result" id="pay"></td>
					</tr>
					<tr>
						<td class="info">예매일</td>
						<td class="result" id="res-date"></td>
					</tr>
					<tr>
						<td colspan="2" class="main-link"><a id="to-main" class="to-main" href="${contextPath }/main">[메인화면으로]</a></td>
					</tr>
				</table>
			</div>
		</div>
	</section>
	
	<%-- <footer>
		<div id="content">
			<img id="footer_ci" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png">
			<div id="textarea">
				<p>COPYRIGHT © BoxMovie, Inc. All rights reserved</p>
				<p>대구광역시 서구 서대구로 7길2 (내당동 245-4번지 2층) ARS 053-555-1333</p>
			</div>
		</div>
	</footer> --%>
	
	<%@include file="/WEB-INF/view/footer.jsp"%>
	
	<script type="text/javascript">
		$(function(){
			var contextPath = "${contextPath}";
			var no = ${param.resNo};
			
			if (${member != null}) {
				console.log("회원번호" + ${member.memNo});	
			}
			
			$.ajax({
				type:"GET",
				url: contextPath + "/api/reservation/" + no,
				contentType: "application/json; charset=utf-8",
				async: false,
				success: function(json){
					$("#mov-title").text(json.shwNo.movNo.movTitle);			
					$("#theater-name").text(json.shwNo.thtNo.thtName);

					var showDate = json.shwNo.shwDate;
					var arrShowDate = showDate.split("-");
					var strShowDate = arrShowDate[0] + "년 " + arrShowDate[1] + "월 " + arrShowDate[2] + "일";
					var startTime = json.shwNo.shwStarttime;
					var arrStartTime = startTime.split(":");
					var strStartTime = arrStartTime[0] + "시 " + arrStartTime[1] + "분";
					$("#show-date").text(strShowDate + " - " + strStartTime);
					
					var cntPeople = "";
					if (json.resAdult > 0) {
						cntPeople += "성인" + json.resAdult + "명 "
					}
					if (json.resTeen > 0) {
						cntPeople += "청소년" + json.resTeen + "명 "
					}
					if (json.resPref > 0) {
						cntPeople += "우대" + json.resPref + "명 "
					}
					$("#people").text(cntPeople);			
					
					$("#pay").text(json.resPrice + " 원");
					
					var resDate = json.resDate;
					var arrResDate = resDate.split(" ");
					var resDay = arrResDate[0];
					var resTime = arrResDate[1];
					var arrResDay = resDay.split("-");
					var arrResTime = resTime.split(":");
					var strResDay = arrResDay[0] + "년 " + arrResDay[1] + "월 " + arrResDay[2] + "일";
					var strResTime = arrResTime[0] + "시 " + arrResTime[1] + "분";
					$("#res-date").text(strResDay + " - " + strResTime);
				}
			});
			
			$.ajax({
				type:"GET",
				url: contextPath + "/api/seatbyresno/" + no,
				contentType: "application/json; charset=utf-8",
				async: false,
				success: function(json){
					var dataLength = json.length;
					var seat = "";
					if (dataLength >= 1) {
						for (i = 0; i < dataLength; i++) {
							var row = String.fromCharCode(json[i].seatRowNo + 64);
							var col = json[i].seatColNo;
							seat += row + col + " ";
						}
						$("#seat").text(seat);
					}
				}
			});
		});
	</script>
</body>
</html>