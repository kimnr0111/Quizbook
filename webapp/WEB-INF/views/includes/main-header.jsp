<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- <div class="container-fluid">
	<div class="row color">
		<div class="col-xs-12">

			<ul class="nav" id="header">
				<li class="nav-item" id="title"><a id="aLinkHeader"
					href="http://localhost:8088/Quizbook/">QUIZBOOK</a></li>

				<li class="nav-item" id="blankHeader"></li>


				<li class="nav-item" id="followingHeader">
					<button class="btn-header">팔로잉</button>
				</li>
				<li class="nav-item" id="newHeader">
					<button class="btn-header">만들기</button>
				</li>
				<li class="nav-item" id="nav-search">
					<form action="${pageContext.request.contextPath}/test" method="post">
						<input type="text" placeholder="&#xF002; 검색" id="searchHeader" name="keyword">
					</form>
				</li>
				<li class="nav-item" id="signInHeader">
					<button class="btn-header">로그인</button>
				</li>
				<li class="nav-item" id="signUpHeader">
					<button class="btn-header">회원가입</button>
				</li>
			</ul>

		</div>
	</div>
</div> --%>

<!-- 로그인 이후 -->
<div id="header-wrap">
	<div id="loginHeader">
		<ul class="nav">
				<li class="login-item" id="login-title">
					<button class="login-btn">QUIZBOOK</button>
				</li>

				<li class="login-item" id="login-blankHeader"></li>


				<li class="login-item" id="login-followingHeader">
					<button class="login-btn">팔로잉</button>
				</li>
				<li class="login-item" id="login-newHeader">
					<button class="login-btn">만들기</button>
				</li>
				<li class="login-item" id="login-nav-search">
					<form action="${pageContext.request.contextPath}/test" method="post">
						<input type="text" placeholder="&#xF002; 검색" id="login-searchHeader" name="keyword">
					</form>
				</li>
				<li class="login-item" id="login-profileHeader">
					<button class="login-btn">
						<img src="${pageContext.request.contextPath}/assets/images/01.메인.png" alt="mainImage" id="profileImg"/>
					</button>
				</li>
				<li class="login-item" id="login-signUpHeader">
					<button class="login-btn">로그아웃</button>
				</li>
			</ul>
	</div>
</div>