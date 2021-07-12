<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">	<!-- 파비콘 오류 메세지 해결 -->
	<meta charset="UTF-8">
	<title>댓글 수정</title>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 	<!-- 이 js가 다른 js보다 낮으면 에러 뜸 -->
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<link rel="stylesheet" href="${contextPath}/resources/css/movie/updateComment.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/movie/star/fontawesome-stars.css">	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">  
    <script>
    	window.jQuery || document.write('<script src="${contextPath}/resources/js/star/vendor/jquery-1.11.2.min.js"><\/script>')
    </script>	
    <script src="${contextPath}/resources/js/star/jquery.barrating.min.js"></script>
    <script src="${contextPath}/resources/js/movie/updateComment.js"></script>
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
                     <input type="text" id="comContent" class="form-control" maxlength="40" placeholder="수정하고자 할 한줄평을 적어주세요 (40자 이내)">
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

	<script>
		$(function(){
			var contextPath = "${contextPath}";
			var comNo = ${param.comNo};

			/* 값 받아올때 */
			$.get(contextPath + "/api/comments/" + comNo,
				function(json){
					$('#comNo').val(json.comNo);
					$('#comContent').val(json.comContent);
					$('.com-star').val('1');
			});
			
			/* ajax - 수정 버튼 눌렸을때 */
			$('#modify').on("click", function(e){
				var content = $('#comContent').val();
				var data = {comNo: $('#comNo').val(),
							comContent: $('#comContent').val(),
							comStar: $('.com-star').val(),
						};
				
				Swal.fire({ 		// Alert창 디자인 sweetalert2
					title			  : '수정 하시겠습니까?', 
					icon			  : 'question', 
					showCancelButton  : true, 
					confirmButtonColor: '#3085d6', 
					cancelButtonColor : '#d33', 
					confirmButtonText : '수정', 
					cancelButtonText  : '취소' 
					}).then((result) => {
						if (result.isConfirmed) {
							$.ajax({
								url			: contextPath + "/api/comments/" + comNo,
								type		: 'PATCH',
								contentType : "application/json; charset=utf-8",
								dataType	: 'json',
								cache		: false,
								data		: JSON.stringify(data),
								beforeSend  : function(xhr) {	// success로 넘어가기 전에 조건 만족시 success로 넘어가지 않고 beforeSend에서 멈춤
							        if (content == "") {		// 한줄평 내용이 없을때
							        	xhr.abort();
							        	//alert("내용을 입력해주세요!");							        	
							        	Swal.fire({				// Alert창 디자인 sweetalert2
						                    icon : 'warning',
						                    title: '내용을 입력해주세요!',
						                }).then((result) => {
											if (result.isConfirmed) { 
												return false;
											} 
										});	
							        }
							    },
								success		: function(data) {
									//alert(comNo + "번 댓글 수정 완료");
									//window.opener.location.reload();
							        //window.close();			
									Swal.fire({				// Alert창 디자인 sweetalert2
					                    icon : 'success',
					                    title: '한줄평 수정이 완료되었습니다.',
					                }).then((result) => {
										if (result.isConfirmed) { 
											window.opener.location.reload();
									        window.close();
										} 
									});		
								},
								error: function(data, status, error){
									alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
									window.close();
								}
							});
						} else{   
							return false;
					 	}
					});
			});

		});
	</script>
</body>
</html>