<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>1대1 문의 내역</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/mypage/inquiry.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.0/css/all.min.css" rel="stylesheet">
	
	<script type="text/javascript">
	$(function(){  
        var inq = (".inquiry-table .show");  
        $(".inquiry-table .item td").click(function() {  
            var inqDetail =$(this).parents().next("tr");  
            if($(inqDetail).hasClass('hide')) {  
                $(inq).removeClass('show').addClass('hide');  
                $(inqDetail).removeClass('hide').addClass('show');  
            } else {  
                $(inqDetail).addClass('hide').removeClass('show');  
            }  
        });  
    });  

	</script>
</head>
<body>
	<%@include file="/WEB-INF/view/header.jsp"%>
	
	<section>
		<div id="container">
			<div id="mypage-menubar">
			
				<ul>
					<li><a href="${contextPath}/mypage"><h2>My Page</h2></a></li>
					<li><a href="${contextPath}/reserveInfo">예매내역</a></li>
					<li><a href="${contextPath}/commentInfo">한줄평 내역</a></li>
					<li class="active-menu"><a href="${contextPath}/inquiryInfo">1대1 문의 내역</a></li>
					<li><a href="${contextPath}/myinfo">개인정보 수정</a></li>
					<li><a href="${contextPath}/withdrawal">회원탈퇴</a></li>
				</ul>
			</div>
			
			<div id="inquiry-wrap">
				<h2>1대1 문의 내역</h2>
				<div id="inquiry-content">
					<div id="inquiry-count">
						<strong id="strCnt">전체(0 건)</strong>
					</div>
					<div id="inquiry-list">
						<table id="inquiry-table" class="inquiry-table">
							<colgroup>
								<col width="10%">
								<col width="55%">
								<col width="20%">
								<col width="15%">
							</colgroup>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>문의일</th>
								<th>답변상태</th>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	</section>

	<%@include file="/WEB-INF/view/footer.jsp"%>

<script type="text/javascript">
	$(function(){
		var contextPath = "${contextPath}";
		var user = "${member.memEmail}";
		
		$.ajax({
			type:"GET",
			url: contextPath + "/api/inquiryByUser?inqUser=" + user,
			contentType: "application/json; charset=utf-8",
			async: false,
			success: function(json){
				var dataLength = json.length;
				if (dataLength >= 1) {
					var sCont = "";
					$("#strCnt").text("전체(" + dataLength + " 건)");
					for (i = 0; i < dataLength; i++) {
						sCont += "<tr class='item'>";
						sCont += "<td>" + json[i].inqNo + "</td>";
						sCont += "<td>" + json[i].inqTitle + "</td>";
						sCont += "<td>" + json[i].inqDate + "</td>";
						if (json[i].inqStatus) {
							sCont += "<td class='complete'>답변 완료</td>";
						} else {
							sCont += "<td class='notyet'>답변 예정</td>";
						}
						sCont += "</tr>";
						sCont += "<tr class='hide'>";
						sCont += "<td colspan='4'>";
						sCont += "<table class='detail-table'>";
						sCont += "<tr>";
						sCont += "<td width='200px'>문의내용</td>";
						sCont += "<td class='detail' width='550px'>" + json[i].inqDetail + "</td>";
						sCont += "</tr>";
						sCont += "<tr>";
						sCont += "<td>답변</td>";
						if (json[i].inqAnswer == null) {
							sCont += "<td class='notyet'>답변 예정입니다.</td>";
						} else {
							sCont += "<td class='detail'>" + json[i].inqAnswer + "</td>";
						}
						sCont += "</tr>";
						sCont += "<tr>";
						sCont += "<td>답변일</td>";
						if (json[i].inqAnsDate == null) {
							sCont += "<td class='notyet'>답변 예정입니다.</td>";
						} else {
							sCont += "<td>" + json[i].inqAnsDate + "</td>";
						}
						sCont += "</tr>";
						sCont += "</table>";
						sCont += "</td>";
						sCont += "</tr>";
					}
					$("#inquiry-table").append(sCont);
				}
			}
		});
	});
</script>
</body>
</html>