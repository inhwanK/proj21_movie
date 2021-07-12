<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">	<!-- 파비콘 오류 메세지 해결 -->
	<meta charset="UTF-8">
	<title>좌석 선택</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/reserve/seat.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
				</div>

				<div id="seat-info">
					<div id="movie-info">
						<dl>
							<dt id="mov-title"></dt>
							<dd id="mov-date"></dd>
							<dd id="mov-time"></dd>
							<dd id="mov-type"></dd>
						</dl>
					</div>
					<div id="select-info">
						<dl>
							<dt>좌석번호</dt>
							<dd id="seat-no"></dd>
						</dl>
					</div>
					<div id="price-info">
						<dl>
							<dt>결제금액</dt>
							<dd><span id="price">0</span> 원</dd>
						</dl>
					</div>
					
					<div id="button-group"> 
						<span id="before">이전</span>
						<span id="next">다음</span>
					</div>
					</div>

			</div>
		</div>

	</section>
	
	<%@include file="/WEB-INF/view/footer.jsp"%>	
	
	<script type="text/javascript">
		/* $(document).ready(function(){
			if (${member == null}) {
				var contextPath = "${contextPath}";
				alert("로그인이 필요한 서비스입니다.");
				window.location.href = contextPath + "/login";
			}
		}); */
		
		$(function(){
			var contextPath = "${contextPath}";
			var no = ${param.no};
			var row = 0;
			var col = 0;
			var memNo = 0;
			
			if (${member != null}) {
				memNo = ${member.memNo};
				console.log("회원번호" + memNo);
			}
			
			$.ajax({
				type:"GET",
				url: contextPath + "/api/showinfo/" + no,
				contentType: "application/json; charset=utf-8",
				async: false,
				success: function(json){
					$("#mov-title").text(json.movNo.movTitle);			
					$("#mov-date").text("상영일 : " + json.shwDate);
					$("#mov-time").text("상영시간 : " + json.shwStarttime);
					$("#mov-type").text("상영타입 : " + json.cinNo.cinType);
					$("#priceAdult").val(json.cinNo.cinAdultPrice);
					$("#priceTeen").val(json.cinNo.cinTeenPrice);
					$("#pricePref").val(json.cinNo.cinPrefPrice);
					row = json.cinNo.cinRow;
					col = json.cinNo.cinCol;
				}
			});
			/* console.log("row >> " + row + ", col >> " + col); */
			
			// 상영관의 행과 열로 좌석 넣어주는 함수
			var updateView = function(){
				var makeTag = "";
				var i = 1;
				var leng = row * col;
				/* console.log("updateView >> " + row + ", " + col); */
				
				makeTag += "<img alt='스크린 이미지' src='${contextPath}/resources/images/screen.png'><br><br>";
				makeTag += "<span id='hiddenseat'></span>";
				for (i = 1; i <= col; i++){
					makeTag += "<span class=matrix>" + i + "</span>";
				}
				makeTag += "<br>";
				for (j = 1; j <= row; j++) {
					for (i = 1; i <= col; i++) {
						if (i % col == 0) {
							makeTag += "<span class='select-seat' id='" + j + "" + i + "'>" + col + "</span>";
							makeTag += "<br>";
							makeTag += "</div>";
						} else if (i % col == 1) {
							makeTag += "<div class='row-index'>"
							makeTag += "<span class='matrix'>" + String.fromCharCode(65+(j-1)) + "</span>";
							makeTag += "<span class='select-seat' id='" + j + "" + i + "'>" + (i % col) + "</span>"
						} else {
							makeTag += "<span class='select-seat' id='" + j + "" + i + "'>" + (i % col) + "</span>";
						}
					}
				}
				makeTag += "<span style='background-color:gray;'>&nbsp;</span>예매된 좌석 <span style='background-color:orange;'>&nbsp;</span>예매중인 좌석";
				$("#seat-area").html(makeTag);
			}
			
			updateView();
			
			// 예약된 좌석 비활성화
			$.ajax({
				type:"GET",
				url: contextPath + "/api/seat/" + no,
				contentType: "application/json; charset=utf-8",
				async: false,
				success: function(json){
					var dataLength = json.length;
					if (dataLength >= 1) {
						for (i = 0; i < dataLength; i++){
							console.log("예약된 좌석 - 행 >> " + json[i].seatRowNo + ", 열 >> " + json[i].seatColNo);
							$("#" + json[i].seatRowNo + json[i].seatColNo).removeClass('select-seat');
							$("#" + json[i].seatRowNo + json[i].seatColNo).addClass('reserved');
						}
					}
				}
			});
			
			// 예약중인 좌석 비활성화
			$.ajax({
				type:"GET",
				url: contextPath + "/api/reservingByShowNo/" + no,
				contentType: "application/json; charset=utf-8",
				async: false,
				success: function(json) {
					var dataLength = json.length;
					if (dataLength >= 1) {
						for (i = 0; i < dataLength; i++) {
							var arrSeat = json[i].ingSeat.split(" ");
							arrSeat.pop();
							console.log("예약중인 좌석 >> " + arrSeat);
							for (j = 0; j < arrSeat.length; j++) {
								var row = "";
								var col = "";
								row += arrSeat[j].charAt(0).charCodeAt(0)-64;
								col += arrSeat[j].substring(1);
								$("#" + row + "" + col).removeClass('select-seat');
								$("#" + row + "" + col).addClass('reserving');
							}
						}
					}
				}
			});
			
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
				
				var cntAdult = Number($("#countAdult").text());
				var cntTeen = Number($("#countTeen").text());
				var cntPref = Number($("#countPref").text());
				var cntTotal = cntAdult + cntTeen + cntPref; // 선택한 인원 총합
				var activeLength = $(".select-seat.active").length; // 선택된 좌석 개수
				
				if (cnt > 0) {
					if (cntTotal <= activeLength){
						// alert("좌석이 선택되어 있습니다.");
						Swal.fire({				// Alert창 디자인 sweetalert2
			                icon : 'warning',
			                title: '좌석이 선택되어 있습니다.'
			            }).then((result) => {
							if (result.isConfirmed) {
							}
			            });
						return;
					}
					$(this).next().text(cnt-1);
					$("#price").text(resPrice - price);
				} 
			});
			
			// 좌석 선택
			$("#seat-area").on('click', '.select-seat', function(e){
				var cntAdult = Number($("#countAdult").text());
				var cntTeen = Number($("#countTeen").text());
				var cntPref = Number($("#countPref").text());
				var cntTotal = cntAdult + cntTeen + cntPref; // 선택한 인원 총합
				
				var activeLength = $(".select-seat.active").length; // 선택된 좌석 개수
				
				var selectCol = Number($(this).text());		// 열번호
				var selectRow = $(this).parent().children().first().text();		// 행번호
				var selectSeat = selectRow + selectCol;
				var sCont = "<span id='" + selectSeat + "'>"+ selectSeat + " </span>";
				
				if (cntTotal <= activeLength) {
					if ($(this).hasClass("active")){
						$(this).removeClass("active");
						$("#seat-no span").remove('#' + selectSeat);
					} else {
						// alert("관람인원을 확인하세요.");
						Swal.fire({				// Alert창 디자인 sweetalert2
			                icon : 'warning',
			                title: '관람인원을 확인하세요.'
			            }).then((result) => {
							if (result.isConfirmed) {
							}
			            });
					}
				} else {
					if ($(this).hasClass("active")){
						$(this).toggleClass("active");
						$("#seat-no span").remove('#' + selectSeat);			
					} else {
						$(this).toggleClass("active");
						$("#seat-no").append(sCont);
					}
				}
			});
			
			$("#button-group").on('click', '[id=next]', function(e){
				var activeLength = $(".select-seat.active").length; // 선택된 좌석 개수
				if (activeLength <= 0) {
					// alert("좌석을 선택해 주세요.");
					Swal.fire({				// Alert창 디자인 sweetalert2
		                icon : 'error',
		                title: '좌석을 선택해 주세요.'
		            }).then((result) => {
						if (result.isConfirmed) {
						}
		            });
					return;
				}
				
				var cntAdult = Number($("#countAdult").text());
				var cntTeen = Number($("#countTeen").text());
				var cntPref = Number($("#countPref").text());
				var cntTotal = cntAdult + cntTeen + cntPref; // 선택한 인원 총합
				
				if (activeLength != cntTotal) {
					// alert("인원과 좌석수를 확인하세요.");
					Swal.fire({				// Alert창 디자인 sweetalert2
		                icon : 'error',
		                title: '인원과 좌석수를 확인하세요.'
		            }).then((result) => {
						if (result.isConfirmed) {
						}
		            });
					return;
				}
				
				/* alert("shwNo >> " + no + "\ningPrice >> " + $("#price").text() + "\ningSeat >> " + $("#seat-no").text() 
						+ "\ningAdult >> " + $("#countAdult").text() 
						+ "\ningTeen >> " + $("#countTeen").text() 
						+ "\ningPref >> " + $("#countPref").text()); */
				
				var newReserving = {
						memNo: memNo,
						shwNo: no,
						ingPrice: Number($("#price").text()),
						ingSeat: $("#seat-no").text(),
						ingAdult: Number($("#countAdult").text()),
						ingTeen: Number($("#countTeen").text()),
						ingPref: Number($("#countPref").text())
				};
				
				$.ajax({
					url: contextPath + "/api/reserving",
					type: "POST",
					contentType: "application/json; charset=utf-8",
					datatype: "json",
					cache: false,
					data: JSON.stringify(newReserving),
					success: function(res) {
						/* alert(res); */
						window.location.href = contextPath + "/payment?shwNo=" + no + "&reservingNo=" + res + "#menu-title";
					}, 
					error: function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					}
				});
			});
			
			$("#button-group").on('click', '[id=before]', function(e){
				/* if (confirm("이전 화면으로 돌아가시겠습니까?")){
					window.location.href = contextPath + "/reserve#menu-title";
				} */
				
				Swal.fire({ 		// Alert창 디자인 sweetalert2
					title			  : '이전 화면으로 돌아가시겠습니까?', 
					icon			  : 'question',
					showCancelButton  : true, 
					confirmButtonColor: '#3085d6', 
					cancelButtonColor : '#d33', 
					confirmButtonText : '돌아가기', 
					cancelButtonText  : '취소' 
					}).then((result) => {
						if (result.isConfirmed) {
							window.location.href = contextPath + "/reserve#menu-title";
						} else{    
							return false;
					 	}
					});
			});
		});
	</script>
</body>
</html>