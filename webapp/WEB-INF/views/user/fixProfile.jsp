<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
   rel="stylesheet">

<script type="text/javascript"
   src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript"
   src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<link
   href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
   rel="stylesheet" type="text/css">
<link
   href="${pageContext.request.contextPath}/assets/css/headerfooter.css"
   rel="stylesheet" type="text/css">

<link
   href="${pageContext.request.contextPath}/assets/css/user/fixProfile.css"
   rel="stylesheet" type="text/css">
</head>

<body>

   <c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>
   <!-- 로그인 후 헤더  -->


   <form class="profile-form">
      <!-- 좌측 nav  -->
      <div class="profile-nav">
         <div class="sideTxt" id="sideFix" onclick="location.href='${pageContext.request.contextPath}/user/fixProfile'">프로필 수정</div>
         <div class="sideTxt" id="sideSet" onclick="location.href='${pageContext.request.contextPath}/users/upProfile'">계정 설정</div>
      </div>
      <div id="profile-content">
         <div id="pro-title-area">
            <!-- 타이틀 - 프로필수정  -->
            <span id="pro-title">프로필 수정</span>

            <!-- 취소 확인 버튼  -->
            <div class="btn-top">
               <button class="pro-btn" id="pro-cancle">취소</button>
               <input class="pro-btn" id='pro-confirm' type="submit" value="확인">
            </div>
         </div>
         <!-- 사진  -->
         <div id="pro-image-area">
            <!-- 사진텍스트  -->
            <p id="img-text">사진</p>
            <!-- 이미지 보이는 영역 -->
            <img src="${pageContext.request.contextPath}/assets/images/07.프로필/기본.png" alt="profile img" class="img-circle">
            <!-- 버튼  -->
            <span class="filebox" id="pro-cancle">
               <label for="ex_file">변경</label> <input type="file" id="ex_file">
            </span>
         </div>
         
         <!-- 이름  -->
         <div id="pro-name-area">
            <p>이름</p>
            <input class="form-name" id="txtFirstName" type="text"
               name="FirstName" value="" placeholder="이름 "> <br>
         </div>
         
         <!-- 나이 -->
         <div id="pro-age-area">
            <p>나이</p>
            <input class="form-age" id="txtFirstName" type="text"
               name="FirstName" value="" placeholder="나이"> <br>
         </div>

         <!-- 직업  -->
         <div id="pro-job-area">
            <p>직업</p>
            
            <div class="dropdown">
               <select name="month" id="dLabel">
                     <option value=0>선택</option>
                           <option value=1>학생</option>
                           <option value=2>대학생</option>
                           <option value=3>교사/강사</option>
                           <option value=4>회사원</option>
                           <option value=5>공무원</option>
                           <option value=6>주부</option>
                           <option value=7>기타</option>
                      
                   </select>
                </div>
            
         </div>
         
         <!-- 자기소개 -->
         <div id="pro-info-area">
            <p>프로필 정보</p>
            <div class="profile-textarea">
               <textarea cols="72" rows="5" placeholder="자기소개 입력해주세요"></textarea>
            </div>
         </div>
      </div>
   </form>
   <!-- 프로필 수정 폼  -->

</body>

</html>