<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${contextPath}/resources/css/login/login.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
<script src="//cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
<script type="text/javascript">
$(function(){
	<!-- 회원 로그인 -->
    $(".btn").click(function(){
    	var contextPath = "<%=request.getContextPath()%>";
        $("#login_form").attr("action", contextPath + "/login");
        $("#login_form").submit();
    });

});
</script>
</head>
<body>
	<%@include file="../login/header.jsp"%>
	<section id="loginFormArea">
		<form id="login_form" method="POST">
			<fieldset>
				<div class="fm_box">
				<c:if test = "${result == 0 }">
                	<div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            	</c:if>
					<table>
						<tr>
							<td>
								<div class="title"><h1>로그인</h1></div>
							</td>
						</tr>
						<tr>
							<td>
								<input class="id_input" type="text" name="memEmail" placeholder="아이디" />
							</td>
						</tr>
						<tr>
							<td>
								<input class="pw_iput" type="password" name="memPasswd" placeholder="비밀번호" />
							</td>
						</tr>
					</table>
						
						<label class="chbox"> 
						<input type="checkbox" name="chek_box" value="id_check" id="coki">아이디 저장</label> 
						<br> 
						<input class="btn" type="submit" value="로그인" id="selButton" /> 
						<br><br>
					<div class="text_h">
						<a href="${contextPath}/find_IDPW">ID/PW 찾기</a> | <a href="${contextPath}/join">회원가입</a>
					</div>
				</div>
			</fieldset>
		</form>
	</section>
	<%@include file="../login/footer.jsp"%>
</body>
</html>