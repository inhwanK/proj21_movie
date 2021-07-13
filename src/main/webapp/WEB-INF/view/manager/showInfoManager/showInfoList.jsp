<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영 정보 관리</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		var contextPath = "${contextPath}"
		$.get(contextPath + "/api/showinfo",
			function(json){
				var dataLength = json.length;
				if (dataLength >= 1) {
					var sCont = "";
					for (i = 0; i < dataLength; i++) {
						sCont += "<tr>";
						sCont += "<td id='no'>" + json[i].shwNo + "</td>";
						sCont += "<td>" + json[i].thtNo.thtName + "</td>";
						sCont += "<td>" + json[i].cinNo.cinNo + "관(" + json[i].cinNo.cinType +")</td>";
						sCont += "<td>" + json[i].movNo.movTitle + "</td>";
						sCont += "<td>" + json[i].shwDate + "</td>";
						sCont += "<td>" + json[i].shwStarttime + "</td>";
						sCont += "<td>" + json[i].shwEndtime + "</td>";
						/* sCont += "<td><button id='modify' class='btn btn-primary'>수정</button></td>"; */
						sCont += "<td><button id='remove' name='remove' class='btn btn-primary'>삭제</button></td>";
						sCont += "</tr>";
					}
					$("#load:last-child").append(sCont);
				}
		});
		
		$('#new').on("click", function(){
			window.location.href = contextPath + "/registShowInfo";
		});
		
		$(document).on("click", '[id=remove]', function(){
			var tr = $(this).parent().parent();
			var td = tr.children();
			var no = td.eq(0).text();
			
			if (confirm("삭제하시겠습니까?")){
				$.ajax({
					url: contextPath + "/api/showinfo/" + no,
					type: 'DELETE',
					success: function(res) {
						alert("삭제 완료");
						window.location.href = contextPath + "/showInfoManager";
					},
					error: function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
						window.location.href = contextPath + "/showInfoManager";
					}
				});
			} else {
				return false;
			}
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
      <h1 class="text-center">상영관리</h1>
      <button id="new" class="btn btn-primary">상영 영화 추가</button>
      <table class="table table-hover table-striped text-center" style="border: 1px solid;">
      	<thead>
      		<tr>
      			<th>번호</th>
      			<th>극장</th>
      			<th>상영관</th>
      			<th>영화</th>
      			<th>상영일</th>
      			<th>시작시간</th>
      			<th>종료시간</th>
      			<!-- <th></th> -->
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