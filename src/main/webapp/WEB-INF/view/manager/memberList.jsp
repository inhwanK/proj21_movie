<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/manager/sidebar.css">
</head>
<body>
<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="#">관리자 페이지</a>
      </li>
      <li><a href="${contextPath }/main">HOME</a></li>
      <li><a href="${contextPath }/movieManager">영화 관리</a></li>
      <li><a href="${contextPath }/reserveManager">예매 관리</a></li>
      <li><a href="${contextPath }/showInfoManager">상영시간 관리</a></li>
      <li><a href="${contextPath }/memberManager">회원 관리</a></li>
      <li><a href="${contextPath }/salesManager">매출 조회</a></li>
      <li><a href="${contextPath }/noticeManager">공지사항</a></li>
      <li><a href="${contextPath }/inquiryManager">문의사항</a></li>
    </ul>
  </div>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
      <h1 class="text-center">회원관리</h1>
      <table class="table table-hover table-striped text-center" style="border: 1px solid;">
      	<thead>
      		<tr>
      			<th>번호</th>
      			<th>아이디(이메일)</th>
      			<th>이름</th>
      			<th>생년월일</th>
      			<th>연락처</th>
      			<th>보유포인트</th>
      			<th>회원등급</th>
      			<th></th>
      			<th></th>
      		</tr>
      	</thead>
      	<tbody>
      		<tr>
      			<td>1</td>
      			<td>test@test.co.kr</td>
      			<td>홍홍홍</td>
      			<td>1990-10-10</td>
      			<td>010-1234-1234</td>
      			<td>5000</td>
      			<td>실버</td>
      			<td><button class="btn btn-primary">수정</button></td>
      			<td><button class="btn btn-primary">삭제</button></td>
      		</tr>
      		<tr>
      			<td>2</td>
      			<td>test@test.co.kr</td>
      			<td>홍홍홍</td>
      			<td>1990-10-10</td>
      			<td>010-1234-1234</td>
      			<td>5000</td>
      			<td>실버</td>
      			<td><button class="btn btn-primary">수정</button></td>
      			<td><button class="btn btn-primary">삭제</button></td>
      		</tr>
      		<tr>
      			<td>3</td>
      			<td>test@test.co.kr</td>
      			<td>홍홍홍</td>
      			<td>1990-10-10</td>
      			<td>010-1234-1234</td>
      			<td>5000</td>
      			<td>실버</td>
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