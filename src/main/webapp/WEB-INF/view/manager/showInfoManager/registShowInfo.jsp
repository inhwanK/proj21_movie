<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영 영화 추가</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function(){
		var contextPath = "${contextPath}";
		
		$('#cancel').on("click", function(e){
			e.preventDefault();
			window.location.href = contextPath + "/showInfoManager";		
		});
		
		$('#new').on("click", function(e){
			e.preventDefault();
			
			if ($('#theater').val() == null || $('#cinema').val() == null 
				|| $('#movie').val() == null || $('#date').val() == ""
				|| $('#start').val() == null){
				alert("모두 입력해 주세요.");
				return;
			}
			
			var newShow = { 
						thtNo: Number($('#theater').val()),
						cinNo: $('#cinema').val(),
						movNo: $('#movie').val(),
						shwDate: $('#date').val(),
						shwStarttime: $('#start').val()
						}
			/* alert("thtNo > " + newShow.thtNo + "\ncinNo > " + newShow.cinNo + 
					"\nmovNo > " + newShow.movNo + "\nshwDate > " + newShow.shwDate + "\nshwStarttime > " + newShow.shwStarttime); */
			
			$.ajax({
				url: contextPath + "/api/showinfo",
				type: "POST",
				contentType: "application/json; charset=utf-8",
				datatype: "json",
				cache: false,
				data: JSON.stringify(newShow),
				success: function(res) {
					alert("등록 완료");
					window.location.href = contextPath + "/showInfoManager";
				}, 
				error: function(request, status, error){
					alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					window.location.href = contextPath + "/showInfoManager";
				}
			});
		});
	});
</script>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/view/manager/sidebar.jsp"></jsp:include>
</header>
<div id="page-wrapper">
  <!-- 본문 -->
  <div class="main">
  	<h1>상영관리</h1>
         <div class="col-md-6 col-sm-12">
            <div class="form">
               <form>
                  <div class="form-group">
                     <label>극장</label>
                     <select id="theater" class="form-control">
                    	<option selected disabled hidden="">극장 선택</option>
                     	<c:forEach items="${getTheaterList }" var="tht">
                     		<option value="${tht.thtNo }"><c:out value="${tht.thtName }"/></option>
                     	</c:forEach>
                     </select>
                  </div>
                  <div class="form-group">
                     <label>상영관</label>
                     <select id="cinema" class="form-control">
                     	<option selected disabled hidden="">상영관 선택</option>
                     	<c:forEach items="${getCinemaList }" var="cin">
                     		<option value="${cin.cinNo }"><c:out value="${cin.cinType }"/></option>
                     	</c:forEach>
                     </select>
                  </div>
                  <div class="form-group">
                     <label>영화제목</label>
                     <select id="movie" class="form-control">
                     	<option selected disabled hidden="">영화 선택</option>
                     	<c:forEach items="${getMovieList }" var="movie">
                     		<option value="${movie.movNo }" data-time="${movie.movRuntime }" data-start="${movie.movOpendate }" data-end="${movie.movEnddate }">
                     			<c:out value="${movie.movTitle }"/>
                     		</option>
                     	</c:forEach>
                     </select>
                  </div>
                  <div class="form-group">
                     <label>상영일</label>
                     <input type="date" id="date" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>시작시간</label>&nbsp;&nbsp;
                     <button id="chkTime" class="btn btn-primary">시간확인</button>
                     <select id="start" class="form-control">
                     	<option selected disabled hidden="">시작시간</option>
                     	<option id="time1" hidden="">10:00</option>
                     	<option id="time2" hidden="">14:00</option>
                     	<option id="time3" hidden="">20:00</option>
                     </select>
                      
                  </div>
                  <div class="form-group">
                     <label>종료시간</label>
                     <input type="text" id="end" class="form-control" readonly="readonly">
                  </div>
                  
                  <button id="new" class="btn btn-primary">등록</button>
                  <button id="cancel" class="btn btn-primary">취소</button>
               </form>
            </div>
         </div>
      </div>
