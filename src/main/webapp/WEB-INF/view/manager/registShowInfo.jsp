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
			var newShow = { 
						thtNo: $('#theater option:selected').thtNo,
						cinNo: $('#cinema option').index($("#cinema option:selected")),
						movNo: $('#movie').val(),
						shwDate: $('#date').val(),
						shwStarttime: $('#start').val()
					}
			alert("data > " + newShow.thtNo);
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
                     	<c:forEach items="${getTheaterList }" var="theater">
                     		<option><c:out value="${theater }"/></option>
                     	</c:forEach>
                     </select>
                  </div>
                  <div class="form-group">
                     <label>상영관</label>
                     <select id="cinema" class="form-control">
                     	<option selected>상영관</option>
                     	<option>1(2D)</option>
                     	<option>2(3D)</option>
                     	<option>3(4D)</option>
                     </select>
                  </div>
                  <div class="form-group">
                     <label>영화제목</label>
                     <select id="movie" class="form-control">
                     	<option selected>영화</option>
                     	<c:forEach items="${getMovieList }" var="movie">
                     		<option><c:out value="${movie.movTitle }"/></option>
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
                  <button id="new" class="btn btn-primary">등록</button>
                  <button id="cancel" class="btn btn-primary">취소</button>
               </form>
            </div>
         </div>
      </div>
</div>
</body>
</html>            
