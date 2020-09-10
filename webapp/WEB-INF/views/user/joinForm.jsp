<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>Join</title>
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/joinForm.css"
	rel="stylesheet" type="text/css">

</head>

<body>
	<div id="center-content">
		<form class="join-Form">
				<div class="joinImg">
					<img
					src="${pageContext.request.contextPath}/assets/images/03.회원가입/회원가입 상단.png"
					alt="로고 옆 이미지" class="main-img">
				</div>
	
				<!-- 아이디  -->
				<div id="form-group">
					<input class="form-text" id="txtId" type="text" name="id" value=""
						placeholder="아이디"> <br>
					<!-- 비밀번호  -->
					<input class="form-text" id="txtPassword" type="password"
						name="password" value="" placeholder="비밀번호"> <br>
					<!-- 나이  -->
					<input class="form-text" id="txtAge" type="text" name="age"
						value="" placeholder="나이"> <br>
				</div>
				<!-- 아이디 비밀번호 나이 입력창  -->
							
				<div id="BtnBox">
					<!-- 회원가입 버튼  -->
					<button class="btn-Join" id="btnjoin" type="button">회원가입</button>
					<div class="or">
						<p>또는</p>
					</div>
					<button class="btn-Join" id="btnFacebook" type="button">FACEBOOK으로
						가입하기</button>
					<br>
					<button class="btn-Join" id="btnGoogle" type="button">GOOGLE으로
						가입하기</button>
					<div class="already">
						<a> 이미 회원이신가요? 로그인하기 </a>
					</div>
				</div>
				<!-- 아이디 비밀번호 회원가입 버튼  -->
			
		</form>
		<!-- 회원가입 폼  -->
	</div>
</body>

</html>