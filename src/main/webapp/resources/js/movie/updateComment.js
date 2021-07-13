$(function(){
	/* js파일에서 contextPath찾기(ajax 이미지 경로는 인식이 이상함) */
	function getContextPath() {
	  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};

	var contextPath = getContextPath();
	
	/* 별점 테마 */
    $('#example-fontawesome').barrating({ 
		theme: 'fontawesome-stars' 
	});
	
    /* 취소 버튼 누를시  */
	$('#cancel').on("click", function(e){
		$('#comContent').val('');
		$(".br-widget a").removeClass();	               
        $(".br-widget a:first-child").addClass("br-selected br-current");	               	   
        $('.com-star').val("1");
        $(".br-current-rating").text("1");
        $(".br-widget").unbind('mouseleave');
	});
	
    /* 나가기 버튼 누를시 */
	$('#exit').on("click", function(e){
        window.close();
	});
    
	/* 엔터 쳤을때 버튼 누른것과 동일한 이벤트 */
	$("#comContent").on("keyup", function(key) {
        if (key.keyCode == 13) {
        	$('#modify').click();
        	return false;
        }
    });
	
});