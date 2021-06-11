<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1대1 문의 내역</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/inquiry.css">
</head>
<body>
	<header>
		<img id="header_ci" alt="브랜드 로고" src="<%=request.getContextPath()%>/resources/images/ci.png">
		<div>
			<a href="#">로그인</a>
			<a href="#">회원가입</a>
			<a href="#">바로예매</a>
		</div>

	</header>
	
	<nav>
		<ul>
			<li class="nav"><a href="#">영화</a></li>
			<li class="nav"><a href="#">예매</a></li>
			<li class="nav"><a href="#">극장</a></li>
			<li class="nav"><a href="#">이벤트</a></li>
			<li class="nav"><a href="#">고객센터</a></li>
			<li id="mypagebtn"><a href="#"><i class="far fa-user"></i></a></li>
		</ul>
	</nav>
	
	
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
			
			<div id="inquiry-wrap">
				<h2>1대1 문의 내역</h2>
				<div id="inquiry-content">
					<div id="inquiry-count">
						<strong>전체(2건)</strong>
					</div>
					<div id="inquiry-list">
						<table id="inquiry-table">
							<tr>
								<th>번호</th>
								<th>작성자</th>
								<th>제목</th>
								<th>문의일</th>
								<th>답변상태</th>
							</tr>
							<tr>
								<td>1</td>
								<td>test</td>
								<td>문의합니다.</td>
								<td>20210607</td>
								<td>X</td>
							</tr>
							<tr>
								<td>2</td>
								<td>test2</td>
								<td>문의혀요...</td>
								<td>20210608</td>
								<td>X</td>
							</tr>
						</table>
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