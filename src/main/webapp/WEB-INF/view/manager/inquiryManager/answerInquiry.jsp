<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 수정</title>
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/resources/css/manager/additional.css">
<style type="text/css">
.form {
	margin: 50px auto;
}
</style>
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {

		var contextPath = "${contextPath}";
		console.log(contextPath);
		var inqNo = "${inqNo}";
		console.log(inqNo);

		$.ajax({
			url : contextPath + "/api/inquiry?inqNo=" + inqNo,
			type : "get",
			contentType : "application/json; charset=utf-8",
			dataType : "json",
			success : function(json) {
						
				console.log(json.inqFile);
				// 파일 존재 판단 후, 그에 따른 처리.
				if(json.inqFile !=null){
					var divFile = "";
							
					divFile += "<div class=\"form-group\">";
					divFile += "<label>파일</label>";
					divFile += "<a class=\"form-control\" href=\"/proj21_movie/resources/attachments/inquiry/"+json.inqFile +"\">"
							+ json.inqFile + "</a>";
					divFile += "</div>";
							
					$("#content").parent().after(divFile);
				}

				$("#no").attr('value', json.inqNo);
				$("#regdate").attr('value', json.inqDate);
				$("#title").attr('value', json.inqTitle);
				$("#user").attr('value', json.inqUser);
				$("#content").empty();
				$("#content").append(json.inqDetail);

				$("#answerCont").empty();
				$("#answerCont").append(json.inqAnswer);

			},
			error : function() {
				alert("뭔가 잘못되긴 했어용");
			}
		});

		// 답변 버튼
		$("#answer").on('click',function() {
			if($("#answerCont").val() == ""){
				alert("답변을 입력하세요.");
				return;
			}
			
			
			var conf = confirm("답변을 등록하시겠습니까?");
			if (conf) {
				var data = {
					inqNo : $("#no").val(),
					inqAnswer : $("#answerCont").val()
				}
				$.ajax({
					url : contextPath + "/api/inquiry",
					type : "patch",
					dataType : "json",
					data : JSON.stringify(data),
					contentType : "application/json; charset=utf-8",
					success : function(json) {
						alert("답변이 등록되었습니다.");
						window.location.href = contextPath + "/inquiryManager";
					},
					error : function() {
						alert("뭔가 잘못된 것이 분명합니다.");
					}
				});
			}
		}); //end of answer

		// 취소 버튼
		$("#cancel").on('click', function() {
			window.location.href = contextPath + "/inquiryManager";
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
		<div class="main">
			<h1 class="text-center">문의</h1>
			<div class="col-md-6 col-sm-12" id="contents">
				<div class="form">
					<form:form>
						<div class="form-group">
							<label>번호</label> <input type="text" id="no" class="form-control"
								readonly="readonly">
						</div>
						<div class="form-group">
							<label>등록일</label> <input type="text" id="regdate"
								class="form-control" readonly="readonly">
						</div>
						<div class="form-group">
							<label>작성자</label> <input type="text" id="user"
								class="form-control" readonly="readonly">
						</div>
						<div class="form-group">
							<label>제목</label> <input type="text" id="title"
								class="form-control" readonly="readonly">
						</div>
						<div class="form-group">
							<label>내용</label>
							<textarea rows="10" cols="500" id="content" class="form-control"
								readonly="readonly">
                     		</textarea>
						</div>
						<div class="form-group">
							<label>답변</label>
							<textarea rows="10" cols="500" id="answerCont"
								class="form-control">
                     </textarea>
						</div>



					</form:form>
					<div id="btn">
						<button id="answer" class="btn btn-primary">답변</button>
						<button id="cancel" class="btn btn-primary">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>