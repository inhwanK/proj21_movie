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
	
	// date 처리...
	/* var oneDay = (24 * 60 * 60 * 1000);
	var currentEndDate = new Date();
	var currentStartDate = new Date(currentEndDate.getTime() - (oneDay * 365.25));*/
	
	
	
	google.charts.load('current', {'packages' : [ 'corechart' ]});
	google.charts.setOnLoadCallback(drawChart);

	var contextPath = "${contextPath}";
	
	function drawChart() {
		var salesData = new google.visualization.DataTable();
		var audienceData = new google.visualization.DataTable();
		
		$.ajax({
			url:contextPath+"/api/salesLatestDate",
			type:"get",
			contentType:"application/json; charset=utf-8",
			dataType:"json",
			success:function(json){
				
				var sum = 0;
				var avg = 0;
				
				salesData.addColumn('string', '날짜');
				salesData.addColumn('number', '매출');
				
				for(i=0;i<json.length;i++){
					salesData.addRows([
						[json[i].date.substr(8,9),json[i].data]
					]);
					sum += json[i].data;
				} // end of for
				avg = sum/(i+1);

				var salesOptions = {
					title:'지난 7일간 매출',
					width:600,
					height:400, 
					hAxis:{
					},
					vAxis:{
						scaleType:'linear'
					},
							
				};
				
				var salesChart = new google.visualization.ColumnChart(document.getElementById('sales_chart_div'));
				salesChart.draw(salesData, salesOptions);
				// 매출 차트 끝.
				
				
				
				var sum = 0;
				var avg = 0;
				
				audienceData.addColumn('string', '날짜');
				audienceData.addColumn('number', '관람인원');
				
				for(i=0;i<json.length;i++){
					audienceData.addRows([
						[json[i].date.substr(8,9), json[i].audience ]
					]);
					sum += json[i].audience;
				} // end of for
				avg = sum/(i+1);

				var audienceOptions = {
					title:'지난 7일간 관람객 수',
					width:600,
					height:400, 
					hAxis:{
					},
					vAxis:{
						scaleType:'linear'
					},
							
				};
				
				var audienceChart = new google.visualization.ColumnChart(document.getElementById('audience_chart_div'));
				audienceChart.draw(audienceData, audienceOptions);
			} // end of success
		});
		
		var salesMonth = new google.visualization.DataTable();
		var audienceMonth = new google.visualization.DataTable();
		
		$.ajax({
			url:contextPath+"/api/salesMonth",
			type:"get",
			contentType:"application/json; charset=utf-8",
			dataType:"json",
			success:function(json){
				
				var sum = 0;
				var avg = 0;
				
				salesMonth.addColumn('string', '날짜');
				salesMonth.addColumn('number', '매출');
				
				for(i=0;i<json.length;i++){
					salesMonth.addRows([
						[json[i].date.substr(0,7),json[i].data]
					]);
					sum += json[i].data;
				} // end of for
				avg = sum/(i+1);

				var salesOptions = {
					title:'월별 매출',
					width:600,
					height:400, 
					hAxis:{
					},
					vAxis:{
						scaleType:'linear'
					},
							
				};
				
				var salesChart = new google.visualization.ColumnChart(document.getElementById('sales_monthchart_div'));
				salesChart.draw(salesMonth, salesOptions);
				// 매출 차트 끝.
				
				var sum = 0;
				var avg = 0;
				
				audienceMonth.addColumn('string', '날짜');
				audienceMonth.addColumn('number', '관람인원');
				
				for(i=0;i<json.length;i++){
					audienceMonth.addRows([
						[json[i].date.substr(0,7), json[i].audience ]
					]);
					sum += json[i].audience;
				} // end of for
				avg = sum/(i+1);

				var audienceOptions = {
					title:'월별 관람객 수',
					width:600,
					height:400, 
					hAxis:{
					},
					vAxis:{
						scaleType:'linear'
					},
							
				};
				
				var audienceChart = new google.visualization.ColumnChart(document.getElementById('audience_monthchart_div'));
				audienceChart.draw(audienceMonth, audienceOptions);
			} // end of success
		});
		var advanceRate= new google.visualization.DataTable();
		
		$.ajax({
			url:contextPath+"/api/movieAudience",
			type:"get",
			contentType:"application/json; charset=utf-8",
			dataType:"json",
			success: function(json){
				
				var sum = 0;
				var avg = 0;
				
				advanceRate.addColumn('string', '영화');
				advanceRate.addColumn('number', '관람인원');
				
				for(i=0;i<json.length;i++){
					advanceRate.addRows([
						[json[i].movTitle, json[i].audience ]
					]);
					sum += json[i].audience;
				} // end of for
				avg = sum/(i+1);

				var reservationOptions = {
					title:'예매율',
					width:600,
					height:400, 
					vAxis:{
						scaleType:'linear'
					}
							
				};
				
				var audienceOptions = {
						title:'영화별 관람객 수',
						width:600,
						height:400, 
						vAxis:{
							scaleType:'linear'
						}
								
					};
				
				var audienceChart = new google.visualization.PieChart(document.getElementById('reservation_chart_div'));
				audienceChart.draw(advanceRate, reservationOptions);
				
				var audienceChart = new google.visualization.ColumnChart(document.getElementById('reservation_columnchart_div'));
				audienceChart.draw(advanceRate, audienceOptions);
			}
		})
	}
</script>
<style type="text/css">
#chart_div{
	display:inline;
}

#columnchart_div{
	display:inline;
}

</style>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/view/manager/sidebar.jsp"></jsp:include>
	</header>
	<div id="page-content-wrapper">
		<div id="page-wrapper">
			<h1 class="text-center">매출 조회</h1>
			<table>
				<tr>
					<td style="width:50%"><div id="sales_chart_div"></div></td>
					<td style="width:50%"><div id="audience_chart_div"></div></td>
				</tr>
				<tr>
					<td style="width:50%"><div id="sales_monthchart_div"></div></td>
					<td style="width:50%"><div id="audience_monthchart_div"></div></td>
				</tr>
				<tr>
					<td style="width:50%"><div id="reservation_chart_div"></div></td>
					<td style="width:50%"><div id="reservation_columnchart_div"></div></td>
				</tr>
				
			</table>
		</div>
	</div>
</body>
</html>