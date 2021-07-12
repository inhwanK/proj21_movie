$(function(){
	/* js파일에서 contextPath찾기(ajax 이미지 경로는 인식이 이상함) */
	function getContextPath() {
	  var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	  return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	};

	var contextPath = getContextPath();
	
	/* 주요정보 등 탭 클릭시 */
	$(".btn li").click(function(e) {
		e.preventDefault();
		$(this).addClass("active");
		$(this).siblings().removeClass("active");

		$(".tab-cont-wrap > div").removeClass("active");
		$(".tab-cont-wrap > div").eq($(this).index()).addClass("active");	
	});
	
   /* 취소 버튼 누를시  */
   $("#cancel").click(function () {
        $("#contxt").val('');	        
        $(".br-widget a").removeClass();	               
        $(".br-widget a:first-child").addClass("br-selected br-current");	               
        $(".br-current-rating").text("1");	         
        $(".br-widget").unbind('mouseleave');
   });
   
   /* 한줄평쓰기 버튼 누를시 */
   $(".comment-write > span").click(function(){
		$(".write-content").slideToggle().toggleClass("active");  
		$("#contxt").focus();
     });
   
   /* 별점 테마 */
   $('#example-fontawesome').barrating({ 
		theme: 'fontawesome-stars' 
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
    
    /* 엔터키를 입력시 쓰기버튼과 동일 기능 */
	$("#contxt").on("keyup", function(key) {
        if (key.keyCode == 13) {
        	$('#writeBtn').click();
        	return false;	
        }
    });
    
    /* 수정 버튼 누를시 팝업 */
	$(document).ready(function(){
		$(this).on('click', '[id=modify]', function(){
			var pa = $(this).parent().parent();
			var ch = pa.children().children();
			var comNo = ch.eq(3).text();
		    
		Swal.fire({ 		// Alert창 디자인 sweetalert2
			title			  : '수정하시겠습니까?', 
			icon			  : 'question', 
			showCancelButton  : true, 
			confirmButtonColor: '#3085d6', 
			cancelButtonColor : '#d33', 
			confirmButtonText : '수정', 
			cancelButtonText  : '취소' 
			}).then((result) => { 
				if (result.isConfirmed) {
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
				    PopupCenter(contextPath + "/updateComment?comNo=" + comNo,'popup','700','450'); 
				} else{
					return false;
			 	}
			});
		});
	});
	
});