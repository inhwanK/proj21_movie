<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전체 극장 리스트</title>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<link rel="stylesheet" href="${contextPath}/resources/css/theater/theaterList.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var contextPath = "${contextPath}";
			$.get(contextPath + "/api/theaters",
				function(json) {
					var dataLength = json.length;
					if (dataLength >= 1) {
						var list = "";
						for (i = 0; i < dataLength; i++) {
							list += "<li>";
							list += "<a href='${contextPath}/theater?thtNo=" + json[i].thtNo 
								+ "' title='" + json[i].thtName + " 상세보기'>" + json[i].thtName + "</a>"; 
							list += "</li>";						
						}
						$(".theater-list ul").append(list);
					}
				});		
		});	
	</script>
</head>
<body>	
	<header>
		<a href="main" title="박스무비 메인으로 가기">
			<img id="header_ci" alt="브랜드 로고" src="${contextPath}/resources/images/theater/ci.png">
		</a>
		<div>
			<a href="${contextPath}/login">로그인</a>
			<a href="${contextPath}/join">회원가입</a>
			<a href="#">바로예매</a>
		</div>

	</header>
	
	<nav>
		<ul>
			<li class="nav"><a href="${contextPath}/movielist">영화</a></li>
			<li class="nav"><a href="${contextPath}/reserve">예매</a></li>
			<li class="nav"><a href="${contextPath}/theaterlist">극장</a></li>
			<li class="nav"><a href="${contextPath}/inquiry">이벤트</a></li>
			<li class="nav"><a href="${contextPath}/noticelist">고객센터</a></li>
			<li id="mypagebtn"><a href="#"><i class="far fa-user"></i></a></li> <!-- mypage 연결 필요 -->
		</ul>
	</nav>
	
	<section>
		<div class="container">
	    	<div class="page-util">	
				<div class="location">
	    			<span></span>
	    			<a href="" title="극장 페이지로 이동">극장</a>
	    			<a href="" title="전체극장 페이지로 이동">전체극장</a>
	    		</div>
	    	</div>
	    	
	    	<div class="contents">
	    		<div class="inner-wrap">
	    			<h2 class="title">전체극장</h2>
	    				
	    				<!-- 전체극장 리스트 -->
			     		<div class="theater-box">
							<div class="theater-place">
								<ul>
									<li class="active">
										<button type="button" class="sel-city">대구</button>
										<div class="theater-list">
											<ul>																					
											</ul>
										</div>
									</li>
								</ul>
							</div>
						</div>
						
	    		</div>
	    	</div>
		</div>
	</section>
	
	<footer>
		<div id="content">
			<img id="footer_ci" alt="브랜드 로고" src="<%=request.getContextPath()%>/resources/images/ci.png">
			<div id="textarea">
				<p>COPYRIGHT © BoxMovie, Inc. All rights reserved</p>
				<p>대구광역시 서구 서대구로 7길2 (내당동 245-4번지 2층) ARS 053-555-1333</p>
			</div>
		</div>
	</footer>
</body>
</html>