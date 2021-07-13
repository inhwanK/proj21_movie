<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<link rel="stylesheet"
	href="${contextPath}/resources/css/notice/newlayout.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/inquiry/inquiryForm.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script type="text/javascript">
	$(function(json) {
		var contextPath = "${contextPath}";
		var member = "${member.memEmail}";
		console.log(member);
		if(member == ""){
			console.log("안됨")
			//if(confirm("로그인이 필요한 서비스입니다.\n로그인창으로 이동하시겠습니까?")){
			Swal.fire({ 		// Alert창 디자인 sweetalert2
				title			  : '로그인이 필요한 서비스입니다.\n로그인창으로 이동하시겠습니까?', 
				icon			  : 'question',
				showCancelButton  : true, 
				confirmButtonColor: '#3085d6', 
				cancelButtonColor : '#d33', 
				confirmButtonText : '예', 
				cancelButtonText  : '아니오' 
				}).then((result) => {
				if (result.isConfirmed) {
					window.location.href = contextPath + "/login";				
				}else{
					window.location.href = contextPath + "/noticelist";
				}
			});
		}
		
		$("button#regist").on("click",function() {
			//var conf = confirm("등록하시겠습니까?");
			//if (conf) {
			Swal.fire({ 		// Alert창 디자인 sweetalert2
				title			  : '등록하시겠습니까?', 
				icon			  : 'question',
				showCancelButton  : true, 
				confirmButtonColor: '#3085d6', 
				cancelButtonColor : '#d33', 
				confirmButtonText : '예', 
				cancelButtonText  : '아니오' 
				}).then((result) => {
				if (result.isConfirmed) {
					
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
						// alert("아이디을 입력하세요.");
						Swal.fire({				// Alert창 디자인 sweetalert2
			                icon : 'error',
			                title: '아이디을 입력하세요.'
			            });
					} else if (inquiry.inqTitle == "") {
						// alert("제목을 입력하세요.")
						Swal.fire({				// Alert창 디자인 sweetalert2
			                icon : 'warning',
			                title: '제목을 입력하세요.'
			            });
					} else if (inquiry.inqDetail == "") {
						//alert("문의 내용을 입력하세요.")
						Swal.fire({				// Alert창 디자인 sweetalert2
			                icon : 'warning',
			                title: '문의 내용을 입력하세요.'
			            });
					} else {
						
						if (fileName != "") {
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

				} else{
					return false;
				}
			});
		}); // end of event

	});
</script>
</head>
<body>


	<%@include file="/WEB-INF/view/header.jsp"%>
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
							<th scope="row">
								<label for="name">ID</label>
								<em	class="font-orange">*</em>
							</th>
							<td>

					            	<input type="text" id="name" name="inqUser"	class="input-text w150px" value="${member.memEmail}"readonly="readonly">	

							</td>
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
	<%@include file="/WEB-INF/view/footer.jsp"%>

</body>
</html>