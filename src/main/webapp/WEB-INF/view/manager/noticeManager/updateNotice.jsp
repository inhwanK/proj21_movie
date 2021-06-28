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
		console.log(contextPath);
		var notNo = "${notNo}"; 
		console.log(notNo);
		$("#no").attr('value',notNo);
		
		$.ajax({
			url: contextPath + "/api/notice?notNo="+notNo,
			type:"get",
			contentType:"application/json; charset=utf-8",
			dataType:"json",
			success:function(json){
				$("#no").attr('value',json.notNo);
				$("#regdate").attr('value',json.notDate);
				$("#title").attr('value',json.notTitle);
				$("#content").empty();
				$("#content").append(json.notDetail);
				
				// 파일 다운로드 구현해야함.
			},
			error:function(){
				alert("뭔가 잘못되긴 했어용");
			}
		}); 
		
		$("#modify").on('click', function(){
			var data ={
				notNo: $("#no").val(),
				notTitle: $("#title").val(),
				notDetail: $("#content").val(),
				// date 이슈 발생.
				notFile: null
			}
			
			$.ajax({
				url:contextPath+"/api/notice",
				type:"patch",
				dataType:"json",
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				success: function(json){
					alert(JSON.stringify(data)+"수정이 완료되었습니다.");
					//목록 페이지로 이동.
				},
				error: function(){
					alert("뭔가 잘못된 것이 분명합니다.");	
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
                     <input type="text" id="no" value="231231" class="form-control" readonly="readonly">
                  </div>
                   <div class="form-group">
                     <label>등록일</label>
                     <input type="text" id="regdate" class="form-control" readonly="readonly">
                  </div>
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
               </form:form>
                  <button id="modify" class="btn btn-primary">수정</button>
                  <button id="cancel" class="btn btn-primary">취소</button>
            </div>
         </div>
      </div>
</div>
</body>
</html>