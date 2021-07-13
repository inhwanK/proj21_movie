<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 관리</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		var contextPath = "${contextPath}";
		$.get(contextPath + "/api/movies",
			function(json) {
				var dataLength = json.length;
				if (dataLength >= 1) {
					var sCont = "";
					for (i = 0; i < dataLength; i++) {
						sCont += "<tr>";
						sCont += "<td id='no'>" + json[i].movNo + "</td>";
						sCont += "<td>" + json[i].movTitle + "</td>";
						sCont += "<td>" + json[i].movGenre + "</td>";
						if (json[i].movGrade == 0) {
							sCont += "<td>전체 관람가</td>";
						} else {
							sCont += "<td>" + json[i].movGrade + "</td>";
						}
						sCont += "<td>" + json[i].movRuntime + " 분</td>";
						sCont += "<td>" + json[i].movOpendate + "</td>";
						sCont += "<td>" + json[i].movEnddate + "</td>";
						sCont += "<td><button id='modify' class='btn btn-primary'>수정</button></td>";
						sCont += "<td><button id='remove' name='remove' class='btn btn-primary'>삭제</button></td>";
						sCont += "</tr>";
						
					}
					$("#load:last-child").append(sCont);
				}
		});	
		
		$('#new').on("click", function(){
			window.location.href = contextPath + "/registMovie";
		});
		
		$(document).on('click', '[id=remove]', function(){
			var tr = $(this).parent().parent();
			var td = tr.children();
			var no = td.eq(0).text();
			
			if (confirm("삭제하시겠습니까?")){
				$.ajax({
					url: contextPath + "/api/movies/" + no,
					type: 'DELETE',
					success: function(res) {
						alert("삭제되었습니다");
						window.location.href = contextPath + "/movieManager";
					},
					error: function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
						window.location.href = contextPath + "/movieManager";
					}
				});
			} else {
				return false;
			}
			
		});
		
		$(document).ready(function(){
			$(this).on('click', '[id=modify]', function(){
				var tr = $(this).parent().parent();
				var td = tr.children();
				var no = td.eq(0).text();
				window.location.href = contextPath + "/updateMovie?no=" + no;
			});
		});
		
	});
	
	
</script>
</head>
<body>
<header>
	<jsp:include page="/WEB-INF/view/manager/sidebar.jsp"></jsp:include>
</header>
<div id="page-wrapper">
  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <h1 class="text-center">영화관리</h1>
      <button class="btn btn-primary" id="new">영화 추가</button>
      <table class="table table-hover table-striped text-center" style="border: 1px solid;">
      	<colgroup>
			<col width="7%">
			<col width="25%">
			<col width="15%">
			<col width="10%">
			<col width="9%">
			<col width="9%">
			<col width="9%">
			<col width="8%">
			<col width="8%">
		</colgroup>
      	<thead>
      		<tr>
      			<th>번호</th>
      			<th>제목</th>
      			<th>장르</th>
      			<th>심의등급</th>
      			<th>런타임</th>
      			<th>개봉일</th>
      			<th>종료일</th>
      			<th></th>
      			<th></th>
      		</tr>
      	</thead>
      	<tbody id="load">
      	</tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>