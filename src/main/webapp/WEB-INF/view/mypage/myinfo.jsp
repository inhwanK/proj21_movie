<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/myinfo.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	<!-- 휴대폰번호 서식 지정 -->
	$('#memPhone').keydown(function(event) {
	    var key = event.charCode || event.keyCode || 0;
	    $text = $(this);
	    if (key !== 8 && key !== 9) {
	        if ($text.val().length === 3) {
	            $text.val($text.val() + '-');
	        }
	        if ($text.val().length === 8) {
	            $text.val($text.val() + '-');
	        }
	    }
	    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
	});
	
	<!-- 취소버튼 -->
	$('#cancel').click(function(){
    	var contextPath = "<%=request.getContextPath()%>";
		location.href = contextPath + "/mypage";
	});
			
	<!-- 비밀번호 찾기 -->
	$(".pwchange").click(function(){
		var contextPath = "<%=request.getContextPath()%>";
		
		function PopupCenter(url, title, w, h) { 
	        var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;  
	        var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;  
	                  
	        width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;  
	        height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;  
	                  
	        var left = ((width / 2) - (w / 2)) + dualScreenLeft;  
	        var top = ((height / 2) - (h / 2)) + dualScreenTop;  
	        var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);  
	      
	        if (window.focus) {  
	            newWindow.focus();  
	        }  
	    } 				    
	    PopupCenter(contextPath + "/find_PW_change",'popup','313','420');
	});
});
</script>
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<section>
		<div id="container">
		
			<!-- 메뉴바 -->
			<div id="mypage-menubar">
				<ul>
					<li><a href="${contextPath}/mypage"><h2>My Page</h2></a></li>
					<li><a href="${contextPath}/reserveInfo">예매내역</a></li>
					<li><a href="${contextPath}/commentInfo">한줄평 내역</a></li>
					<li><a href="${contextPath}/inquiryInfo">1대1 문의 내역</a></li>
					<li class="active-menu"><a href="${contextPath}/myinfo">개인정보 수정</a></li>
					<li><a href="${contextPath}/withdrawal">회원탈퇴</a></li>
				</ul>
			</div>
			
			<!-- 수정페이지 -->
			<form action="/myinfo/info.set" method="POST" class="content" id="form1">
				<div id="myinfo-wrap">
					<h2>개인정보 수정</h2>
				
					<div>
						<h3>기본정보</h3>
						<table id="myinfo-table" class="myinfo">
							<tr>
								<th>아이디</th>
								<td>
									<input type="email" name="memEmail" value="${member.memEmail}" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<input type="text" name="memName" value="${member.memName}" required> 
									<br>※ 개명으로 이름이 변경된 경우, 회원정보의 이름을 변경하실 수 있습니다.
								</td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td>
									<input type="date" name="memBirthdate" value="${member.memBirthdate}" required>
								</td>
							</tr>						
							<tr>
								<th>휴대폰</th>
								<td>
									<input type="text" id="memPhone" value="${member.memPhone}" maxlength="13" required>
								</td>
							</tr>						
							<tr>
								<th>비밀번호</th>
								<td>
									<input type="password" id="memPasswd" required>
									<input class="pwchange" type="button" value="비밀번호 변경" /> 
									<br>※ 개인정보 수정 후 반드시 비밀번호를 다시 입력해 주시기 바랍니다.
								</td>
							</tr>
						</table>
					
						<div id="button-group">
							<input class="btn1" type="button" value="취소" id="cancel" /> 
							<input class="btn2" type="submit" value="수정" id="confirm" />
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>

	<!-- footer -->
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>