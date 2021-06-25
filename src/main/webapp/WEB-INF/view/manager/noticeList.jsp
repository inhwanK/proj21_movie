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
<script type="text/javascript">
	$(function(){
		
		function getFormatDate(date) { // date 폼 관리.
			var subDateArray = date.substr(0, 10).split('-');
			return subDateArray[0] + "." + subDateArray[1] + "."
					+ subDateArray[2];
		} // js 파일로 관리할 필요 있음.
		
		var contextPath = "${contextPath}";
		
		$.ajax({
			url: contextPath+"/api/noticelist",
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
		      			console.log(json[i].notNo);
		      			list += "<td><button class=\"btn btn-primary\">수정</button></td>";
		      			list += "<td><button class=\"btn btn-primary\">삭제</button></td>";
		      			list += "</tr>";
					} // end of for
					$("tbody").append(list);
				} // end of if
			} // end of success
			
		});
		
	});

</script>
<link rel="stylesheet" href="${contextPath}/resources/css/manager/sidebar.css">
</head>
<body>
<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="#">관리자 페이지</a>
      </li>
      <li><a href="${contextPath }/main">HOME</a></li>
      <li><a href="${contextPath }/movieManager">영화 관리</a></li>
      <li><a href="${contextPath }/reserveManager">예매 관리</a></li>
      <li><a href="${contextPath }/showInfoManager">상영시간 관리</a></li>
      <li><a href="${contextPath }/memberManager">회원 관리</a></li>
      <li><a href="${contextPath }/salesManager">매출 조회</a></li>
      <li><a href="${contextPath }/noticeManager">공지사항</a></li>
      <li><a href="${contextPath }/inquiryManager">문의사항</a></li>
    </ul>
  </div>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <h1 class="text-center">공지사항</h1>
      <button class="btn btn-primary">등록</button>
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