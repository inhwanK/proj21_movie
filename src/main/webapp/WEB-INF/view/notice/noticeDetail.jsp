<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function(){
		function getFormatDate(date){
			var subDateArray = date.substr(0,10).split('-');
			return subDateArray[0] + "." + subDateArray[1] + "." + subDateArray[2]; 
		} // js 파일로 관리할 필요 있음.
		
		var contextPath = "${contextPath}";
		var notNo = "${notNo}";
		$.ajax({
			url: contextPath +"/api/notice/" + notNo,
			method: "get",
			dataType: "json"
		})
		.done(function(json){
			
			var dateForm = getFormatDate(json.notDate);
			
			$("p.tit[title = '제목']").append(json.notTitle);
			$("span.txt[title = '등록일']").append(dateForm);
			$("div.cont[title = '내용']").append(json.notDetail);
		})
	});
</script>
<style type="text/css">
body {
    overflow: auto;
    overflow-y: scroll;
    letter-spacing: 0;
    line-height: 1.5;
    font-size: 15px;
    color: #444;
    font-weight: 400;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
}


#contents {
    width: 100%;
    margin: 0;
    padding: 40px 0 0 0;
}

.container.has-lnb #contents {
    float: right;
    width: calc(100% - 260px);
}

h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

h2.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
}

.table-wrap {
    position: relative;
    border-top: 1px solid #555;
}

.board-view {
    word-break: break-all;
}

.board-view .tit-area {
    display: table;
    width: 100%;
    padding: 15px 0;
}

.board-view .tit-area .tit {
    display: table-cell;
    margin: 0;
    padding: 0;
    font-size: 1.1429em;
    color: #444;
    font-weight: 400;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.board-view .info {
    padding-bottom: 20px;
    font-size: .9333em;
}

.board-view {
    word-break: break-all;
}

.board-view .cont {
    overflow: hidden;
    width: 100%;
    padding: 20px 0;
    border-top: 1px solid #eaeaea;
}

.prev-next {
    border: 1px solid #eaeaea;
    border-width: 1px 0;
}

.prev-next .line {
    position: relative;
    padding: 0 0 0 170px;
    word-break: break-all;
}

.prev-next .line p {
    margin: 0;
    padding: 0;
}

.prev-next .line .link {
    display: block;
    line-height: 45px;
}

.prev-next .line+.line {
    border-top: 1px solid #eaeaea;
}

a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}

a {
    background-color: transparent;
}

.prev-next .line a.link {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    width: 100%;
    padding: 0 20px 0 0;
    color: #444;
    font-weight: 400;
}

.btn-group {
    padding: 20px 0 30px 0;
    margin: 0;
    text-align: center;
}

.pt40 {
    padding-top: 40px!important;
}

.button {
    display: inline-block;
    height: 36px;
    margin: 0;
    padding: 0 15px;
    text-align: center;
    line-height: 34px;
    color: #503396;
    font-weight: 400;
    border-radius: 4px;
    font-family: NanumBarunGothic,Dotum,'돋움',sans-serif;
    text-decoration: none;
    border: 1px solid #503396;
    vertical-align: middle;
    background-color: #fff;
    cursor: pointer;
}

a:link {
    color: #444;
    text-decoration: none;
}

a.button {
    text-decoration: none;
}

.button.large {
    height: 46px;
    padding: 0 30px;
    line-height: 44px;
}

.btn-group .button {
    margin: 0 3px;
}

#notice-detail-wrap{
	margin: 200px auto 0 auto;
	width: 70%;
}
</style>
</head>
<body>

	<div id="notice-detail-wrap">
	<div id="contents">
		<h2 class="tit">공지사항</h2>

		<div class="table-wrap">
			<div class="board-view">
				<div class="tit-area">
					<p class="tit" title="제목">
					
					</p>
				</div>

				<div class="info">
					<p>
						<span class="tit">등록일</span> 
						<span class="txt" title="등록일"></span>
					</p>
				</div>

				<div class="cont" title="내용">
				
				</div>
			</div>
		</div>

		<div class="prev-next">
			<div class="line prev">
				<p class="tit">이전</p>
				<p class="link">이전글 제목</p> 
				<!-- 글 존재하면 a태그 존재하지 않으면 p 태그  -->
			</div>
			<div class="line next">
				<p class="tit">다음</p>

				<a href="#" class="link moveBtn" data-no="10348" title="">다음글 제목 </a>

			</div>
		</div>
		<div class="btn-group pt40">
			<a href="${contextPath}/noticelist" class="button large listBtn" title="">목록</a>
		</div>
	</div>
	</div>
</body>
</html>