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
	
	var contextPath = "${contextPath}";
	

    // Visualization API 최신버전으로 corechart package에서 받아오기 ?
    // 최신 버전으로 뽑아오기 'current' 
    google.charts.load('current', {'packages':['corechart']});

    // 데이터, 옵션값, div 매칭등의 역할을 하는 콜백함수 설정.
    google.charts.setOnLoadCallback(drawChart);

    //콜백함수 정의
	function drawChart() {

    	// Create the data table.
    	var data = new google.visualization.DataTable();
        
        // 컬럼 설정.
        // data.addColumn('데이터 타입', '컬럼 이름');
        /* data.addColumn('string', '영화 제목');
        data.addColumn('number', '예매'); */
        
        // 데이터 넣기.
       	/* data.addRows([
        	['킬러의 보디가드2', 3],
        	['분노의 질주:더 얼티메이트', 1],
        	['랑종', 1],
        	['블랙위도우', 2],
        	['크루엘라', 2]
        ]); */

        $.ajax({
        	url:contextPath+"/api/totalSales",
        	type:'get',
        	contentType:"application/json; charset=utf-8",
        	dataType:'json',
        	success: function(json){
        		var i = json;
        		data.addColumn('string', '값..?');
        		data.addColumn('number', '값..?');
        		
        		console.log(i);
        		data.addRows([
        			['매출',json]
        		]);
        		
        		var options = {
        	        	'legend':'right',
        	        	'title':'예매율 테스트',
        	            'width':1000,
        	            'height':500,
        	            'is3D':true
        		};
        		
        		var chart = new google.visualization.PieChart(document.getElementById('piechart_div'));
                chart.draw(data, options);
                
                var chart = new google.visualization.BarChart(document.getElementById('barchart_div'));
                chart.draw(data, options);
        	}
        	
        });
        
        // 옵션 설정. title, title 위치, 그래프 크기 등.
        /* var options = {
        	'legend':'right',
        	'title':'예매율 테스트',
            'width':1000,
            'height':500,
            'is3D':true
		}; */

        // 차트 그리기. 
       /*  var chart = new google.visualization.PieChart(document.getElementById('piechart_div'));
        chart.draw(data, options);
        
        var chart = new google.visualization.BarChart(document.getElementById('barchart_div'));
        chart.draw(data, options); */
    }
    </script>
</head>
<body>
	<header>
		<jsp:include page="/WEB-INF/view/manager/sidebar.jsp"></jsp:include>
	</header>
	<div id="page-wrapper">
		<div id="piechart_div"></div>
		<div id="barchart_div"></div>
	</div>
</body>
</html>