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
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/manager/additional.css">
<script type="text/javascript">

	$(function() {

		var contextPath = "${contextPath}";
		console.log(contextPath);
		var notNo = "${notNo}";
		console.log(notNo);
		$("#no").attr('value', notNo);

		$.ajax({
				url : contextPath + "/api/notice?notNo=" + notNo,
				type : "get",
				contentType : "application/json; charset=utf-8",
				dataType : "json",
				success : function(json) {
					var divFile = "";

					// 파일 존재 판단 후, 그에 따른 처리.
					if (json.notFile == null) {
						divFile += "<div id=\"file\"class=\"form-group\">";
						divFile += "<label>파일 첨부</label>";
						divFile += "<input type=\"file\" id=\"uploadFile\" name=\"uploadFile\" class=\"form-control\">";
						divFile += "</div>";
					} else {
						
						divFile += "<div id=\"file\" class=\"form-group\">";
						divFile += "<button id=\"initFile\" class=\"btn btn-primary\" style=\"float:right;\">X</button>";
						divFile += "<a href=\"/proj21_movie/resources/attachments/notice/"+json.notFile +"\" class=\"form-control\">"
								+ json.notFile + "</a>";
						divFile += "</div>";
					}
					
					$("#no").attr('value', json.notNo);
					$("#regdate").attr('value', json.notDate);
					$("#title").attr('value', json.notTitle);
					$("#content").empty();
					$("#content").append(json.notDetail.replace(/<br>/g,'\n'));
					$("div.form-group").eq(3).after(divFile);
					
					},
				error : function() {
					alert("뭔가 잘못되긴 했어용");
				}
			});
		
		//파일 초기화
		//동적으로 생성된 버튼은 document 사용. 나중에 정리.
		$(document).on('click','#initFile',function(e){
			console.log("드디어 되땅.");
			var divFile = "";
			divFile += "<label>파일 첨부</label>";
			divFile += "<input type=\"file\" id=\"uploadFile\" name=\"uploadFile\" class=\"form-control\">";
			
			$("div#file").empty();
			$("div#file").append(divFile);			
		});
		
		// 수정 버튼
		$("#modify").on('click', function() {
			var conf = confirm("수정하시겠습니까?");
			if (conf) {
				// 업로드되는 파일이 있다면. 파일 업로드 수행.

				var fileName;
				if ($("input#uploadFile").val() != "") {
					console.log($("#uploadFile").val());
					// 파일 이름만 뽑아내기.
					var filePath = $("#uploadFile").val().split('\\');
					fileName = filePath[filePath.length - 1];

					// 업로드 수행.
					var formData = new FormData();
					var inputFile = $("input#uploadFile");
					var files = inputFile[0].files;
					console.log(files);

					for (var i = 0; i < files.length; i++) {
						formData.append("uploadFile", files[i]);
					}

					$.ajax({
						url : contextPath + "/api/noticeFileUpload",
						processData : false,
						contentType : false,
						data : formData,
						type : "POST",
						success : function(result) {
							console.log("Uploaded");
						}
					});
				}

				var data = {
					notNo : $("#no").val(),
					notTitle : $("#title").val(),
					notDetail : $("#content").val(),
					// date 이슈 발생.
					notFile : fileName
				}

				$.ajax({
					url : contextPath + "/api/notice",
					type : "patch",
					dataType : "json",
					data : JSON.stringify(data),
					contentType : "application/json; charset=utf-8",
					success : function(json) {
						alert("수정이 완료되었습니다.");
						window.location.href = contextPath + "/noticeManager";
					},
					error : function() {
						alert("뭔가 잘못된 것이 분명합니다.");
					}
				});
			}

		});

		// 취소 버튼
		$("#cancel").on('click', function() {
			window.location.href = contextPath + "/noticeManager";
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
			<h1 class="text-center">공지사항</h1>
			<div class="col-md-6 col-sm-12" id="contents">
				<div class="form">
				
						<div class="form-group">
							<label>번호</label> <input type="text" id="no" class="form-control"
								readonly="readonly">
						</div>
						<div class="form-group">
							<label>등록일</label> <input type="text" id="regdate"
								class="form-control" readonly="readonly">
						</div>
						<div class="form-group">
							<label>제목</label> <input type="text" id="title"
								class="form-control">
						</div>
						<div class="form-group" >
							<label>내용</label>
							<textarea rows="10" cols="500" id="content" class="form-control">
                     		</textarea>
						</div>
						

						<div id="btn">
							<button id="modify" class="btn btn-primary">수정</button>
							<button id="cancel" class="btn btn-primary">취소</button>
						</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>