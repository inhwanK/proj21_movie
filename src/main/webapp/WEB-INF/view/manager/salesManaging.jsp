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
	// 본래 선언할 때 값을 그대로 유지한다는 특성도 있음.(검증 필요.)
	
	let date = new Date();

	console.log(date);
	console.log(date.getDate());
	console.log(date.getDate()-1);
	date.setDate(date.getDate()-1);
	console.log(date)
	
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
        		data.addColumn('string', '날짜');
        		data.addColumn('number', '매출');
        		
        		console.log(i);
        		data.addRows([
        			['yyyy-MM-dd',json]
        		]);
        		
        		var options = {
        	        	'legend':'right',
        	        	'title':'예매율 테스트',
        	            'width':1000,
        	            'height':500
        		};
        		
        		var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_div'));
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
      google.charts.load('current', {'packages':['annotationchart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('date', 'Date');
        data.addColumn('number', 'Kepler-22b mission');
        data.addColumn('string', 'Kepler title');
        data.addColumn('string', 'Kepler text');
        data.addColumn('number', 'Gliese 163 mission');
        data.addColumn('string', 'Gliese title');
        data.addColumn('string', 'Gliese text');

        
        data.addRows([
          [date, 12400, undefined, undefined,
                                  10645, undefined, undefined],
          [date.setDate(date.getDate()+1), 24045, 'Lalibertines', 'First encounter',
                                  12374, undefined, undefined],
          [date.setDate(date.getDate()+1), 35022, 'Lalibertines', 'They are very tall',
                                  15766, 'Gallantors', 'First Encounter'],
          [date.setDate(date.getDate()+1), 12284, 'Lalibertines', 'Attack on our crew!',
                                  34334, 'Gallantors', 'Statement of shared principles'],
          [date.setDate(date.getDate()+1), 8476, 'Lalibertines', 'Heavy casualties',
                                  66467, 'Gallantors', 'Mysteries revealed'],
          [date.setDate(date.getDate()+1), 0, 'Lalibertines', 'All crew lost',
                                  79463, 'Gallantors', 'Omniscience achieved']
        ]);

        var chart = new google.visualization.AnnotationChart(document.getElementById('chart_div'));

        var options = {
          displayAnnotations: true
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
		<div id="chart_div"></div>
	</div>
</body>
</html>