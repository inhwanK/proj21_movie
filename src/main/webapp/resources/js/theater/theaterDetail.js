$(function(){
	/* js파일에서 contextPath찾기(ajax 이미지 경로는 인식이 이상함) */
	function getContextPath() {
	  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};

	var contextPath = getContextPath();
	
	/* 날짜 불러오기 */
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var today = new Date();
	
	var year = today.getFullYear();
	var month = today.getMonth();
	var date = today.getDate();
	var day = today.getDay();

	for (i = 0; i < 5; i++){			
		var addDate = date + i;
		
		var today2 = new Date(year, month, addDate);
		var month2 = today2.getMonth() + 1;
		var date2 = today2.getDate();

		var dayOfWeek = week[(day + i) % 7]; 
		
		$(".date-list").append("<button type='button'><span>" + month2 + "월 " + date2 + "일</span><span>"+ dayOfWeek + "요일</span></button>");
	}
	
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