<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
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
			<div class="sideTxt" id="sideFix">프로필 수정</div>
			<div class="sideTxt" id="sideSet">계정 설정</div>
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
				<img src="${pageContext.request.contextPath}/assets/images/01.메인.png" alt="profile img" class="img-circle">
				<!-- 버튼  -->
				<span class="filebox" id="pro-cancle">
					<label for="ex_file">선택</label> <input type="file" id="ex_file">
				</span>
			</div>
			
			<!-- 이름  -->
			<div id="pro-name-area">
				<p>이름</p>
				<input class="form-name" id="txtFirstName" type="text"
					name="FirstName" value="" placeholder="이름을 입력해주세요"> <br>
			</div>

			<!-- 직업  -->
			<div id="pro-job-area">
				<p>직업</p>
				
				<div class="dropdown">
				<select name="month" id="dLabel">
						<option value=1>1</option>
                        <option value=2>2</option>
                        <option value=3>3</option>
                        <option value=4>4</option>
                        <option value=5>5</option>
                        <option value=6>6</option>
                        <option value=7>7</option>
                        <option value=8>8</option>
                        <option value=9>9</option>
                        <option value=10>10</option>
                        <option value=11>11</option>
                        <option value=12>12</option>
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