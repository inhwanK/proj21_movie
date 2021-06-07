<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영 정보 관리</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/sidebar.css">
</head>
<body>
<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="#">관리자 페이지</a>
      </li>
      <li><a href="#">HOME</a></li>
      <li><a href="#">영화 관리</a></li>
      <li><a href="#">예매 관리</a></li>
      <li><a href="#">상영시간 관리</a></li>
      <li><a href="#">회원 관리</a></li>
      <li><a href="#">쿠폰 관리</a></li>
      <li><a href="#">매출 조회</a></li>
      <li><a href="#">공지사항</a></li>
      <li><a href="#">문의사항</a></li>
      <li><a href="#">이벤트 관리</a></li>
    </ul>
  </div>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <h1 class="text-center">상영관리</h1>
      <button class="btn btn-primary">상영 영화 추가</button>
      <table class="table table-hover table-striped text-center" style="border: 1px solid;">
      	<thead>
      		<tr>
      			<th>번호</th>
      			<th>극장</th>
      			<th>상영관</th>
      			<th>영화</th>
      			<th>상영일</th>
      			<th>시작시간</th>
      			<th>종료시간</th>
      			<th></th>
      			<th></th>
      		</tr>
      	</thead>
      	<tbody>
      		<tr>
      			<td>1</td>
      			<td>신세계</td>
      			<td>1관</td>
      			<td>반지의제왕</td>
      			<td>2021-05-30</td>
      			<td>10:00</td>
      			<td>13:00</td>
      			<td><button class="btn btn-primary">수정</button></td>
      			<td><button class="btn btn-primary">삭제</button></td>
      		</tr>
      		<tr>
      			<td>2</td>
      			<td>신세계</td>
      			<td>1관</td>
      			<td>반지의제왕</td>
      			<td>2021-05-30</td>
      			<td>10:00</td>
      			<td>13:00</td>
      			<td><button class="btn btn-primary">수정</button></td>
      			<td><button class="btn btn-primary">삭제</button></td>
      		</tr>
      		<tr>
      			<td>3</td>
      			<td>신세계</td>
      			<td>1관</td>
      			<td>반지의제왕</td>
      			<td>2021-05-30</td>
      			<td>10:00</td>
      			<td>13:00</td>
      			<td><button class="btn btn-primary">수정</button></td>
      			<td><button class="btn btn-primary">삭제</button></td>
      		</tr>
      	</tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>