<%@ page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/join.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
$(function(){
    var contextPath = "<%= request.getContextPath()%>";

    $('#cancel').on("click", function(e){
        window.location.href = contextPath + "/memberlist";
    });

    $('#new').on("click", function(e){
        var newMember = {  email: $('#memEmail').val(), password: $('#memPasswd').val(), Birthday: $('#memBirthdate').val(), 
        		name: $('#memBirthdate').val(), name: $('#memName').val(), name: $('#memPhone').val() };
        alert("data > " + newMember.email );
        $.ajax({
            url         : contextPath + "/api/login/",
            type        : "POST",
            contentType : "application/json; charset=utf-8",
            datatype    : "json",
            cache       : false,
            data        : JSON.stringify(newMember),
            success     : function(res) {
                alert(res);
                window.location.href = contextPath + "/memberlist";
            },
            error       : function(request, status, error){
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                window.location.href = contextPath + "/memberlist";
            }
        }); 
    });
});

</script>
</head>
<body>
</head>
<body>
	<header>
		<img id="header_ci" alt="" src="image/logow1_2.png">
		<ul>
			<li><a class="sub_menu" href="#">로그인</a></li>
			<li><a class="sub_menu" href="#">회원가입</a></li>
			<li><a class="sub_menu" href="#">바로예매</a></li>
		</ul>
	</header>
	<nav role="navigation">
		<ul id="main-menu">
			<li><a href="#">영화</a>
				<ul id="sub-menu">
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
				</ul>
			</li>
			<li><a href="#">예매</a>
				<ul id="sub-menu">
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
				</ul>
			</li>
			<li><a href="#">극장</a>
				<ul id="sub-menu">
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
					<li><a href="#" aria-label="subemnu">submenu</a></li>
				</ul>
			</li>
			<li><a href="#">고객센터</a></li>
		</ul>
	</nav>
	
	<section id="joinFormArea">
		<br>
		<ul class="join_box">
				<h2>회원약관</h2>
				<p>
					국가는 지역간의 균형있는 발전을 위하여 지역경제를 육성할 의무를 진다. 국민경제자문회의의 조직·직무범위 기타
					필요한 사항은 법률로 정한다. 국가는 사회보장·사회복지의 증진에 노력할 의무를 진다. 제안된 헌법개정안은 대통령이 20일
					이상의 기간 이를 공고하여야 한다. 근로자는 근로조건의 향상을 위하여 자주적인 단결권·단체교섭권 및 단체행동권을 가진다.
					국회는 국무총리 또는 국무위원의 해임을 대통령에게 건의할 수 있다. 대통령은 국가의 독립·영토의 보전·국가의 계속성과
					헌법을 수호할 책무를 진다. 모든 국민은 통신의 비밀을 침해받지 아니한다. 대한민국의 경제질서는 개인과 기업의 경제상의
					자유와 창의를 존중함을 기본으로 한다.
					
					국가는 농지에 관하여 경자유전의 원칙이 달성될 수 있도록 노력하여야 하며, 농지의 소작제도는 금지된다. 국채를
					모집하거나 예산외에 국가의 부담이 될 계약을 체결하려 할 때에는 정부는 미리 국회의 의결을 얻어야 한다. 누구든지 체포
					또는 구속을 당한 때에는 즉시 변호인의 조력을 받을 권리를 가진다. 다만, 형사피고인이 스스로 변호인을 구할 수 없을
					때에는 법률이 정하는 바에 의하여 국가가 변호인을 붙인다. 국정의 중요한 사항에 관한 대통령의 자문에 응하기 위하여
					국가원로로 구성되는 국가원로자문회의를 둘 수 있다. 교육의 자주성·전문성·정치적 중립성 및 대학의 자율성은 법률이 정하는
					바에 의하여 보장된다.
				</p>
		</ul>
		<br><br>
		<ul>
			<li>
				<label class="chbox">
				<input type="checkbox" name="chek_box" value="id_coki">이용약관에 동의합니다.</label>
			</li>
		</ul>
			<form action="join">
			<div>
				<ul>
					<li>
						<span>아이디 </span> 
						<br> 
						<input type="email" placeholder="아이디를 입력하세요" class='box' id="email"/></li>
					<li>
						<span>패스워드 </span> 
						<br> 
						<input type="password" placeholder="패스워드를 입력하세요" class='box' id="password" />
					</li>
					<li>
						<span>패스워드 확인 </span> 
						<br> 
						<input type="password" placeholder="다시 패스워드를 입력하세요" class='box' id="confirmPassword" />
					</li>
					<li>
						<span>이름 </span> 
						<br> 
						<input type="text" placeholder="이름을 입력하세요" class='box' id="name" /></li>
					<li>
					<li>
						<span>생년월일 </span> 
						<br> 
						<input type="date" placeholder="생년월일을 입력하세요." class='box' id="birthday" />
					</li>
					<li>
						<span>휴대폰번호 </span> 
						<br> 
						<input type="text" placeholder="휴대폰번호를 입력하세요" class='box' id="phone" />
					</li>
					
					<li><button id="new">가입하기</button></li>
				</ul>
			</div>
		</form>
	</section>

	<footer>
		<div>
			<img id="footer_ci" alt="" src="image/logow1_2.png">
			<p>COPYRIGHT © MegaboxJoongAng, Inc. All rights reserved</p>
		</div>
	</footer>
</body>
</html>