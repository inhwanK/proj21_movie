<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function() {
		function getFormatDate(date) {
			var subDateArray = date.substr(0, 10).split('-');
			return subDateArray[0] + "." + subDateArray[1] + "."
					+ subDateArray[2];
		} // js 파일로 관리할 필요 있음.

		var contextPath = "${contextPath}"; // 절대 경로
		
		var totalNotice = "${totalNotice}"; // 검색된 공지 전체 개수
		var page = Math.ceil(totalNotice / 10); // 페이징 계산
		var selectPage = "${selectPage}"; // 선택한 페이지
		var notTitle = "${notTitle}"; // 검색어, 제목.
		
		console.log(notTitle);
		console.log(selectPage);
		console.log(totalNotice);
		
		$.ajax({
			url:contextPath+"/api/noticesearch?notTitle="+notTitle+"&selectPage="+selectPage,
			type:"get",
			contentType:"application/json; charset=utf-8",
			dataType: "json",
			success: function(json) {
				var dataLength = json.length;
				if(dataLength == 0){
					var list = "";
					list += "<div id=\"notfound\">";
					list += "<h2>\""+notTitle+"\"에 대한 검색 결과가 없습니다.</h2>";
					list += "</div>";
					
					$("tbody").empty(); // 목록 지우기
					$("nav.pagination").remove(); // 페이지 버튼 지우기
					$("div#notfound").remove(); // 이전 검색 결과 메세지 지우기
					$("div.table-wrap").append(list); // list 문자열 마지막에 추가하기. css 적용안되서 tbody에 안넣고 div.table-wrap에 넣음.
				}else{
					list = "";
					for (i = 0; i < dataLength; i++) {
						list += "<tr>";
						list += "<td>" + json[i].notNo + "</td>";
						list += "<td><a href='${contextPath}/notice?notNo="
								+ json[i].notNo + "'>" + json[i].notTitle
								+ "</a></td>";
						list += "<td>" + getFormatDate(json[i].notDate) + "</td>";
						list += "<tr>"
					}
					$("tbody").append(list);
				}

				var pageBtn = "";

				for (i = 1; i < page + 1; i++) {
					pageBtn += "<a title=" + i
							+ "페이지보기 href=\""+contextPath+"/noticelist?notTitle="+notTitle+ "&selectPage=" + i
							+ "\">" + i + "</a>"; // 더 좋은 방법이 있을 거야....
				}
				$("nav.pagination").append(pageBtn);
				$(".pagination a[title="+selectPage+"페이지보기]").attr('style','font-weight:1000; color:#000; border-color:#000;')
			}
		});
		
		// 검색 엔터 기능.
		$("#searchTxt").on("keyup", function(key) {
	        if (key.keyCode == 13) {
	        	$('#searchBtn').click();
	        	return false;	// 검색 버튼을 눌렀을 경우에 해당 버튼이 활성화 (다른 의도하지 않은 동작 방지)
	        }
	    });
		
		// 검색 클릭 기능.
		$("#searchBtn").on("click", function(){
			
			var notTitle = $("#searchTxt").val();
			if(notTitle == ""){
				var list = "";
				list += "<div id=\"notfound\">";
				list += "<h2>\""+notTitle+"\"에 대한 검색 결과가 없습니다.</h2>";
				list += "</div>";
				
				$("tbody").empty(); // 목록 지우기
				$("nav.pagination").remove(); // 페이지 버튼 지우기
				$("div#notfound").remove(); // 이전 검색 결과 메세지 지우기
				$("div.table-wrap").append(list); // list 문자열 마지막에 추가하기. css 적용안되서 tbody에 안넣고 div.table-wrap에 넣음.
			}else{
				window.location.href = contextPath + "/noticelist?notTitle="+notTitle;
			}
		});
	});

</script>

<link rel="stylesheet"
	href="${contextPath}/resources/css/notice/noticeList.css">
<title>공지사항</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css"
	rel="stylesheet">
</head>
<body>
	
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<section>
		<div>

			<div id="contents">
				<div id="title-wrap">
					<div class="title">
						<a href="noticelist" style="font-weight: 900; color: #222;">공지사항</a>
					</div>
					<div class="title">
						<a href="inquiry">1:1 문의</a>
					</div>
				</div>


				<!-- 검색 기능 -->
				<div class="board-list-util">
					<div class="board-search">
						<input type="text" id="searchTxt" title="검색어를 입력해 주세요."
							placeholder="제목을 입력하세요." class="input-text" maxlength="15"
							name="notTitle">
						<button type="button" id="searchBtn" class="button purple">검색</button>
					</div>
				</div>

				<!-- 여기부터 리스트  -->
				<div class="table-wrap">
					<table class="board-list">
						<colgroup>
							<col style="width: 15%;">
							<col>
							<col style="width: 15%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">등록일</th>
							</tr>

						</thead>
						<tbody>

						</tbody>
					</table>
				</div>

				<!-- pagination -->
				<nav class="pagination"></nav>

				<!--// pagination -->
			</div>
		</div>
	</section>
	
	<%@include file="/WEB-INF/view/footer.jsp"%>
	

</body>
</html>