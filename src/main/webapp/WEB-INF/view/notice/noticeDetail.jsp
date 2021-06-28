<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function() {
		function getFormatDate(date) {
			var subDateArray = date.substr(0, 10).split('-');
			return subDateArray[0] + "." + subDateArray[1] + "."
					+ subDateArray[2];
		} // js 파일로 관리할 필요 있음.

		var contextPath = "${contextPath}";
		var notNo = "${notNo}";
		// console.log(notNo.serialize());
		$.ajax({
			url : contextPath + "/api/notice?notNo=" + notNo,
			method : "get",
			dataType : "json"
		}).done(function(json) {
			var dateForm = getFormatDate(json.notDate);

			$("p.tit[title = '제목']").append(json.notTitle);
			$("span.txt[title = '등록일']").append(dateForm);
			$("div.cont[title = '내용']").append(json.notDetail);
		});

	});
</script>
<link rel="stylesheet"
	href="${contextPath}/resources/css/notice/newlayout.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/notice/noticeDetail.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css">
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
				<a href="noticelist" style="font-weight: 900; color: #222;">공지사항</a>
			</div>
			<div class="title">
				<a href="inquiry">1:1 문의</a>
			</div>
		</div>

		<div id="notice-detail-wrap">
			<div id="contents">
				<div class="table-wrap">
					<div class="board-view">
						<div class="tit-area">
							<p class="tit" title="제목"></p>
						</div>

						<div class="info">
							<p>
								<span class="tit">등록일</span> <span class="txt" title="등록일"></span>
							</p>
						</div>

						<div class="cont" title="내용"></div>
					</div>
				</div>

				<div class="prev-next">
					<div class="line prev" title="이전">
						<p class="tit" title="이전">이전</p>
						<p class="link" title="이전">이전글 제목</p>
						<!-- 글 존재하면 a태그 존재하지 않으면 p 태그  -->
					</div>
					<div class="line next" title="다음">
						<p class="tit" title="다음">다음</p>
						<!-- <p class="link" title="다음">다음글 제목</p> -->
						<a href="#" class="link moveBtn" data-no="10348" title="다음">
							다음글 제목 </a>

					</div>
				</div>
				<div class="btn-group pt40">
					<a href="${contextPath}/noticelist" class="button large listBtn"
						title="">목록</a>
				</div>
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