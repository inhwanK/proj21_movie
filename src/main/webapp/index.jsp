<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery.min.js"></script>
</head>
<body>
	<a href="<%=request.getContextPath() %>/main">Welcome to <strong>BOX MOVIE</strong></a>
<script>
	$(function(){
		var now = new Date();
		var yesterday = new Date(now.getFullYear(), now.getMonth(), now.getDate() - 1);
		var selDate = "2021-07-02";
		
		console.log("오늘 >> " + now);
		console.log("어제 >> " + yesterday);
		console.log("now > yesterday" + now > yesterday);
		console.log("now < yesterday" + now < yesterday);
	});

</script>
</body>
</html>