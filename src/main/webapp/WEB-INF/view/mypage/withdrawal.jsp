<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원탈퇴</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/withdrawal.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet"> <!-- fontawesome 링크 -->
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
			
			<div id="mypage-wrap">
				<h2>회원탈퇴</h2>
				<div id="textarea">
					<i class="fas fa-square"></i>
					<h3>유의사항</h3>
					<p>사용하신 계정은 회원 탈퇴 후 복구가 불가합니다.</p>
					<p>탈퇴 후 회원정보가 모두 삭제됩니다.</p>
	 			 	<p>예매내역, 메일주소, 핸드폰 번호/기타 연락처 등 회원정보가 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</p>
 			 	</div>
 			 	
 			 	<div id="passwordarea">
 			 		<label>비밀번호</label>
 			 		<input type="password">
 			 		<br>
 			 		<label>비밀번호 확인</label>
 			 		<input type="password">
 			 	</div>
 			 	
 			 	<div id="button-group">
 			 		<span id="cancel">취소</span>
					<span id="delete">탈퇴</span>
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