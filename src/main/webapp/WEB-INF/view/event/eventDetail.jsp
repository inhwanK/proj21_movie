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

img {
	width: 70%;
	margin: 200px auto 0 auto;
}
#contents {
	width: 100%;
	margin: 0;
	padding: 40px 0 0 0;
}

.event-detail {
	position: relative;
	margin: 200px 0 40px 0;
	padding: 0 0 30px 0;
}

.event-detail:after {
	content: '';
	display: block;
	position: absolute;
	left: 50%;
	bottom: 0;
	width: 1100px;
	height: 1px;
	margin: 0 0 0 -550px;
	background-color: #ebebeb;
}

.event-detail h2.tit {
	width: 1100px;
	margin: 0 auto;
	padding: 0;
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

.event-detail .event-detail-date {
	overflow: hidden;
	width: 1100px;
	margin: 0 auto 30px auto;
	padding: 15px 0 25px 0;
	line-height: 1.1;
	border-bottom: 1px solid #555;
}

.event-detail .event-detail-date span {
	display: block;
	float: left;
}

.event-detail .event-detail-date em {
	display: block;
	float: left;
}

.event-detail .event-detail-date em:before {
	content: '';
	display: block;
	float: left;
	width: 1px;
	height: 12px;
	margin: 1px 8px 0 8px;
	background-color: #aaa;
}

p {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}

.event-detail .event-html {
	overflow: hidden;
	width: 70%;
	margin: 200px auto 0 auto;
	text-align: center;
}
</style>
</head>
<body>
	<div class="event-detail">
		<h2 class="tit">메가박스 오리지널 티켓 No.28 &lt;크루엘라&gt;</h2>
		<p class="event-detail-date">
			<span>기간</span> <em>2021.05.26 ~ 2021.06.26</em>
		</p>
		<div class="event-html">
			<img  src="images/logo.png" >
		</div>

	</div>
</body>
</html>