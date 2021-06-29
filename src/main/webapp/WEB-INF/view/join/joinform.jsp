<%@ page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tf" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="${contextPath}/resources/css/join/joinform.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function(){	
		<!-- 이메일 중복체크() -->
<%-- 		function fn_idOverlap() {
			var contextPath = "<%= request.getContextPath()%>";
			$.ajax({
				url : contextPath + "/idOverlap",
				type : "post",
				dataType : "json",
				data : { "memEmail" : $("#memEmail").val()},
				success : function(data) {
					if(data == 1) {
						alert("중복된 아이디 입니다.");
						$("#new").attr("disabled", "disabled");
					} else if(data == 0) {
						alert("사용가능한 아이디 입니다.");
						$("#new").removeAttr("disabled");
						}
					}
				});
			} --%>
			
		<!-- 아이디 중복검사!!! -->

			
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
		
		<!-- 회원가입 -->
		var contextPath = "<%= request.getContextPath()%>";
		$('#new').on("click", function(e){
	        var newMember = {  memEmail: $('#memEmail').val(), 
	        				   memPasswd: $('#memPasswd').val(), 
	       					   memBirthdate: $('#memBirthdate').val(),
	        				   memName: $('#memName').val(),
	        				   memPhone: $('#memPhone').val()
	        				   };
	        $.ajax({
	            url         : contextPath + "/api/joinform/",
	            type        : "POST",
	            contentType : "application/json; charset=utf-8",
	            datatype    : "json",
	            cache       : false,
	            data        : JSON.stringify(newMember),
	            success     : function(res) {
    	                window.location.href = contextPath + "/joinsuccess";
	            },
	            error       : function(request, status, error){
	                alert("회원가입 폼을 정확히 입력해주세요");
	            }
	        }); 
	    });
	});
</script>
</head>
<body>
	<%@include file ="../join/header.jsp" %>
	<section>
		<h1 class="join_title">회원가입</h1>
		<form action="joinsuccess" method="post">
			<div class="join_main">
				<ul class="ul">
					<li class="li">
						<span>아이디 </span><a href="${contextPath}/memberIdCheck"><button type="button" id="memberIdCheck">중복확인</button></a>
						<br> 
						<input type="email" placeholder="메일주소를 입력하세요" class="box1" id="memEmail" name="memEmail" value="${memEmail }" required />
					</li>
					<li class="li">
						<span>패스워드 </span> 
						<br> 
						<input type="password" placeholder="패스워드를 입력하세요" class="box2" id="memPasswd" required />
					</li>
					<li class="li">
						<span>패스워드 확인 </span> 
    					<span id="alert-success" style="display: none; color: #00498c; font-weight: bold;">비밀번호가 일치합니다.</span>
    					<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
						<br> 
						<input type="password" placeholder="패스워드를 한번 더 입력하세요" class="box2" id="confmemPasswd" required />
					</li>
					<li class="li">
						<span>이름 </span> 
						<br> 
						<input type="text" placeholder="이름을 입력하세요" id="memName" class="box3" required />
					</li>
					<li class="li">
						<span>생년월일 </span> 
						<br> 
						<input type="date" id="memBirthdate" class="box3" required />
					</li>
					<li class="li">
						<span>휴대폰번호 </span> 
						<br> 
						<input type="number" placeholder="하이픈('-')없이 숫자만 입력하세요" id="memPhone" class="box3" required />
					</li>
					<li class="li">
						<button id="new" disabled="disabled">가입하기</button>
					</li>
				</ul>
			</div>
		</form>
	</section>
	<%@include file ="../join/footer.jsp" %>
</body>
</html>