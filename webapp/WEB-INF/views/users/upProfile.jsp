<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">  
<link href="${pageContext.request.contextPath}/assets/css/headerfooter.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/headerfooter.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/user/upProfile.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>
	<!-- 로그인 후 헤더  -->
	<div class="main-wrap">
		<div class="main-body">
			 <div class="profile-nav">
			<div class="sideTxt" id="sideFix" onclick="location.href='${pageContext.request.contextPath}/user/fixProfile'">프로필 수정</div>
         <div class="sideTxt" id="sideSet" onclick="location.href='${pageContext.request.contextPath}/users/upProfile'">계정 설정</div>
		</div>
		<div class="main_content"> 
			<div id="profile-content">
			 
				<div class="main">
				<div class="setting_main">
					<div>
						<h1 class="setting">계정 설정</h1>
					</div>
					<div class="btn_two"> 
							<button class="cancle" name="cancle">취소</button>
							<button class="sure" name="sure">확인</button>
					</div>
				</div>	
				<div>
						<div class="emailAdress">이메일 주소</div>
							<div class="email">
								<input class="eAdress" type="text" name="account" value="" id="name" placeholder="이름을 입력해주세요">
							</div>
						<div class="password">비밀번호</div>
							<div>
								<input class="txt_password" id="txtPassword" type="password" name="password" value="" placeholder="비밀번호를 입력해주세요">
							<div class="sure_pw">비밀번호 확인</div>	
								<input class="pw_sure" id="pw_sure" type="password" name="password" value="" placeholder="비밀번호를 입력해주세요">
							</div>
					</div>	
						<div class="gender">성별</div>
						<div class="radio_btn">	
							<input class="male" type="radio" name="chk_info" value="male">남성
							<input class="female"  type="radio" name="chk_info" value="female">여성
						</div>
		
					</div>
				</div>	
			</div>
		</div>
	</div>
</body>
</html>