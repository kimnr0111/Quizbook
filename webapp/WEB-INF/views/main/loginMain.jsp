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
							<c:choose>
								<c:when test="${userVo.userImg == null}"> <!-- 프로필사진이 없을때 -->
									<img src="${pageContext.request.contextPath}/assets/images/01.메인.png" class="mainImg">
								</c:when>
								<c:when test="${userVo.userImg != null}"> <!-- 프로필사진이 있을때 -->
									<img src="${pageContext.request.contextPath}/upload/user/${userVo.userImg}" class="mainImg">
								</c:when>
							</c:choose>
						</a>
					</div>
					<!-- profileImg -->
					<div id="userprofile-Info">
						<a href="" class="user-alink alink-Title">${userVo.nickName }</a><br>
						<a href="" class="user-alink alink-Content left-line">팔로잉 00</a>
						<a href="" class="user-alink alink-Content">팔로워 00</a>
					</div>
					<!-- profileInfo -->
					<div id="userprofile-Button">
						<div class="leftButton">
							<a href="" class="user-alink">
								<img src="${pageContext.request.contextPath}/assets/images/iconmonstr-pencil-4-32.png" class="mainImg">
							</a>
						</div>
						<div class="rightButton">
							<a href="" class="user-alink">
								<img src="${pageContext.request.contextPath}/assets/images/iconmonstr-volume-control-9-32.png" class="mainImg">
							</a>
						</div>
						<ul class="order-menu">
							<a href=""><li class='order-list orderby-recently'>등록순</li></a>
							<a href=""><li class='order-list orderby-name'>이름순</li></a>
						</ul>
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







<!-- 세트삭제 모달창 -->
<div class="modal fade" id="setDeleteModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<h4 class="modal-title">
					삭제하시겠습니까?
				</h4>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="setDel-modal">삭제</button>
				<input type="hidden" value="" id="setDelNo"> <br>	
			</div>
		</div>
		<!-- modal-content  -->
	</div>
	<!-- modal-dialog  -->
</div>
<!-- 세트삭제 모달창 -->

<!-- 세트복사 모달창 -->
<div class="modal fade" id="setCopyModal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<select id="setCopy-folderArea">
					
				</select>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="setCopy-modal">복사</button>
				<input type="text" value="" id="setCopyNo"><br>
			</div>
		</div>
		
		<!-- modal-content  -->
	</div>
	<!-- modal-dialog  -->
</div>
<!-- 세트복사 모달창 -->


<!-- 우클릭메뉴 -->
<!-- 내 세트일때 수정, 복사, 삭제
	  다른 사용자의 세트일때 복사 -->
<c:choose>
	<c:when test="${sessionScope.authUser.userNo == userVo.userNo }">
		<ul class='custom-menu'>
			<!-- 수정버튼 클릭시 세트수정폼(세트입력폼에서 약간 수정)으로 이동 -->
			<li id="setModify" class='custom-menu-attribute bottom-line'>수정</li>
			<li id="setCopy" class='custom-menu-attribute bottom-line'>복사</li>
			<li id="setDelete" class='custom-menu-attribute'>삭제</li>
		</ul>
	</c:when>
	
	<c:when test="${sessionScope.authUser.userNo != userVo.userNo }">
		<ul class='custom-menu'>
			<li id="setCopy" class='custom-menu-attribute bottom-line'>복사</li>
		</ul>
	</c:when>
</c:choose>

