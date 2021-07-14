<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>약관동의</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/join/join.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script>
		/* 약관에 체크가 안되어있으면 알림창 띄우기 */
		$(function(){
			$(document).on('click', '[class=btn_joinform]', function(){
		        if ($("input:checkbox[class='chbox1']").is(":checked") != true) {
		        	// alert("이용약관에 동의해 주세요.");
		        	Swal.fire({				// Alert창 디자인 sweetalert2
		                icon : 'warning',
		                title: '이용약관에 동의해 주세요.'
		            });
		        	return false;
		        }
			});
	    });
</script>
</head>
<body>
	<!-- header -->
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<!-- section -->
	<section id="joinFormArea">
		<br>
		<h1 class="join_title">회원가입</h1>
		<ul class="join_box">
			<li>
				<h2>회원약관</h2>
				<p>박스무비는 「개인정보보호법」 제15조제1항제1호, 제17조제1항제1호, 제23조제1호, 제24조제1항 제1호에 따라
				 아래와 같이 개인정보의 수집. 이용에 관하여 귀하의 동의를 얻고자 합니다.</p>
				<p>박스무비는 이용자의 사전 동의 없이는 이용자의 개인정보를 함부로 공개하지 않으며, 수집된 정보는 아래와 같이 이용하고 있습니다.
				이용자가 제공한 모든 정보는 아래의 목적에 필요한 용도 이외로는 사용되지 않으며 이용 목적이 변경될 시에는 이를 알리고 동의를 구할 것입니다.</p>
				<h2>개인정보의 수집 및 이용 동의</h2>
				<h4>1. 개인정보의 수집 및 이용 목적</h4>
				<p>가. 서비스 제공에 관한 업무 이행 - 컨텐츠 제공, 특정 맞춤 서비스 제공(마이페이지, 뉴스레터 등), 기업 애로상담 </p>
				<p>나. 회원관리</p>
				<p>- 회원제 서비스 이용 및 제한적 본인 확인제에 따른 본인확인, 개인식별, 가입의사 확인, 가입 및 가입횟수 제한, 추후 법정 대리인 본인확인, 
				분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 공지사항 전달</p>
				<h4>2. 수집하는 개인정보의 항목</h4>
				<p>개인회원 가입
				필수항목 : 아이디, 비밀번호, 이름, 핸드폰번호, 이메일, 암호화된 이용자 확인값(CI)
				선택항목 : 이메일 수신여부, 문자수신여부, 웹진구독여부
				기업회원 가입
				필수항목 : 아이디, 비밀번호, 담당자 이름, 담당자 전화번호, 핸드폰번호, 이메일, (법인기업의 경우 법인등록번호), 
				기업정보(회사명, 대표자명, 사업자등록번호, 회사전화번호, 주소, 지역, 대표업종), 암호화된 이용자 확인값(CI)
				선택항목 : 팩스번호, 홈페이지주소, 회사이메일주소, 창업일자, 부업종, 매출액, 수출액, 상시근로자 수, 주요생산품명, 
				이메일 수신여부, 문자수신여부, 이메일 수신여부, 문자수신여부, 웹진구독여부
				자동수집
				IP주소, 쿠키, 서비스 이용기록, 방문기록 등</p>
				<h4>3. 개인정보의 보유 및 이용기간</h4>
				<p>박스무비은 원칙적으로 보유기간의 경과, 개인정보의 수집 및 이용목적의 달성 등 그 개인정보가 불필요하게 되었을 때에는 지체 없이 파기합니다. 
				다만, 다른 법령에 따라 보존하여야 하는 경우에는 그러하지 않을 수 있습니다. 불필요하게 되었을 때에는 지체 없이 해당 개인정보를 파기합니다.</p>
				<p>회원정보 -탈퇴 후 지체없이 파기</p>
			</li>
		</ul>
			<br>
		<ul>
			<li>
				<form action="joinform" method="post">
				<input type="checkbox" name="agree" value="true" class="chbox1"><label class="chbox2">이용약관에 동의합니다.</label>
				<br><br>
				<a href="${contextPath}/joinform">
					<input class="btn_joinform" id="button" type="submit" value="회원가입 화면으로"/>
				</a>
				</form>
			</li>
		</ul>
		<br>
	</section>
	
	<!-- footer -->
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>