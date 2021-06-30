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
	<!-- URL 직접 입력해서 접속하는것을 차단 -->
<%
	String strReferer = request.getHeader("referer");
	 
	if(strReferer == null){
%>
	<script language="javascript">
		alert("정상적인 경로를 통해 다시 접근해 주십시오.");
		document.location.href="${contextPath}/main";
	</script>
<%
	return;
	}
%>
</head>
<body>
	
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