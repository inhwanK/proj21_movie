<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
<script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
	<header>
		<c:if test = "${member == null }">
		<a href="${contextPath}/main"> <img id="header_ci" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png"></a>
		</c:if>
		<c:if test = "${member != null }">
		<a href="${contextPath}/main"> <img id="header_ci2" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png"></a>
		</c:if>
		<div>
		<!-- 관리자가 로그인하지 않은 상태 -->
		<c:if test = "${admin == null }">
			<!-- 로그인 하지 않은 상태 -->
        	<c:if test = "${member == null }">
				<a href="${contextPath}/login">로그인</a> <a href="${contextPath}/join">회원가입</a>
				<a href="${contextPath}/reserve">바로예매</a>
			</c:if>
			
			<!-- 로그인한 상태 -->
        	<c:if test="${ member != null }">
            	<div class="login_success_area">
            		<span>안녕하세요. ${member.memName} 회원님!</span>
            		<a href="${contextPath}/main.do">로그아웃</a>
            		<a href="${contextPath}/reserve">바로예매</a>
            	</div>
        	</c:if>
   		</c:if>
   		<!-- 관리자가 로그인하지 않은 상태 -->
		<c:if test = "${admin != null }">
			<div class="admin_success_area">
            	<span>안녕하세요. ${admin.admId} 회원님!</span>
            	<a href="${contextPath}/main.do">로그아웃</a>
            	<a href="${contextPath}/movieManager">관리페이지</a>
            </div>
		</c:if>
		</div>
	</header>
	<nav>
		<ul>
			<li class="nav"><a href="${contextPath}/movielist">영화</a></li>
			<li class="nav"><a href="${contextPath}/reserve">예매</a></li>
			<li class="nav"><a href="${contextPath}/theaterlist">극장</a></li>
			<li class="nav"><a href="${contextPath}/noticelist">고객센터</a></li>
			<li id="mypagebtn"><a href="${contextPath}/mypage" id="to-mypage"><i class="far fa-user"></i></a></li>
		</ul>
	</nav>
	
	<script type="text/javascript">
		$(function(){
			var contextPath = "${contextPath}";
			$('#to-mypage').on('click', function(e){
				if(${member == null}) {
					e.preventDefault();
					//alert("회원 로그인이 필요합니다.");
					//window.location.href = contextPath + "/login";
					Swal.fire({				// Alert창 디자인 sweetalert2
		                icon : 'error',
		                title: '회원 로그인이 필요합니다.'
		            }).then((result) => {
						if (result.isConfirmed) {
							window.location.href = contextPath + "/login";
						}
		            });
				}
			});
		});
	</script>
</body>
</html>