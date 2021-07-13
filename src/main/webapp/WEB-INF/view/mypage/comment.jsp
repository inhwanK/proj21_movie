<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">	<!-- 파비콘 오류 메세지 해결 -->
	<meta charset="UTF-8">
	<title>한줄평 내역</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/mypage/comment.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<section>
		<div id="container">
			<div id="mypage-menubar">
			
				<ul>
					<li><a href="${contextPath}/mypage"><h2>My Page</h2></a></li>
					<li><a href="${contextPath}/reserveInfo">예매내역</a></li>
					<li class="active-menu"><a href="${contextPath}/commentInfo">한줄평 내역</a></li>
					<li><a href="${contextPath}/inquiryInfo">1대1 문의 내역</a></li>
					<li><a href="${contextPath}/myinfo">개인정보 수정</a></li>
					<li><a href="${contextPath}/withdrawal">회원탈퇴</a></li>
				</ul>
			</div>
			
			<div id="comment-wrap">
					<h2>한줄평 내역</h2>
					<div id="comment-count">
						<strong id="strCnt">총 0건</strong>
					</div>
					<ul id="comments">
					
					</ul>
			</div>
		</div>
		
	</section>

	<%@include file="/WEB-INF/view/footer.jsp"%>
	
	<script type="text/javascript">
		$(function(){
			var contextPath = "${contextPath}";
			var user = "${member.memEmail}";
			
			console.log("user >> " + user);
			
			reload();
			
			$("#comments").on('click', '[class=delComment]', function(e){
				e.preventDefault();
				var comNo = Number($(this).prev().val());
				
				// if (confirm("한줄평을 삭제하시겠습니까?")) {					
				Swal.fire({ 		// Alert창 디자인 sweetalert2
					title			  : '한줄평을 삭제하시겠습니까?', 
					icon			  : 'warning',
					showCancelButton  : true, 
					confirmButtonColor: '#3085d6', 
					cancelButtonColor : '#d33', 
					confirmButtonText : '삭제', 
					cancelButtonText  : '취소' 
					}).then((result) => {
						if (result.isConfirmed) {
							$.ajax({
								url: contextPath + "/api/comments/" + comNo,
								type: 'DELETE',
								success: function(res) {
									$("#comments").empty();
									reload();
								},
								error: function(request, status, error) {
									alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
								}
							});
						} else {
							return false;
						}
					});
				
			});
			
			function reload(){
				$.ajax({
					type:"GET",
					url: contextPath + "/api/comments/user?comUser=" + user,
					contentType: "application/json; charset=utf-8",
					async: false,
					success: function(json){
						var dataLength = json.length;
						if (dataLength >= 1) {
							var sCont = "";
							$("#strCnt").text("총 " + dataLength + " 건");
							for (i = 0; i < dataLength; i++) {
								sCont += "<li>";
								sCont += "<div class='comment-list'>";
								sCont += "<a href='${contextPath}/movie?movNo=" + json[i].movNo.movNo + "'>";
								sCont += "<img alt='포스터사진' src='${contextPath}/resources/images/movie/box-office/" + json[i].movNo.movPoster + "'>";
								sCont += "</a>";
								sCont += "<div class='textarea'>";
								sCont += "<h3>" + json[i].movNo.movTitle + "</h3>";
								sCont += "<p>작성내용 : " + json[i].comContent + "</p>";
								sCont += "<p>평점 : " + json[i].comStar + " 점</p>";
								sCont += "<p>작성일 : " + json[i].comDate + "</p>";
								sCont += "<input type='hidden' value=" + json[i].comNo + ">";
								sCont += "<a class='delComment' href=''>한줄평 삭제</a>";
								sCont += "</div>";
								sCont += "</div>";
								sCont += "</li>";
							}
							$("#comments").append(sCont);
						}
					}
				});
			}
		});
		
	</script>
	
</body>
</html>