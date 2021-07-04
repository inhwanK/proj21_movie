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
<title>패스워드 찾기 - 성공!</title>
<link rel="stylesheet" href="${contextPath}/resources/css/login/find_PW.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
</head>
<body>
	<div class="findmain">
		<div class="findpw">
			<form action="find_PW_success" method="POST" class="content">
				<table>
					<tr>
						<td><img id="pw_img" alt="변경성공이미지" src="${contextPath}/resources/images/login/community.png"></td>
					</tr>
					<tr>
						<td>
							<h2>변경에 성공하셨습니다!</h2>
						</td>
					</tr>
					<tr>
						<td>
							<h4>새로운 비밀번호로 로그인 해 주세요.</h4>
						</td>
					</tr>
					<tr>
						<td>
							<button id="success_submit" onclick="top.window.close()">닫기</button>
						</td>
					</tr>
				</table>		
			</form>
		</div>
	</div>
</body>
</html>