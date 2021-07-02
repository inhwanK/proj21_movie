<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">	<!-- 파비콘 오류 메세지 해결 -->
	<meta charset="UTF-8">
	<title>전체 극장 리스트</title>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<link rel="stylesheet" href="${contextPath}/resources/css/theater/theaterList.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var contextPath = "${contextPath}";
			$.get(contextPath + "/api/theaters",
				function(json) {
					var dataLength = json.length;
					if (dataLength >= 1) {
						var list = "";
						for (i = 0; i < dataLength; i++) {
							list += "<li>";
							list += "<a href='${contextPath}/theater?thtNo=" + json[i].thtNo 
								+ "' title='" + json[i].thtName + " 상세보기'>" + json[i].thtName + "</a>"; 
							list += "</li>";						
						}
						$(".theater-list ul").append(list);
					}
				});		
		});	
	</script>
</head>
<body>	
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<section>
		<div class="container">
	    	<!-- <div class="page-util">	
				<div class="location">
	    			<span></span>
	    			<a href="" title="극장 페이지로 이동">극장</a>
	    			<a href="" title="전체극장 페이지로 이동">전체극장</a>
	    		</div>
	    	</div> -->
	    	
	    	<div class="contents">
	    		<div class="inner-wrap">
	    			<h2 class="title">전체극장</h2>
	    				
	    				<!-- 전체극장 리스트 -->
			     		<div class="theater-box">
							<div class="theater-place">
								<ul>
									<li class="active">
										<button type="button" class="sel-city">대구</button>
										<div class="theater-list">
											<ul>																					
											</ul>
										</div>
									</li>
								</ul>
							</div>
						</div>
						
	    		</div>
	    	</div>
		</div>
	</section>
	
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>