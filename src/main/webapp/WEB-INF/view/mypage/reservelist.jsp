<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예매내역</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/reservelist.css">
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
			
			<div id="reserve-wrap">
				<!-- <div id="reserve-history">
					<h2>예매내역</h2>
					<ul id="reserve-list">
						<li>예매 내역이 없습니다.</li>
					</ul>
				</div> -->
				<h2>예매 내역</h2>
					<div id="reserve-count">
						<strong>총 1건</strong>
					</div>
					<ul>
						<li>
							<div class="reserve-list">
								<img alt="포스터사진" src="<%=request.getContextPath()%>/resources/images/stillcut1.jpg">
								<div class="textarea">
									<h3>영화제목</h3>
									<p>영화관</p>
									<p>상영일/상영시간</p>
									<p>인원</p>
									<p>결제금액</p>
									<p>예매일</p>
								</div>
							</div>
						</li> 
						<li>
							<div class="reserve-list">
								<img alt="포스터사진" src="<%=request.getContextPath()%>/resources/images/stillcut1.jpg">
								<div class="textarea">
									<h3>영화제목</h3>
									<p>영화관</p>
									<p>상영일/상영시간</p>
									<p>인원</p>
									<p>결제금액</p>
									<p>예매일</p>
								</div>
							</div>
						</li> 
					</ul>
				
				<div id="desc">
					<h3>예매 유의사항</h3>
					<p>01. 영화 상영 시간표는 영화관 사정에 의해 변경될 수 있습니다.</p>
					<p>02. 온라인 예매 및 취소는 영화 상영시작 시간 20분 전까지 가능합니다.</p>
				</div>
			</div>
		</div>
	</section>
	
	<%@include file="/WEB-INF/view/footer.jsp"%>

</body>
</html>