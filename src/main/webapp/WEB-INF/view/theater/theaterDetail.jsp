<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>극장 상세정보</title>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<link rel="stylesheet" href="${contextPath}/resources/css/theater/theaterDetail.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(function(){
			$(".btn li").click(function(){ 
				$(this).addClass("active");
				$(this).siblings().removeClass("active"); 
							
				$(".tab-cont-wrap > div").removeClass("active");
				$(".tab-cont-wrap > div").eq($(this).index()).addClass("active");
			});
			
			$(".date-area button").click(function(){ 
				$(this).addClass("active");
				$(this).siblings().removeClass("active"); 
			});
		});
	</script>
	<script>
		$(function(){		
			var contextPath = "${contextPath}";
			
			/* 극장정보 탭 */
			var thtNo = "${thtNo}";
			$.get(contextPath+"/api/theaters/" + thtNo,
				function(json) {
					var name = "";
					var detail = "";
					var address = "";
					var map = "";
						/* 극장 이름 */
						name += "<p class='theater-name'>" + json.thtName + "</p>";
						/* 극장 설명 */
						detail += "<h2 class='big-title'>" + json.thtDetail + "</h2>"
						detail += "<p> 최고 수준의 영화 관람 환경을 제공하는 메가박스 대구에서 안락한 문화생활을 즐겨보세요. </p>"	// 
						/* 극장 주소 */
						address += "<li> <span class='font-gblue'> 도로명주소 : </span>" + json.thtAddress + "</li>";
						/* 실시간 길찾기 */
						map += "<a href='https://m.map.naver.com/map.naver?lng=" + json.thtLong + "&lat=" + json.thtLat 
								+ "&level=2'" + "class='button purple' target='_blank' title='새창열림'>실시간 길찾기 </a>";
													 
					$(".contents .thtName").append(name);
					$(".theater-info").append(detail);
					$(".address").append(address);
					$(".btn-group").append(map);
			});
			/* // 극장정보 탭 */
			
			/* price-table-box(관람료 탭) */
			$.get(contextPath+"/api/cinemas",
				function(json) {
					var dataLength = json.length;
					if (dataLength >= 1) {
						var list = "";
						for (i = 0; i < dataLength; i++) {
							list += "<tr>";
							list += "<td>" + json[i].cinType + "</td>";
							list += "<td>" + json[i].cinAdultPrice + "원</td>";
							list += "<td>" + json[i].cinTeenPrice + "원</td>";
							list += "<td>" + json[i].cinPrefPrice + "원</td>";
							list += "</tr>";
						}
						$(".data-table tbody").append(list);
					}
				});
				/* // price-table-box(관람료 탭) */
		});
	</script>
