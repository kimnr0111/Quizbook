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
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css">


<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
<link rel="shortcut icon" href="#">
</head>

<body>
	<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>		
	<!-- header -->
	<div id="main-wrap">
		<div id="main-body">
			<div id="side-nav">
				사이드바 공간
			</div>
			<div id="main">
				<div id="user-profile">
					<div id="userprofile-Img">
						<a href="">
							<img src="${pageContext.request.contextPath}/assets/images/01.메인.png"/ class="mainImg">
						</a>
					</div>
					<!-- profileImg -->
					<div id="userprofile-Info">
						<a href="" class="user-alink alink-Title">펭수</a><br>
						<a href="" class="user-alink alink-Content left-line">팔로잉 00</a>
						<a href="" class="user-alink alink-Content">팔로워 00</a>
					</div>
					<!-- profileInfo -->
					<div id="userprofile-Button">
						<div class="leftButton">
							<a href="" class="user-alink">
								<img src="${pageContext.request.contextPath}/assets/images/01.메인.png"/ class="mainImg">
							</a>
						</div>
						<div class="rightButton">
							<a href="" class="user-alink">
								<img src="${pageContext.request.contextPath}/assets/images/01.메인.png"/ class="mainImg">
							</a>
						</div>
					</div>
					<!-- profileButton -->
				</div>
				<!-- userProfile -->
				
				<div id="user-set">
					<div id="userset-folderName">
						내 폴더
					</div>
					
					<div id="userset-setArea">
						
					</div>
				</div>
				
			</div>
			<!-- main -->
		</div>
	</div>
	
	
	
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	<!-- footer -->
	
	<!-- <c:import url="/WEB-INF/views/includes/main-footer.jsp"></c:import> -->
	<!-- 반응형 footer -->








<div class="modal fade" id="modifyModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<h4 class="modal-title">
					퀴즐렛,<br>당신이 찾는<br>모든 지식 콘텐츠
				</h4>
				<p>당신이 원하는 스터디 찾기</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary">Save changes</button>
			</div>
		</div>
		<!-- modal-content  -->
	</div>
	<!-- modal-dialog  -->
</div>
<!-- 로그인 modal -->

</body>

<script type="text/javascript">

	$(document).ready(function(){
		
		var uno = 2;
		var color = "#"
		var letters = ['D581E6', '8DAEF0', '6DD6A0', 'E9F097', 'E6A54C'];
		
		var mainVo = {
				userNo: uno
		};
		
		$.ajax({
			url : "${pageContext.request.contextPath }/setList",		
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(mainVo),
			dataType: "json",
			success : function(setList){
				console.log(setList);
				for(var i=0;i<setList.length;i++) {
					color = "#"
					render(setList[i]);
					color += letters[Math.floor(Math.random() * letters.length)];
					console.log(color);
					$("#userset-"+setList[i].setNo).css('background-color', color);
					
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
		/* 
		for(var i=0;i<10;i++) {
			color = '#';
			render(i);
			color += letters[Math.floor(Math.random() * letters.length)];
			console.log(color);
			$("#userset-"+i).css('background-color', color);
		} 
		*/
		
	});

	/* 	
	$("#test").on("click", function(){
		$("#modifyModal").modal(); //모달창 보이게
	});
	 */
	
	 $(document).on('mouseenter', '.userset-set', function(){
			console.log("mouseenter");
			
			var $this = $(this);
			$this.find('.setHeader-Save').css('visibility', 'visible');
			
		});
	 
	 $(document).on('mouseleave', '.userset-set', function(){
			console.log("mouseleave");
			
			var $this = $(this);
			$this.find('.setHeader-Save').css('visibility', 'hidden');
			
		});
	
	function render(mainVo) {
		var str = "";
		str += "<div class='userset-set' id='userset-"+mainVo.setNo+"'>";
		str += "	<div class='setHeader'>";
		str += "		<div class='setHeader-Save' id='usersetImg-"+mainVo.setNo+"'>";
		str += "			<button>저장</button>";
		str += "		</div>";
		str += "		<div class='setHeader-Title'>";
		str += "			<span>"+mainVo.setName+"</span><br>";
		str += "		</div>";
		str += "		<div class='setHeader-setContent'>";
		str += "			<span>"+mainVo.setExplain+"</span>";
		str += "		</div>";
		str += "	</div>";
		str += "	<div class='setFooter'>";
		str += "		<a href='' class='user-alink'><span class='setFooter-setUser'>"+mainVo.userNo+"</span></a><br>"; //유저번호가져옴 유저아이디 가져오게 수정
		str += "		<span class='setFooter-like'>"+mainVo.setlike+"</span>";
		str += "		<span class='setFooter-dislike'>"+mainVo.setdislike+"</span>";
		str += "	</div>";
		str += "</div>";
		str += "";
		
		$("#userset-setArea").append(str);
	}
	
	
</script>

</html>