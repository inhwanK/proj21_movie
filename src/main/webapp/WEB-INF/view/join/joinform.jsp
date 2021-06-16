<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${contextPath}/resources/css/join/joinform.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){
		<!-- 비밀번호 일치 확인 -->
		$('.box2').focusout(function () {
	        var pwd1 = $("#memPasswd").val();
	        var pwd2 = $("#confmemPasswd").val();
	  
	        if ( pwd1 != '' && pwd2 == '' ) {
	            null;
	        } else if (pwd1 != "" || pwd2 != "") {
	            if (pwd1 == pwd2) {
	            $("#alert-success").css('display', 'inline-block'); 
	            $("#alert-danger").css('display', 'none');  
	            } else {
	                $("#alert-success").css('display', 'none'); 
	                $("#alert-danger").css('display', 'inline-block');
	            }
	        }
	    });
	});
</script>
</head>
<body>

	<header>
		<a href="main" title="박스무비 메인으로 가기"> <img id="header_ci"
			alt="브랜드 로고" src="${contextPath}/resources/images/movie/ci.png">
		</a>
		<div>
			<a href="${contextPath}/login">로그인</a> <a href="${contextPath}/join">회원가입</a>
			<a href="#">바로예매</a>
		</div>

	</header>

	<nav>
		<ul>
			<li class="nav"><a href="${contextPath}/movielist">영화</a></li>
			<li class="nav"><a href="${contextPath}/reserve">예매</a></li>
			<li class="nav"><a href="${contextPath}/theaterlist">극장</a></li>
			<li class="nav"><a href="#">이벤트</a></li>
			<li class="nav"><a href="#">고객센터</a></li>
			<li id="mypagebtn"><a href="#"><i class="far fa-user"></i></a></li>
			<!-- mypage 연결 필요 -->
		</ul>
	</nav>

	<section>
		<h1 class="join_title">회원가입</h1>
		<form action="joinsuccess" method="post">
			<div class="join_main">
				<ul class="ul">
					<li class="li">
						<span>아이디 </span> 
						<br> 
						<input type="email" placeholder="메일주소를 입력하세요" class="box1" id="memEmail" required />
					</li>
					<li class="li">
						<span>패스워드 </span> 
						<br> 
						<input type="password" placeholder="패스워드를 입력하세요" class="box2" id="memPasswd" required />
					</li>
					<li class="li">
						<span>패스워드 확인 </span> 
    					<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
    					<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
						<br> 
						<input type="password" placeholder="패스워드를 한번 더 입력하세요" class="box2" id="confmemPasswd" required />
					</li>
					<li class="li">
						<span>이름 </span> 
						<br> 
						<input type="text" placeholder="이름을 입력하세요" id="memName" class="box1" required />
					</li>
					<li class="li">
						<span>생년월일 </span> 
						<br> 
						<input type="date" placeholder="생년월일을 입력하세요." id="memBirthdate" class="box1" required />
					</li>
					<li class="li">
						<span>휴대폰번호 </span> 
						<br> 
						<input type="text" placeholder="휴대폰번호를 입력하세요" id="memPhone" class="box1" required />
					</li>
					<li class="li">
						<button id="new">가입하기</button>
					</li>
				</ul>
			</div>
		</form>
	</section>

	<footer>
		<div id="content">
			<img id="footer_ci" alt="브랜드 로고"
				src="${contextPath}/resources/images/ci.png">
			<div id="textarea">
				<p>COPYRIGHT © BoxMovie, Inc. All rights reserved</p>
				<p>대구광역시 서구 서대구로 7길2 (내당동 245-4번지 2층) ARS 053-555-1333</p>
			</div>
		</div>
	</footer>
</body>
</html>