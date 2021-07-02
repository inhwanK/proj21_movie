<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">	<!-- 파비콘 오류 메세지 해결 -->
	<meta charset="UTF-8">
	<title>영화리스트</title>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<link rel="stylesheet" href="${contextPath}/resources/css/movie/boxOffice.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script>
	$(function(){
		/* 박스오피스/상영예정작 탭 이벤트 */
		$(".btn li").click(function(e){
			e.preventDefault();
			$(this).addClass("active");
			$(this).siblings().removeClass("active"); 
					
			$(".movie-list > div").removeClass("active");
			$(".movie-list > div").eq($(this).index()).addClass("active");
		});
		
		/* 엔터 쳤을때 버튼 누른것과 동일한 이벤트 */
		$("#searchMovieName").on("keyup", function(key) {
	        if (key.keyCode == 13) {
	        	$('#btnMovieSearch').click();
	        	return false;	// 검색 버튼을 눌렀을 경우에 해당 버튼이 활성화 (다른 의도하지 않은 동작 방지)
	        }
	    });
		
		/* 탑버튼 눌렸을때 올라가는 스크립트 */
		$(document).ready(function() {
	        $(window).scroll(function() {
	            if ($(this).scrollTop() > 500) {	// 아래로 스크롤시 (500) 보여줌
	                $('#top_btn').fadeIn();
	            } else {
	                $('#top_btn').fadeOut();
	            }
	        });
	        
	        $("#top_btn").click(function() {		// 클릭시 상단으로 올려줌
	            $('html, body').animate({scrollTop : 0}, 400);
	            return false;
	        });
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
		
		/* commingsoon-list (상영예정작 리스트) */
		var contextPath = "${contextPath}";
		$.get(contextPath + "/api/movies/commingSoon",
			function(json) {
				var dataLength = json.length;
				if (dataLength >= 1) {
					var list = "";
					var count = "";
						count += dataLength + "개";
						
					for (i = 0; i < dataLength; i++) {		// 오늘 날짜 이후 (상영예정)
						list += "<li>";
						/* movie-list-info */
						list += "<div class='movie-list-info'>";
						list += "<input id=hidden-movNo type='hidden' value='" + json[i].movNo + "'/>";
						list += "<p id='rank' style ='display:none'>" + (i+1) + "</p>";	
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
						list += "<span class='rate'>평균 별점 : " + json[i].movAvgstar + "</span>";
						list += "<span class='date'>개봉일 " + getFormatDate(json[i].movOpendate) + "</span>";						
						list += "</div>";
						/* // rate-date */
						
						/* btn-util */
						list += "<div class='btn-util'>";					
						/* movie-reserve */
						list +=	"<button id='commingSoon'>상영예정</button>"
						/* // btn-util */
												
						list += "</li>";	
					}
					$(".commingsoon-list .movie-count b").append(count);
					$(".commingsoon-list ul").append(list);
				}else {
					$(".commingsoon-list ul").empty();
					$(".commingsoon-list ul").append(list);
					$(".commingsoon-list .movie-count b").append(dataLength + "개");
					$('.commingsoon-list #noDataDiv').show();
				}
			});	
			
		/* ajax */
		$("#btnMovieSearch").on("click", function(){	// 박스 오피스에 들어있는 영화만 검색되도록 함 (상영예정작 탭은 안 바뀌고 검색 안됨)
			var movTitle = $("#searchMovieName").val();
			$.ajax({
				url			: contextPath + "/api/moviesearch?movTitle="+movTitle,
				type		:"get",
				contentType : "application/json; charset=utf-8",
				dataType	: "json",
				data 		: movTitle,
				success 	: function(json){
					
					if (movTitle != '') {  		// 검색시 영화데이터가 있을시			
						var dataLength = json.length;
						if (dataLength >= 1) {
							var list = "";
							var count = "";
								count += dataLength + "개";
								
							for (i = 0; i < dataLength; i++) {
								list += "<li>";
								/* movie-list-info */
								list += "<div class='movie-list-info'>";
								list += "<input id=hidden-movNo type='hidden' value='" + json[i].movNo + "'/>";
								list += "<p id='rank'>" + (i+1) + "</p>";	// 검색된 순번대로
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
								list += "<span class='rate'>평균 별점 : " + json[i].movAvgstar + "</span>";
								list += "<span class='date'>개봉일 " + getFormatDate(json[i].movOpendate) + "</span>";																		
								list += "</div>";
								/* // rate-date */
								
								/* btn-util */
								list += "<div class='btn-util'>";					
								/* movie-reserve */
								list +=	"<button id='reserve' title='영화 예매하기'>예매</button>"
								/* // btn-util */
														
								list += "</li>";	
							}
							$(".box-office-list ul").empty();
							$(".box-office-list ul").append(list);
							$(".box-office-list .movie-count b").empty();
							$(".box-office-list .movie-count b").append(count);		
							$('.box-office-list #noDataDiv').hide();
						}
					} else if (movTitle == '') {		// 검색 단어를 입력안하고 검색 버튼을 클릭시
						//alert('검색할 영화명을 입력해주세요');
						Swal.fire({						// Alert창 디자인 sweetalert2 Test <-- get을 제외한 다른 방식은 나중에..
		                    icon: 'warning',
		                    title: '검색할 영화명을 입력해주세요.'
		                }).then((result) => { 
							if (result.isConfirmed) { 
								window.location.href = contextPath + "/movielist";
							} 
						});
					}
				},
				error : function(){
					console.log("error > ");
				},
				complete : function(xhr) {			
					if (xhr.responseJSON == ''){		// 검색 했을때 검색된 영화가 없을 경우
						$(".box-office-list ul").empty();
						$(".box-office-list .movie-count b").empty();
						$(".box-office-list .movie-count b").append(xhr.responseJSON.length + "개");
						$('.box-office-list #noDataDiv').show();
					}
					console.log(xhr.responseJSON);
				}
			});
		});
		
		// 메인에서 검색으로 영화 받아올때
		var movTitle = "${movTitle}"; // 검색어, 제목.
			console.log(movTitle);
		
		$.ajax({
			url			: contextPath + "/api/moviesearch?movTitle=" + movTitle,
			type		:"get",
			contentType : "application/json; charset=utf-8",
			dataType	: "json",
			data 		: movTitle,
			success 	: function(json){
				var dataLength = json.length;
				
				if (dataLength != '') {  		// 검색시 영화데이터가 있을시			
					if (dataLength >= 1) {
						var list = "";
						var count = "";
							count += dataLength + "개";
							
						for (i = 0; i < dataLength; i++) {
							list += "<li>";
							/* movie-list-info */
							list += "<div class='movie-list-info'>";
							list += "<input id=hidden-movNo type='hidden' value='" + json[i].movNo + "'/>";
							list += "<p id='rank'>" + (i+1) + "</p>";	// 검색된 순번대로
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
							list += "<span class='rate'>평균 별점 : " + json[i].movAvgstar + "</span>";
							list += "<span class='date'>개봉일 " + getFormatDate(json[i].movOpendate) + "</span>";																		
							list += "</div>";
							/* // rate-date */
							
							/* btn-util */
							list += "<div class='btn-util'>";					
							/* movie-reserve */
							list +=	"<button id='reserve' title='영화 예매하기'>예매</button>"
							/* // btn-util */
													
							list += "</li>";	
						}
						$(".box-office-list ul").empty();
						$(".box-office-list ul").append(list);
						$(".box-office-list .movie-count b").empty();
						$(".box-office-list .movie-count b").append(count);			
					}
				}
			},
			error : function(){
				console.log("error > ");
			},
			complete : function(xhr) {			
				if (xhr.responseJSON == ''){		// 검색 했을때 검색된 영화가 없을 경우
					$(".box-office-list ul").empty();
					$(".box-office-list .movie-count b").empty();
					$(".box-office-list .movie-count b").append(xhr.responseJSON.length + "개");
					$('.box-office-list #noDataDiv').show();
				}
			}
		});
		
		// 예매버튼 클릭시 영화 번호를 reserve 페이지에 전달
		$(document).ready(function(){
			$(document).on('click', '[id=reserve]', function(e){
				var pa = $(this).parent().parent();
				var ch = pa.children();
				var movNo = ch.eq(0).text();
				
				window.location.href = contextPath + "/reserve?no=" + movNo;
			});
		});
	});	
	</script>	
</head>
<body>	
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<!-- 탑위로 올라가는 버튼 -->
	<div id="top_btn">
		<img src="${contextPath}/resources/images/movie/icon/top_btn.png">
	</div>
	
	<section>
		<div class="container">
	    	<div class="page-util">	
				<div class="location">
	    			<span></span>
	    			<a href="${contextPath}/movielist" title="영화 페이지로 이동">영화</a>
	    			<a href="${contextPath}/movielist" title="전체영화 페이지로 이동">전체영화</a>
	    		</div>
	    	</div>
	    	
	    	<div class="contents">
	    		<div class="inner-wrap">
	    			<h2 class="title">전체영화</h2>
	    			<!-- 영화 검색 -->
	    			<div class="movieSearch"> 
	    				<input type="text" id="searchMovieName" class="input-text" title="검색" placeholder="영화를 검색하세요">
	    				<button type="button" id="btnMovieSearch"></button>
	    			</div>
	    			
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
						<div class="movie-count"><b></b>의 영화가 검색되었습니다.</div>
						
						<!-- 검색결과 없을 때 -->
						<div class="movie-list-no-result" id="noDataDiv" style="display: none;">
							<p>현재 상영중인 영화가 없습니다.</p>
						</div>
						
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
						<div class="movie-count"><b></b>의 영화가 검색되었습니다.</div>
						
						<!-- 검색결과 없을 때 -->
						<div class="movie-list-no-result" id="noDataDiv" style="display: none;">
							<p>현재 상영예정인 영화가 없습니다.</p>
						</div>
						
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
	
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>