$(function(){
	/* js파일에서 contextPath찾기(ajax 이미지 경로는 인식이 이상함) */
	function getContextPath() {
	  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};

	var contextPath = getContextPath();
	
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
    
    // 예매버튼 클릭시 영화 번호를 reserve 페이지에 전달
	$(document).ready(function(){
		$(document).on('click', '[id=reserve]', function(e){
			var pa = $(this).parent().parent();
			var ch = pa.children().children();
			var movNo = ch.val();
			
			window.location.href = contextPath + "/reserve?no=" + movNo;
		});
	});
});