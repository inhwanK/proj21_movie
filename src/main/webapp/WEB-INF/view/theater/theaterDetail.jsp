<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" href="data:;base64,iVBORw0KGgo=">	<!-- 파비콘 오류 메세지 해결 -->
	<meta charset="UTF-8">
	<title>극장 상세정보</title>
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<link rel="stylesheet" href="${contextPath}/resources/css/theater/theaterDetail.css">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
		$(function(){
			/* 날짜 불러오기 */
			var week = ['일', '월', '화', '수', '목', '금', '토'];
			var today = new Date();
			
			var year = today.getFullYear();
			var month = today.getMonth();
			var date = today.getDate();
			var day = today.getDay();

			for (i = 0; i < 7; i++){			
				var addDate = date + i;
				
				var today2 = new Date(year, month, addDate);
				var month2 = today2.getMonth() + 1;
				var date2 = today2.getDate();

				var dayOfWeek = week[(day + i) % 7]; 
				
				$(".date-list").append("<button type='button'><span>" + month2 + "월 " + date2 + "일</span><span>"+ dayOfWeek + "요일</span></button>");
			}
			
			/* 기본 active 클래스 활성화 */
			//$(".date-list button:first").addClass("active");
			
			/* 해당요일이 토요일/일요일일시 class 추가 */
		    var spanSat = $('.date-list button span:nth-child(2):contains("토요일")').parent();
		    var spanHoli = $('.date-list button span:nth-child(2):contains("일요일")').parent();
		    spanSat.addClass('sat');
		    spanHoli.addClass('holi'); 
			
		    /* 텍스트 변경(토/일 클래스 추가 후) */
			$('.date-list button:first span:nth-child(2)').text("오늘");
			$('.date-list button:nth-child(2) span:nth-child(2)').text("내일");
		    
			/* 극장정보 등 탭 클릭 */
			$(".btn li").click(function(e){
				e.preventDefault();
				$(this).addClass("active");
				$(this).siblings().removeClass("active"); 
							
				$(".tab-cont-wrap > div").removeClass("active");
				$(".tab-cont-wrap > div").eq($(this).index()).addClass("active");
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
						detail += "<p> 최고 수준의 영화 관람 환경을 제공하는 메가박스 대구에서 안락한 문화생활을 즐겨보세요. </p>"
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
	<script>
		$(function(){		
			/* 상영시간표 탭 */
			
			var contextPath = "${contextPath}";
			var dateIdx = 0;
			var movieNo = 0;
			var theaterNo = 0;
			var time = "";
			var showInfoNo = 0;
			
			// 날짜 선택했을 시 효과 & 선택된 날짜 인덱스 리턴
			$(".date-list button").click(function(e){ 
				e.preventDefault();
				
				$(this).addClass("active");
				$(this).siblings().removeClass("active"); 
				
				// alert($(this).text());
				
				var idx = $(".date-list button").index(this);
				// alert("날짜 인덱스 >> " + idx);
				
				dateIdx = idx;
			});
			
			/* 날짜 클릭시 날짜계산하여 상영시간 출력 */
			/* $(".date-list button").click(function(e){		
				$(function(){
					var no = "${thtNo}";
					var shwDate = date(dateIdx);
					
					$.ajax({
						type:"GET",
						url: contextPath + "/api/showInfoListByTheater/" + no + "/" + shwDate,
						contentType: "application/json; charset=utf-8",
						success: function(json){
							
							// 영화번호가 같으면 중복 제거 (좌석도 같이 제거 됨 - 후에 처리할 예정)
							var result = json.filter((item1, idx1)=>{
							    return json.findIndex((item2, idx2)=>{
							        return item1.movNo.movNo == item2.movNo.movNo;
							    }) == idx1;
							});
							
							console.table(result);
							
							var dataLength = json.length;
							var resultLength = result.length;
							if (dataLength >= 1) {
								var sCont = "";
								var sCont2 = "";
								
								for (i = 0; i < resultLength; i++) {
									sCont += "<div class='theater-list'>";
									
									// theater-title
									sCont += "<div class='theater-title'>";
									sCont += "<p class='movie-grade age-" + result[i].movNo.movGrade + "'>";
									sCont += "<a href='${contextPath}/movie?movNo=" + result[i].movNo.movNo + "' title='" 
											+ result[i].movNo.movTitle + " 상세보기'>" + result[i].movNo.movTitle + "</a></p>";
									sCont += "<input id=hidden-movNo type='hidden' value='" + result[i].movNo.movNo + "'/>";
									sCont += "<p class='information'>";
									sCont += "<span>상영중</span>/상영시간" + result[i].movNo.movRuntime + "분</p>";
									sCont += "</div>";					
									sCont += "</div>";
								}
								for (i = 0; i < dataLength; i++) {
									
									// theater-type-box
									sCont2 += "<div class='theater-type-box'>";
									sCont2 += "<div class='theater-type'>";
									sCont2 += "<p class='theater-name'>" + json[i].cinNo.cinNo + "관</p>";
									sCont2 += "<p class='chair'>총 " + json[i].cinNo.cinSeat + "석</p>";
									sCont2 += "</div>";
									sCont2 += "<div class='theater-time'>";
									sCont2 += "<div class='theater-type-area'>" + json[i].cinNo.cinType + "(자막)</div>";
									sCont2 += "<div class='theater-time-box'>";
									sCont2 += "<a href='#' title='영화 예매하기'>";
									sCont2 += "<span class='time'>" + json[i].shwStarttime;
									sCont2 += "<span class='chair'>" + json[i].cinNo.cinSeat + "석 </span></span></a>";
									sCont2 += "</div></div></div>";
								}
								$(".theater-list-box").empty();		
								$(".theater-list-box").append(sCont);	
								$(".theater-list").append(sCont2);					
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
				});
			}); */
			

			$(".date-list button").click(function(e){
				$(function(){
					var thtNo = "${thtNo}";
					var shwDate = date(dateIdx);

					$.ajax({
						type:"GET",
						url: contextPath + "/api/showInfoListByTheater/" + thtNo + "/" + shwDate,
						contentType: "application/json; charset=utf-8",
						success: function(json){
							
							console.table(json);
							
							var dataLength = json.length;
							if (dataLength >= 1) {
								var sCont = "";
								
								for (i = 0; i < dataLength; i++) {
									
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
									
									// theater-type-box
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
									sCont += "<span class='chair'>" + json[i].cinNo.cinSeat + "석 </span></span></a>";
									sCont += "</div></div></div>";
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
				});
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
		/* // 상영시간표 탭 */
	</script>
</head>
<body>
	<%@include file="/WEB-INF/view/header.jsp"%>
	
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
									<div class="theater-list">
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
	
	<%@include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>