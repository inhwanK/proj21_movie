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
                     <label>내용</label>
                     <input type="text" id="genre" class="form-control">
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