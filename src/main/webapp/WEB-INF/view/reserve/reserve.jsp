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
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script type="text/javascript">
		$(function(){
			var week = ['일', '월', '화', '수', '목', '금', '토'];
			var today = new Date();
			
			var year = today.getFullYear();
			var month = today.getMonth();
			var date = today.getDate();
			var day = today.getDay();

			for (i = 0; i < 5; i++){
								
				var addDate = date + i;
				
				var today2 = new Date(year, month, addDate);
				var month2 = today2.getMonth() + 1;
				var date2 = today2.getDate();

				var dayOfWeek = week[(day + i) % 7]; 

				$("#calendar").append("<span><a href='' class='date'>"+ month2 + "월" + date2 + "일("+ dayOfWeek + ")</a></span>");
				
				/* 페이지 로드시 첫번째 날짜 선택됨 */
				var test = $('.calendar span a:first');
				test.addClass('active');
			}
		});
	
	</script>
</head>
<body>

	<%@include file="/WEB-INF/view/header.jsp"%>
	<section>
		<div id="containter">
		
			<h2 id="menu-title">바로예매</h2>
			
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
				<!-- <div class="btntimediv">
					<button class="btntime">시간 확인하기</button>
				</div> -->
				<!-- <p>
					극장을 선택해 주세요.
				</p> -->	
			</div>
	
			<div id="time-choice">
				<h3>시간</h3>
				
				<div id="time-select">
				</div>	
	
			</div>
			</div>
		</div>
	</section>
	
	<%@include file="/WEB-INF/view/footer.jsp"%>
	
	<script type="text/javascript">
		var contextPath = "${contextPath}";
		var dateIdx = 0;
		var movieNo = "${param.no}";
		var theaterNo = 0;
		var time = "";
		var showInfoNo = 0;
		
		// 영화에서 에매 클릭시 영화 선택 됨
		var movNo = $(".movie input[value='${param.no}']").parent();
		if (movNo != ''){
			movNo.addClass("active");
		}
		
		// 날짜 선택했을 시 효과 & 선택된 날짜 인덱스 리턴
		$("#calendar").on('click', 'a', function(e){
			e.preventDefault();
			
			$(this).toggleClass("active");
			$(this).parent().siblings().children().removeClass("active"); 
			
			/* alert($(this).text()); */
			
			var idx = $("#calendar span a").index(this);
			/* alert("날짜 인덱스 >> " + idx); */
			
			dateIdx = idx;
			
			var dateActive = $(".date.active").length;
			var movieActive = $(".movie.active").length;
			var theaterActive = $(".theater.active").length;
			var activeLength = dateActive + movieActive + theaterActive; // 날짜, 영화, 극장 active 클래스의 수
			
			if (activeLength == 3){
				selTime();
			} else {
				$("#time-select").empty();
			}
		});
		
		// 영화 선택 시 효과 & 영화 번호 리턴
		$("#movie-list").on('click', 'a', function(e){
			e.preventDefault();
			
			$(this).toggleClass("active");
			$(this).parent().siblings().children().removeClass("active"); 
			
			/* alert($(this).text()); */
			/* alert("movNo >> " + $(this).children().val()); */
			
			movieNo = $(this).children().val();
			
			var dateActive = $(".date.active").length;
			var movieActive = $(".movie.active").length;
			var theaterActive = $(".theater.active").length;
			var activeLength = dateActive + movieActive + theaterActive; // 날짜, 영화, 극장 active 클래스의 수
			
			if (activeLength == 3){
				selTime();
			} else {
				$("#time-select").empty();
			}
		});
		
		// 극장 선택 시 효과 & 극장 번호 리턴
		$("#theater-list").on('click', 'a', function(e){
			e.preventDefault();
			
			$(this).toggleClass("active");
			$(this).parent().siblings().children().removeClass("active"); 
			
			/* alert($(this).text()); */
			/* alert("thtNo >> " + $(this).children().val()); */
			
			theaterNo = $(this).children().val();
			
			var dateActive = $(".date.active").length;
			var movieActive = $(".movie.active").length;
			var theaterActive = $(".theater.active").length;
			var activeLength = dateActive + movieActive + theaterActive; // 날짜, 영화, 극장 active 클래스의 수
			
			if (activeLength == 3){
				selTime();
			} else {
				$("#time-select").empty();
			}
		});
		
		// 영화번호, 극장번호, 날짜로 상영정보(시간) 조회
		function selTime(){
			$("#time-select").empty();
			
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
						var cinemaNo = 0;
						for (i = 0; i < dataLength; i++) {
							if (json[i].cinNo.cinNo != cinemaNo) {
								sCont += "<br><br><br>";
								sCont += "<label class='type'>" + json[i].cinNo.cinType + "</label>";
								sCont += "<br><br>";
								cinemaNo = json[i].cinNo.cinNo;
							}
							sCont += "<span class='time'>";
							sCont += json[i].shwStarttime;
							sCont += "</span>";
							sCont += "<input type='hidden' value='" + json[i].shwNo + "'/>";
						}
						sCont += "<br><br><br><button id='btn-seat' class='btn-seat'>좌석 선택</button>";
						var brDelete = sCont.substring(12);
						$("#time-select:last-child").append(brDelete);
					}
				}
			});
		}
		
	
		// 시간 선택 시 효과
		$(document).on('click', '[class=time]', function(e){
			e.preventDefault();
			
			$(this).toggleClass("active");
			$(this).siblings().removeClass("active"); 
			
			time = $(this).text();
			showInfoNo = $(this).next().val();
		});
		
		// 좌석 선택 버튼 기능
		$(document).on('click', '[class=btn-seat]', function(e){
			var shwDate = date(dateIdx);
					
			if (${member == null}) {
				/* alert("로그인이 필요한 서비스입니다.");
				window.location.href = contextPath + "/login";
				return; */
				Swal.fire({				// Alert창 디자인 sweetalert2
	                icon : 'error',
	                title: '로그인이 필요한 서비스입니다.'
	            }).then((result) => {
					if (result.isConfirmed) { 
						window.location.href = contextPath + "/login";
					}
	            });
			}else if ($("#time-select").children().hasClass("active")){
				window.location.href = contextPath + "/seat?no=" + showInfoNo + "#menu-title";
			} else {
				// alert("상영시간을 선택해 주세요.");
				Swal.fire({				// Alert창 디자인 sweetalert2
	                icon : 'warning',
	                title: '상영시간을 선택해 주세요.'
	            }).then((result) => {
					if (result.isConfirmed) {
					}
	            });
			}
					
		});
		
		// 인덱스를 넣으면 해당 인덱스만큼 +된 날짜를 계산하여 "yyyy-MM-dd" 형식으로 리턴해주는 함수 
		function date(idx){
			var today = new Date();
			
			var year = today.getFullYear();
			var month = today.getMonth();
			var date = today.getDate();
			
			var addDate = date + idx;
			
			var today2 = new Date(year, month, addDate);
			var year2 = today2.getFullYear();
			var month2 = today2.getMonth() + 1;
			var date2 = today2.getDate();
			
			if (month2 < 10) month2 = "0" + month2;
			if (date2 < 10) date2 = "0" + date2;
			
			return year2 + "-" + month2 + "-" + date2;
		}
	</script>
</body>
</html>