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
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
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
	<script>
	$(function(){
		function getFormatDate(date){
			var subDateArray = date.substr(0,10).split('-');
			var newDateForm = subDateArray[0] + "." + subDateArray[1] + "." + subDateArray[2];
			return newDateForm; 
		}
		
		/* box-office-list (박스오피스 리스트 - 영화번호 ~12번 까지) */
		var contextPath = "${contextPath}";
		$.get(contextPath + "/api/movies",
			function(json) {
				var dataLength = json.length;
				if (dataLength >= 1) {
					var list = "";
					for (i = 0; i < dataLength - 8; i++) {		// 임시 지정 - 등록된 총 20영화에서 -8한 12번 까지의 영화만 보여줌 (box_office 이미지)
						list += "<li>";
						/* movie-list-info */
						list += "<div class='movie-list-info'>";
						list += "<p class='rank'>" + json[i].movNo +  "</p>";	
						list += "<a href='${contextPath}/movie?movNo=" + json[i].movNo + "'>"
						list += "<img alt='" + json[i].movTitle + "' title='" + json[i].movTitle 
							+ " 상세보기' src='${contextPath}/resources/images/movie/box-office/" + json[i].movPoster + "'></a>" 
						list += "</div>";
						/* // movie-list-info */
						
						/* title-area */
						list += "<div class='title-area'>";
						list += "<p class='movie-grade age-" + json[i].movGrade + "'</p>";	
						list += "<p class='title' title='" + json[i].movTitle + "'>" + json[i].movTitle + "</p>";	
						list += "</div>";
						/* // title-area */
						
						/* rate-date */
						list += "<div class='rate-date'>";
						list += "<span class='rate'>" + "예매율 26.3%" + "</span>";	/* 예매율 DB에 없음 - 임시 부여 */
						list += "<span class='date'>개봉일 " + getFormatDate(json[i].movOpendate) + "</span>";						
						list += "</div>";
						/* // rate-date */
						
						/* btn-util */
						list += "<div class='btn-util'>";
						/* btn-like */
						list += "<button type='button' class='btn-like'>";
						list += "<span class='like'></span>";
						list += "<span class='like-quantity'>" + "1.1k" + "</span></button>";	/* 좋아요 수 미구현 - 임시 부여 */						
						/* movie-reserve */
						list += "<div class='movie-reserve'>";
						list += "<a href='#' title='영화 예매하기'>예매</a></div>"
						list += "</div>";
						/* // btn-util */
												
						list += "</li>";	
					}
					$(".box-office-list ul").append(list);
				}
			});			
		/* // box-office-list (박스오피스 리스트) */
		
		/* commingsoon-list (상영예정작 리스트 - 영화번호 13번부터~) */
		var contextPath = "${contextPath}";
		$.get(contextPath + "/api/movies",
			function(json) {
				var dataLength = json.length;
				if (dataLength >= 1) {
					var list = "";
					for (i = 12; i < dataLength; i++) {		// 임시 지정 - 등록된 총 20영화에서 12번 부터의 영화만 보여줌 (commingsoon 이미지)
						list += "<li>";
						/* movie-list-info */
						list += "<div class='movie-list-info'>";
						list += "<a href='${contextPath}/movie?movNo=" + json[i].movNo + "'>"
						list += "<img alt='" + json[i].movTitle + "' title='" + json[i].movTitle 
							+ " 상세보기' src='${contextPath}/resources/images/movie/box-office/" + json[i].movPoster + "'></a>" 
						list += "</div>";
						/* // movie-list-info */
						
						/* title-area */
						list += "<div class='title-area'>";
						list += "<p class='movie-grade age-" + json[i].movGrade + "'</p>";	
						list += "<p class='title' title='" + json[i].movTitle + "'>" + json[i].movTitle + "</p>";	
						list += "</div>";
						/* // title-area */
						
						/* rate-date */
						list += "<div class='rate-date'>";
						list += "<span class='rate'>" + "예매율 0%" + "</span>";	/* 예매율 DB에 없음 - 임시 부여 */
						list += "<span class='date'>개봉일 " + getFormatDate(json[i].movOpendate) + "</span>";						
						list += "</div>";
						/* // rate-date */
						
						/* btn-util */
						list += "<div class='btn-util'>";
						/* btn-like */
						list += "<button type='button' class='btn-like'>";
						list += "<span class='like'></span>";
						list += "<span class='like-quantity'>" + "1.1k" + "</span></button>";	/* 좋아요 수 미구현 - 임시 부여 */						
						/* movie-reserve */
						list += "<div class='movie-reserve'>";
						list += "<a href='#' title='영화 예매하기'>예매</a></div>"
						list += "</div>";
						/* // btn-util */
												
						list += "</li>";	
					}
					$(".commingsoon-list ul").append(list);
				}
			});	
			/* // commingsoon-list (상영예정작 리스트) */
	});	
	</script>	
