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
<link rel="stylesheet" href="${contextPath}/resources/css/manager/additional.css">
<script type="text/javascript">
	$(function(){
		$("textarea").empty(); // 왠지 모르겠지만 페이지 띄울 때 textarea가 띄어쓰기가 되어있음.
		
		var contextPath = "${contextPath}";
		console.log(contextPath);
		
		var fileName;
		
		// 등록 버튼
		$("#regist").on('click', function(){
			
			if($("#title").val() == ""){
				alert("제목을 입력하세요.");
				return;
			}else if($("#content").val() == ""){
				alert("내용을 입력하세요.");
				return;
			}
			
			var conf = confirm("등록하시겠습니까?");
			if(conf){
				
				// 파일 이름 뽑기.
				if($("#uploadFile").val() != ""){
					var filePath = $("#uploadFile").val().split('\\');
					fileName = filePath[filePath.length - 1];
				
				
					// 파일 업로드 
					var formData = new FormData();
					var inputFile = $("input#uploadFile");
					var files = inputFile[0].files;
					console.log(files);
					
					for(var i=0; i<files.length; i++){
						formData.append("uploadFile", files[i]);
					}
		
					$.ajax({
						url:contextPath+"/api/noticeFileUpload",
						processData:false,
						contentType:false,
						data:formData,
						type:"POST",
						success:function(result){
							console.log("Uploaded");
						}
					});
				}
				

				var data ={
					notTitle: $("#title").val(),
					notDetail: $("#content").val(),
					notFile: fileName // 파일이름 저장.
				}
					
				// 공지사항 등록.
				$.ajax({
					url:contextPath+"/api/notice",
					type:"post",
					dataType:"json",
					data:JSON.stringify(data),
					contentType:"application/json; charset=utf-8",
					success: function(json){
						alert("등록이 완료되었습니다.");
						window.location.href = contextPath + "/noticeManager";
					},
					error: function(){
						alert("뭔가 잘못된 것이 분명합니다.");	
					}
				});
			}
		});
		
		// 취소 버튼
		$("#cancel").on('click', function(){
			window.location.href = contextPath + "/noticeManager";
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
  	<h1 class="text-center">공지사항</h1>
         <div class="col-md-6 col-sm-12" id="contents">
            <div class="form">
               	  
                  <div class="form-group">
                     <label>제목</label>
                     <input type="text" id="title" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>내용</label>
                     <textarea rows="10" cols="500" id="content" class="form-control">
                     </textarea>
                  </div>
                  <div class="form-group">
					<label>파일 첨부</label>
					<input type="file" id="uploadFile" name="uploadFile" class="form-control">
				  </div>
				  
				  
               <div id="btn">
                  <button id="regist" class="btn btn-primary">등록</button>
                  <button id="cancel" class="btn btn-primary">취소</button>
               </div>
            </div>
         </div>
      </div>
</div>
</body>
</html>