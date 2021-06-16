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
<link rel="stylesheet" href="${contextPath}/resources/css/manager/sidebar.css">
<script type="text/javascript">
	$(function(){
		var contextPath = "${contextPath}";
		
		$('#cancel').on("click", function(e){
			e.preventDefault();
			window.location.href = contextPath + "/showInfoManager";		
		});
		
		$('#new').on("click", function(e){
			e.preventDefault();
			var newShow = { 
						thtNo: Number($('#theater').val()),
						/* cinNo: $('#cinema option').index($("#cinema option:selected")), */
						cinNo: $('#cinema').val(),
						movNo: $('#movie').val(),
						shwDate: $('#date').val(),
						shwStarttime: $('#start').val()
						}
			alert("thtNo > " + newShow.thtNo + "\ncinNo > " + newShow.cinNo + 
					"\nmovNo > " + newShow.movNo + "\nshwDate > " + newShow.shwDate + "\nshwStarttime > " + newShow.shwStarttime);
			
			$.ajax({
				url: contextPath + "/api/showinfo",
				type: "POST",
				contentType: "application/json; charset=utf-8",
				datatype: "json",
				cache: false,
				data: JSON.stringify(newShow),
				success: function(res) {
					alert(res);
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
<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="#">관리자 페이지</a>
      </li>
      <li><a href="${contextPath }/main">HOME</a></li>
      <li><a href="${contextPath }/movieManager">영화 관리</a></li>
      <li><a href="${contextPath }/reserveManager">예매 관리</a></li>
      <li><a href="${contextPath }/showInfoManager">상영시간 관리</a></li>
      <li><a href="${contextPath }/memberManager">회원 관리</a></li>
      <li><a href="${contextPath }/salesManager">매출 조회</a></li>
      <li><a href="${contextPath }/noticeManager">공지사항</a></li>
      <li><a href="${contextPath }/inquiryManager">문의사항</a></li>
    </ul>
  </div>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div class="main">
  	<h1>상영관리</h1>
         <div class="col-md-6 col-sm-12">
            <div class="form">
               <form>
                  <div class="form-group">
                     <label>극장</label>
                     <select id="theater" class="form-control">
                    	<option selected>극장</option>
                     	<c:forEach items="${getTheaterList }" var="tht">
                     		<option value="${tht.thtNo }"><c:out value="${tht.thtName }"/></option>
                     	</c:forEach>
                     </select>
                  </div>
                  <div class="form-group">
                     <label>상영관</label>
                     <select id="cinema" class="form-control">
                     	<option selected>상영관</option>
                     	<c:forEach items="${getCinemaList }" var="cin">
                     		<option value="${cin.cinNo }"><c:out value="${cin.cinType }"/></option>
                     	</c:forEach>
                     </select>
                  </div>
                  <div class="form-group">
                     <label>영화제목</label>
                     <select id="movie" class="form-control">
                     	<option selected>영화</option>
                     	<c:forEach items="${getMovieList }" var="movie">
                     		<option value="${movie.movNo }" data-time="${movie.movRuntime }"><c:out value="${movie.movTitle }"/></option>
                     		<%-- <input type="hidden" id="runtime" value="${movie.movRuntime }"/> --%>
                     	</c:forEach>
                     </select>
                  </div>
                  <div class="form-group">
                     <label>상영일</label>
                     <input type="text" id="date" class="form-control" placeholder="2021-06-02">
                  </div>
                  <div class="form-group">
                     <label>시작시간</label>
                     <select id="start" class="form-control">
                     	<option selected>시작시간</option>
                     	<option>10:00</option>
                     	<option>14:00</option>
                     	<option>20:00</option>
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
		});
	});
</script>
</body>
</html>            
