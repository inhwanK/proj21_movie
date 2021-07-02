<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/manager/sidebar.css">
</head>
<body>
<!-- 사이드바 -->
<div id="page-wrapper">
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="#">관리자 페이지</a>
      </li>
      <li><a href="${contextPath }/main">Main Page</a></li>
      <li><a href="${contextPath }/movieManager">영화 관리</a></li>
      <%-- <li><a href="${contextPath }/reserveManager">예매 관리</a></li> --%>
      <li><a href="${contextPath }/showInfoManager">상영시간 관리</a></li>
      <%-- <li><a href="${contextPath }/memberManager">회원 관리</a></li> --%>
      <li><a href="${contextPath }/noticeManager">공지사항</a></li>
      <li><a href="${contextPath }/inquiryManager">문의사항</a></li>
      <li><a href="${contextPath }/salesManager">매출 조회</a></li>
    </ul>
  </div>
</div>
  <!-- /사이드바 -->
</body>
</html>