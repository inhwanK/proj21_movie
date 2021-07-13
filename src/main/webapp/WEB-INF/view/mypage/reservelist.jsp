<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">	<!-- 파비콘 오류 메세지 해결 -->
	<meta charset="UTF-8">
	<title>예매내역</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/mypage/reservelist.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<section>
		<div id="container">
			<div id="mypage-menubar">
			
				<ul>
					<li><a href="${contextPath}/mypage"><h2>My Page</h2></a></li>
					<li class="active-menu"><a href="${contextPath}/reserveInfo">예매내역</a></li>
					<li><a href="${contextPath}/commentInfo">한줄평 내역</a></li>
					<li><a href="${contextPath}/inquiryInfo">1대1 문의 내역</a></li>
					<li><a href="${contextPath}/myinfo">개인정보 수정</a></li>
					<li><a href="${contextPath}/withdrawal">회원탈퇴</a></li>
				</ul>
			</div>
			
			<div id="reserve-wrap">
				<!-- <div id="reserve-history">
					<h2>예매내역</h2>
					<ul id="reserve-list">
						<li>예매 내역이 없습니다.</li>
					</ul>
				</div> -->
				<h2>예매 내역</h2>
					<div id="reserve-count">
						<strong id="strCnt">총 0건</strong>
					</div>
					<ul id="reservation">
						
					</ul>
				
				<div id="desc">
					<h3>예매 유의사항</h3>
					<p>01. 영화 상영 시간표는 영화관 사정에 의해 변경될 수 있습니다.</p>
					<p>02. 온라인 예매 및 취소는 영화 상영시작 시간 전까지 가능합니다.</p>
				</div>
			</div>
		</div>
	</section>
	
	<%@include file="/WEB-INF/view/footer.jsp"%>

	<script type="text/javascript">
		$(function(){
			// 예매내역 불러옴
			reload();
			
			// 예매취소 클릭하면 에매 데이터 삭제
			$("#reservation").on('click', '[class=cancelRes]', function(e){
				e.preventDefault();
				var contextPath = "${contextPath}";
				var resNo = Number($(this).prev().val());
				
				// if (confirm("예매를 취소하시겠습니까?")) {
				Swal.fire({ 		// Alert창 디자인 sweetalert2
					title			  : '예매를 취소하시겠습니까?', 
					icon			  : 'question',
					showCancelButton  : true, 
					confirmButtonColor: '#3085d6', 
					cancelButtonColor : '#d33', 
					confirmButtonText : '확인', 
					cancelButtonText  : '취소' 
					}).then((result) => {
						if (result.isConfirmed) {
							$.ajax({
								url: contextPath + "/api/reservation/" + resNo,
								type: 'DELETE',
								success: function(res) {
									$("#reservation").empty();
									reload();
								},
								error: function(request, status, error) {
									alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
								}
							});
						} else {
							return false;
						}
					});
			});
			
			$("#reservation").on('click', '[class=cancelFail]', function(e){
				e.preventDefault();
				// alert("상영시간이 지났으므로 예매 취소 불가");
				Swal.fire({				// Alert창 디자인 sweetalert2
	                icon : 'error',
	                title: '상영시간이 지나서 예매 취소 불가'
	            }).then((result) => {
					if (result.isConfirmed) {
					}
	            });
			});
			
			// 회원번호로 예매내역 불러오는 함수
			function reload(){
				var contextPath = "${contextPath}";
				var memNo = ${member.memNo};
				
				$.ajax({
					type:"GET",
					url: contextPath + "/api/reservationByMember/" + memNo,
					contentType: "application/json; charset=utf-8",
					async: false,
					success: function(json){
						var dataLength = json.length;
						if (dataLength >= 1) {
							var sCont = "";
							$("#strCnt").text("총 " + dataLength + " 건");
							for (i = 0; i < dataLength; i++) {
								sCont += "<li>";
								sCont += "<div class='reserve-list'>";
								sCont += "<a href='${contextPath}/movie?movNo=" + json[i].shwNo.movNo.movNo + "'>";
								sCont += "<img alt='포스터사진' src='${contextPath}/resources/images/movie/box-office/" + json[i].shwNo.movNo.movPoster + "'>";
								sCont += "</a>";
								sCont += "<div class='textarea'>";
								sCont += "<h3>" + json[i].shwNo.movNo.movTitle + "</h3>";
								sCont += "<p>상영관 : " + json[i].shwNo.thtNo.thtName + "</p>";
								
								var showDate = json[i].shwNo.shwDate;
								var arrShowDate = showDate.split("-");
								var strShowDate = arrShowDate[0] + "년 " + arrShowDate[1] + "월 " + arrShowDate[2] + "일";
								var startTime = json[i].shwNo.shwStarttime;
								var arrStartTime = startTime.split(":");
								var strStartTime = arrStartTime[0] + "시 " + arrStartTime[1] + "분";
								
								sCont += "<p>상영일시 : " + strShowDate + " - " + strStartTime + "</p>";
								
								var cntPeople = "";
								if (json[i].resAdult > 0) {
									cntPeople += "성인" + json[i].resAdult + "명 "
								}
								if (json[i].resTeen > 0) {
									cntPeople += "청소년" + json[i].resTeen + "명 "
								}
								if (json[i].resPref > 0) {
									cntPeople += "우대" + json[i].resPref + "명 "
								}
								
								sCont += "<p>인원 : " + cntPeople + "</p>";
								
								sCont += "<p>결제금액 : " + json[i].resPrice + " 원</p>";
								
								var resDate = json[i].resDate;
								var arrResDate = resDate.split(" ");
								var resDay = arrResDate[0];
								var resTime = arrResDate[1];
								var arrResDay = resDay.split("-");
								var arrResTime = resTime.split(":");
								var strResDay = arrResDay[0] + "년 " + arrResDay[1] + "월 " + arrResDay[2] + "일";
								var strResTime = arrResTime[0] + "시 " + arrResTime[1] + "분";
								
								sCont += "<p>예매일 : " + strResDay + " - " + strResTime + "</p>";
								
								sCont += "<input type='hidden' value=" + json[i].resNo + ">";
								
								var today = new Date();
								var selDate = new Date(arrShowDate[0], arrShowDate[1] - 1, arrShowDate[2], arrStartTime[0]);
								
								if (today <= selDate){
									sCont += "<a class='cancelRes' href=''>예매 취소</a>";
								} else {
									sCont += "<a class='cancelFail' href=''>취소 불가</a>";
								}
								
								sCont += "</div>";
								sCont += "</div>";
								sCont += "</li>";
							}
							$("#reservation").append(sCont);
						}
					}
				});
			}
			
		});
	</script>
</body>
</html>