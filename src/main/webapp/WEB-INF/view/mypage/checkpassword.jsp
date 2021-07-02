<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정/탈퇴</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/checkpassword.css">
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
					<li><a href="${contextPath}/chkPassword">개인정보 수정</a></li>
					<li><a href="${contextPath}/withdrawal">회원탈퇴</a></li>
				</ul>
			</div>
			
			<div id="myinfo-wrap">
				<div id="textarea">
					<h2>개인정보 수정</h2>
					<p>회원님의 개인정보 보호를 위해 비밀번호를 입력해야 합니다.</p>
					<p>박스무비 로그인 시 사용하는 비밀번호를 입력해주세요.</p>
				</div>
				
				<div id="input">
					<input type="password">
				</div>
				
				<div id="button-group">
					<span id="cancel">취소</span>
					<span id="confirm">확인</span>
				</div>
			</div>
		</div>
		
	</section>

	<%@include file="/WEB-INF/view/footer.jsp"%>
	
	<script type="text/javascript">
		$(function(){
			$('#cancel').on('click', function(e){
				window.history.back();
			});
		});
	</script>
</body>
</html>