</div>
<script type="text/javascript">
	$(function(){
		var contextPath = "${contextPath}";
		var cinNo = 0;
		var thtNo = 0;
		var shwDate = "";
		
		// 분을 시:분(00:00) 출력으로 바꿔주는 함수
		function HHmmss(seconds){
			var myNum = parseInt(seconds, 10);
			var hours = Math.floor(myNum / 3600);
			var minutes = Math.floor((myNum - (hours * 3600)) / 60);
		    var seconds = myNum - (hours * 3600) - (minutes * 60);

		    if (hours   < 10) {hours   = "0"+hours;}
		    if (minutes < 10) {minutes = "0"+minutes;}
		    if (seconds < 10) {seconds = "0"+seconds;}
		    
		    return hours+':'+minutes;
		}
		
		// 이미 등록되어 있는 상영시간을 가져옴
		function timeList(theater, cinema, showDate){
			$.ajax({
				type:"GET",
				url: contextPath + "/api/timelistbycondition/" + theater + "/" + cinema + "/" + showDate,
				contentType: "application/json; charset=utf-8",
				async: false,
				success: function(json){
					var dataLength = json.length;
					if (dataLength >= 1) {
						for (i = 0; i < dataLength; i++){
							if (json[i].shwStarttime == '10:00'){
								$('#time1').attr("hidden", true);
							}
							if (json[i].shwStarttime == '14:00'){
								$('#time2').attr("hidden", true);
							}
							if (json[i].shwStarttime == '20:00'){
								$('#time3').attr("hidden", true);
							}
						}
					}
				}
			});	
		}
		
		$('#theater').change(function(){
			thtNo = $('#theater').val();
			$("#start").val("시작시간");
			$('#time1').attr("hidden", true);
			$('#time2').attr("hidden", true);
			$('#time3').attr("hidden", true);
		});
		
		$('#cinema').change(function(){
			cinNo = $('#cinema').val();
			$("#start").val("시작시간");
			$('#time1').attr("hidden", true);
			$('#time2').attr("hidden", true);
			$('#time3').attr("hidden", true);
		});
		
		$('#date').change(function(){
			shwDate = $('#date').val();
			$("#start").val("시작시간");
			$('#time1').attr("hidden", true);
			$('#time2').attr("hidden", true);
			$('#time3').attr("hidden", true);
		});
		
		$('#chkTime').on('click', function(e){
			e.preventDefault();
			/* alert("극장번호 >> " + thtNo + "\n상영관번호 >> " + cinNo + "\n날짜 >> " + shwDate); */
			
			if ($('#theater').val() == null || $('#cinema').val() == null || $('#date').val() == ""	){
				alert("극장, 상영관, 날짜를 확인해 주세요.");
				return;
			}
			
			$("#start").val("");
			$('#end').val("");
			$('#time1').attr("hidden", false);
			$('#time2').attr("hidden", false);
			$('#time3').attr("hidden", false);
			timeList(thtNo, cinNo, shwDate);
		});
		
		// 시작시간을 바꾸면 종료시간에 적용
		$('#start').change(function(){
			var runtime = $("#movie option:selected").data("time");
			var starttime = $("#start").val();
			var starttime_to_min = "";
			
			if (runtime == null) return;
			
			if (starttime == '10:00') {
				starttime_to_min = 60 * 10;
			} else if (starttime == '14:00') {
				starttime_to_min = 60 * 14;
			} else {
				starttime_to_min = 60 * 20;
			}
			
			/* alert("starttime >> " + starttime + "\nruntime >> " + runtime + "\nstarttime_to_min >> " + starttime_to_min); */
			
			var changeTime = HHmmss((runtime + starttime_to_min) * 60);
			
			$('#end').val(changeTime);
		});
		
		// 영화 선택을 바꾸면 종료시간에 적용
		$('#movie').change(function(){
			var runtime = $("#movie option:selected").data("time");
			var starttime = $("#start").val();
			var starttime_to_min = "";
			
			if (starttime == '시작시간') return;
			
			if (starttime == '10:00') {
				starttime_to_min = 60 * 10;
			} else if (starttime == '14:00') {
				starttime_to_min = 60 * 14;
			} else {
				starttime_to_min = 60 * 20;
			}
			
			/* alert("starttime >> " + starttime + "\nruntime >> " + runtime + "\nstarttime_to_min >> " + starttime_to_min); */
			
			var changeTime = HHmmss((runtime + starttime_to_min) * 60);
			
			$('#end').val(changeTime);
			
			var openDate = $("#movie option:selected").data("start");
			var endDate = $("#movie option:selected").data("end");
			var today = new Date();
			var year = today.getFullYear();
			var month = today.getMonth() + 1;
			var day = today.getDate();
			
			if(month < 10) {
				month = "0" + month.toString();
			}
			if(day < 10) {
				day = "0" + day.toString();
			}
			var strDate = year + "-" + month + "-" + day;
			
			console.log("개봉일 >> " + openDate + ", 종료일 >> " + endDate);
			
			// 오늘날짜와 개봉일 비교하여 date의 최소값으로 넣음
			var date1 = new Date(strDate);	// 오늘날짜
			var date2 = new Date(openDate);	// 영화개봉일
			
			if (date2 > date1) {
				$('#date').attr('min', openDate);
				$('#date').val(openDate);
				shwDate = openDate;
			} else {
				$('#date').attr('min', strDate);
				$('#date').val(strDate);
				shwDate = strDate;
			}
			$('#date').attr('max', endDate);
		});
	});
</script>
</body>
</html>            
