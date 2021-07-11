<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정/탈퇴</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/checkpassword.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	<!-- 취소버튼 -->
	$('#cancel').click(function(){
    	var contextPath = "<%=request.getContextPath()%>";
		location.href = contextPath + "/mypage";
	});
	
<%-- 	<!-- 비밀번호 체크 -->
	$('#confirm').click(function(){
		var contextPath = "<%= request.getContextPath()%>";
		var memberpass = $('#memPasswd').val();		
		var data = {memPasswd : memberpass};	
		
		$.ajax({
			url 		:  contextPath + "/api/passCheck",
			type 		: "post",
            contentType : "application/json; charset=utf-8",
            datatype    : "json",
            cache       : false,
            data        : JSON.stringify(data),
			success : function(result){
				if(result != 'fail'){
					return "mypage/myinfo";	
								
				} else {
					alert("비밀번호를 다시 확인해 주세요.");
					return "mypage/chkPassword";
				}					
			}
		});	
	}); --%>
});
</script>
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<!-- section -->
	<section>
		<div id="container">
		
			<!-- 메뉴바 -->
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
			
			<!-- 본문 -->
			<div id="myinfo-wrap">
				<form action="myinfo" method="post">
				<div id="textarea">
					<h2>개인정보 수정</h2>
					<span>
						     개인정보 수정을 위해서는 비밀번호가 필요합니다.<br>
						  ${member.memName } 회원님의 개인정보 보호를 위해 비밀번호를 한 번 더 입력해주세요.
					</span>
				</div>
				
				<div id="input">
					<input type="hidden" name="memEmail" value="${member.memEmail}"><br>
					<input type="password" name="conmemPasswd" placeholder="박스무비 로그인 시 사용하시는 비밀번호를 입력해주세요." required>
				</div>
				
				<div id="button-group">
					<input class="btn" type="button" value="취소" id="cancel" /> 
					<input class="btn" type="submit" value="확인" id="confirm" /> 
				</div>
				</form>
			</div>	
		</div>
	</section>
	
	<!-- footer -->
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>