</head>
<body>	
	<header>
		<a href="main" title="박스무비 메인으로 가기">
			<img id="header_ci" alt="브랜드 로고" src="${contextPath}/resources/images/movie/ci.png">
		</a>
		<div>
			<a href="${contextPath}/login">로그인</a>
			<a href="${contextPath}/join">회원가입</a>
			<a href="#">바로예매</a>
		</div>

	</header>
	
	<nav>
		<ul>
			<li class="nav"><a href="${contextPath}/movielist">영화</a></li>
			<li class="nav"><a href="${contextPath}/reserve">예매</a></li>
			<li class="nav"><a href="${contextPath}/theaterlist">극장</a></li>
			<li class="nav"><a href="${contextPath}/inquiry">이벤트</a></li>
			<li class="nav"><a href="${contextPath}/noticelist">고객센터</a></li>
			<li id="mypagebtn"><a href="${contextPath}/mypage"><i class="far fa-user"></i></a></li>
		</ul>
	</nav>
	
	<section>
		<div class="container">
	    	<div class="page-util">	
				<div class="location">
	    			<span></span>
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
									<%-- <li>
										<div class="movie-list-info">
											<p class="rank">1</p>		
											<a href="movielist/movieDetail/1">
												<img alt="크루엘라" title="크루엘라 상세보기" 
												src="${contextPath}/resources/images/movie/box-office/Cruella.jpg">
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
									</li> --%>															
								</ul>		
							</div>
							
							<!-- 상영예정작 리스트 -->
							<div class="commingsoon-list">
								<ul>
									<%-- <li>
										<div class="movie-list-info">	
											<a href="#">
												<img alt="여고괴담 여섯번째 이야기 : 모교" title="여고괴담 여섯번째 이야기 : 모교 상세보기" 
												src="${contextPath}/resources/images/movie/commingsoon/Quo vadis, Aida.jpg">
											</a>										
										</div>
										<div class="title-area">
											<p class="movie-grade age-15"></p>
											<p class="title" title="여고괴담 여섯번째 이야기 : 모교">여고괴담 여섯번째 이야기 : 모교</p>
										</div>
										<div class="rate-date">
											<span class="rate">예매율 0%</span>
											<span class="date">개봉일 2021.06.17</span>
										</div>
										<div class="btn-util">
											<button type="button" class="btn-like">
												<span class="like"></span>
												<span class="like-quantity">68</span>
											</button>
											<div class="movie-reserve">
												<a href="#" title="영화 예매하기">예매</a>
											</div>
										</div>
									</li> --%>															
								</ul>
							</div>
						</div>
						
	    		</div>
	    	</div>
		</div>
	</section>
	
	<footer>
		<div id="content">
			<img id="footer_ci" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png">
			<div id="textarea">
				<p>COPYRIGHT © BoxMovie, Inc. All rights reserved</p>
				<p>대구광역시 서구 서대구로 7길2 (내당동 245-4번지 2층) ARS 053-555-1333</p>
			</div>
		</div>
	</footer>
</body>
</html>