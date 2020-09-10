<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/loginForm.css"
	rel="stylesheet" type="text/css">
<title>QuizBook</title>

</head>
<body>
	<div id="center-content">
		<div id="loginForm">
			<form method="post" action="${pageContext.request.contextPath}/user/login">
					<div class="loginImg"><img src="${pageContext.request.contextPath}/assets/images/04.로그인/로그인상단.png"> </div>
		
				
				<label for="textId"></label> 
				<input id="textId" type="text" name="id" placeholder="아이디"> 
				
				<label for="textPassword"></label>
				<input id="textPassword" type="password" name="password" placeholder="비밀번호">

				<p class="pw">비밀번호를 잊으셨나요?</p>
				<div id="btnArea">
					<button class="lgbtn" type="submit">로그인</button>
					<p id="or">또는</p>
				</div>

				<button class="btnFacebook" type="submit">Facebook으로 로그인</button>

				<button class="btnGoogle" type="submit">Google으로 로그인</button>



			</form>
		<!-- footer -->
		<p class="footer"><strong>다른 사람들과 함께 사용하는 기기에서는 반드시 <br>로그아웃해주세요.</strong></p>
		</div>
	</div>
</body>
</html>