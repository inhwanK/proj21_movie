<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 찾기</title>
<link rel="stylesheet" href="${contextPath}/resources/css/login/find_PW.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
	
</script>
</head>
<body>
	<div class="findmain">
		<div class="findpw">
			<form method="post" class="form-signin" action="find_PW_code.do" name="findform">
				<table>
					<tr>
						<td><img id="pw_img" alt="패스워드이미지" src="${contextPath}/resources/images/login/pw.png"></td>
					</tr>
					<tr>
						<td><h2>패스워드 찾기</h2></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="이름을 입력하세요" id="memName" name="memName" required /></td>
					</tr>
					<tr>
						<td><input type="email" placeholder="이메일을 입력하세요" id="memEmail" name="memEmail" required /></td>
					</tr>
					<tr>
						<td><button id="pw_submit">검색</button></td>
					</tr>
				</table>	
			</form>
		</div>
	</div>
</body>
</html>