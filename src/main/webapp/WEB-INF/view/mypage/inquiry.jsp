<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1대1 문의 내역</title>
	<link rel="stylesheet" href="css/inquiry.css">
</head>
<body>
	<header>
		<img id="header_ci" alt="브랜드 로고" src="img/ci.png">
		<div>
			<a href="#">로그인</a>
			<a href="#">회원가입</a>
			<a href="#">바로예매</a>
		</div>

	</header>
	
	<nav>
		<ul>
			<li><a href="#">영화</a></li>
			<li><a href="#">예매</a></li>
			<li><a href="#">극장</a></li>
			<li><a href="#">이벤트</a></li>
			<li><a href="#">고객센터</a></li>
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
		<div>
			<img id="footer_ci" alt="브랜드 로고" src="img/ci.png">
			<p>
			제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다.
			<br>
			재판의 전심절차로서 행정심판을 할 수 있다. 행정심판의 절차는 법률로 정하되, 사법절차가 준용되어야 한다.
			</p>
		</div>
	</footer>
	

</body>
</html>