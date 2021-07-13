<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 등록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(function(){
		var contextPath = "${contextPath}";
		
		$('#cancel').on("click", function(e){
			window.location.href = contextPath + "/movieManager";
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
  	<h1>영화관리</h1>
         <div class="col-md-6 col-sm-12">
            <div class="form">
               <form:form>
                  <div class="form-group">
                     <label>제목</label>
                     <input type="text" id="title" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>장르</label>
                     <input type="text" id="genre" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>심의등급</label>
                      <select id="grade" class="form-control">
                     	<option selected disabled hidden="" value="">등급 선택</option>
                     	<option value="0">전체 관람가</option>
                     	<option value="12">12세 관람가</option>
                     	<option value="15">15세 관람가</option>
                     	<option value="19">청소년 관람불가</option>
                     </select>
                  </div>
                  <div class="form-group">
                     <label>런타임(분)</label>
                     <input type="number" id="runtime" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>감독</label>
                     <input type="text" id="director" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>출연진</label>
                     <input type="text" id="actor" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>주요정보</label>
                     <textarea id="detail" style="height: 200px;" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                     <label>개봉일</label>
                     <input type="date" id="opendate" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>종료일</label>
                     <input type="date" id="enddate" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>예고편 URL</label>
                     <input type="text" id="video" class="form-control">
                  </div>
                   <div class="form-group">
                     <label>포스터 첨부</label>
                     <input type="file" id="uploadFile" name="uploadFile" class="form-control">
                  </div>
               </form:form>
                  <button id="uploadBtn" class="btn btn-primary">등록</button>
                  <button id="cancel" class="btn btn-primary">취소</button>
            </div>
         </div>
      </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	
	var contextPath = "${contextPath}";
	
	$("#uploadBtn").on("click", function(e){
		
		if ($('#title').val() == "" || $('#genre').val() == "" 
				|| $('#grade').val() == null || $('#runtime').val() == ""
				|| $('#director').val() == "" || $('#actor').val() == ""
				|| $("#detail").val() == "" || $('#opendate').val() == ""
				|| $('#enddate').val() == "" || $('#video').val() == ""
				|| document.getElementById("uploadFile").files[0] == null){
			alert("모두 입력해 주세요.");
			return;
		}
		
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		
		for (var key of formData.keys()){
			console.log(key);
		}
		for (var value of formData.values()) {
			console.log(value);
		}
		
		for(var i = 0; i < files.length; i++){
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url: contextPath + '/api/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			success: function(result){
				/* alert("Uploaded"); */
			}
		});
		
		var name = document.getElementById("uploadFile").files;
		
		// textarea의 엔터를 <br>로 치환
		var detail = $("#detail").val();
		var reDetail = detail.replace(/\n/g, '<br/>');
		
		var newMovie = { movTitle: $('#title').val(),
				movGenre: $('#genre').val(),
				movGrade: $('#grade').val(),
				movRuntime: $('#runtime').val(),
				movDirector: $('#director').val(),
				movActor: $('#actor').val(),
				movDetail: reDetail,
				movOpendate: $('#opendate').val(),
				movEnddate: $('#enddate').val(),
				movVideo: $('#video').val(),
				movPoster: document.getElementById("uploadFile").files[0].name 
			};
		
		$.ajax({
			url: contextPath + "/api/movies",
			type: "POST",
			contentType: "application/json; charset=utf-8",
			datatype: "json",
			cache: false,
			data: JSON.stringify(newMovie),
			success: function(res){
				alert("등록 완료");
				window.location.href = contextPath + "/movieManager";
			},
			error: function(request, status, error){
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				window.location.href = contextPath + "/movieManager";
			}
		});
	});
});

</script>


</body>
</html>