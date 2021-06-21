<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>댓글 수정</title>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 	<!-- 이 js가 다른 js보다 낮으면 에러 뜸 -->
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/movie/updateComment.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/movie/star/fontawesome-stars.css">	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">  
    <script>
    	window.jQuery || document.write('<script src="${contextPath}/resources/js/star/vendor/jquery-1.11.2.min.js"><\/script>')
    </script>	
    <script src="${contextPath}/resources/js/star/jquery.barrating.min.js"></script>
    
	<script>
		$(function(){
			var contextPath = "${contextPath}";
			var comNo = ${param.comNo};
			
			/* 별점 테마 */
		    $('#example-fontawesome').barrating({ 
   				theme: 'fontawesome-stars' 
  			});
			
			$('#cancel').on("click", function(e){
				$('#comContent').val('');
			});
			
			$('#exit').on("click", function(e){
		        window.close();
			});
			
			$.get(contextPath + "/api/comments/" + comNo,
				function(json){
				$('#comNo').val(json.comNo);
				$('#comContent').val(json.comContent);
				$('.com-star').val(json.comStar);
			});
			
			$('#modify').on("click", function(e){
				var data = {comNo: $('#comNo').val(),
							comContent: $('#comContent').val(),
							comStar: $('.com-star').val(),
						};
				
				$.ajax({
					url			: contextPath + "/api/comments/" + comNo,
					type		: 'PATCH',
					contentType : "application/json; charset=utf-8",
					dataType	: 'json',
					cache		: false,
					data		: JSON.stringify(data),
					success		: function(data) {
						alert(comNo + "번 댓글 수정 완료");
						window.opener.location.reload();
				        window.close();
					},
					error: function(data, status, error){
						alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
						window.close();
					}
				});
				
			});
		});
	</script>
	</head>
<body>

  <!-- 본문 -->
  <div class="main">
         <div class="col-md-6 col-sm-12">
            <div class="form">
               <form:form>
               	  <div class="form-group">
                     <label>번호</label>
                     <input type="text" id="comNo" class="form-control" readonly="readonly">
                  </div>
                  <div class="form-group">
                     <label>내용</label>
                     <input type="text" id="comContent" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>별점</label>
	          		 <select id="example-fontawesome" class="com-star" name="rating">
						 <option value="1">1</option>
						 <option value="2">2</option>
						 <option value="3">3</option>
						 <option value="4">4</option>
						 <option value="5">5</option>
					 </select>
                  </div>
               </form:form>
                  <button id="modify" class="btn btn-primary">수정</button>
                  <button id="cancel" class="btn btn-primary">내용지우기</button>
                  <button id="exit" class="btn btn-primary">나가기</button>
            </div>
         </div>
      </div>

</body>
</html>