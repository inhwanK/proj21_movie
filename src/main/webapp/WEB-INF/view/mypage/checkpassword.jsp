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
					<li><a href="#"><h2>My Page</h2></a></li>
					<li><a href="#">예매내역</a></li>
					<li><a href="#">한줄평 내역</a></li>
					<li><a href="#">1대1 문의 내역</a></li>
					<li><a href="#">개인정보 수정</a></li>
					<li><a href="#">회원탈퇴</a></li>
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
					<span><a herf="#">취소</a></span>
					<span id="confirm"><a herf="#">확인</a></span>
				</div>
			</div>
		</div>
		
	</section>

	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>