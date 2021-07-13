<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">	<!-- 파비콘 오류 메세지 해결 -->
	<meta charset="UTF-8">
	<title>결제</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/reserve/payment.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<!-- URL 직접 입력해서 접속하는것을 차단 -->
<%
	String strReferer = request.getHeader("referer");
	 
	if(strReferer == null){
%>
	<script language="javascript">
		
		document.location.href="${contextPath}/main";
	</script>
<%
	return;
	}
%>
	<script type="text/javascript">
		$(function(){
			$(".title").click(function() {
				$(this).addClass("active");
				$(this).siblings(".title").removeClass("active");
				
				$(this).siblings(".desc").stop().slideUp();
				$(this).next().stop().slideDown();
				
			});
			
			$(".desc").on('click', '.paytype', function(e){
				e.preventDefault();
				$(this).addClass("active");
				$(this).siblings().removeClass("active");
			});
		});
	</script>
</head>
<body>
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<section>
		<h2 id="menu-title">바로예매</h2>
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
				<!-- <div class="title">박스무비 포인트 / 쿠폰</div>
					<div class="desc">
						<span><a href="#">포인트</a></span>
						<span><a href="#">쿠폰</a></span>
					</div> -->
				<div class="title">결제 수단 선택</div>
					<div class="desc">
						<span class="paytype">신용 / 체크카드</span>
						<span class="paytype">휴대폰 결제</span>
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
						<dd id="select-seat"></dd>
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
				<br><br>
				<div id="button-group">
					<span id="before">이전</span> <span id="next">결제</span>
				</div>
			</div>
		</div>
	</section>
	
	<%@include file="/WEB-INF/view/footer.jsp"%>
	
	<script type="text/javascript">
		$(function(){
			var contextPath = "${contextPath}";
			var showNo = ${param.shwNo};
			var reservingNo = ${param.reservingNo};
			var seat = "";
			var price = 0;
			var cntAdult = 0;
			var cntTeen = 0;
			var cntPref = 0;
			var checkUnload = true;
			var memNo = 0;
			
			if (${member != null}) {
				memNo = ${member.memNo};
				console.log("회원번호" + memNo);	
			}
			
			// 상영정보 받아옴
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
			
			// 예매진행정보 받아옴
			$.ajax({
				type:"GET",
				url: contextPath + "/api/reserving/" + reservingNo,
				contentType: "application/json; charset=utf-8",
				async: false,
				success: function(json) {
					$("#price").text(json.ingPrice);
					seat = json.ingSeat;
					$("#select-seat").text("선택좌석 : " + json.ingSeat);
					price = json.ingPrice;
					cntAdult = json.ingAdult;
					cntTeen = json.ingTeen;
					cntPref = json.ingPref;
				},
				error: function() {
					window.location.href = contextPath + "/seat?no=" + showNo;
				}
			});
			
			var arrSeat = seat.split(" ");	// 공백 기준으로 나눠서 배열화
			arrSeat.pop();	// 마지막 공백 제거
			
			var row = [];
			var col = [];
			
			for (i = 0; i < arrSeat.length; i++) {
				row.push(arrSeat[i].charAt(0).charCodeAt(0)-64);
				col.push(Number(arrSeat[i].substring(1)));
			}
			
			// 결제 버튼 누르면 예매, 좌석 테이블에 등록되고 예매진행중 테이블에서 데이터 삭제
			$("#button-group").on('click', '[id=next]', function(e){
				/* alert("memNo >> " + 1 
						+ "\nshwNo >> " + showNo
						+ "\nreservingNo >> " + reservingNo
						+ "\nprice >> " + price
						+ "\ncntAdult >> " + cntAdult
						+ "\ncntTeen >> " + cntTeen
						+ "\ncntPref >> " + cntPref
						+ "\nrow >> " + row
						+ "\ncol >> " + col
						); */
				
				var activeLength = $(".paytype.active").length;
				if (activeLength != 1) {
					// alert("결제 방식을 선택해 주세요.");
					Swal.fire({				// Alert창 디자인 sweetalert2
		                icon : 'error',
		                title: '결제 방식을 선택해 주세요.'
		            }).then((result) => {
						if (result.isConfirmed) {
						}
		            });
					return;
				}
				
				var resCommand = {
						memNo: memNo,
						shwNo: showNo,
						reservingNo: reservingNo,
						price: price,
						cntAdult: cntAdult,
						cntTeen: cntTeen,
						cntPref: cntPref,
						row: row,
						col: col
				}
				
				//if(confirm("결제하시겠습니까?")) {
				Swal.fire({ 		// Alert창 디자인 sweetalert2
					title			  : '결제하시겠습니까?', 
					icon			  : 'question',
					showCancelButton  : true, 
					confirmButtonColor: '#3085d6', 
					cancelButtonColor : '#d33', 
					confirmButtonText : '결제', 
					cancelButtonText  : '취소' 
					}).then((result) => {
						if (result.isConfirmed) {
							$.ajax({
								url: contextPath + "/api/trReserving",
								type: "POST",
								contentType: "application/json; charset=utf-8",
								datatype: "json",
								cache: false,
								data: JSON.stringify(resCommand),
								success: function(res) {
									//alert("결제가 완료되었습니다.");
									checkUnload = false;
									//window.location.href = contextPath + "/resultpay?resNo=" + res +"#menu-title";
									Swal.fire({				// Alert창 디자인 sweetalert2
						                icon : 'success',
						                title: '결제가 완료되었습니다.'
						            }).then((result) => {
										if (result.isConfirmed) {
											window.location.href = contextPath + "/resultpay?resNo=" + res +"#menu-title"
										}
						            });
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
			
			// 이전 버튼 누르면 예매진행중인 내용 삭제되고 이전페이지로 돌아감
			$("#button-group").on('click', '[id=before]', function(e){
				// if (confirm("현재 진행중인 내역은 저장되지 않습니다.")) {
				Swal.fire({ 		// Alert창 디자인 sweetalert2
					title			  : '현재 진행중인 내역은 저장되지 않습니다.', 
					icon			  : 'question',
					showCancelButton  : true, 
					confirmButtonColor: '#3085d6', 
					cancelButtonColor : '#d33', 
					confirmButtonText : '이동', 
					cancelButtonText  : '취소' 
					}).then((result) => {
						if (result.isConfirmed) {
							$.ajax({
								url: contextPath + "/api/delReserving/" + reservingNo,
								type: 'DELETE',
								success: function(res) {
									/* alert(res); */
									checkUnload = false;
									window.location.href = contextPath + "/seat?no=" + showNo + "#menu-title";
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
			
			// 다른페이지로 이동하거나 새로고침을 하면 예매진행중인 내용 삭제되고 이동
			$(window).on("beforeunload", function(){
				if (checkUnload) {
					$.ajax({
						url: contextPath + "/api/delReserving/" + reservingNo,
						type: 'DELETE',
						success: function(res) {
							/* alert(res); */
						},
						error: function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
						}
					});
					
					return "이 페이지를 벗어나면 진행중인 내역은 저장되지 않습니다.";
				}
			});
			
		});
	</script>
</body>
</html>