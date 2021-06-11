<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<%-- <c:set var="pageNo" value="<%=request.getAttribute("pageNo") %>"/> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
	$(function(){
		function getFormatDate(date){
			var subDateArray = date.substr(0,10).split('-');
			return subDateArray[0] + "." + subDateArray[1] + "." + subDateArray[2]; 
		} // js 파일로 관리할 필요 있음.
		
		var contextPath = "${contextPath}";
		var totalNotice = "${totalNotice}";
		var page = Math.ceil(totalNotice/10);
		var selectPage = "${selectPage}";
		
		$.get(contextPath+"/api/noticelist/"+ selectPage, function(json) {
			
			var dataLength = json.length;
			if(dataLength >= 1){
				var list = "";
				for(i = 9 ; i > -1 ; i--){
					list += "<tr>";
					list += "<td>" + json[i].notNo + "</td>"; 
					list += "<td><a href='${contextPath}/notice?notNo=" + json[i].notNo + "'>" + json[i].notTitle+  "</a></td>"; //보여주면 안될 것 같은 정보.
					list += "<td>" + getFormatDate(json[i].notDate) + "</td>";
					list += "<tr>"
				}
				$("tbody").append(list);
			};
			
			var pageBtn = "";
			
			for(i = 1; i < page + 1; i++){
					pageBtn += "<a title="+ i +"페이지보기 href=\"javascript:void(0)\" pageNo="+ i + ">" + i + "</a>";
			}
			$("nav.pagination").append(pageBtn);
		});
	});
</script>
<title>Insert title here</title>
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

h2.tit {
    padding: 0 0 26px 0;
    font-size: 1.8666em;
    font-weight: 400;
    letter-spacing: -1px;
    line-height: 1.1;
    color: #222;
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

.tab-block:before {
    content: '';
    position: absolute;
    left: 0;
    top: 35px;
    width: 100%;
    height: 1px;
    background-color: #d8d9db;
}

.tab-block ul:after, .tab-block ul:before {
    content: '';
    display: table;
}

.tab-block ul:after {
    clear: both;
}

.tab-block ul:after, .tab-block ul:before {
    content: '';
    display: table;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

ol, ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
}

.board-list-util:after, .board-list-util:before {
    content: '';
    display: table;
}

.board-list-util:after {
    clear: both;
}

.board-list-util:after, .board-list-util:before {
    content: '';
    display: table;
}

.board-list-util {
    margin: 30px 0 15px 0;
    text-align: right;
}

.table-wrap {
    position: relative;
    border-top: 1px solid #555;
}

table {
    width: 100%;
    margin: 0;
    border: 0;
    table-layout: fixed;
    border-collapse: collapse;
    empty-cells: show;
}

.board-list {
    line-height: 1.3;
}

th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
}

.board-list>thead>tr>th {
    height: 45px;
    padding: 3px 10px;
    color: #222;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    background-color: #f2f4f5;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.board-list>tbody>tr>td, .board-list>tbody>tr>th {
    height: 45px;
    padding: 10px;
    border: 1px solid #eaeaea;
    border-width: 0 0 1px 0;
    text-align: center;
}

td {
    display: table-cell;
    vertical-align: inherit;
}

a:link {
    color: #444;
    text-decoration: none;
}

.board-list>tbody>tr>td>a, .board-list>tbody>tr>th>a {
    display: inline-block;
    margin: 0;
    padding: 0;
    vertical-align: middle;
}

article, aside, figcaption, figure, footer, header, main, nav, section {
    display: block;
}

.pagination {
    clear: both;
    position: relative;
    margin: 0 auto;
    padding: 30px 0 0 0;
    text-align: center;
}

.pagination .control, .pagination a, .pagination strong {
    display: inline-block;
    position: relative;
    min-width: 32px;
    height: 32px;
    margin: 0;
    padding: 0 8px;
    border: 1px solid #ebebeb;
    text-decoration: none;
    line-height: 30px;
    color: #333;
    font-weight: 400;
    vertical-align: middle;
    border-radius: 4px;
}

.pagination .active {
    color: #fff;
    background-color: #01738b;
    border-color: #01738b;
}

#notice-wrap{
	width:70%;
	margin: 200px auto 0 auto;
}
</style>
</head>
<body>


