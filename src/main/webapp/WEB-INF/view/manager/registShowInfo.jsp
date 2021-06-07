<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영 영화 추가</title>
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
  <div class="main">
  	<h1>상영관리</h1>
         <div class="col-md-6 col-sm-12">
            <div class="form">
               <form>
                  <div class="form-group">
                     <label>극장번호</label>
                     <select class="form-control">
                     	<option>신세계</option>
                     	<option>칠성</option>
                     	<option>어디?</option>
                     </select>
                  </div>
                  <div class="form-group">
                     <label>상영관번호</label>
                     <select class="form-control">
                     	<option>1(2D)</option>
                     	<option>2(3D)</option>
                     	<option>3(4D)</option>
                     </select>
                  </div>
                  <div class="form-group">
                     <label>영화번호</label>
                     <select class="form-control">
                     	<option>반지의제왕</option>
                     	<option>해리포터</option>
                     	<option>크루엘라</option>
                     </select>
                  </div>
                  <div class="form-group">
                     <label>상영일</label>
                     <input type="text" class="form-control" placeholder="2021-06-02">
                  </div>
                  <div class="form-group">
                     <label>시작시간</label>
                     <input type="text" class="form-control">
                  </div>
                  <button type="submit" class="btn btn-primary">등록</button>
                  <button class="btn btn-primary">취소</button>
               </form>
            </div>
         </div>
      </div>
</div>
</body>
</html>            
