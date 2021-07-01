<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 등록</title>
<%-- <link rel="stylesheet" href="${contextPath}/resources/css/notice/newlayout.css"> --%>
<link rel="stylesheet" href="${contextPath}/resources/css/inquiry/inquirySuccess.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" >
</head>
<body>

	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<section>
		<div class="con_main">
			<img id="con_img" alt="축하이미지" src="${contextPath}/resources/images/join/icon-movie.png">
			<div class="con_text">
				
				<h2>감사합니다.<br>더 나은 박스무비가 되겠습니다.</h2>
				<a href="${contextPath}/main"><input class="btn_main" id="button" type="submit" value="메인으로 돌아가기"/></a>
			</div>
		</div>
	</section>	
	
	<%@include file="/WEB-INF/view/footer.jsp"%>

</body>
</html>