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

<c:choose>
	 <c:when test="${sessionScope.authUser == null }">
	 	<!-- 로그인 이전 -->
		<div id="header-wrap">
		   <div id="loginHeader">
		      <ul class="nav">
		            <li class="login-item" id="login-title">
		               <button class="login-btn">QUIZBOOK</button>
		            </li>
		
		            <li class="login-item" id="login-blankHeader"></li>
		
					<!-- 나중에 만들기 -->
		            <!-- <li class="login-item" id="login-followingHeader">
		               <button class="login-btn" data-toggle="modal" data-target="#loginModal">팔로잉</button>
		            </li> -->
		            
		            <li class="login-item" id="login-newHeader">
		               <button class="login-btn" id="headerCreateBtn" data-toggle="modal" data-target="#loginModal">만들기</button>
		            </li>
		            <li class="login-item" id="login-nav-search">
		               <form action="${pageContext.request.contextPath}/searchSetList" method="post" >
		                  <input type="text" placeholder="&#xF002; 검색" id="login-searchHeader" name="keyword">
		               </form>
		            </li>
		            <li class="login-item" id="join-profileHeader">
		               <button class="login-btn" id="lgin-btn-prime"
		               data-toggle="modal" data-target="#loginModal">로그인</button>
		               
		            </li>
		            <li class="login-item" id="join-signUpHeader">
		               <button class="login-btn" 
		               data-toggle="modal" data-target="#joinModal">회원가입</button>
		            </li>
		         </ul>
		   </div>
		</div>
		
		<!-- Modal -->
                  <div class="modal fade" id="loginModal" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content" id="login-modal-content">
                        <div class="modal-body">
                          <c:import url="/WEB-INF/views/user/loginForm.jsp"></c:import>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  
		<!-- Modal -->
                  <div class="modal fade" id="joinModal" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content" id="join-modal-content">
                        <div class="modal-body">
                          <c:import url="/WEB-INF/views/user/joinForm.jsp"></c:import>
                        </div>
                      </div>
                    </div>
                  </div>
		
		
	 </c:when>
	 
	 
	 <c:when test="${sessionScope.authUser != null }">
	 	<!-- 로그인 이후 -->
			<div id="header-wrap">
				<div id="loginHeader">
					<ul class="nav">
							<li class="login-item" id="login-title">
								<button class="login-btn" onclick="location.href='${pageContext.request.contextPath}/${sessionScope.authUser.id }'">QUIZBOOK</button>
							</li>
			
							<li class="login-item" id="login-blankHeader"></li>
			
							<!-- 나중에 만들기 -->
							<!-- <li class="login-item" id="login-followingHeader">
								<button class="login-btn">팔로잉</button>
							</li> -->
							
							<li class="login-item" id="login-newHeader">
								<button class="login-btn" id="headerCreateBtn">만들기</button>
							</li>
							<li class="login-item" id="login-nav-search">
								<form action="${pageContext.request.contextPath}/searchSetList" method="post">
									<input type="text" placeholder="&#xF002; 검색" id="login-searchHeader" name="keyword">
								</form>
							</li>
							<li class="login-item" id="login-profileHeader">
								<button class="login-btn">
								<!-- 사용자의 프로필사진 가져오기 -->
								<c:choose>
									<c:when test="${sessionScope.authUser.userImg == null}"> <!-- 프로필사진이 없을때 -->
										<img src="${pageContext.request.contextPath}/assets/images/07.프로필/기본.png" id="profileImg">
									</c:when>
									<c:when test="${sessionScope.authUser.userImg != null}"> <!-- 프로필사진이 있을때 -->
										<img src="${pageContext.request.contextPath}/upload/user/${sessionScope.authUser.userImg}" id="profileImg"/>
									</c:when>
								</c:choose>
								</button>
							</li>
							<li class="login-item" id="login-signUpHeader">
								<button class="login-btn" onclick="location.href='${pageContext.request.contextPath}/user/api/logout'">로그아웃</button>
							</li>
						</ul>
				</div>
			</div>
	 </c:when>
	</c:choose>	



