<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 변경</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/login/find_PW.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){	
		<!-- 비밀번호 일치 확인 -->
		$('.box2').focusout(function () {
	        var pwd1 = $("#memPasswd").val();
	        var pwd2 = $("#confmemPasswd").val();
	  
	        if ( pwd1 != '' && pwd2 == '' ) {
	            null;
	        } else if (pwd1 != "" || pwd2 != "") {
	            if (pwd1 == pwd2) {
	            $("#alert-success").css('display', 'inline-block'); 
	            $("#alert-danger").css('display', 'none');  
	            } else {
	                $("#alert-success").css('display', 'none'); 
	                $("#alert-danger").css('display', 'inline-block');
		    	    $('#confmemPasswd').val('');
			        $('#confmemPasswd').focus();
	            }
	        }
		});
	});
</script>
</head>
<body>
	<div class="findmain">
		<div class="findpw">
			<form action="pw_set.me" method="POST" class="content">
				<table>
					<tr>
						<td><img id="pw_img" alt="패스워드이미지" src="${contextPath}/resources/images/login/pw.png"></td>
					</tr>
					<tr>
						<td>
							<h2>패스워드 변경</h2>
							<span id="alert-success">비밀번호가 일치합니다.</span>
    						<span id="alert-danger">비밀번호가 일치하지 않습니다.</span>
						</td>
					</tr>
					<tr>
						<td><input type="email" placeholder="이메일을 입력해주세요" class="box1" id="memEmail" name="memEmail" required /></td>
					</tr>
					<tr>
						<td><input type="password" placeholder="새로운 비밀번호를 입력해주세요" class="box1" id="memPasswd" name="memPasswd" required /></td>
					</tr>
					<tr>
						<td><input type="password" placeholder="비밀번호를 다시 입력해주세요" class="box2" id="confmemPasswd" name="confmemPasswd" required /></td>
					</tr>
					<tr>
						<td><button id="change_submit">변경하기</button></td>
					</tr>
				</table>		
			</form>
		</div>
	</div>
</body>
</html>
