<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>패스워드 찾기 - 인증번호 입력</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/login/find_PW.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="findmain">
	<div class="findpw">
		<form action="pw_code.do" method="post">
			<table> 
				<tr>
					<td>
						<img id="pw_img" alt="패스워드이미지" src="${contextPath}/resources/images/login/pw.png">
						<input type="hidden" name="num" value="${num }">
					</td>
				</tr>
				<tr>
					<td>
						<h2>인증번호 확인</h2>
						<h4>인증실패시 이전화면으로 돌아갑니다.</h4>
					</td>
				</tr>		
				<tr>
					<td><input type="text" name="memEmail_code" placeholder="인증번호를 입력하세요"></td>
				</tr>
				<tr>
					<td><button id="code_submit">확인</button></td>
				</tr> 
			</table>
		</form>
	</div>
</div>
</body>
</html>