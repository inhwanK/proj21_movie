<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>영화리스트</title>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<link rel="stylesheet" href="${contextPath}/resources/css/movie/box_office.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(function(){
		$(".btn li").click(function(){ 
			$(this).addClass("active");
			$(this).siblings().removeClass("active"); 
			
			
			$(".movie-list > div").removeClass("active");
			$(".movie-list > div").eq($(this).index()).addClass("active");
		});
	
		$(".btn-like").click(function(){ 
			$(".like").toggleClass("active");
		});
	});
	</script>
</head>
<body>	
	<header>
		<a href="main" title="박스무비 메인으로 가기">
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
			<li><a href="">영화</a></li>
			<li><a href="#">예매</a></li>
			<li><a href="theater">극장</a></li>
			<li><a href="#">이벤트</a></li>
			<li><a href="#">고객센터</a></li>
		</ul>
	</nav>
	
	<section>
		<div class="container">
	    	<div class="page-util">	
				<div class="location">
	    			<span>Home</span>
	    			<a href="" title="영화 페이지로 이동">영화</a>
	    			<a href="" title="전체영화 페이지로 이동">전체영화</a>
	    		</div>
	    	</div>
	    	
	    	<div class="contents">
	    		<div class="inner-wrap">
	    			<h2 class="title">전체영화</h2>
	    			
	    			<div class="tab-list">
	    				<ul class="btn">
	    					<li class="active">
	    						<a href="#" title="박스 오피스 탭으로 이동">박스오피스</a>
	    					</li>
	    					<li>
	    						<a href="#" title="상영예정작 탭으로 이동">상영예정작</a>
	    					</li>
	    				</ul>
	    			</div>
	    				
	    				<div class="movie-list">
	    					<!-- 박스오피스 리스트 -->
							<div class="box-office-list active" >
								<ul>
									<li>
										<div class="movie-list-info">
											<p class="rank">1</p>		
											<a href="movie/movieDetail/1">
												<img alt="크루엘라" src="${contextPath}/resources/images/movie/box-office/Cruella.jpg">
											</a>										
										</div>
										<div class="title-area">
											<p class="movie-grade age-12"></p>
											<p class="title" title="크루엘라">크루엘라</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 26.3%</span>
											<span class="date">개봉일 2021.05.26</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">1.1k</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>									
									<li>
										<div class="movie-list-info">
											<p class="rank">2</p>
											<a href="#">
												<img alt="캐시트럭" src="${contextPath}/resources/images/movie/box-office/Wrath of Man.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-19"></p>
											<p class="title" title="캐시트럭">캐시트럭</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 18.1%</span>
											<span class="date">개봉일 2021.06.09</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">255</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<li>
										<div class="movie-list-info">
											<p class="rank">3</p>
											<a href="#">
												<img alt=컨저링3 src="${contextPath}/resources/images/movie/box-office/Conjuring3.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-15"></p>
											<p class="title" title="컨저링3: 악마가 시켰다">컨저링3: 악마가 시켰다</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 17.1%</span>
											<span class="date">개봉일 2021.06.03</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">294</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<li>
										<div class="movie-list-info">
											<p class="rank">4</p>
											<a href="#">
												<img alt="분노의 질주" src="${contextPath}/resources/images/movie/box-office/Fast & Furious.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-12"></p>
											<p class="title" title="분노의 질주 : 더 얼티메이트">분노의 질주 : 더 얼티메이트</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 10.7%</span>
											<span class="date">개봉일 2021.05.19</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">1k</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<!-- 1줄 -->
									
									<!-- 2줄 -->
									<li>
										<div class="movie-list-info">
											<p class="rank">5</p>
											<a href="#">
												<img alt="미스피츠" src="${contextPath}/resources/images/movie/box-office/misfits.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-15"></p>
											<p class="title" title="미스피츠">미스피츠</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 5.8%</span>
											<span class="date">개봉일 2021.06.03</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">46</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<li>
										<div class="movie-list-info">
											<p class="rank">6</p>
											<a href="#">
												<img alt="극장판 귀멸의 칼날" src="${contextPath}/resources/images/movie/box-office/Demon Slayer.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-15"></p>
											<p class="title" title="극장판 귀멸의 칼날: 무한열차편">극장판 귀멸의 칼날: 무한열차편</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 3.7%</span>
											<span class="date">개봉일 2021.01.27</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">7.6k</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<li>
										<div class="movie-list-info">
											<p class="rank">7</p>
											<a href="#">
												<img alt="뱅드림! 로젤리아 에피소드Ⅰ: 약속" src="${contextPath}/resources/images/movie//box-office/BanG Dream!.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-all"></p>
											<p class="title" title="뱅드림! 로젤리아 에피소드Ⅰ: 약속">뱅드림! 로젤리아 에피소드Ⅰ: 약속</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 3.4%</span>
											<span class="date">개봉일 2021.06.03</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">1.1k</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<li>
										<div class="movie-list-info">
											<p class="rank">8</p>
											<a href="#">
												<img alt="프로세서 앤 매드맨" src="${contextPath}/resources/images/movie/box-office/The Professor and the Madman.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-15"></p>
											<p class="title" title="프로세서 앤 매드맨">프로세서 앤 매드맨</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 2.3%</span>
											<span class="date">개봉일 2021.06.02</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">106</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<!-- 2줄 -->
									
									<!-- 3줄 -->	
									<li>
										<div class="movie-list-info">
											<p class="rank">9</p>
											<a href="#">
												<img alt="낫아웃" src="${contextPath}/resources/images/movie/box-office/NOT OUT.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-15"></p>
											<p class="title" title="낫아웃">낫아웃</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 2.1%</span>
											<span class="date">개봉일 2021.06.03</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">20</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<li>
										<div class="movie-list-info">
											<p class="rank">10</p>
											<a href="#">
												<img alt="2021 빈 필하모닉 여름음악회" src="${contextPath}/resources/images/movie/box-office/Vienna Philharmonic 2021.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-all"></p>
											<p class="title" title="2021 빈 필하모닉 여름음악회">2021 빈 필하모닉 여름음악회</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 1.8%</span>
											<span class="date">개봉일 2021.06.19</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">82</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<li>
										<div class="movie-list-info">
											<p class="rank">11</p>
											<a href="#">
												<img alt="파이프라인" src="${contextPath}/resources/images/movie/box-office/Pipeline.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-12"></p>
											<p class="title" title="파이프라인">파이프라인</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 1.3%</span>
											<span class="date">개봉일 2021.05.26</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">260</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<li>
										<div class="movie-list-info">
											<p class="rank">12</p>
											<a href="#">
												<img alt="보이저스" src="${contextPath}/resources/images/movie/box-office/Voyagers.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-15"></p>
											<p class="title" title="보이저스">보이저스</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 0.7%</span>
											<span class="date">개봉일 2021.05.26</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">195</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<!-- 3줄 -->									
								</ul>		
							</div>
							
							<!-- 상영예정작 리스트 -->
							<div class="commingsoon-list">
								<ul>
									<li>
										<div class="movie-list-info">
											<p class="rank">1</p>		
											<a href="#">
												<img alt="쿠오바디스,아이다" src="${contextPath}/resources/images/movie/commingsoon/Quo vadis, Aida.jpg">
											</a>										
										</div>
										<div class="title-area">
											<p class="movie-grade age-15"></p>
											<p class="title" title="쿠오바디스,아이다">쿠오바디스,아이다</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 0%</span>
											<span class="date">개봉일 2021.05</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">60</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>									
									<li>
										<div class="movie-list-info">
											<p class="rank">2</p>
											<a href="#">
												<img alt="캐시트럭" src="${contextPath}/resources/images/movie/commingsoon/Wrath of Man.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-19"></p>
											<p class="title" title="캐시트럭">캐시트럭</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 21.9%</span>
											<span class="date">개봉일 2021.06.29</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">258</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<li>
										<div class="movie-list-info">
											<p class="rank">3</p>
											<a href="#">
												<img alt="실크 로드" src="${contextPath}/resources/images/movie/commingsoon/Silk Road.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-15"></p>
											<p class="title" title="실크 로드">실크 로드</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 0%</span>
											<span class="date">개봉일 2021.06.29</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">40</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<li>
										<div class="movie-list-info">
											<p class="rank">4</p>
											<a href="#">
												<img alt="화이트 온 화이트" src="${contextPath}/resources/images/movie/commingsoon/White on White.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-12"></p>
											<p class="title" title="화이트 온 화이트">화이트 온 화이트</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 0%</span>
											<span class="date">개봉일 2021.06.10</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">20</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<!-- 1줄 -->
									
									<!-- 2줄 -->
									<li>
										<div class="movie-list-info">
											<p class="rank">5</p>
											<a href="#">
												<img alt="강호아녀" src="${contextPath}/resources/images/movie/commingsoon/Ash Is Purest White.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-15"></p>
											<p class="title" title="강호아녀">강호아녀</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 0%</span>
											<span class="date">개봉일 2021.06.10</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">20</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="상영예정">상영예정</a>
											</div>
										</div>
									</li>
									<li>
										<div class="movie-list-info">
											<p class="rank">6</p>
											<a href="#">
												<img alt="플래시백" src="${contextPath}/resources/images/movie/commingsoon/Flashback.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-15"></p>
											<p class="title" title="플래시백">플래시백</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 0%</span>
											<span class="date">개봉일 2021.06.10</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">62</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li>
									<li>
										<div class="movie-list-info">
											<p class="rank">7</p>
											<a href="#">
												<img alt="콰이어트 플레이스 2" src="${contextPath}/resources/images/movie/commingsoon/A Quiet Place Part II.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-15"></p>
											<p class="title" title="콰이어트 플레이스 2">콰이어트 플레이스 2</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 0%</span>
											<span class="date">개봉일 2021.06.16</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">586</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="상영예정">상영예정</a>
											</div>
										</div>
									</li>
									<li>
										<div class="movie-list-info">
											<p class="rank">8</p>
											<a href="#">
												<img alt="그 여름, 가장 차가웠던" src="${contextPath}/resources/images/movie/commingsoon/Summer is the coldest season.jpg">
											</a>
										</div>
										<div class="title-area">
											<p class="movie-grade age-12"></p>
											<p class="title" title="그 여름, 가장 차가웠던">그 여름, 가장 차가웠던</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 0%</span>
											<span class="date">개봉일 2021.06.17</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">40</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="상영예정">상영예정</a>
											</div>
										</div>
									</li>
									<!-- 2줄 -->								
								</ul>
							</div>
						</div>
						
	    		</div>
	    	</div>
		</div>
	</section>
	
	<footer>
		<div>
			<img id="footer_ci" alt="브랜드 로고" src="${contextPath}/resources/images/movie/ci.png">
			<p>
			제1항의 해임건의는 국회재적의원 3분의 1 이상의 발의에 의하여 국회재적의원 과반수의 찬성이 있어야 한다.
			<br>
			재판의 전심절차로서 행정심판을 할 수 있다. 행정심판의 절차는 법률로 정하되, 사법절차가 준용되어야 한다.
			</p>
		</div>
	</footer>
</body>
</html>