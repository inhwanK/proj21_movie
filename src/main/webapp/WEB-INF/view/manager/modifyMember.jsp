<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
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
  	<h1>회원관리</h1>
         <div class="col-md-6 col-sm-12">
            <div class="form">
               <form>
                  <div class="form-group">
                     <label>아이디(이메일)</label>
                     <input type="text" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>비밀번호</label>
                     <input type="password" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>비밀번호 확인</label>
                     <input type="password" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>생년월일</label>
                     <input type="text" class="form-control" placeholder="2021-06-02">
                  </div>
                  <div class="form-group">
                     <label>이름</label>
                     <input type="text" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>연락처</label>
                     <input type="text" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>포인트</label>
                     <input type="text" class="form-control">
                  </div>
                  <div class="form-group">
                     <label>회원등급</label>
                     <select class="form-control">
                     	<option>SILVER</option>
                     	<option>GOLD</option>
                     	<option>VIP</option>
                     </select>
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