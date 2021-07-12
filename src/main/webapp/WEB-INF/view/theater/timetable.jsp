<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">	<!-- 파비콘 오류 메세지 해결 -->
	<meta charset="UTF-8">
	<title>극장별 상영시간표</title>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<link rel="stylesheet" href="${contextPath}/resources/css/theater/timetable.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="${contextPath}/resources/js/theater/theaterDetail.js"></script>
	<script>
		$(function(){
			/* ajax - 극장 리스트 */
			var contextPath = "${contextPath}";
			$.get(contextPath + "/api/theaters",
				function(json) {
					var dataLength = json.length;
					if (dataLength >= 1) {
						var list = "";
						for (i = 0; i < dataLength; i++) {
							list += "<li class='list-li'>";
							list += "<input type='hidden' value='" + json[i].thtNo  + "'>";			
							list += "<button type='button' class='btn'>" + json[i].thtName + "</button>";
							list += "</li>";						
						}
						$(".list-section ul").append(list);
						
						$(".list li .btn:first").addClass("active");
					}
				});
			
			/* 극장 클릭 */
			$(document).on('click', '[class=list-li]', function(e){
				e.preventDefault();
							
				$(".btn").removeClass("active");
				$(".btn").eq($(this).index()).addClass("active");
				
				var dateActive = $(".date-list button.active").length;
				var theaterActive = $(".btn.active").length;
				var activeLength = dateActive + theaterActive; // 날짜, 극장 active 클래스의 수
				
				if (activeLength == 2){
					selList();
				} else {
					var sEmp = "";
						sEmp = "<p class='no-showInfo-list'>선택하신 날짜의 상영중인 영화가 없습니다. 다른 날짜를 선택해주세요.</p>"
					$(".theater-list-box").empty();
					$(".theater-list-box").append(sEmp);
				}
			});
			
			/* 상영시간표 */
			var dateIdx = 0;
			var movieNo = 0;
			var theaterNo = 0;
			var time = "";
			var showInfoNo = 0;

			/* 날짜 클릭시 날짜계산하여 상영시간 출력 */
			$(".date-list button").click(function(e){	
				e.preventDefault();
				
				$(this).addClass("active");
				$(this).siblings().removeClass("active"); 
				
				// alert($(this).text());
				
				var idx = $(".date-list button").index(this);
				//alert("날짜 인덱스 >> " + idx);
				
				dateIdx = idx;
				
				var dateActive = $(".date-list button.active").length;
				var theaterActive = $(".btn.active").length;
				var activeLength = dateActive + theaterActive; // 날짜, 극장 active 클래스의 수
				
				if (activeLength == 2){
					selList();
				} else {
					var sEmp = "";
						sEmp = "<p class='no-showInfo-list'>선택하신 날짜의 상영중인 영화가 없습니다. 다른 날짜를 선택해주세요.</p>"
					$(".theater-list-box").empty();
					$(".theater-list-box").append(sEmp);
				}
			});
			
			function selList(){
				$(".theater-list-box").empty();	
			
				var thtNo = $(".btn.active").prev().val();
				var shwDate = date(dateIdx);
				
				$.ajax({
					type:"GET",
					url: contextPath + "/api/showInfoListByTheater/" + thtNo + "/" + shwDate,
					contentType: "application/json; charset=utf-8",
					success: function(json){
						
						var dataLength = json.length;
						if (dataLength >= 1) {
							var sCont = "";
							var sCont2 = "";
							var showNo = 0;
							var movieNo = 0;
							var cinemaNo = 0;
							for (i = 0; i < dataLength; i++) {
								if (json[i].movNo.movNo != movieNo || json[i].shwNo != json[i].shwNo) {
									sCont += "<div class='theater-list'>";
									// theater-title
									sCont += "<div class='theater-title'>";
									sCont += "<p class='movie-grade age-" + json[i].movNo.movGrade + "'>";
									sCont += "<a href='${contextPath}/movie?movNo=" + json[i].movNo.movNo + "' title='" 
											+ json[i].movNo.movTitle + " 상세보기'>" + json[i].movNo.movTitle + "</a></p>";
									sCont += "<input id=hidden-movNo type='hidden' value='" + json[i].movNo.movNo + "'/>";
									sCont += "<p class='information'>";
									sCont += "<span>상영중</span>/상영시간" + json[i].movNo.movRuntime + "분</p>";
									sCont += "</div>";					
									sCont += "</div>";			
									movieNo = json[i].movNo.movNo;
								}
								// theater-type-box
								if (json[i].cinNo.cinNo == json[i].cinNo.cinNo) {
									sCont += "<div class='theater-type-box'>";
									sCont += "<div class='theater-type'>";
									sCont += "<p class='theater-name'>" + json[i].cinNo.cinNo + "관</p>";
									sCont += "<p class='chair'>총 " + json[i].cinNo.cinSeat + "석</p>";
									sCont += "</div>";
									sCont += "<div class='theater-time'>";
									sCont += "<div class='theater-type-area'>" + json[i].cinNo.cinType + "(자막)</div>";
									sCont += "<div class='theater-time-box'>";
									sCont += "<a href='#' title='영화 예매하기'>";
									sCont += "<span class='time'>" + json[i].shwStarttime;
									sCont += "<span class='chair'>" + json[i].cinNo.cinSeat + "석 </span></span>";
									sCont += "<input type='hidden' value='" + json[i].shwNo + "'/></a>";
									sCont += "</div></div></div>";	
									cinemaNo = json[i].cinNo.cinNo;
								}
							}
							$(".theater-list-box").empty();		
							$(".theater-list-box").append(sCont);																
						}else {
							var sEmp = "";
								sEmp = "<p class='no-showInfo-list'>선택하신 날짜의 상영중인 영화가 없습니다. 다른 날짜를 선택해주세요.</p>"
							$(".theater-list-box").empty();
							$(".theater-list-box").append(sEmp);
						}
					},
					error : function(request, status, error){
						var sEmp = "";
							sEmp = "<p class='no-showInfo-list'>선택하신 날짜의 상영중인 영화가 없습니다. 다른 날짜를 선택해주세요.</p>"
						$(".theater-list-box").empty();
						$(".theater-list-box").append(sEmp);
						console.log("error > ");
					}
				});
			}
			
			// 시간 선택시(영화 예매하기)
			$(document).on('click', '[class=time]', function(e){
				e.preventDefault();
				var showInfoNo = $(this).next().val();
				//console.log(showInfo);
				if (${member == null}) {
					Swal.fire({				// Alert창 디자인 sweetalert2
		                icon : 'error',
		                title: '로그인이 필요한 서비스입니다.'
		            }).then((result) => {
						if (result.isConfirmed) { 
							window.location.href = contextPath + "/login";
							return;
						} 
					});
				}else {					
					window.location.href = contextPath + "/seat?no=" + showInfoNo + "#menu-title";
				}	
			});
			
		});
		
		// 인덱스를 넣으면 해당 인덱스만큼 +된 날짜를 계산하여 "yyyy-MM-dd" 형식으로 리턴해주는 함수 
		function date(idx){
			var today = new Date();
			
			var year = today.getFullYear();
			var month = today.getMonth();
			var date = today.getDate();
			
			var addDate = date + idx;
			
			var today2 = new Date(year, month, addDate);
			var year2 = today2.getFullYear();
			var month2 = today2.getMonth() + 1;
			var date2 = today2.getDate();
			
			if (month2 < 10) month2 = "0" + month2;
			if (date2 < 10) date2 = "0" + date2;
			
			return year2 + "-" + month2 + "-" + date2;
		}
		/* // 상영시간표 */
	</script>
