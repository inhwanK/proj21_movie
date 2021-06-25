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
                     <input type="text" id="grade" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>런타임</label>
                     <input type="text" id="runtime" class="form-control">
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
                     <textarea id="detail" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                     <label>개봉일</label>
                     <input type="text" id="opendate" class="form-control" placeholder="2021-06-02">
                  </div>
                  <div class="form-group">
                     <label>종료일</label>
                     <input type="text" id="enddate" class="form-control" placeholder="2021-06-02">
                  </div>
                   <div class="form-group">
                     <label>파일 첨부</label>
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
				alert("Uploaded");
			}
		});
		
		var name = document.getElementById("uploadFile").files;
		
		var newMovie = { movTitle: $('#title').val(),
				movGenre: $('#genre').val(),
				movGrade: $('#grade').val(),
				movRuntime: $('#runtime').val(),
				movDirector: $('#director').val(),
				movActor: $('#actor').val(),
				movDetail: $('#detail').val(),
				movOpendate: $('#opendate').val(),
				movEnddate: $('#enddate').val(),
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
				alert(res);
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