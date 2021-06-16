<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세정보</title>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<link rel="stylesheet" href="${contextPath}/resources/css/movie/movie_detail.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
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
	<script>
		$(function(){
			function getFormatDate(date){
				var subDateArray = date.substr(0,10).split('-');
				return newDateForm = subDateArray[0] + "." + subDateArray[1] + "." + subDateArray[2];
			}
			
			var contextPath = "${contextPath}";
					
			var movNo = "${movNo}";
			$.get(contextPath+"/api/movies/" + movNo,
				function(json) {	
					var bg = "";
					var title = "";
					var sCont = "";
					var poster = "";
					
						/* 영화 뒷 배경 */
						bg += "<div class='bg-img' style='background-image:url("
								+ "${contextPath}/resources/images/movie/movie-detail/bg-" + json.movPoster + ");'>";
						bg += "</div>"; 
						
						/* 영화 제목 */			
						title += "<p class='title'>" + json.movTitle + "</p>";
						// title += "<p class='title-eng'>" + 'Cruella' + "</p>";		// 영어 제목 컬럼 미지정	
						
						/* 영화 포스터 */
						poster += "<p class='movie-grade age-" + json.movGrade + "'></p>";	
						poster += "<img alt='" + json.movTitle + "'src="
							+ "'${contextPath}/resources/images/movie/box-office/" + json.movPoster + "'/>";			
						
						// 주요정보 탭					
						/* 영화 줄거리 */
						sCont += "<div class='movie-summary'>";
						sCont += "<div class='txt'>" + json.movDetail + "</div>";
						sCont += "</div><br><hr>";
						
						/* 영화 정보 */
						sCont += "<div class='movie-info'>";
						sCont += "<p>상영타입 : " + '2D(자막)' + "</p>";	// 상영타입 컬럼 미 지정						
						sCont += "<div class='line'>";						
						sCont += "<p>감독&nbsp;: " + json.movDirector + "</p>";						
						sCont += "<p>장르&nbsp;: " + json.movGrade + "/" + json.movRuntime + "분</p>";						
						sCont += "<p>등급&nbsp;: " + json.movGrade + "세이상관람가</p>";						
						sCont += "<p>개봉일&nbsp;: " + getFormatDate(json.movOpendate) + "</p>";											
						sCont += "</div>";
						sCont += "<p>출연진&nbsp;: " + json.movActor + "</p>";
						sCont += "</div>";
						
					$(".movie-detail-page .movie-bg").append(bg);
					$(".movie-detail-cont").append(title);
					$(".poster .wrap").append(poster);
					$(".movie-info-list").append(sCont);
			});
			/* // 주요정보 탭 */
		});
	</script>
</head>
<body>
	<header>
		<a href="${contextPath}/main" title="박스무비 메인으로 가기"> 
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
		<!-- container -->
		<div class="container">
			<!-- contents -->
			<div class="contents">

				<!-- movie-detail-page -->
				<div class="movie-detail-page">
				<div class="movie-bg"></div>
					<%-- <div class="bg-img" style="background-image: url('${contextPath}/resources/images/movie/movie-detail/bg-Cruella.jpg');"></div> --%>
					<div class="bg-mask"></div>
					<!-- movie-detail-cont -->
					<div class="movie-detail-cont">
						
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
			    			 </div>
			    			 <!-- //movie-info-list -->
			    			 
			    			 <!-- movie-comment-list -->
			    			 <div class="movie-comment-list">
								<h2>영화 한줄평 내역</h2>
								<div id="comment-count">
									<b>전체 <span class="font-gblue">20</span> 건</b>								
								</div>
								<div class="comment-write">
									<a href="#" title="관람평쓰기">관람평쓰기</a>
								</div>
								
								<div class="movie-comment">
									<ul>
										<li>
											<div class="comment-list">
												<div class="prof">
													<img src="${contextPath}/resources/images/movie/movie-detail/bg-profile.png">
													<p class="user-id">test@test.com</p>
												</div>	
												<div class="textarea">
													<h3>관람평</h3>
													<h3>10</h3>
													<p>긴장감이 있어서 재미 있었네요 👍</p>
												</div>
											</div>
										</li> 
										<li>
											<div class="comment-list">
												<div class="prof">
													<img src="${contextPath}/resources/images/movie/movie-detail/bg-profile.png">
													<p class="user-id">tes2@test.com</p>
												</div>	
												<div class="textarea">
													<h3>관람평</h3>
													<h3>1</h3>
													<p>내 점수는 1점...</p>
												</div>
											</div>
										</li> 
									</ul>
								</div>
								
			    			 </div>
			    			 <!-- // movie-comment-list -->
			    			 
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
		<div id="content">
			<img id="footer_ci" alt="브랜드 로고" src="<%=request.getContextPath()%>/resources/images/ci.png">
			<div id="textarea">
				<p>COPYRIGHT © BoxMovie, Inc. All rights reserved</p>
				<p>대구광역시 서구 서대구로 7길2 (내당동 245-4번지 2층) ARS 053-555-1333</p>
			</div>
		</div>
	</footer>
</body>
</html>