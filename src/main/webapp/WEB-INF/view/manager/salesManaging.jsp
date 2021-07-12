<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/manager/sidebar.css">

<!-- https://developers.google.com/chart/interactive/docs/basic_preparing_data 플러그인 가이드-->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> <!-- 구글 차트  -->
<script type="text/javascript">
	
	// Date 를 빼고 더해서 다시 Date형태로 반환 먼저
	// 이 Date 계산을 자동화, 데이터로 넣기
	// 그에 따른 쿼리수행?

	// let 변수로 한번 선언하면 타입이 변하지않음. var 보다는 좀 더 정적임. 
	// 예를들어, Date 타입에 날짜를 빼는 등 숫자 연산을 해버리면 var 변수는 Date 타입을 정수타입으로 바꿔버림.
	// let은 그렇지가 않음.
	// 또한, 함수에 한번 진입했다가 다시 나오면 함수에서 연산된 값이 적용되지 않고,
	// 본래 선언할 때 타입을 그대로 유지는 것 같음.
	
	
	
	google.charts.load('current', {
		'packages' : [ 'annotationchart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = new google.visualization.DataTable();

		let date = new Date();

		console.log(date);
		
		data.addColumn('string', '날짜');
		data.addColumn('number', '매출');

		var day = date.toDateString();
		console.log(day);
		console.log(date);
		date.setDate(date.getDate() - 1);

		console.log(date);
		
		
		data.addRows([ 
			[day , 3 ], 
			[day , 4 ] 
			]);

		var chart = new google.visualization.ColumnChart(document
				.getElementById('chart_div'));

		var options = {
			displayAnnotations : true
		};

		chart.draw(data, options);
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/view/manager/sidebar.jsp"></jsp:include>
	</header>
	<div id="page-wrapper">
		<div id="columnchart_div"></div>
		<div id="chart_div" > <!-- style="margin:0 0;" --></div>
	</div>
</body>
</html>