</body>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		console.log(${userVo.userNo}); //유저번호 받아와짐
		var uno = ${userVo.userNo};
		var folderNo = ${folderVo.folderNo};
		var color = "#"
		var letters = ['D581E6', '8DAEF0', '6DD6A0', 'E9F097', 'E6A54C'];
		
		var mainVo = {
				userNo: uno,
				folderNo: folderNo
		};
		
		
		
		/* set불러오기 */
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
		
	});

	/* 	
	$("#test").on("click", function(){
		$("#modifyModal").modal(); //모달창 보이게
	});
	 */
	
	/* 세트에 마우스 올려졌을때 */
	$(document).on('mouseenter', '.userset-set', function(){
		console.log("mouseenter");
		
		var $this = $(this);
		$this.find('.setHeader-Save').css('visibility', 'visible');
			
	});
	
	/* 세트에서 마우스 벗어났을때 */
	$(document).on('mouseleave', '.userset-set', function(){
		console.log("mouseleave");
		
		var $this = $(this);
		$this.find('.setHeader-Save').css('visibility', 'hidden');
		
	});
	
	/* 우클릭 */
	$(document).on('contextmenu', '.userset-set', function() {
		event.preventDefault();
		$(".custom-menu-button").hide();
		var $this = $(this);
	    var no = $this.data("setno");
	    console.log(no);
	    
	    $("#setDelNo").val(no); //setNo값 전달
	    $("#setCopyNo").val(no); //setNo값 전달
	    
	    $(".custom-menu").css({top: event.pageY + "px", left: event.pageX + "px"});
		$(".custom-menu").show();
	/* 우클릭 후 클릭 */
	}).on('click', function() {
			$(".custom-menu").hide();
	});
	
	/* 세트 우측상단 버튼클릭 */
	$(document).on('click', '.setHeader-Save-Button', function() {
		console.log("세트버튼클릭");
	    
		var $this = $(this);
	    var no = $this.data("setno");
	    console.log(no);

	});
	
	
	/* 수정버튼클릭 */
	$(document).on('click', '#setModify', function(){
		event.preventDefault(); //a태그 기능 막기
		console.log("수정버튼클릭");
		//세트입력폼으로 이동
	});
	
	/* 복사버튼클릭 */
	$(document).on('click', '#setCopy', function(){
		event.preventDefault();
		console.log("복사버튼클릭");
		$("#setCopyModal").modal();
		
		var no = ${sessionScope.authUser.userNo};
		console.log("authUser : " + no);
		var mainVo = {
				userNo: no
		};
		
		$.ajax({
			url : "${pageContext.request.contextPath }/folderList",		
			type : "post",
			contentType : "application/json",
			dataType: "json",
			data : JSON.stringify(mainVo),
			success : function(folderList){
				console.log(folderList);
				$("#setCopy-folderArea").html("");
				for(var i=0;i<folderList.length;i++) {
					renderOption(folderList[i]);
					
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	/* 모달창 복사버튼클릭 */
	$(document).on('click', '#setCopy-modal', function(){
		console.log("모달창 복사버튼 클릭");
		
		var setNo = $("#setCopyNo").val();
		console.log("세트번호:" + setNo);
		var folderNo = $("#setCopy-folderArea").val();
		
		console.log("폴더번호:" + folderNo);
		
		var vo = {
				setNo: setNo,
				folderNo: folderNo
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath }/setCopy",		
			type : "post",
			contentType : "application/json",
			dataType: "json",
			data : JSON.stringify(vo),
			success : function(count){
				console.log(count);
				//세트 지우기
				$("#userset-" + no).remove();
				//모달창 닫기
				$("#setDeleteModal").modal("hide");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
		
		$("#setCopyModal").modal("hide");
	});
	
	/* 삭제버튼클릭 */
	$(document).on('click', '#setDelete', function(){
		event.preventDefault();
		console.log("삭제버튼클릭");
		$("#setDeleteModal").modal();
	});
	
	/* 모달창 삭제버튼 클릭 */
	$(document).on('click', '#setDel-modal', function(){
		console.log("모달창 삭제버튼 클릭");
		
		var no = $("#setDelNo").val();
		console.log(no);
		
		var mainVo = {
				setNo: no
		};
		
		$.ajax({
			url : "${pageContext.request.contextPath }/setDelete",		
			type : "post",
			contentType : "application/json",
			dataType: "json",
			data : JSON.stringify(mainVo),
			success : function(count){
				console.log(count);
				//세트 지우기
				$("#userset-" + no).remove();
				//모달창 닫기
				$("#setDeleteModal").modal("hide");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	/* 세트 정렬 */
	$(document).on('click', '.rightButton', function(){
		event.preventDefault();
		console.log("정렬버튼클릭");
		$(".order-menu").toggle();
	});
	
	$(document).on('click','.orderby-recently', function(){
		event.preventDefault();
		console.log("최근");
	});
	
	$(document).on('click','.orderby-name', function(){
		event.preventDefault();
		console.log("이름순");
	});
	
	
	/* set 그리기 */
	function render(mainVo) {
		var str = "";
		str += "<div class='userset-set' draggable='true' data-setno="+mainVo.setNo+" id='userset-"+mainVo.setNo+"'>";
		str += "	<div class='setHeader'>";
		str += "		<div class='setHeader-Save'>";
		str += "			<button class='setHeader-Save-Button' data-setno="+mainVo.setNo+"><img src='${pageContext.request.contextPath}/assets/images/iconmonstr-plus-1-32.png' class='mainImg'></button>";
		str += "		</div>";
		str += "		<div class='setHeader-Title'>";
		str += "			<span>"+mainVo.setName+"</span><br>";
		str += "		</div>";
		str += "		<div class='setHeader-setContent'>";
		str += "			<span>"+mainVo.setExplain+"</span>";
		str += "		</div>";
		str += "	</div>";
		str += "	<div class='setFooter'>";
		str += "		<a href='${pageContext.request.contextPath }/" + mainVo.id + "' class='user-alink'><span class='setFooter-setUser'>"+mainVo.id+"</span></a><br>"; //유저번호가져옴 유저아이디 가져오게 수정
		str += "		<span class='setFooter-like'>♥"+mainVo.setlike+"</span>";
		str += "		<span class='setFooter-dislike'>♡"+mainVo.setdislike+"</span>";
		str += "	</div>";
		str += "</div>";
		str += "";
		
		$("#userset-setArea").append(str);
	}
	
	function renderOption(folderVo) {
		
		var str = "";
		str += "<option value=" + folderVo.folderNo + " id='folderNo-" + folderVo.folderNo + "'>" + folderVo.folderName + "</option>";
		str += "";
		
		$("#setCopy-folderArea").append(str);
	}
	
	
</script>

</html>