</head>
<body>
	<header>
		<a href="${contextPath}/main" title="박스무비 메인으로 가기">
			<img id="header_ci" alt="브랜드 로고" src="${contextPath}/resources/images/theater/ci.png">
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
	    			<a href="${contextPath}/theaterlist" title="극장 페이지로 이동">극장</a>
	    			<a href="${contextPath}/theaterlist" title="전체극장 페이지로 이동">전체극장</a>
	    			<a href="" title="극장정보 페이지로 이동">극장정보</a>
	    		</div>
	    	</div>
	    	
	    	<div class="contents">
	    		<div class="thtName"></div>	    												 		
    			<div class="inner-wrap">
    				<div class="tab-list">
	    				<ul class="btn">
	    					<li class="active">
	    						<a href="#" title="극장정보 탭으로 이동">극장정보</a>
	    					</li>
	    					<li>
	    						<a href="#" title="상영시간표 탭으로 이동">상영시간표</a>
	    					</li>
	    					<li>
	    						<a href="#" title="관람료 탭으로 이동">관람료</a>
	    					</li>
	    				</ul>
	    			</div>
	    			
	    			<!-- tab-cont-wrap -->
	    			<div class="tab-cont-wrap">
	    				<!-- 극장정보 리스트 -->
	    				<div id="tab01" class="tab-cont active">
	    					<!-- theater-info -->
	    					<div class="theater-info">
	    					</div>
	    					<!-- // theater-info -->
	    					
	    					<!-- 시설 안내 -->
	    					<h2 class="title">시설안내</h2>
	    					<h3 class="title">보유시설</h3>
	    					<div class="theater-facility">
	    						<p>
	    							<i class="iconset facility-theater"></i>
	    							일반상영관
	    						</p>
	    						<p>
	    							<i class="iconset facility-disabled"></i>
	    							장애인석
	    						</p>
	    					</div>	    					
	    					<h3 class="title">층별 안내</h3>
	    					<ul class="dot-list">
	    						<li>
	    							<span class="font-gblue">8층 : </span>
	    							매표소, 스넥바(팝콘 박스), 화장실(남,여), 장애인 화장실(남,여), 상영관 퇴장로(MX관, 2~6관)
	    						</li>
	    						<li>
	    							<span class="font-gblue">9층 : </span>
	    							상영관 입장로(MX관, 2~6관), 화장실(남,여)
	    						</li>
	    					</ul>
	    					<!-- // 시설 안내 -->
	    					
	    					<!-- 교통안내 -->
	    					<h2 class="title">교통안내</h2>
	    					<h3 class="title">약도</h3>
	    					<ul class="dot-list address">
	    					</ul>
	    					<div class="location-map-btn">
	    						<div class="btn-group">
	    						</div>
	    					</div>
	    					
	    					<h3 class="title">주차</h3>
	    					<!-- parking-info -->
	    					<div class="parking-info">
	    						<!-- parking-section -->
	    						<!-- 주차안내 정보 -->
	    						<div class="parking-section">
	    							<div class="icon-box">
	    								<i class="iconset ico-parking" title="주차안내"></i>
	    							</div>
	    							<div class="info">
	    								<p class="title">주차안내</p>
		    							<ul class="dot-list">
				    						<li>
				    							영화관 건물 지하 이용
				    						</li>
				    						<li>
				    							주차공간 협소 하오니 대중교통 이용 바랍니다.
				    						</li>		    						
				    					</ul>	    								
	    							</div>
	    						</div>
	    						
	    						<!-- 주차확인 정보 -->
	    						<div class="parking-section">
	    							 <div class="icon-box">
	    								<i class="iconset ico-confirm" title="주차확인"></i>
	    							</div>
	    							<div class="info">
	    								<p class="title">주차확인</p>
		    							<ul class="dot-list">
				    						<li>
				    							차량 번호 인증시 3시간 무료주차 적용.
				    						</li>
				    						<li>
				    							주차시간 초과 시, 별도 요금 부과 됩니다. 이후 30분 추가시 1,000원 징수
				    						</li>					    						
				    						<li>
				    							차량 인증은 현장 매표소 및 입장시 직원에게 문의 바랍니다. (주차권을 반드시 지참하세요)
				    						</li>				    									    						
				    					</ul>	    								
	    							</div>
	    						</div>
	    						
	    						<!-- 주차요금 정보 -->
	    						<div class="parking-section">
	    							<div class="icon-box">
	    								<i class="iconset ico-cash" title="주차요금"></i>
	    							</div>
	    							<div class="info">
	    								<p class="title">주차요금</p>
		    							<ul class="dot-list">
				    						<li>
				    							주차 요금은 입차시간을 기준으로 합니다.
				    						</li>				    						
				    						<li>
				    							차량 1대당 최초 30분 무료 30분 추가당 1,000원 징수
				    						</li>				    									    						
				    						<li>
				    							주말 및 공휴일에는 주차장이 혼잡할 수 있으니, 대중교통을 이용 바랍니다.
				    						</li>				    						
				    					</ul>	    								
	    							</div>
	    						</div>
	    						<!-- // parking-section -->	    							    					
	    					</div>
	    					<!-- // parking-info -->	    						    				
	    										    					
						</div>
						<!-- // 극장정보 리스트 -->
						
						<!-- 상영시간표 리스트 -->
						<div id="tab02" class="tab-cont">
							<h2 class="title">상영시간표</h2>
							<div class="time-schedule">
								
								<!-- date-list -->
								<div class="date-list">
									<!-- date-area -->
									<div class="date-area" style="position: relative; width: 2100px; border: none; left: -70px;">								
										<button></button>																			
										<button class="active" type="button">
											<span>8</span><span>오늘</span>																																				
										</button>										
										<button type="button">
											<span>9</span><span>내일</span>																																				
										</button>
										<button type="button">
											<span>10</span><span>목</span>																																				
										</button>
										<button type="button">
											<span>11</span><span>금</span>																																				
										</button>
										<button class="sat" type="button">
											<span>12</span><span>토</span>																																				
										</button>
										<button class="holi" type="button">
											<span>13</span><span>일</span>																																			
										</button>
										<button class="disabled" type="button">
											<span>14</span><span>월</span>																																				
										</button>
										<button class="disabled" type="button">
											<span>15</span><span>화</span>																																				
										</button>
										<button class="disabled" type="button">
											<span>16</span><span>수</span>																																				
										</button>
										<button class="disabled" type="button">
											<span>17</span><span>목</span>																																				
										</button>
										<button class="disabled" type="button">
											<span>18</span><span>금</span>																																				
										</button>
										<button class="sat" type="button">
											<span>19</span><span>토</span>
										</button>
										<button class="disabled" type="button">
											<span>20</span><span>일</span>																								
										</button>										
									</div>
									<!-- // date-area -->
								</div>
								<!-- // date-list -->
								
								<!-- theater-list-box -->
								<div class="reserve theater-list-box">
								
									<!-- 크루엘라 theater-list -->
									<div class="theater-list">
										<!-- theater-title -->
										<div class="theater-title">
											<p class="movie-grade age-12">
												<a href="../../movielist/movieDetail/1" title="크루엘라 상세보기">크루엘라</a>
											</p>
											<p class="information" style="float: right;">
												<span style="color: #01738b;">상영중</span>/상영시간 134분
											</p>
										</div>
										<!-- // theater-title -->
										
										<!-- theater-type-box -->
										<div class="theater-type-box">
											<div class="theater-type">
												<p class="theater-name">3관</p>
												<p class="chair">총 90석</p>
 											</div>
 											<div class="theater-time">
 												<div class="theater-type-area">2D(자막)</div>
 												<div class="theater-time-box">
													<a href="#" title="영화 예매하기">
														<span class="time">15:10
														<span class="chair">63석 </span>
														</span>
													</a>	
													<a href="#" title="영화 예매하기">
														<span class="time">18:15
														<span class="chair">75석</span>
														</span>
													</a>
 												</div>
 											</div>
										</div>
										<!-- // theater-type-box -->
										
										<!-- theater-type-box -->
										<div class="theater-type-box">
											<div class="theater-type">
												<p class="theater-name">5관</p>
												<p class="chair">총 80석</p>
 											</div>
 											<div class="theater-time">
 												<div class="theater-type-area">2D(자막)</div>
 												<div class="theater-time-box">
													<a href="#" title="영화 예매하기">
														<span class="time">12:10
														<span class="chair">43석</span>
														</span>
													</a>	
													<a href="#" title="영화 예매하기">
														<span class="time">14:15
														<span class="chair">35석</span>
														</span>
													</a>
 												</div>
 											</div>
										</div>
										<!-- // theater-type-box -->
									</div>
									<!-- // 크루엘라 theater-list -->
									
									<!-- 컨저링3: 악마가 시켰다 theater-list -->
									<div class="theater-list">
										<!-- theater-title -->
										<div class="theater-title">
											<p class="movie-grade age-15">
												<a href="#" title="컨저링3: 악마가 시켰다 상세보기">컨저링3: 악마가 시켰다</a>
											</p>
											<p class="information" style="float: right;">
												<span style="color: #01738b;">상영중</span>/상영시간 112분
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
										</div>
										<!-- // theater-type-box -->
									</div>
									<!-- // 컨저링3: 악마가 시켰다 theater-list -->																		
								</div>
								<!-- // theater-list-box -->								
							</div>
						</div>
						<!-- // 상영시간표 리스트 -->
						
						<!-- 관람료 리스트 -->
						<div id="tab03" class="tab-cont">
							<h2 class="title">영화관람료</h2>
							<!-- price-table-box -->
							<div class="price-table-box">
								<p class="price-table-title">요금 정보</p>
								<table class="data-table">
									<thead> 
										<tr> 
											<th>상영 타입</th>
											<th>일반</th>
											<th>청소년</th>
											<th>우대</th>
										</tr>
									</thead>
									<tbody>												
									</tbody>
								</table>
							</div>
							<!-- price-table-box -->
						</div>
						<!-- // 관람료 리스트 -->
																		
	    			</div>
	    			<!-- // tab-cont-wrap -->	    			    			
    			</div>
  			
    		</div>
    	</div>
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