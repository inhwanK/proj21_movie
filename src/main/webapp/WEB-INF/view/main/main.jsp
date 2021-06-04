<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
		background-color: black;
	}
	
	header {
		/* 		height: 170px;*/
		text-align: center;
	}
	
	section {
		
	}
	
	div.contentsBox {
		text-align: center;
		width:1280px;
		margin: 0 auto;
	}
	
	div.boxoffice {
		margin: 170px 0 20px 0;
		display: block;
		/* background-color: black;  */
	}
	
	div.main-movie-list {
		 overflow: hidden;
	     position: relative; 
	    /* z-index: 3; */
	    width: 1280px;
	    height: auto;
	    margin: 0 auto;
	    /* padding: 0 0 80px 0; */
		float:none;
	}
	div.search {
	    /* position: relative;  */
	    width: auto;
	    height: 80px;
	    margin: 40px auto;
		float:none;
		text-align: center;
		background-color: red;
	}
	
	div ul {
		margin: 0px 0px;
		padding: 0px 0px;
	}
	
	div ul li {
 		float:left;
    	padding: 0;
		list-style-type: none;
		display: inline;
		height: auto;
		width: 400px; 
	}
	
	button#btnBoxo {
		margin: 0 auto;
		padding: 0;
		background-color: white;
	}
	
	img {
		height: auto;
		width: 400px;
	}

</style>
</head>
<body>
	<header> </header>
	<section>
		<div class="contentsBox">
			<div class="boxoffice">
				<button id="btnBoxo">박스오피스</button>
			</div>
			<div class="main-movie-list">
				<ul>
					<li>
						<img src="https://img.megabox.co.kr/SharedImg/2021/05/12/J7vthd2FWEXswHD67dL2rQrMW4uhJQUF_420.jpg">
					</li>
					<li style="margin-left: 40px;">
						<img src="https://img.megabox.co.kr/SharedImg/2021/04/20/Pg9xMYRfMNouXwkqG2PeOGGqyUaQ9skl_420.jpg">
					</li>
					<li style="margin-left: 40px;">
						<img src="https://img.megabox.co.kr/SharedImg/2021/05/24/OPZRLPUEwlEliCfy6Li4gfhUFCJ52AE1_420.jpg">
					</li>
				</ul>
			</div>
			<div class="search">
				<h2>검색?</h2>
			</div>
		</div>
	</section>
	<footer> </footer>
</body>
</html>