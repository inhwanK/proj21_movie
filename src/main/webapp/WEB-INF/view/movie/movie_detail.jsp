<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>크루엘라 영화 상세정보</title>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<link rel="stylesheet" href="${contextPath}/resources/css/movie/movie_detail.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {
		$(".btn li").click(function() {
			$(this).addClass("active");
			$(this).siblings().removeClass("active");

			$(".tab-cont-wrap > div").removeClass("active");
			$(".tab-cont-wrap > div").eq($(this).index()).addClass("active");
		});
	});
</script>
</head>
<body>
	<header>
		<a href="${contextPath}/main" title="박스무비 메인으로 가기"> 
			<img id="header_ci" alt="브랜드 로고" src="${contextPath}/resources/images/movie/ci.png">
		</a>
		<div>
			<a href="#">로그인</a> 
			<a href="#">회원가입</a> 
			<a href="#">바로예매</a>
		</div>
	</header>

	<nav>
		<ul>
			<li><a href="${contextPath}/movie">영화</a></li>
			<li><a href="#">예매</a></li>
			<li><a href="${contextPath}/theater">극장</a></li>
			<li><a href="#">이벤트</a></li>
			<li><a href="#">고객센터</a></li>
		</ul>
	</nav>

	<section>
		<!-- container -->
		<div class="container">
			<!-- contents -->
			<div class="contents">

				<!-- movie-detail-page -->
				<div class="movie-detail-page">
					<div class="bg-img" style="background-image: url('${contextPath}/resources/images/movie/movie-detail/bg-Cruella.jpg');"></div>

					<!-- movie-detail-cont -->
					<div class="movie-detail-cont">
						<!-- 개봉 예매가능-->
						<p class="title">크루엘라</p>
						<p class="title-eng">Cruella</p>
						
						<!-- info -->
						<div class="info">
							<div class="score">
								<p class="title">실관람 평점</p>
								<div class="number">
									<p title="실관람 평점" class="before">
										<em>9.3</em>
										<span>점</span>
									</p>
								</div>
							</div>
	
							<div class="rate">
								<p class="title">예매율</p>
								<p class="cont">
									<em>2</em>위 (14.1&#37;)
								</p>
							</div>
	
							<div class="audience">
								<p class="title">누적관객수</p>
								<p class="cont">
									<em>664,320</em> 명
								</p>
							</div>
						</div>
						<!--// info -->
						
						<div class="poster">
							<div class="wrap">
								<p class="movie-grade age-12">12세 이상 관람가</p>
								<img src="${contextPath}/resources/images/movie/movie-detail/poster-Cruella.jpg" alt="크루엘라" /> 
							</div>
						</div>
						<div class="screen-type">
							<a href="#" class="btn reserve" title="영화 예매하기">예매</a> 
						</div>
					</div>
				<!--// movie-detail-cont -->
				</div>
				<!-- movie-detail-page -->
				
				<!-- contentData -->
				<div id="contentData">
					<!-- inner-wrap -->
					<div class="inner-wrap">
	    				<div class="tab-list">
		    				<ul class="btn">
		    					<li class="active">
		    						<a href="#" title="주요정보 탭으로 이동">주요정보</a>
		    					</li>
		    					<li>
		    						<a href="#" title="실관람평 탭으로 이동">실관람평</a>
		    					</li>
		    					<li>
		    						<a href="#" title="예고편/스틸컷 탭으로 이동">예고편/스틸컷</a>
		    					</li>
		    				</ul>
		    			</div>
		    			
		    			<!-- tab-cont-wrap -->
		    			<div class="tab-cont-wrap">
			    			<!-- movie-info-list -->
			    			<div class="movie-info-list active">
				    			<!-- movie-summary -->
				    			<div class="movie-summary">
				    				<div class="txt">
				    					처음부터 난 알았어. 내가 특별하단 걸
				    					<br>
				    					<br>
				    					그게 불편한 인간들도 있겠지만 모두의 비위를 맞출 수는 없잖아?
				    					<br>
				    					그러다 보니 결국, 학교를 계속 다닐 수가 없었지
				    					<br>
				    					<br>
				    					우여곡절 런던에 오게 된 나, 에스텔라는 재스퍼와 호레이스를 운명처럼 만났고
				    					<br>
				    					나의 뛰어난 패션 감각을 이용해 완벽한 변장과 빠른 손놀림으로 런던 거리를 싹쓸이 했어
				    					<br>
				    					<br>
										도둑질이 지겹게 느껴질 때쯤, 꿈에 그리던 리버티 백화점에 낙하산(?)으로 들어가게 됐어
										<br>
										거리를 떠돌았지만 패션을 향한 나의 열정만큼은 언제나 진심이었거든
										<br>
										<br>
										근데 이게 뭐야, 옷에는 손도 못 대보고 하루 종일 바닥 청소라니
										<br>
										인내심에 한계를 느끼고 있을 때, 런던 패션계를 꽉 쥐고 있는 남작 부인이 나타났어
										<br>
										천재는 천재를 알아보는 법! 난 남작 부인의 브랜드 디자이너로 들어가게 되었지
										<br>
										<br>
										꿈을 이룰 것 같았던 순간도 잠시, 세상에 남작 부인이 ‘그런 사람’이었을 줄이야…
										<br>
										<br>
										그래서 난 내가 누군지 보여주기로 했어
										<br>
										잘가, 에스텔라
										<br>
										<br>
										난 이제 크루엘라야!	    					
				    				</div>
				    				<div class="btn-more toggle">
				    					<!-- 줄거리 열기 닫기 미구현 -->
				    				</div>
				    			</div>
				    			<!-- // movie-summary -->
				    			
				    			<!-- movie-info -->
				    			<div class="movie-info">
				    				<p>상영타입 : 2D(자막)</p>
				    				<div class="line">
				    					<p>감독&nbsp;: 크레이그 질레스피</p>
				    					<p>장르&nbsp;: 드라마, 범죄, 코미디 / 133 분</p>
				    					<p>등급&nbsp;: 12세이상관람가</p>
				    					<p>개봉일&nbsp;: 2021.05.26</p>
				    				</div>
				    				<p>출연진&nbsp;: 엠마 스톤, 엠마 톰슨, 마크 스트롱</p>
				    			</div>
				    			<!-- // movie-info -->
				    			
				    			<!-- movie-graph -->
				    			<div class="movie-graph">
				    			<!-- 미구현함 -->
				    			</div>
				    			<!-- // movie-graph -->		    			
			    			 </div>
			    			 <!-- //movie-info-list -->
			    			 
			    			 <!-- audience-review-list -->
			    			 <div class="audience-review-list">
			    			 	<p>실관람평입니다. </p>
			    			 </div>
			    			 <!-- // audience-review-list -->
			    			 
		    			 </div>
		    			 <!-- // tab-cont-wrap -->
		    		</div>
		    		<!-- // inner-wrap -->					
				</div>
				<!-- // contentData -->
			</div>
			<!-- // contents -->
		</div>
		<!-- // container -->
	</section>

	<footer>
		<div>
			<img id="footer_ci" alt="브랜드 로고" src="${contextPath}/resources/images/movie/ci.png">
			<p>
				제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다. <br>
				재판의 전심절차로서 행정심판을 할 수 있다. 행정심판의 절차는 법률로 정하되, 사법절차가 준용되어야 한다.
			</p>
		</div>
	</footer>
</body>
</html>