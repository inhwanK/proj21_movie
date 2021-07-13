<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/mypage/mypage.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
</head>
<body>

	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<section>
		<div id="container">
			<div id="mypage-menubar">
				<ul>
					<li><a href="${contextPath}/mypage"><h2>My Page</h2></a></li>
					<li><a href="${contextPath}/reserveInfo">예매내역</a></li>
					<li><a href="${contextPath}/commentInfo">한줄평 내역</a></li>
					<li><a href="${contextPath}/inquiryInfo">1대1 문의 내역</a></li>
					<li><a href="${contextPath}/myinfo">개인정보 수정</a></li>
					<li><a href="${contextPath}/withdrawal">회원탈퇴</a></li>
				</ul>
			</div>
			
			<div id="mypage-wrap">
				<div id="user-info">
					<div id="profile">
						<img alt="프로필사진" src="${contextPath}/resources/images/profile-photo.png">
						<div id="textbox">
							<c:if test = "${member != null }">
								<p id="user">${member.memName } 님,</p>
								<p id="welcome">환영합니다.</p>
							</c:if>
						</div>
					</div>
					
					<a href="${contextPath}/myinfo">개인정보 수정</a>
				</div>
				
				<!-- <div id="reserve-history">
					<h2>예매내역</h2>
					<ul id="reserve-list">
						<li>예매 내역이 없습니다.</li>
					</ul>
				</div>

				<div id="qna-history">
					<h2>문의내역</h2>
					<ul id="qna-list">
						<li>예매 내역이 없습니다.</li>
					</ul>
				</div> -->
			</div>
		</div>
		
	</section>

	<%@include file="/WEB-INF/view/footer.jsp"%>
	
</body>
</html>