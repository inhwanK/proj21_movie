<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>한줄평 내역</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/comment.css">
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
			
			<div id="comment-wrap">
					<h2>한줄평 내역</h2>
					<div id="comment-count">
						<strong>총 1건</strong>
					</div>
					<ul>
						<li>
							<div class="comment-list">
								<img alt="포스터사진" src="<%=request.getContextPath()%>/resources/images/stillcut1.jpg">
								<div class="textarea">
									<h3>크루엘라</h3>
									<p>2021-06-08</p>
									<p>재밌다...재밌다....재밌다....재ㅣㅅ다...</p>
								</div>
							</div>
						</li> 
					</ul>
			</div>
		</div>
		
	</section>

	<%@include file="/WEB-INF/view/footer.jsp"%>
	
</body>
</html>