<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>

<title>Main</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/joinForm.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/loginForm.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/index.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/assets/css/headerfooter.css"
	rel="stylesheet" type="text/css">

</head>
<body>
	<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>
	<!-- header -->


	<div class="top">
		<img
			src="${pageContext.request.contextPath}/assets/images/01.메인/01.메인2.png"
			alt="mainImage" class="img-block01">

		<button class="btn-study-open" data-toggle="modal"
			data-target="#joinModal">학습시작</button>
		<!-- Modal -->
		<%--  <div class="modal fade" id="myModal" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                 <div class="modal-dialog">
                   <div class="modal-content" id="join-modal-content">
                     <div class="modal-body">
                       <c:import url="/WEB-INF/views/user/joinForm.jsp"></c:import>
                     </div>
                   </div>
                 </div>
               </div> --%>

	</div>
	<!-- top -->

	<div class="mid">
		<span class="txt-score"> Quizbook을 사용하는 학생의 <span
			id="txt-light">90%</span>가 높은 점수를 받았다고 합니다
		</span>

		<div class="mid01">
			<div class="txt-box1">
				<div class="study-txt">학습에 필요한 모든 것을 제공해 드리겠습니다</div>
				<br>
				<div class="study-txt2">영어를 배우는데 도움이 되는 낱말카드부터 역사를 쉽게 이해할 수 있는
					게임에 이르기까지 다양한 도구를 사용하여 모든 도전을 극복할 수 있습니다.</div>
			</div>
			<img
				src="${pageContext.request.contextPath }/assets/images/01.메인/02.책사람.png"
				alt="first-img" class="img-block02">
		</div>
		<!-- //mid01 -->

		<div class="mid02">
			<img
				src="${pageContext.request.contextPath }/assets/images/01.메인/03.그룹.png"
				alt="first-img" class="img-block03">

			<div class="txt-box2">
				<div class="study-txt3">당신의 스터디를 공유하세요</div>
				<br>
				<div class="study-txt4">학습카드는 학생부터 선생님, 학부모, 직장인까지 모두가 공유할 수
					있습니다. 학습 카드를 공유하여 스터디 친구들을 사귀어 보세요.</div>
			</div>
		</div>
		<!-- //mid02 -->


		<div class="mid03">
			<div class="txt-box3">
				<div class="study-txt5">작은 화면으로도 틈틈이 공부하세요</div>
				<div class="study-txt6">
					어느 환경에서든지 손쉽게 접근할 수 있습니다. <br>어디서든 학습하고 도전하세요!
				</div>
			</div>
			<img
				src="${pageContext.request.contextPath }/assets/images/01.메인/아이폰 영역.png"
				alt="first-img" class="img-block04">
		</div>
		<!-- //mid03 -->
		<div class="mid04">
			<img
				src="${pageContext.request.contextPath }/assets/images/01.메인/줄노트.png"
				alt="first-img" class="img-block05">
			<p class="start-txt" data-toggle="modal" data-target="#joinModal">학습시작</p>
			<!-- Modal -->
			<%-- <div class="modal fade" id="myModal" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content" id="join-modal-content">
                        <div class="modal-body">
                          <c:import url="/WEB-INF/views/user/joinForm.jsp"></c:import>
                        </div>
                      </div>
                    </div>
                  </div> --%>
		</div>
		<!-- //mid04 -->
		<div class="mid05">
			<img
				src="${pageContext.request.contextPath }/assets/images/01.메인/05.메인.png"
				alt="first-img" class="img-block06">
		</div>
		<!-- //mid05 -->

	</div>
	<!-- //mid -->

	<c:import url="/WEB-INF/views/includes/main-footer.jsp"></c:import>
	<!-- footer -->

	<!-- 모달 -->
	<div class="modal" tabindex="-1" role="dialog" id="modalAlert">
		<div class="modal-dialog" role="document" id="alert-modal-dialog">
			<div class="modal-content" id="alert-modal-content">

				<div class="modal-header" id="modalAlert-header">
					<h5 class="modal-title" id="modalAlert-title">알림</h5>
				</div>

				<div class="modal-body" id="modalAlert-body">
					<p></p>
				</div>

				<div class="modal-footer" id="modalAlert-footer">
					<button type="button" class="btn btn-primary" id="modalAlert-button" data-dismiss="modal">확인</button>
				</div>

			</div>
		</div>
	</div>

</body>



<script>

/* function openModal(modalname){
  document.get
  $("#modal").fadeIn(300);
  $("."+modalname).fadeIn(300);
}
$("#modal, .close").on('click',function(){
  $("#modal").fadeOut(300);
  $(".modal-con").fadeOut(300);
}); */

</script>


<script type="text/javascript">

$("#btnjoin").on("click",function(){
	
	event.preventDefault();
	console.log('회원가입 클릭');
	
	var uId = $("#txtId").val();
	var uPw = $("#txtPassword").val();
	var uAge = $("#txtAge").val();
	
	if(uId===""||uPw===""||uAge===""){
		$(".modal-body>p").text("공백이 있습니다");
		$("#modalAlert").modal("show");
	} 
	else {
		console.log('가입 데이터 전송')
		var userInfo = {
				id: uId,
				password: uPw,
				age: uAge
				}
		
		$.ajax({
			url : "${pageContext.request.contextPath }/user/api/signUp",		
			
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(userInfo),
			
			dataType : "json",
			success : function(result){
				/*성공시 처리해야될 코드 작성*/
				console.log(result);
				if(result >= 1){
					$('#joinModal').modal("hide");
					$(".modal-body>p").text("가입완료");
					$("#modalAlert").modal("show");
				} else {
					$(".modal-body>p").text("이미 있는 아이디입니다");
					$("#modalAlert").modal("show");
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	}
});

</script>

<script type="text/javascript">
	$(".lgbtn").on("click",function(){
		
		event.preventDefault();
		
		console.log('회원가입 클릭');
		var uId = $("#textId").val();
		var uPw = $("#textPassword").val();
		if(uId===""||uPw===""){
			$(".modal-body>p").text("공백이 있습니다");
			$("#modalAlert").modal("show");
		} else {
			
			var userInfo = {
					id: uId,
					password: uPw
					}
			
			console.log(userInfo);
			
			$.ajax({
				url : "${pageContext.request.contextPath }/user/api/login",		
				
				type : "post",
				contentType : "application/json",
				data : JSON.stringify(userInfo),
				
				dataType : "json",
				success : function(result){
					/*성공시 처리해야될 코드 작성*/
					console.log(result);
					if(result == 1){
						console.log("로그인 성공");
						$('#loginModal').modal("hide");
						$(location).attr('href', '${pageContext.request.contextPath}'+'/'+uId);
					} else {
						$(".modal-body>p").text("회원정보가 없습니다");
						$("#modalAlert").modal("show");
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
			
		} 
		console.log(uId);
		console.log(uPw);
	});
</script>

</html>