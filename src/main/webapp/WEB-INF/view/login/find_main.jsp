<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>아이디 또는 패스워드 찾기</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/login/find_main.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	<!-- 아이디 찾기 -->
	$(".btn_id").click(function(){
		var contextPath = "<%=request.getContextPath()%>";
		window.open(contextPath + "/find_ID","popup","width=313, height=400, left=650, top=200")
	});
	
	<!-- 비밀번호 찾기 -->
	$(".btn_pw").click(function(){
		var contextPath = "<%=request.getContextPath()%>";
		window.open(contextPath + "/find_PW","popup","width=313, height=420, left=650, top=200")
	});
});
</script>
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<!-- section -->
	<section>
		<div class="find_m">
			<img id="find_account" alt="안내이미지" src="${contextPath}/resources/images/login/info.png">
			<h3>이메일 또는 패스워드 찾기를 선택해 주세요</h3>
			<input class="btn_id" id="button" type="submit" value="이메일 찾기"/></a>
			<input class="btn_pw" id="button" type="submit" value="패스워드 찾기"/></a>
		</div>
	</section>
	
	<!-- footer -->	
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>