<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/notice/newlayout.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/inquiry/inquiryForm.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function(json) {
		var contextPath = "${contextPath}";
		$("button#regist").on("click",function() {
			var conf = confirm("등록하시겠습니까?");
			if (conf) {
				var fileName = null;

				// 파일 이름 넣기.
				if ($("input[name='inqFile']").val() != "") {
					var location = $("input[name='inqFile']").val().split('\\');
					fileName = location[location.length - 1];
					console.log(file);
				}

				console.log(fileName);

				var inquiry = {
					inqUser : $("input[name=inqUser]").val(),
					inqTitle : $("input[name=inqTitle]").val(),
					inqDetail : $("textarea[name=inqDetail]").val(),
					inqFile : fileName	
				};

				// 필수항목 기입하지 않았을 때, 처리
				if (inquiry.inqUser == "") {
					alert("이름을 입력하세요.");
				} else if (inquiry.inqTitle == "") {
					alert("제목을 입력하세요.")
				} else if (inquiry.inqDetail == "") {
					alert("문의 내용을 입력하세요.")
				} else {
					$.ajax({
						url : contextPath + "/api/inquiry",
						type : "post",
						contentType : "application/json; charset=utf-8",
						dataType : "json",
						data : JSON.stringify(inquiry),
						success : function(res) {
							console.log(res);
							window.location.href = contextPath + "/inquirySuccess";
						},
						error : function() {
							alert("뭔가 잘못된게 분명합니다.");
							alert("error > "+ JSON.stringify(data))
						}
					});
				} //end of else
	
				if (file != null) {
					var formData = new FormData();
					var inputFile = $("input[name='inqFile']");
					var files = inputFile[0].files;

					console.log(files);

					for (var i = 0; i < files.length; i++) {
						formData.append("uploadFile", files[i]);
					}

					$.ajax({
						url : contextPath + "/api/inquiryFileUpload",
						processData : false,
						contentType : false,
						data : formData,
						type : "POST",
						success : function(result) {
						console.log("Uploaded");
						}	
					}); // end of ajax
				} //end of if

			} //end of if(conf)
		}); // end of event

	});
</script>
</head>
<body>

	<header>
		<a href="${contextPath}/main"><img id="header_ci" alt="브랜드 로고"
			src="${contextPath}/resources/images/ci.png"></a>
		<div>
			<a href="${contextPath}/login">로그인</a> <a href="#">회원가입</a> <a
				href="#">바로예매</a>
		</div>

	</header>

	<nav>
		<ul>
			<li class="nav"><a href="${contextPath}/movielist">영화</a></li>
			<li class="nav"><a href="${contextPath}/reserve">예매</a></li>
			<li class="nav"><a href="${contextPath}/theaterlist">극장</a></li>
			<li class="nav"><a href="${contextPath}/inquiry">이벤트</a></li>
			<li class="nav"><a href="${contextPath}/noticelist">고객센터</a></li>
			<li id="mypagebtn"><a href="${contextPath}/mypage"><i
					class="far fa-user"></i></a></li>
		</ul>
	</nav>

	<section>
		<div id="title-wrap">
			<div class="title">
				<a href="noticelist">공지사항</a>
			</div>
			<div class="title">
				<a href="inquiry" style="font-weight: 900; color: #222;">1:1 문의</a>
			</div>
		</div>


		<div id="contents" class="">

			<!-- <div class="mypage-infomation mb30">

					<div class="btn-group right">
						<a href="#" class="button purple" id="myQnaBtn" title="나의 문의내역 페이지로 이동">나의 문의내역</a>btn-layer-open
					</div>
				</div>  -->

			<p id="essential">* 필수</p>


			<div class="table-wrap mt10">
				<table class="board-form va-m">
					<colgroup>
						<col style="width: 150px;">
						<col>
						<col style="width: 150px;">
						<col>
					</colgroup>
					<tbody>

						<tr>
							<th scope="row"><label for="name">이름</label> <em
								class="font-orange">*</em></th>
							<td><input type="text" id="name" name="inqUser"
								class="input-text w150px" value="" maxlength="15"></td>
						</tr>



						<tr>
							<th scope="row"><label for="qnaCustInqTitle">제목</label> <em
								class="font-orange">*</em></th>
							<td colspan="3"><input type="text" name="inqTitle"
								id="qnaCustInqTitle" class="input-text" maxlength="30">
							</td>
						</tr>

						<tr>
							<th scope="row"><label for="textarea">내용</label> <em
								class="font-orange">*</em></th>
							<td colspan="3">
								<div class="textarea">
									<textarea id="textarea" name="inqDetail" rows="7" cols="60"
										title="내용입력"
										placeholder="※ 불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변 드리겠습니다."
										class="input-textarea"></textarea>
									<div class="util">
										<p class="count">
											<span id="textareaCnt">0</span> / 2000
										</p>
									</div>
								</div>
							</td>
						</tr>



						<tr>
							<th scope="row">사진첨부</th>
							<td colspan="3">
								<div class="upload-image-box">

									<div class="info-txt">
										<input type="file" id="uploadFile" class="btn-image-add"
											name="inqFile">
										<p id="file">* 개인정보가 포함된 이미지 등록은 자제하여 주시기 바랍니다.</p>
									</div>

									<div id="imgList"></div>

								</div>
							</td>
						</tr>

					</tbody>
				</table>
			</div>


			<div class="btn-group pt40">
				<button type="submit" class="button purple large" id="regist">등록</button>
			</div>

		</div>
	</section>

	<footer>
		<div id="content">
			<img id="footer_ci" alt="브랜드 로고"
				src="${contextPath}/resources/images/ci.png">
			<div id="textarea">
				<p>COPYRIGHT © BoxMovie, Inc. All rights reserved</p>
				<p>대구광역시 서구 서대구로 7길2 (내당동 245-4번지 2층) ARS 053-555-1333</p>
			</div>
		</div>
	</footer>
</body>
</html>