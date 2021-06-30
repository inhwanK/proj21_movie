<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/myinfo.css">
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
				<h2>개인정보 수정</h2>
				
				<div>
					<h3>기본정보</h3>
					<table id="myinfo-table" class="myinfo">
						<tr>
							<th>이름</th>
							<td>
								test &nbsp;&nbsp;
								<span>이름 변경하기</span> &nbsp;&nbsp;
								※ 개명으로 이름이 변경된 경우, 회원정보의 이름을 변경하실 수 있습니다.
							</td>
						</tr>
						
						<tr>
							<th>생년월일</th>
							<td>1990년 01월 01일</td>
						</tr>
						
						<tr>
							<th>휴대폰</th>
							<td>
								010-1234-1234 &nbsp;&nbsp;
								<span>휴대폰번호 변경하기</span>
							</td>
						</tr>
						
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" value="test@test.com">
							</td>
						</tr>
						
						<tr>
							<th>비밀번호</th>
							<td><span>비밀번호 변경</span></td>
						</tr>
					</table>
					
					<div id="button-group">
						<span><a herf="#">취소</a></span>
						<span id="confirm"><a herf="#">등록</a></span>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="/WEB-INF/view/footer.jsp"%>
	
</body>
</html>