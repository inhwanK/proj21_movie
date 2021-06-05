<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>전체 극장 리스트</title>
	<link rel="stylesheet" href="css/theater_list.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	</script>
</head>
<body>	
	<header>
		<a href="#" title="박스무비 메인으로 가기">
			<img id="header_ci" alt="브랜드 로고" src="images/ci.png">
		</a>
		<div>
			<a href="#">로그인</a>
			<a href="#">회원가입</a>
			<a href="#">바로예매</a>
		</div>

	</header>
	
	<nav>
		<ul>
			<li><a href="#">영화</a></li>
			<li><a href="#">예매</a></li>
			<li><a href="#">극장</a></li>
			<li><a href="#">이벤트</a></li>
			<li><a href="#">고객센터</a></li>
		</ul>
	</nav>
	
	<section>
		<div class="container">
	    	<div class="page-util">	
				<div class="location">
	    			<span>Home</span>
	    			<a href="#" title="극장 페이지로 이동">극장</a>
	    			<a href="#" title="전체극장 페이지로 이동">전체극장</a>
	    		</div>
	    	</div>
	    	
	    	<div class="contents">
	    		<div class="inner-wrap">
	    			<h2 class="title">전체극장</h2>
	    				
	    				<!-- 전체극장 리스트 -->
			     		<div class="theater-box">
							<div class="theater-place">
								<ul>
									<li class="active">
										<button type="button" class="sel-city">대구</button>
										<div class="theater-list">
											<ul>		
												<li data-brch-no="0001">												
													<a href="#" title="대구이시아 상세보기">대구이시아</a>												
												</li>																																								
												<li data-brch-no="0002">												
													<a href="#" title="대구신세계&#40;동대구&#41; 상세보기">대구신세계&#40;동대구&#41;</a>												
												</li>																														
												<li data-brch-no="0003">											
													<a href="#" title="북대구&#40;칠곡&#41; 상세보기">북대구&#40;칠곡&#41;</a>												
												</li>																				
											</ul>
										</div>
									</li>
								</ul>
							</div>
						</div>
						
	    		</div>
	    	</div>
		</div>
	</section>
	
	<footer>
		<div>
			<img id="footer_ci" alt="브랜드 로고" src="images/ci.png">
			<p>
			제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다.
			<br>
			재판의 전심절차로서 행정심판을 할 수 있다. 행정심판의 절차는 법률로 정하되, 사법절차가 준용되어야 한다.
			</p>
		</div>
	</footer>
</body>
</html>