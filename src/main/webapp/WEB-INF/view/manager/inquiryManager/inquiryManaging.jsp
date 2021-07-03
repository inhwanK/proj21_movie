<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/manager/sidebar.css">

</head>
<body>
<header>
	<jsp:include page="/WEB-INF/view/manager/sidebar.jsp"></jsp:include>
</header>
<div id="page-wrapper">


  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <h1 class="text-center">문의</h1>
      
      <!-- css 정리 너무 안됨. -->
      <div style="margin:0 20px;">
      	<select name="inqStatus" onchange="changeSearchCond()" id="statusComb" style="float:right; margin: 0 0 10px 0;">
      		<option value="all" selected>전체</option>
      		<option value="1">답변 완료</option>      		
      		<option value="0">답변 미완료</option>      				
      	</select>
	  </div>
	  
      <table class="table table-hover table-striped text-center" style="border: 1px solid; margin: 10px 0;">
      	<thead>
      		<tr>
      			<th>번호</th>
      			<th>제목</th>
      			<th>작성자</th>
      			<th>문의일</th>
      			<th>답변상태(Y/N)</th>
      			<th></th>
      			<th></th>
      		</tr>
      	</thead>
      	<tbody>
      		
      	</tbody>
      </table>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
	var contextPath = "${contextPath}";

	function getFormatDate(date) { // date 폼 처리 메서드.
		var subDateArray = date.substr(0, 10).split('-');
		return subDateArray[0] + "." + subDateArray[1] + "."
				+ subDateArray[2];
	} // js 파일로 관리할 필요 있음. 

	$(function(){

		//var contextPath = "${contextPath}";
		// 리스트 가져오기
		$.ajax({
			url: contextPath+"/api/inquirylist",
			type:"get",
			contentType:"application/json; charset=utf-8",
			dataType:"json",
			success:function(json){
				var list="";
				if(json.length >= 1){
					for(i=0;i<json.length;i++){
						list += "<tr>";
						list += "<td>"+json[i].inqNo+"</td>";
						list += "<td>"+json[i].inqTitle+"</td>";
						list += "<td>"+json[i].inqUser+"</td>";
		      			list += "<td>"+getFormatDate(json[i].inqDate)+"</td>";
		      			list += "<td>"+(json[i].inqStatus ==1 ? 'Y' : 'N') +"</td>";
		      			list += "<td><button id=\"answer\" class=\"btn btn-primary\">답변</button></td>";
		      			list += "<td><button id=\"delete\" class=\"btn btn-primary\">삭제</button></td>";
		      			list += "</tr>";
					} // end of for
					$("tbody").append(list);
				} // end of if
			} // end of success
			
		});
		
		
		
		$(document).ready(function(){
			
			
			var td;
			var inqNo;
			
			//답변
			$(this).on('click','[id=answer]',function(){
				td = $(this).parent().prevUntil();
				inqNo = td.last().text(); 
				
				window.location.href = contextPath + "/answerInquiry?inqNo="+inqNo;
			});
			
			// 삭제
			$(this).on('click','[id=delete]',function(){
				td = $(this).parent().prevUntil();
				inqNo = td.last().text(); 
				
				$.ajax({
					url:contextPath + "/api/inquiry?inqNo="+inqNo,
					type:"delete",
					contentType:"application/json; charset=utf-8",
					dataType:"json",
					data: inqNo,
					success:function(){
						var conf = confirm("정말 삭제하시겠습니까?");
						if(conf){
							alert("삭제되었습니다.");
							location.reload(); // 페이지 새로고침.
						}
					},
					error: function(){
						alert("문제가 생긴것이 분명하답니다?")
					}
					
				}); // end of ajax
			}); // end of function
			
		});
		
	});
	
	function changeSearchCond(){
		
		var inqStatus = $("#statusComb option:selected").val();
		
		if(inqStatus=="all"){
			location.reload();
		}
		
		$.ajax({
			url: contextPath+"/api/inquiryStatus?inqStatus="+inqStatus,
			type:"get",
			contentType:"application/json; charset=utf-8",
			dataType:"json",
			success:function(json){
				var list="";
				
				if(json.length >= 1){
					for(i=0;i<json.length;i++){
						list += "<tr>";
						list += "<td>"+json[i].inqNo+"</td>";
						list += "<td>"+json[i].inqTitle+"</td>";
						list += "<td>"+json[i].inqUser+"</td>";
		      			list += "<td>"+getFormatDate(json[i].inqDate)+"</td>";
		      			list += "<td>"+(json[i].inqStatus ==1 ? 'Y' : 'N') +"</td>";
		      			list += "<td><button id=\"answer\" class=\"btn btn-primary\">답변</button></td>";
		      			list += "<td><button id=\"delete\" class=\"btn btn-primary\">삭제</button></td>";
		      			list += "</tr>";
					} // end of for
					$("tbody").empty();
					$("tbody").append(list);
				} // end of if
			}
		});
	}
</script>
</html>