<div id="notice-wrap">

	<div id="contents">
		<h2 class="tit">공지사항</h2>

		<!-- <div class="tab-block mb30">
			<ul>
				<li class="on tabBtn"><button type="button" class="btn tabBtn"
						data-no="" title="전체공지 보기">전체</button></li>

				<li class="tabBtn"><button type="button" class="btn"
						data-no="81" title="메가박스 공지 보기">메가박스 공지</button></li>

				<li class="tabBtn"><button type="button" class="btn"
						data-no="82" title="지점 공지 보기">지점 공지</button></li>

			</ul>
		</div> -->


<!-- 검색 기능 -->
		  <div class="board-list-util">
			<!-- <p class="result-count">
				<strong>전체 <em class="font-gblue">5,645</em>건
				</strong>
			</p> -->

			<div class="dropdown bootstrap-select mr07 bs3">
				<select id="theater" title="지역 선택" class="mr07" tabindex="-98"><option
						class="bs-title-option" value=""></option>
					<option value="">지역 선택</option>

					<option value="10">서울</option>

					<option value="30">경기</option>

					<option value="35">인천</option>

					<option value="45">대전/충청/세종</option>

					<option value="55">부산/대구/경상</option>

					<option value="65">광주/전라</option>

					<option value="70">강원</option>

					<option value="80">제주</option>

				</select>
				<button type="button"
					class="btn dropdown-toggle btn-default bs-placeholder"
					data-toggle="dropdown" role="button" data-id="theater"
					title="지역 선택">
					<div class="filter-option">
						<div class="filter-option-inner">
							<div class="filter-option-inner-inner">지역 선택</div>
						</div>
					</div>
					<span class="bs-caret"><span class="caret"></span></span>
				</button>
				
				<div class="dropdown-menu open" role="combobox">
					<div class="inner open" role="listbox" aria-expanded="false"
						tabindex="-1">
						<ul class="dropdown-menu inner "></ul>
					</div>
				</div>
			</div>

			<div class="dropdown bootstrap-select disabled mr07 bs3">
				<select id="theater02" title="극장 선택" disabled="disabled"
					class="mr07" tabindex="-98"><option
						class="bs-title-option" value=""></option>
					<option value="">극장 선택</option>

				</select>
				<button type="button"
					class="btn dropdown-toggle disabled btn-default bs-placeholder"
					data-toggle="dropdown" role="button" data-id="theater02"
					tabindex="-1" aria-disabled="true" title="극장 선택">
					<div class="filter-option">
						<div class="filter-option-inner">
							<div class="filter-option-inner-inner">극장 선택</div>
						</div>
					</div>
					<span class="bs-caret"><span class="caret"></span></span>
				</button>
				<div class="dropdown-menu open" role="combobox">
					<div class="inner open" role="listbox" aria-expanded="false"
						tabindex="-1">
						<ul class="dropdown-menu inner "></ul>
					</div>
				</div>
			</div>

			<div class="board-search">
				<input type="text" id="searchTxt" title="검색어를 입력해 주세요."
					placeholder="검색어를 입력해 주세요." class="input-text" value=""
					maxlength="15">
				<button type="button" id="searchBtn" class="btn-search-input">검색</button>
			</div>
		</div>
		
<!-- 여기부터 리스트  -->
		<div class="table-wrap">
			<table class="board-list">
				<caption>번호, 극장, 구분, 제목, 등록일이 들어간 공지사항 전체 리스트</caption>
				<colgroup>
					<col style="width: 72px;">
					<col>
					<col style="width: 116px;">
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
		<nav class="pagination">
			<!-- <strong class="active">1</strong> 
			<a title="2페이지보기" href="javascript:void(0)" pagenum="2">2</a> 
			<a title="3페이지보기" href="javascript:void(0)" pagenum="3">3</a> 
			<a title="10페이지보기" href="javascript:void(0)" pagenum="10">10</a>  
			<a title="이후 10페이지 보기" href="javascript:void(0)" class="control next" pagenum="11">next</a>
			<a title="마지막 페이지 보기" href="javascript:void(0)" class="control last"pagenum="565">last</a> -->
		</nav> 
		
		<!--// pagination -->
	</div>
	</div>
</body>
</html>