</head>
<body>
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<section>
		
		<!-- 탑위로 올라가는 버튼 -->
		<div id="top_btn">
			<img src="${contextPath}/resources/images/movie/icon/top_btn.png">
		</div>
	
		<div class="container">
	    	<%-- <div class="page-util">	
				<div class="location">
	    			<span></span>
	    			<a href="${contextPath}/theaterlist" title="극장 페이지로 이동">극장</a>
	    			<a href="${contextPath}/theaterlist" title="전체극장 페이지로 이동">전체극장</a>
	    			<a href="" title="극장정보 페이지로 이동">극장정보</a>
	    		</div>
	    	</div> --%>
	    	
	    	<div class="contents"> 												 		
    			<div class="inner-wrap">
					
					<h2 class="title">극장선택</h2>
					<!-- choice-area -->
    				<div class="choice-area">
    					<!-- left-area -->
    					<div class="left-area">
    						<ul>
    							<li class="active">
    								<a href="#" title="극장별 선택">
	    								<i class="iconset ico-tab-theater"></i>
	    								극장별
    								</a>
    							</li>
    						</ul>
    					</div>
    					<!-- // left-area -->
    					
    					<!-- theater-choice -->
    					<div class="theater-choice">
    						<div class="tab-list-choice">
    							<ul>
    								<li>
    									<a href="#" title="대구지점 선택" class="active">
    										대구(3)
    									</a>
    								</li>
    							</ul>
    						</div>
    						
    						<div class="list-section">
    							<ul class="list">
    							</ul>
    						</div>
    					</div>
    					<!-- // theater-choice -->
    				</div>
    				<!-- // choice-area -->

	    			
	    			
	    			<!-- tab-cont-wrap -->
	    			<div class="tab-cont-wrap">
						
						<!-- 상영시간표 리스트 -->
						<div id="tab02" class="tab-cont active">
							<h2 class="title">상영시간표</h2>
							<div class="time-schedule">
								
								<!-- date-list -->
								<div class="date-list">													
									<!-- <button class="disabled" type="button">
										<span>7월 2일</span><span>금</span>																																				
									</button>									
									<button class="sat" type="button">
										<span>7월 3일</span><span>토</span>																																			
									</button> -->
								</div>
								<!-- // date-list -->
								
								<!-- theater-list-box -->
								<div class="reserve theater-list-box">
									<p class="no-showInfo-list">날짜를 선택해주세요</p>
									
									<!-- 컨저링3: 악마가 시켰다 theater-list -->
									<%-- <div class="theater-list">
										<!-- theater-title -->
										<div class="theater-title">
											<p class="movie-grade age-15">
												<a href="${contextPath}/movie?movNo=3" title="컨저링3: 악마가 시켰다 상세보기">컨저링3: 악마가 시켰다</a>
											</p>
											<p class="information">
												<span>상영중</span>/상영시간 112분
											</p>
										</div>
										<!-- // theater-title -->
										
										<!-- theater-type-box -->
										<div class="theater-type-box">
											<div class="theater-type">
												<p class="theater-name">3관</p>
												<p class="chair">총 78석</p>
 											</div>
 											<div class="theater-time">
 												<div class="theater-type-area">2D(자막)</div>
 												<div class="theater-time-box">
													<a href="#" title="영화 예매하기">
														<span class="time">12:05
														<span class="chair">71석</span>
														</span>
													</a>	
 												</div>
 											</div>
										</div>
										<!-- // theater-type-box -->
										
										<!-- theater-type-box -->
										<div class="theater-type-box">
											<div class="theater-type">
												<p class="theater-name">4관</p>
												<p class="chair">총 66석</p>
 											</div>
 											<div class="theater-time">
 												<div class="theater-type-area">2D(자막)</div>
 												<div class="theater-time-box"> 
													<a href="#" title="영화 예매하기">
														<span class="time">13:25
														<span class="chair">70석</span>
														</span>
													</a>	
													<a href="#" title="영화 예매하기">
														<span class="time">15:45
														<span class="chair">68석</span>
														</span>
													</a>
													<a href="#" title="영화 예매하기">
														<span class="time">18:05
														<span class="chair">64석</span>
														</span>
													</a>
 												</div>
 											</div>
										</div> --%>
										<!-- // theater-type-box -->
									</div>
									<!-- // 컨저링3: 악마가 시켰다 theater-list -->																		
								</div>
								<!-- // theater-list-box -->								
							</div>
							<!-- // 상영시간표 리스트 -->

						</div>								
	    				<!-- // tab-cont-wrap -->	    			    			
	    			</div>
    			</div>
  			
    		</div>
	</section>
	
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>