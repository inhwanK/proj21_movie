<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/login/loginsuccess.css">
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
				<h3>반갑습니다! ${member.memName} 회원님, 로그인 되셨습니다.</h3>
				<a href="${contextPath}/main"><input class="btn_main" id="button" type="submit" value="메인으로 돌아가기"/></a>
				<a href="${contextPath}/mypage"><input class="btn_mypage" id="button" type="submit" value="마이페이지"/></a>
			</div>
		</div>
	</section>
	
	<!-- footer -->	
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>