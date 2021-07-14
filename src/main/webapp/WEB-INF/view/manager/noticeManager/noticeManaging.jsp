<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/manager/sidebar.css">
<script type="text/javascript">
	$(function(){
		
		function getFormatDate(date) { // date 폼 관리.
			var subDateArray = date.substr(0, 10).split('-');
			return subDateArray[0] + "." + subDateArray[1] + "."
					+ subDateArray[2];
		} // js 파일로 관리할 필요 있음.
		
		var contextPath = "${contextPath}";
		
		
		// 날짜 검색값 초기화.
		/* var date;
		var today;
		if(today == null){
			date = new Date();
			today = date.toISOString() // ISO Standard 형식으로 변환.
			today = today.substr(0,10); // 문자열 자르기	
		}
		
		$("#date").attr('value',today); */
		
		$.ajax({
			url: contextPath+"/api/noticerecent",
			type:"get",
			contentType:"application/json; charset=utf-8",
			dataType:"json",
			success:function(json){
				var list="";
				if(json.length >= 1){
					for(i=0;i<json.length;i++){
						list += "<tr>";
						list += "<td>"+json[i].notNo+"</td>";
						list += "<td>"+json[i].notTitle+"</td>";
		      			list += "<td>"+getFormatDate(json[i].notDate)+"</td>";
		      			list += "<td><button id=\"modify\" class=\"btn btn-primary\">수정</button></td>";
		      			list += "<td><button id=\"delete\" class=\"btn btn-primary\">삭제</button></td>";
		      			list += "</tr>";
					} // end of for
					$("tbody").append(list);
				} // end of if
			} // end of success
			
		});
		
		
		//날짜 선택해서 검색.
		$(document).on('change','#date', function selectByDate() {
			
			var notDate = $("#date").val();
			
			$.ajax({
				url: contextPath+"/api/noticeListByDate?notDate="+notDate,
				type:"get",
				contentType:"application/json; charset=utf-8",
				dataType:"json",
				success:function(json){
					list="";
					if(json.length >= 1){
						for(i=0;i<json.length;i++){
							list += "<tr>";
							list += "<td>"+json[i].notNo+"</td>";
							list += "<td>"+json[i].notTitle+"</td>";
			      			list += "<td>"+getFormatDate(json[i].notDate)+"</td>";
			      			list += "<td><button id=\"modify\" class=\"btn btn-primary\">수정</button></td>";
			      			list += "<td><button id=\"delete\" class=\"btn btn-primary\">삭제</button></td>";
			      			list += "</tr>";
						} // end of for
						
						$("tbody").empty();
						$("tbody").append(list);
						
					}else{
						
						$("tbody").empty();
						//$("tbody").append("<tr><td>등록된 공지사항이 없습니다.</td></tr>");
						alert("해당 날짜에 등록된 공지사항이 없습니다.");
					} // end of if
				} // end of success
				
			});
		});
		
		$("#recent-search").on('click',function(){
			$.ajax({
				url: contextPath+"/api/noticerecent",
				type:"get",
				contentType:"application/json; charset=utf-8",
				dataType:"json",
				success:function(json){
					list="";
					if(json.length >= 1){
						for(i=0;i<json.length;i++){
							list += "<tr>";
							list += "<td>"+json[i].notNo+"</td>";
							list += "<td>"+json[i].notTitle+"</td>";
			      			list += "<td>"+getFormatDate(json[i].notDate)+"</td>";
			      			list += "<td><button id=\"modify\" class=\"btn btn-primary\">수정</button></td>";
			      			list += "<td><button id=\"delete\" class=\"btn btn-primary\">삭제</button></td>";
			      			list += "</tr>";
						} // end of for
						$("tbody").empty();
						$("tbody").append(list);
					} // end of if
				} // end of success
				
			});
		});
		
		
		$(document).ready(function(){
			 
			// 다른 방법도 있는지 생각해보기.
			// 수정 버튼
			$(this).on('click', '[id=modify]', function(){
				
				var td = $(this).parent().prevUntil();
				var notNo = td.last().text(); 
				
				console.log(notNo);
				window.location.href = contextPath + "/updateNotice?notNo=" + notNo;
			});
			
			// 등록 버튼
			$(this).on('click','[id=regist]',function(){
				window.location.href = contextPath+"/registNotice";
			});
			
			// 삭제 버튼
			$(this).on('click','[id=delete]',function(){
				var td = $(this).parent().prevUntil();
				var notNo = td.last().text(); 
				
				$.ajax({
					url:contextPath + "/api/notice?notNo="+notNo,
					type:"delete",
					contentType:"application/json; charset=utf-8",
					dataType:"json",
					data: notNo,
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
				});
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
  <!-- 사이드바 -->
  <!-- /사이드바 -->

  <!-- 본문 -->
	<div id="page-content-wrapper">
    	<div class="container-fluid">
      		<h1 class="text-center">공지사항</h1>
      
	  			<button class="btn btn-primary topBtn" id="regist" style="float:left; margin:0 0 10px 5px;">등록</button>
	      		<button class="btn btn-primary topBtn" id="recent-search"style="float:left; margin:0 0 10px 5px;">최근 공지 10개 보기</button>
	      	<div id="search" style="width:290px; height:45px; float:right;">
				<input type="date" class="btn btn-primary" id="date" style="float:right; padding:6px 0px; margin:0 20px 0 0;">
      		</div>
      		
			<table class="table table-hover table-striped text-center" style="border: 1px solid;">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
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

</html>