<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	font-family: NanumBarunGothic, Dotum, '돋움', sans-serif;
}

.event-list ul {
	overflow: hidden;
	margin: 0 0 0 -40px;
}

.inner-wrap {
	width: 1250px;
	margin: 150px auto 0;
}

.inner-wrap:after, .inner-wrap:before {
	content: '';
	display: table;
}

.inner-wrap:after {
	clear: both;
}

.inner-wrap:after, .inner-wrap:before {
	content: '';
	display: table;
}

.event-list {
	overflow: hidden;
}

.mt15 {
	margin-top: 15px !important;
}

.event-list ul li {
	position: relative;
	float: left;
	width: 245px;
	margin: 0 0 0 40px;
	padding: 0;
}

.event-list ul li a {
	overflow: hidden;
	display: block;
	border: 1px solid #e4e4e4;
	border-radius: 10px;
	min-height: 364px;
}

a:link {
	color: #444;
	text-decoration: none;
}

a {
	background-color: transparent;
}

a:-webkit-any-link {
	color: -webkit-link;
	cursor: pointer;
	text-decoration: underline;
}

.event-list ul li a .tit {
	overflow: hidden;
	height: 60px;
	margin: 0 0 10px 0;
	padding: 20px 17px 0 17px;
	line-height: 1.3;
	font-weight: 700;
	color: #222;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

ol, ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
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

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.mt70 {
	margin-top: 70px !important;
}

.tit-util:after, .tit-util:before {
	content: '';
	display: block;
	margin: 0 auto;
}

.tit-util:after {
	clear: both;
}


.tit-util .tit {
    float: left;
    padding: 0! important;
    line-height: 1.1;
}

h3.tit {
    margin: 0;
    padding: 0 0 16px 0;
    font-size: 1.6em;
    font-weight: 400;
    color: #503396;
    line-height: 1.1;
}

h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px; 
    font-weight: bold;
    margin: 0 auto;
}
.tit-util .right {
    float: right;
}

.event-title{
	margin:0 auto;
	text-align: center;
}
</style>
</head>
<body>
	<div class="inner-wrap">
		<div><h2 class=event-title>이벤트</h2></div>
		<div class="tit-util mt70">
			<h3 class="tit">이벤트 종류</h3>
			<div class="right">
				<a href="javascript:fn_chgEventTab('CED01')" title="더보기">더보기 <i
					class="iconset ico-arr-right-gray ml05"></i></a>
			</div>
		</div>
		<div class="event-list mt15">
			<ul>
				<li><a href="#">
						<p class="img">
							<img
								src="https://img.megabox.co.kr/SharedImg/event/2021/05/31/mvIl28QAnbtR6HquRJaicFO3licfTau2.jpg">
						</p>
						<p class="tit">코멘트</p>
						<p class="date">날짜</p>
				</a></li>
				<li><a href="#">
						<p class="img">
							<img src="https://img.megabox.co.kr/SharedImg/event/2021/05/24/crxuTMRnQXW8y0gSc8LYoA2u83Qepd81.jpg"">
						</p>
						<p class="tit">코멘트</p>
						<p class="date">날짜</p>
				</a></li>
				
				<li><a href="#">
						<p class="img">
							<img
								src="https://img.megabox.co.kr/SharedImg/event/2021/05/31/mvIl28QAnbtR6HquRJaicFO3licfTau2.jpg">
						</p>
						
						<p class="tit">코멘트</p>
						<p class="date">날짜</p>
				</a></li>
				<li><a href="#">
						<p class="img">
							<img src="https://img.megabox.co.kr/SharedImg/event/2021/05/24/crxuTMRnQXW8y0gSc8LYoA2u83Qepd81.jpg">
						</p>
						<p class="tit">코멘트</p>
						<p class="date">날짜</p>
				</a></li>
			</ul>
		</div>
		<div class="tit-util mt70">
			<h3 class="tit">이벤트 종류</h3>
			<div class="right">
				<a href="javascript:fn_chgEventTab('CED01')" title="더보기">더보기 <i
					class="iconset ico-arr-right-gray ml05"></i></a>
			</div>
		</div>
		<div class="event-list mt15">
			<ul>
				<li><a href="#">
						<p class="img">
							<img
								src="https://img.megabox.co.kr/SharedImg/event/2021/05/31/mvIl28QAnbtR6HquRJaicFO3licfTau2.jpg">
						</p>
						<p class="tit">코멘트</p>
						<p class="date">날짜</p>
				</a></li>
				<li><a href="#">
						<p class="img">
							<img src="https://img.megabox.co.kr/SharedImg/event/2021/05/24/crxuTMRnQXW8y0gSc8LYoA2u83Qepd81.jpg"">
						</p>
						<p class="tit">코멘트</p>
						<p class="date">날짜</p>
				</a></li>
				
				<li><a href="#">
						<p class="img">
							<img
								src="https://img.megabox.co.kr/SharedImg/event/2021/05/31/mvIl28QAnbtR6HquRJaicFO3licfTau2.jpg">
						</p>
						
						<p class="tit">코멘트</p>
						<p class="date">날짜</p>
				</a></li>
				<li><a href="#">
						<p class="img">
							<img src="https://img.megabox.co.kr/SharedImg/event/2021/05/24/crxuTMRnQXW8y0gSc8LYoA2u83Qepd81.jpg">
						</p>
						<p class="tit">코멘트</p>
						<p class="date">날짜</p>
				</a></li>
			</ul>
		</div>
		<div class="tit-util mt70">
			<h3 class="tit">이벤트 종류</h3>
			<div class="right">
				<a href="javascript:fn_chgEventTab('CED01')" title="더보기">더보기 <i
					class="iconset ico-arr-right-gray ml05"></i></a>
			</div>
		</div>
		<div class="event-list mt15">
			<ul>
				<li><a href="#">
						<p class="img">
							<img
								src="https://img.megabox.co.kr/SharedImg/event/2021/05/31/mvIl28QAnbtR6HquRJaicFO3licfTau2.jpg">
						</p>
						<p class="tit">코멘트</p>
						<p class="date">날짜</p>
				</a></li>
				<li><a href="#">
						<p class="img">
							<img src="https://img.megabox.co.kr/SharedImg/event/2021/05/24/crxuTMRnQXW8y0gSc8LYoA2u83Qepd81.jpg"">
						</p>
						<p class="tit">코멘트</p>
						<p class="date">날짜</p>
				</a></li>
				
				<li><a href="#">
						<p class="img">
							<img
								src="https://img.megabox.co.kr/SharedImg/event/2021/05/31/mvIl28QAnbtR6HquRJaicFO3licfTau2.jpg">
						</p>
						
						<p class="tit">코멘트</p>
						<p class="date">날짜</p>
				</a></li>
				<li><a href="#">
						<p class="img">
							<img src="https://img.megabox.co.kr/SharedImg/event/2021/05/24/crxuTMRnQXW8y0gSc8LYoA2u83Qepd81.jpg">
						</p>
						<p class="tit">코멘트</p>
						<p class="date">날짜</p>
				</a></li>
			</ul>
		</div>
		
	</div>
</body>
</html>