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
<title>영화 수정</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		var contextPath = "${contextPath}";
		var no = ${param.no};
		
		$('#cancel').on("click", function(e){
			window.location.href = contextPath + "/movieManager";
		});
		
		$.get(contextPath + "/api/movies/" + no,
			function(json){
			$('#no').val(json.movNo);
			$('#title').val(json.movTitle);
			$('#genre').val(json.movGenre);
			$('#grade').val(json.movGrade);
			$('#runtime').val(json.movRuntime);
			$('#director').val(json.movDirector);
			$('#actor').val(json.movActor);
			var str = json.movDetail;
			$('#detail').val(str.replace(/<br\s*\/?>/mg,"\n"));
			$('#opendate').val(json.movOpendate);
			$('#enddate').val(json.movEnddate);
			$('#video').val(json.movVideo);
			$('#uploadFile').val(json.movPoster);
		});
		
		$('#modify').on("click", function(e){
			e.preventDefault();
			
			var uploadFileName = document.getElementById("uploadFile").files[0];
			if (uploadFileName == null) {
				uploadFileName = null;
			} else {
				uploadFileName = document.getElementById("uploadFile").files[0].name;
			}
			
			var data = { 
					movNo: $('#no').val(),
					movTitle: $('#title').val(),
					movGenre: $('#genre').val(),
					movGrade: $('#grade').val(),
					movRuntime: $('#runtime').val(),
					movDirector: $('#director').val(),
					movActor: $('#actor').val(),
					movDetail: $('#detail').val(),
					movOpendate: $('#opendate').val(),
					movEnddate: $('#enddate').val(),
					movVideo: $('#video').val(),
					movPoster: uploadFileName 
					};
			alert("data > " + data.movTitle);
			
			$.ajax({
				url: contextPath + "/api/movies/" + no,
				type: 'PATCH',
				contentType: "application/json; charset=utf-8",
				dataType: 'json',
				cache: false,
				data: JSON.stringify(data),
				success: function(data) {
					alert("수정 완료");
					window.location.href = contextPath + "/movieManager";
				},
				error: function(data, status, error){
					alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
					window.location.href = contextPath + "/movieManager";
				}
			});
			
			let formData = new FormData();
			let fileInput = $('input[name="uploadFile"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];
			
			formData.append("uploadFile", fileObj);
			/*파일 input이 multiple라면 
			for(let i = 0; i < fileList.length; i++){
				formData.append("uploadFile", fileList[i]);
			} */
			
			/* console.log("fileList : " + fileList);
			console.log("fileObj : " + fileObj);
			console.log("fileName : " + fileObj.name);
			console.log("fileSize : " + fileObj.size);
			console.log("fileType(MimeType) : " + fileObj.type)  */
			
			$.ajax({
				url: contextPath + '/api/uploadAjaxAction',
				processData: false,
				contentType: false,
				data: formData,
				type: 'POST',
				dataType: 'json',
				success: function(result){
					console.log(result);
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
  	<h1>영화관리</h1>
         <div class="col-md-6 col-sm-12">
            <div class="form">
               <form:form>
               	  <div class="form-group">
                     <label>번호</label>
                     <input type="text" id="no" class="form-control" readonly="readonly">
                  </div>
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
                     	<option selected disabled hidden="">등급 선택</option>
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
                     <label>파일 첨부</label>
                     <input type="file" id="uploadFile" name="uploadFile" class="form-control">
                  </div>
               </form:form>
                  <button id="modify" class="btn btn-primary">수정</button>
                  <button id="cancel" class="btn btn-primary">취소</button>
            </div>
         </div>
      </div>
</div>
</body>
</html>