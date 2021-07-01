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
<link rel="stylesheet" href="${contextPath}/resources/css/admin/adminlogin.css">
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
        $("#login_form").attr("action", contextPath + "/adminlogin");
        $("#login_form").submit();
    });
    
    
    <!-- 아이디 저장 -->
    $(document).ready(function(){
        // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
        var userInputId = getCookie("admId");
        $("input[name='admId']").val(userInputId); 
         
        if($("input[name='admId']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
            $("#coki").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
        }
         
        $("#coki").change(function(){ // 체크박스에 변화가 있다면,
            if($("#coki").is(":checked")){ // ID 저장하기 체크했을 때,
                var userInputId = $("input[name='admId']").val();
                setCookie("admId", userInputId, 7); // 7일 동안 쿠키 보관
            }else{ // ID 저장하기 체크 해제 시,
                deleteCookie("admId");
            }
        });
         
        // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
        $("input[name='admId']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
            if($("#coki").is(":checked")){ // ID 저장하기를 체크한 상태라면,
                var userInputId = $("input[name='admId']").val();
                setCookie("admId", userInputId, 7); // 7일 동안 쿠키 보관
            }
        });
    });
     
    function setCookie(cookieName, value, exdays){
        var exdate = new Date();
        exdate.setDate(exdate.getDate() + exdays);
        var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
        document.cookie = cookieName + "=" + cookieValue;
    }
     
    function deleteCookie(cookieName){
        var expireDate = new Date();
        expireDate.setDate(expireDate.getDate() - 1);
        document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
    }
     
    function getCookie(cookieName) {
        cookieName = cookieName + '=';
        var cookieData = document.cookie;
        var start = cookieData.indexOf(cookieName);
        var cookieValue = '';
        if(start != -1){
            start += cookieName.length;
            var end = cookieData.indexOf(';', start);
            if(end == -1)end = cookieData.length;
            cookieValue = cookieData.substring(start, end);
        }
        return unescape(cookieValue);
    }

});
</script>
</head>
<body>
	<%@include file="/WEB-INF/view/header.jsp"%>
	<section id="loginFormArea">
		<form id="login_form" method="POST" name="form1">
			<fieldset>
				<div class="fm_box">
				<c:if test = "${result == 0 }">
                	<div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            	</c:if>
					<table>
						<tr>
							<td>
								<div class="title"><h1>관리자 로그인</h1></div>
							</td>
						</tr>
						<tr>
							<td>
								<input class="id_input" type="text" name="admId" placeholder="아이디" />
							</td>
						</tr>
						<tr>
							<td>
								<input class="pw_iput" type="password" name="admPasswd" placeholder="비밀번호" />
							</td>
						</tr>
					</table>
						
						<label class="chbox"> 
						<input type="checkbox" name="chek_box" value="id_check" id="coki">아이디 저장</label> 
						<br> 
						<input class="btn" type="submit" value="로그인" id="selButton" /> 
						<br><br>
				</div>
			</fieldset>
		</form>
	</section>
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>