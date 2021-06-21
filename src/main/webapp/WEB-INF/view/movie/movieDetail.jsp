<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세정보</title>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<link rel="stylesheet" href="${contextPath}/resources/css/movie/movieDetail.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/movie/star/fontawesome-stars.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 	<!-- 이 js가 다른 js보다 낮으면 에러 뜸 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">  
    <script>
    	window.jQuery || document.write('<script src="${contextPath}/resources/js/star/vendor/jquery-1.11.2.min.js"><\/script>')
    </script>	
    <script src="${contextPath}/resources/js/star/jquery.barrating.min.js"></script>	
	<script>
		$(function() {
			$(".btn li").click(function() {
				$(this).addClass("active");
				$(this).siblings().removeClass("active");
	
				$(".tab-cont-wrap > div").removeClass("active");
				$(".tab-cont-wrap > div").eq($(this).index()).addClass("active");
			});

		   $("#cancel").click(function () {
		        $("#contxt").val('');	        
		        $("#input-star").val('');	        
		        $(".stars .fa").removeClass("active");        
		   });
			  
		   $(document).ready( function() {
			   $(".comment-write > span").click(function(){
					$(this).addClass("active");
					$(this).removeClass("active");
					
					$(".write-content").toggleClass("active");  
			     });
		   });
		   
		   /* 별점 테마 */
		   $('#example-fontawesome').barrating({ 
   				theme: 'fontawesome-stars' 
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
					var avgStar = "";
					var poster = "";
					var sCont = "";
					
						/* 영화 뒷 배경 */
						bg += "<div class='bg-img' style='background-image:url("
								+ "${contextPath}/resources/images/movie/movie-detail/bg-" + json.movPoster + ");'>";
						bg += "</div>"; 
						
						/* 영화 제목 */			
						title += "<p class='title'>" + json.movTitle + "</p>";
						// title += "<p class='title-eng'>" + 'Cruella' + "</p>";		// 영어 제목 컬럼 미지정
						
						/* 실시간 평점 (영화 평균 평점) */		
						avgStar += json.movAvgstar;			// 영화 한줄평 추가시 평점 반영하여 업뎃 하기는 아직 미 구현
						
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
					$(".number em").append(avgStar);
					$(".poster .wrap").append(poster);
					$(".movie-info-list").append(sCont);
			});
			/* // 주요정보 탭 */
			
			/* 실관람평  탭 */
			var movNo = "${movNo}";
			$.get(contextPath+"/api/comments/movie/" + movNo,
				function(json) {
					var dataLength = json.length;
					if (dataLength >= 1) {
						var sCont = "";				
						var size = "";	
							size += dataLength
							
						for (i = 0; i < dataLength; i++) {							
							sCont += "<li>";
							// comment-list
							sCont += "<div class='comment-list'>";
							// prof
							sCont += "<div class='prof'>";						
							sCont += "<img src='${contextPath}/resources/images/movie/movie-detail/bg-profile.png'>";
							sCont += "<p class='user-id'>" + json[i].comUser + "</p>";
							sCont += "<div class='divNo' style ='display:none'>" + json[i].comNo + "</div>"
							sCont += "</div>";
							// // prof
							
							// textarea
							sCont += "<div class='textarea'>";
							sCont += "<h3>한줄평</h3>";
							sCont += "<h3>" + json[i].comStar + "</h3>";
							sCont += "<p>" + json[i].comContent + "</p>";							
							sCont += "</div>";
							// // textarea
							
							// btn-util
							sCont += "<div class='btn-util'>";
							sCont += "<button id='modify'>수정</button>";
							sCont += "<button id='remove'>삭제</button>";					
							sCont += "</div>";
							// // btn-util
							
							sCont += "</div>";
							// // comment-list
							sCont += "<h5>" + json[i].comDate + "</h5>";
							sCont += "</li>";
						}
						$("#comment-count .font-gblue").append(size);
						$(".movie-comment ul").append(sCont);
					}
					
					
				});
			
			/* ajax */
			$('#writeBtn').on("click", function(e){
				var movNo = "${movNo}";
				var newComment = { movNo: movNo, 
									comUser : $('#user').val(), 
									comContent: $('#contxt').val(),
									comStar : $('.com-star').val()
								};
				
				$.ajax({
					url 		: contextPath + "/api/comments/",
					type 		: "POST",
					contentType : "application/json; charset=utf-8",
					datatype 	: "json",
					cache 		: false,
					data 		: JSON.stringify(newComment),
					success 	: function(res) {
						alert(newComment.comUser + "님의 한줄평이 등록되었습니다.");
						location.reload();
					},
					error : function(request, status, error){
						alert("code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error);
						location.reload();
					}
				}); 
			});
			
			$(document).ready(function(){
				$(this).on('click', '[id=modify]', function(){
					var pa = $(this).parent().parent();
					var ch = pa.children().children();
					var comNo = ch.eq(2).text();
					alert(comNo);	
				    
					/* 팝업 중앙에 띄우기 */
				    function PopupCenter(url, title, w, h) {  
				        var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;  
				        var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;  
				                  
				        width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;  
				        height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;  
				                  
				        var left = ((width / 2) - (w / 2)) + dualScreenLeft;  
				        var top = ((height / 2) - (h / 2)) + dualScreenTop;  
				        var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);  
				      
				        if (window.focus) {  
				            newWindow.focus();  
				        }  
				    } 				    
				    PopupCenter(contextPath + "/updateComment?comNo=" + comNo,'popup','550','400'); 
				});
			});
				
			$(document).on('click', '[id=remove]', function(){
				var pa = $(this).parent().parent();
				var ch = pa.children().children();
				var comNo = ch.eq(2).text();
				
				if (confirm("삭제하시겠습니까?")){
					$.ajax({
						url: contextPath + "/api/comments/" + comNo,
						type: 'DELETE',
						success: function(res) {
							alert(comNo + "번 한줄평 삭제 완료");
							location.reload();
						},
						error: function(request, status, error) {
							alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
							location.reload();
						}
					});
				} else {
					return false;
				}			
			});
			/* // 실관람평 탭 */
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
										<em></em>
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
									<b>전체 <span class="font-gblue"></span> 건</b>						
								</div>
								<div class="comment-write">
									<span title="한줄평쓰기">한줄평쓰기</span>
									<div class="write-content">
										<form:form>
											<div class="form-txt">									
												<table>
													<tr>
														<td>
															<input type="text" id="user" value="테스트 이메일" readonly/>
															<div class="title"><h4>한줄평</h4></div>
														</td>
													</tr>
													<tr>
														<td>
															<textarea id="contxt" rows="3" cols="100" name="contents" placeholder="한줄평을 적어주세요"></textarea>
															<select id="example-fontawesome" class="com-star" name="rating">
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
																<option value="4">4</option>
																<option value="5">5</option>
															</select>
														</td>
													</tr>											
												</table>
											</div>
										</form:form>
										<input id="writeBtn" type="button" value="쓰기"/> 
										<input id="cancel" type="button" class="cancelBtn" value="취소"/> 
									</div>
								</div>
								
								<div class="movie-comment">
									<ul>
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