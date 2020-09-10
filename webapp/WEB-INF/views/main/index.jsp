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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
<link href="${pageContext.request.contextPath}/assets/css/headerfooter.css"
	rel="stylesheet" type="text/css">

</head>
<body>
	<c:import url="/WEB-INF/views/includes/main-header2.jsp"></c:import>
	<!-- header -->
	

	<div class="top">
		<img
			src="${pageContext.request.contextPath}/assets/images/01.메인/01.메인2.png"
			alt="mainImage" class="img-block01" > 
	
		<div class="btn-st">	
			<a ><button class="btn-modal-open">학습시작</button></a>
			
		</div> 				 
  
	 </div>
	<!-- top -->
	
	<div class="mid">
		<span class="txt-score">
			Quizbook을 사용하는 학생의 <span id="txt-light">90%</span>가 높은 점수를 받았다고 합니다
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
				<div class="study-txt6">어느 환경에서든지 손쉽게 접근할 수 있습니다. <br>어디서든 학습하고 도전하세요!</div>
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
					<div class="start-txt">학습시작</div>
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
		
</body>
<script>
$(document).on('click', '.btn-modal-open', function(){
	event.preventDefault();
	console.log("학습시작");
	$("#joinFormModal").modal();
});
function openModal(modalname){
  document.get
  $("#modal").fadeIn(300);
  $("."+modalname).fadeIn(300);
}
$("#modal, .close").on('click',function(){
  $("#modal").fadeOut(300);
  $(".modal-con").fadeOut(300);
});
</script>
<script>
    document.getElementById("modal_join_btn").onclick = function() {
        document.getElementById("modal").style.display="block";
    }
   
    document.getElementById("modal_close_btn").onclick = function() {
        document.getElementById("modal").style.display="none";
    }   
</script>
</html>