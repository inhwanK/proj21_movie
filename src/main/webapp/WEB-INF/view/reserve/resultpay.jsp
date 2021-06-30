<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
<link rel="stylesheet" href="${contextPath}/resources/css/reserve/resultpay.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
</head>
<body>
	<header>
		<img id="header_ci" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png">
		<div>
			<a href="#">로그인</a>
			<a href="#">회원가입</a>
			<a href="#">바로예매</a>
		</div>
	</header>

	<nav>
		<ul>
			<li class="nav"><a href="${contextPath}/movielist">영화</a></li>
			<li class="nav"><a href="${contextPath}/reserve">예매</a></li>
			<li class="nav"><a href="${contextPath}/theaterlist">극장</a></li>
			<li class="nav"><a href="#">이벤트</a></li>
			<li class="nav"><a href="${contextPath}/noticelist">고객센터</a></li>
			<li id="mypagebtn"><a href="${contextPath}/mypage"><i class="far fa-user"></i></a></li>
		</ul>
	</nav>
	
	<section>
		<h2 id="menu-title">바로예매</h2>
			<div id="menubar">
				<ul>
					<li>인원 / 좌석</li>
					<li>결제</li>
					<li id="selected">결제완료</li>
				</ul>
			</div>

		<div id="container">
			<h2 id="title">결제 완료</h2>
			<h1>예매가 완료되었습니다.</h1>
			<div id="table-div">
				<table id="result-table">
					<tr>
						<td class="info">영화명</td>
						<td class="result">크루엘라</td>
					</tr>
					<tr>
						<td class="info">영화관</td>
						<td class="result">대구이시아</td>
					</tr>
					<tr>
						<td class="info">관람일시</td>
						<td class="result">2021년06월30일 10:00:00</td>
					</tr>
					<tr>
						<td class="info">관람인원</td>
						<td class="result">성인1명, 청소년1명</td>
					</tr>
					<tr>
						<td class="info">선택좌석</td>
						<td class="result">A1 A2</td>
					</tr>
					<tr>
						<td class="info">결제금액</td>
						<td class="result">20000 원</td>
					</tr>
					<tr>
						<td class="info">예매일</td>
						<td class="result">2021년06월30일 14:00:00</td>
					</tr>
				</table>
			</div>
		</div>
	</section>
	
	<footer>
		<div id="content">
			<img id="footer_ci" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png">
			<div id="textarea">
				<p>COPYRIGHT © BoxMovie, Inc. All rights reserved</p>
				<p>대구광역시 서구 서대구로 7길2 (내당동 245-4번지 2층) ARS 053-555-1333</p>
			</div>
		</div>
	</footer>
</body>
</html>