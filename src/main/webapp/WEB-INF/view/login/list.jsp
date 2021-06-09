<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
$(function(){
    $('#new').on("click", function() {
        window.location.href = "LoginController";
    });
    
    var contextPath = "${contextPath}";
    $.get(contextPath+"/api/login",
        function(json) {
            var dataLength = json.length;
            if (dataLength >= 1) {
                var sCont = "";
                for (i = 0; i < dataLength; i++) {
                    sCont += "<tr>";
                    sCont += "<td>" + json[i].memEmail + "</td>";
                    sCont += "<td><a href='read?id="+json[i].id+"'>"
                            + json[i].memName + "</a></td>";
                    sCont += "<td>" + memBirthdate + "</td>";
                    sCont += "<td>" + json[i].memPhone + "</td>";
                    sCont += "</tr>";
                }
                $("#load:last-child").append(sCont);
            }
        });
});
</script>
</head>
<body>
   <div><button id="new">추가</button></div>
    <table border="1">
        <thead>
            <th>메일</th>
            <th>이름</th>
            <th>생년월일</th>
            <th>휴대폰번호</th>
        </thead>
        <tbody id="load">
        </tbody>
    </table>
</body>
</html>