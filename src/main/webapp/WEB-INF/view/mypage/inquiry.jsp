<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1대1 문의 내역</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/inquiry.css">
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

	<%@include file="/WEB-INF/view/footer.jsp"%>

</body>
</html>