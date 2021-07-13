<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">	<!-- 파비콘 오류 메세지 해결 -->
	<meta charset="UTF-8">
	<title>영화 상세정보</title>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<link rel="stylesheet" href="${contextPath}/resources/css/movie/movieDetail.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/movie/star/fontawesome-stars.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/footer.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 	<!-- 이 js가 다른 js보다 낮으면 에러 뜸 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <script>
    	window.jQuery || document.write('<script src="${contextPath}/resources/js/star/vendor/jquery-1.11.2.min.js"><\/script>')
    </script>	
    <script src="${contextPath}/resources/js/star/jquery.barrating.min.js"></script>	
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="${contextPath}/resources/js/movie/movieDetail.js"></script>
</head>
<body>
	<header>
		<c:if test = "${member == null }">
		<a href="${contextPath}/main"> <img id="header_ci" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png"></a>
		</c:if>
		<c:if test = "${member != null }">
		<a href="${contextPath}/main"> <img id="header_ci2" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png"></a>
		</c:if>
		<div>
		<!-- 관리자가 로그인하지 않은 상태 -->
		<c:if test = "${admin == null }">
			<!-- 로그인 하지 않은 상태 -->
        	<c:if test = "${member == null }">
				<a href="${contextPath}/login">로그인</a> <a href="${contextPath}/join">회원가입</a>
				<a href="${contextPath}/reserve">바로예매</a>
			</c:if>
			
			<!-- 로그인한 상태 -->
        	<c:if test="${ member != null }">
            	<div class="login_success_area">
            		<span>안녕하세요. ${member.memName} 회원님!</span>
            		<a href="${contextPath}/main.do">로그아웃</a>
            		<a href="${contextPath}/reserve">바로예매</a>
            	</div>
        	</c:if>
   		</c:if>
   		<!-- 관리자가 로그인하지 않은 상태 -->
		<c:if test = "${admin != null }">
			<div class="admin_success_area">
            	<span>안녕하세요. ${admin.admId} 회원님!</span>
            	<a href="${contextPath}/main.do">로그아웃</a>
            	<a href="${contextPath}/movieManager">관리페이지</a>
            </div>
		</c:if>
		</div>
	</header>
	<nav>
		<ul>
			<li class="nav"><a href="${contextPath}/movielist">영화</a></li>
			<li class="nav"><a href="${contextPath}/reserve">예매</a></li>
			<li class="nav"><a href="${contextPath}/theaterlist">극장</a></li>
			<li class="nav"><a href="${contextPath}/noticelist">고객센터</a></li>
			<li id="mypagebtn"><a href="${contextPath}/mypage" id="to-mypage"><i class="far fa-user"></i></a></li>
		</ul>
	</nav>
	
	<script type="text/javascript">
		$(function(){
			var contextPath = "${contextPath}";
			$('#to-mypage').on('click', function(e){
				if(${member == null}) {
					e.preventDefault();
					// alert("회원 로그인이 필요합니다.");
					// window.location.href = contextPath + "/login";
					Swal.fire({				// Alert창 디자인 sweetalert2
		                icon : 'error',
		                title: '회원 로그인이 필요합니다.'
		            }).then((result) => {
						if (result.isConfirmed) {
							window.location.href = contextPath + "/login";
						}
		            });
				}
			});
		});
	</script>

	<section>
	
		<!-- 탑위로 올라가는 버튼 -->
		<div id="top_btn">
			<img src="${contextPath}/resources/images/movie/icon/top_btn.png">
		</div>
		
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
								<p class="title">평균 별점</p>
								<div class="number">
									<p title="평균 별점 " class="before">
										<em></em>
										<span>점</span>
									</p>
								</div>
							</div>
							
							<!-- DB에 없어서 우선 비활성화 -->
							
							<!-- <div class="rate">				
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
							</div> -->
						</div>
						<!--// info -->
						
						<div class="poster">
							<div class="wrap">
							</div>
						</div>
						<div class="screen-type">
							<button type='button' id='comming' class='btn comming' style="display: none;">상영예정</button>
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
		    						<a href="#" title="예고편 탭으로 이동">예고편</a>
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
															<c:if test="${ member != null }">
																<input type="hidden" id="user" value="${member.memEmail}" readonly/>
													        </c:if>
															<div class="title"><h4>한줄평</h4></div>
														</td>
													</tr>
													<tr>
														<td>
															<input type="text" id="contxt" class="form-control" maxlength="40" placeholder="한줄평을 적어주세요 (40자 이내)" autocomplete="off"/>
															<input hidden="hidden">	<!-- 엔터키 오류 방지 -->
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
											<input id="writeBtn" type="button" value="쓰기"/> 
											<input id="cancel" type="button" class="cancelBtn" value="취소"/> 
										</form:form>
									</div>
								</div>
								
								<div class="movie-comment">
								
									<!-- 한줄평 데이터가 없을 때 -->
									<div class="comment-list-no-result" id="noDataDiv" style="display: none;">
										<p>첫번째 <span class="font-gblue">한줄평</span>의 주인공이 되어보세요!</p>
									</div>
									
									<ul>
									</ul>
								</div>
								
			    			 </div>
			    			 <!-- // movie-comment-list -->
			    			 
			    			 <!-- movie-stil-list -->
			    			 <div class="movie-stil-list">
	    			 			<h2 class="title">메인예고편</h2>
	    			 			<!-- 유투브 영상 퍼올시 공유 -> 퍼가기버튼을 눌려서 src안에 있는 링크를 복사하여야 함 -->
	    			 			<div class="slide-video">
	    			 			</div>
			    			 </div>
			    			 <!-- // movie-stil-list -->
			    			 
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
			<img id="footer_ci" alt="브랜드 로고" src="${contextPath}/resources/images/ci.png">
			<div id="textarea">
				<p>COPYRIGHT © BoxMovie, Inc. All rights reserved</p>
				<p>대구광역시 서구 서대구로 7길2 (내당동 245-4번지 2층) ARS 053-555-1333</p>
			</div>
		</div>
	</footer>

	<script>
		$(function(){
			function getFormatDate(date){
				var subDateArray = date.substr(0,10).split('-');
				return newDateForm = subDateArray[0] + "." + subDateArray[1] + "." + subDateArray[2];
			}
			
			reloadComment();		// 실관람평 데이터 받아옴
			reloadMovie();	// 영화 상세 데이터 받아옴
			
			var contextPath = "${contextPath}";
			var movNo = "${movNo}";
			
			/* ajax - 영화 상세 페이지 데이터 받아올때 */
			function reloadMovie(){
				var contextPath = "${contextPath}";
				var movNo = "${movNo}";
				$.ajax({
					type:"GET",
					url: contextPath + "/api/movies/" + movNo,
					contentType: "application/json; charset=utf-8",
					success: function(json){
		
						var bg = "";
						var title = "";
						var avgStar = "";
						var poster = "";
						var video = "";
						var sCont = "";
						
							/* 영화 뒷 배경 */
							bg += "<div class='bg-img' style='background-image:url("
									+ "${contextPath}/resources/images/movie/movie-detail/bg-" + json.movPoster + ");'>";
							bg += "</div>"; 
							
							/* 실시간 평점 (영화 평균 평점) <-- 트랜젝션 사용 */ 
							avgStar += json.movAvgstar;
							
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
							sCont += "</div><br>";
							sCont += "<button type='button' class='btn-more'>";
							sCont += "<span>더보기</span>";
							sCont += "<i class='iconset ico-btn-more'></i>";
							sCont += "</button>";
							
							/* 영화 정보 */
							sCont += "<div class='movie-info'>";
							sCont += "<p class='p-type'></p>";		
							sCont += "<div class='line'>";						
							sCont += "<p>감독&nbsp;: " + json.movDirector + "</p>";						
							sCont += "<p>장르&nbsp;: " + json.movGenre + " / 런타임 : " + json.movRuntime + " 분</p>";						
							sCont += "<p id='movie-grade'>등급&nbsp;: <i>" + json.movGrade + "세이상</i>관람가</p>";						
							sCont += "<p>개봉일&nbsp;: " + getFormatDate(json.movOpendate) + "</p>";											
							sCont += "</div>";
							sCont += "<p>출연진&nbsp;: " + json.movActor + "</p>";
							sCont += "</div>";
							
							/* 영화 예고편 */
							video += "<iframe width='800' height='450' src='" + json.movVideo + "' allowfullscreen>";
							video += "</iframe>";
							
						$(".movie-detail-page .movie-bg").append(bg);
						$(".number em").append(avgStar);
						$(".movie-detail-cont").append(title);
						$(".poster .wrap").append(poster);
						$(".movie-info-list").append(sCont);
						$(".slide-video").append(video);
						$('#movie-grade i:contains("0세이상")').text("전체");
						$('#movie-grade i:contains("19세이상")').parent().text("청소년관람불가");
						
						$('.btn-more').on("click", function(){
							$(this).toggleClass("active");
							
							$(".movie-summary, .ico-btn-more, .btn-more span").toggleClass("active");
							$(".btn-more span").text("더보기");
							$(".btn-more span.active").text("닫기");
						});
						
					},
					error : function(request, status, error){
						window.location.href = contextPath + "/movielist";	// 데이터에 없는 영화번호를 검색시 전체영화 페이지로 이동
					}
				});
				
			/* 상영타입 (전부 2d로 넣어놓음) */
			var cinNo = "1";
			$.get(contextPath + "/api/cinemas/" + cinNo,
				function(json){
					var cinType = "";
						cinType += "상영타입 : " + json.cinType + "(자막)";
					$(".movie-info .p-type").append(cinType);
				});			
			}
			
			/* ajax - 박스오피스 데이터만 예매버튼 활성화 */
			var contextPath = "${contextPath}";
			var no = "${movNo}";
			
			$.ajax({
				type:"GET",
				url: contextPath + "/api/movies/boxOffice/" + no,
				contentType: "application/json; charset=utf-8",
				success: function(json){
					if (json != '') {
						var btn = "";
							btn += "<button type='button' id='reserve' class='btn reserve' title='영화 예매하기'>예매</button>";
						$(".screen-type").append(btn);
					}else if (json == ''){
						$('#comming').show();
					}
				},
				error : function(request, status, error){
					console.log("error > ");
				}	
			});
			/* // 주요정보 탭 */
			
			/* 실관람평  탭 */		
			function reloadComment(){
				var contextPath = "${contextPath}";
				var movNo = "${movNo}";
				
				$.ajax({
					type:"GET",
					url: contextPath + "/api/comments/movie/" + movNo,
					contentType: "application/json; charset=utf-8",
					async: false,
					success: function(json){
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
								sCont += "<p id='none-user' style='display:none'>" + json[i].comUser + "</p>";
								sCont += "<p class='user-id'>" + json[i].comUser.substring(0, 4) + "</p>";
								sCont += "<div class='divNo' style ='display:none'>" + json[i].comNo + "</div>"
								sCont += "</div>";
								// prof
								
								// textarea
								sCont += "<div class='textarea'>";
								sCont += "<h3>한줄평</h3>";
								sCont += "<h3>" + json[i].comStar + "</h3>";
								sCont += "<p>" + json[i].comContent + "</p>";							
								sCont += "</div>";
								// // textarea
								
								// btn-util
								sCont += "<div class='btn-util'>";				
								sCont += "<button id='alert'></button>";					
								sCont += "</div>";
								// // btn-util
								
								sCont += "</div>";
								// // comment-list
								sCont += "<h5>" + json[i].comDate + "</h5>";
								sCont += "</li>";
							}
							$('#noDataDiv').hide();
							$("#comment-count .font-gblue").append(size);
							$(".movie-comment ul").append(sCont);
							
							// 로그인했을때 한줄평에서 회원이메일이 같으면 클래스 추가(배경색 바뀜-구별을 위해)
							if (${member != null}) {
								var pUser = $('.prof:contains("${member.memEmail}")').parent();
								pUser.addClass('com-me');
							}
							
							// 관리자 로그인시 클래스 추가 (파란색 배경으로 바뀜)
							if (${admin != null}) {
								var pUser = $('.prof').parent();
								pUser.addClass('com-admin');
							}
						}else {
							$("#comment-count .font-gblue").append(dataLength);
							$('#noDataDiv').show();
						}							
					}
				});
			}
			
			/* ajax */
			$('#writeBtn').on("click", function(e){
				var movNo = "${movNo}";
				var user = $('#user').val();
				var content = $('#contxt').val();
				var newComment = { movNo: movNo, 
									comUser : $('#user').val(), 
									comContent: $('#contxt').val(),
									comStar : $('.com-star').val()
								};
				
				Swal.fire({ 		// Alert창 디자인 sweetalert2
					title			  : '등록하시겠습니까?', 
					icon			  : 'question', 
					showCancelButton  : true, 
					confirmButtonColor: '#3085d6', 
					cancelButtonColor : '#d33', 
					confirmButtonText : '등록', 
					cancelButtonText  : '취소' 
					}).then((result) => {
						if (result.isConfirmed) {
				 			$.ajax({
								url 		: contextPath + "/api/comments/",
								type 		: "POST",
								contentType : "application/json; charset=utf-8",
								datatype 	: "json",
								cache 		: false,
								data 		: JSON.stringify(newComment),
								beforeSend  : function(xhr) {			// success로 넘어가기 전에 조건 만족시 success로 넘어가지 않고 beforeSend에서 멈춤
									if (${admin != null}) {				// 관리자가 로그인 했을때 
										if (content == "") {			// 한줄평 내용이 없을때
								        	xhr.abort();					    
								        	//alert("내용을 입력해주세요!");
								        	Swal.fire({				// Alert창 디자인 sweetalert2			
							                    icon : 'warning',
							                    title: '내용을 입력해주세요!'
							                }).then((result) => { 
												if (result.isConfirmed) { 
													return false;
												}
											});					        	
								        }else {						// 관리자는 글을 쓸수 없으므로 취소 후 경고 창 표시
								        	xhr.abort();
								        	Swal.fire({				// Alert창 디자인 sweetalert2			
							                    icon : 'error',
							                    title: '관리자는 한줄평을 달 수 없습니다.'
							                }).then((result) => { 
												if (result.isConfirmed) { 
													return false;
												}
											});	
								        }
									}else if (${member == null} || user == "") {	// 한줄평 유저 (user)에 값이 없을시 success로 넘어가지 않고 로그인으로 이동
								            xhr.abort();
								            //alert("권한이 없습니다. 로그인 해주세요.");
								            //window.location.href = contextPath + "/login";
								            
								            Swal.fire({				// Alert창 디자인 sweetalert2			
							                    icon : 'error',
							                    title: '권한이 없습니다. 로그인 해주세요.'
							                }).then((result) => { 
												if (result.isConfirmed) { 
													window.location.href = contextPath + "/login";
												} 
											});	
									} else if (content == "") {	// 한줄평 내용이 없을때
							        	xhr.abort();					    
							        	//alert("내용을 입력해주세요!");
							        	Swal.fire({				// Alert창 디자인 sweetalert2			
						                    icon : 'warning',
						                    title: '내용을 입력해주세요!'
						                }).then((result) => { 
											if (result.isConfirmed) { 
												return false;
											}
										});					        	
							    	}
							    },
								success 	: function(res) {
									if(user != ""){			// 유저가 있으면 등록후 새로고침
										//alert(newComment.comUser + "님의 한줄평이 등록되었습니다.");
										//location.reload();
										Swal.fire({				// Alert창 디자인 sweetalert2
						                    icon : 'success',
						                    title: '한줄평이 등록되었습니다.',
						                    text : '소중한 한줄평 감사합니다.'
						                }).then((result) => {
											if (result.isConfirmed) { 		
												$(".movie-detail-page .movie-bg").empty();
												$(".number em").empty();
												$(".movie-detail-cont > .title").remove();
												$(".poster .wrap").empty();
												$(".movie-info-list").empty();
												$(".slide-video").empty();
												reloadMovie();
												
												$("#comment-count .font-gblue").empty();
												$(".movie-comment ul").empty();
												reloadComment();
												
												$(".write-content").slideToggle().toggleClass("active");  
												
												$("#contxt").val('');	        
										        $(".br-widget a").removeClass();	               
										        $(".br-widget a:first-child").addClass("br-selected br-current");	               
										        $(".br-current-rating").text("1");	         
										        $(".br-widget").unbind('mouseleave');
											} 
										});
									}
								},
								error : function(request, status, error){
									alert("code:" + request.status+"\n" + "message:" + request.responseText+"\n" + "error:" + error);
								}
							});
					} else{    
						return false;
				 	}
				});
			});
			
			/* 한줄평 삭제 */
			$(document).on('click', '[id=remove]', function(){
				var pa = $(this).parent().parent();
				var ch = pa.children().children();
				var comNo = ch.eq(3).text();
				
				Swal.fire({ 		// Alert창 디자인 sweetalert2
					title			  : '삭제하시겠습니까?', 
					icon			  : 'warning', 
					showCancelButton  : true, 
					confirmButtonColor: '#3085d6', 
					cancelButtonColor : '#d33', 
					confirmButtonText : '삭제', 
					cancelButtonText  : '취소' 
					}).then((result) => {
						if (result.isConfirmed) {
							$.ajax({
								url: contextPath + "/api/comments/" + comNo,
								type: 'DELETE',
								dataType: "html",
								success: function(res) {
									//alert(comNo + "번 한줄평 삭제 완료");
									//location.reload();	
									Swal.fire({				// Alert창 디자인 sweetalert2
					                    icon : 'success',
					                    title: '한줄평 삭제가 완료되었습니다.',
					                }).then((result) => {
										if (result.isConfirmed) { 	
											$(".movie-detail-page .movie-bg").empty();
											$(".number em").empty();
											$(".movie-detail-cont > .title").remove();
											$(".poster .wrap").empty();
											$(".movie-info-list").empty();
											$(".slide-video").empty();
											reloadMovie();
											
											$("#comment-count .font-gblue").empty();
											$(".movie-comment ul").empty();
											reloadComment();
										} 
									});	
								},
								error: function(request, status, error) {
									alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
								}
							});
						} else{    
							return false;
					 	}
					});		
			});
			/* // 실관람평 탭 */
			
			// 예매버튼 클릭시 영화 번호를 reserve 페이지에 전달
			$(document).on('click', '[id=reserve]', function(e){
				var movNo = "${movNo}";
				window.location.href = contextPath + "/reserve?no=" + movNo;
			});
			
			// 한줄평 버튼 눌렸을때
			$(document).on('click', '[id=alert]', function(e){
				var pa = $(this).parent().parent();
				var ch = pa.children().children();
				var comUser = ch.eq(1).text();
				var btnPa = $(this).parent();
				
				//console.log(comUser);
				
				if (${admin != null}) {		// 관리자가 로그인 했을때
					var comBtn = "";
						comBtn += "<button id='modify'>수정</button>";
						comBtn += "<button id='remove'>삭제</button>";
						
					btnPa.empty();
					btnPa.append(comBtn);
				}else {
					if (${member != null}) {		// 로그인 했을때
						if('${member.memEmail}' == comUser){	// 로그인 아이디와 한줄평 유저가 일치할때
							var comBtn = "";
								comBtn += "<button id='modify'>수정</button>";
								comBtn += "<button id='remove'>삭제</button>";
								
							btnPa.empty();
							btnPa.append(comBtn);
						}else {		// 다른 유저가 썼을때
							//alert("권한이 없습니다.");
							Swal.fire({				// Alert창 디자인 sweetalert2
			                    icon : 'error',
			                    title: '권한이 없습니다.'
			                }).then((result) => {
								if (result.isConfirmed) { 
									return false;
								} 
							});
						}
					}else {			// 로그인 안했을때
						//alert("권한이 없습니다. 로그인 해주세요.");	
						Swal.fire({				// Alert창 디자인 sweetalert2
		                    icon : 'error',
		                    title: '권한이 없습니다. 로그인 해주세요.'
		                }).then((result) => {
							if (result.isConfirmed) { 
			            		window.location.href = contextPath + "/login";
							} 
						});
					}
				}	
			});
		});
	</script>
</body>
</html>