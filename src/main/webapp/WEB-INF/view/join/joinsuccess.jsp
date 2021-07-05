<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/join/joinsuccess.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<!-- section -->
	<section>
		<div class="con_main">
			<img id="con_img2" alt="축하이미지" src="${contextPath}/resources/images/join/icon-movie.png">
			<div class="con_text">
				<img id="con_img1" alt="크래커" src="${contextPath}/resources/images/join/fire-cracker.png">
				<h2>가입해 주셔서 감사합니다!</h2>
				<a href="${contextPath}/main"><input class="btn_main" id="button" type="submit" value="메인으로 돌아가기"/></a>
				<a href="${contextPath}/login"><input class="btn_login" id="button" type="submit" value="로그인"/></a>
			</div>
		</div>
	</section>
	
	<!-- footer -->	
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>