<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이메일 찾기</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/login/find_ID.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){	
		<!-- 휴대폰번호 서식 지정 -->
		$('#memPhone').keydown(function(event) {
		    var key = event.charCode || event.keyCode || 0;
		    $text = $(this);
		    if (key !== 8 && key !== 9) {
		        if ($text.val().length === 3) {
		            $text.val($text.val() + '-');
		        }
		        if ($text.val().length === 8) {
		            $text.val($text.val() + '-');
		        }
		    }
		    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
		});
	});
</script>
</head>
<body>
	<section>
		<div class="findmain">
			<div class="findid">
				<form method="post" class="form-signin" action="find_id" name="findform">
					<table>
						<tr>
							<td><img id="id_img" alt="아이디이미지" src="${contextPath}/resources/images/login/id.png"></td>
						</tr>
						<tr>
							<td>	
								<h2>이메일 찾기</h2>
								<!-- 이름과 전화번호가 일치하지 않을 때--> 
								<c:if test="${check == 1}">
											<script>
												opener.document.find_ID.memName.value = "";
												opener.document.find_ID.memPhone.value = "";
											</script>
											<h4>일치하는 정보가 존재하지 않습니다.</h4>
										</c:if> 
									<!-- 이름과 전화번호가 일치할 때 --> 
									<c:if test="${check == 0 }">
										<h4>이메일은 ${memEmail}입니다.</h4>
									</c:if>
							</td>
						</tr>
						<tr>
							<td><input type="text" placeholder="이름을 입력하세요" id="memName" name="memName" required /></td>
						</tr>
						<tr>
							<td><input type="text" placeholder="전화번호를 입력하세요" id="memPhone" name="memPhone" maxlength="13" required /></td>
						</tr>
						<tr>
							<td><button id="id_submit">찾기</button></td>
						</tr>
					</table>
				</form>
			</div>			
		</div>
	</section>
</body>
</html>