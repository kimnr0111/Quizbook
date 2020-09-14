<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"> -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>

<title>Main</title>
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/headerfooter.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/sidebar.css" rel="stylesheet" type="text/css">

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
<link rel="shortcut icon" href="#">
</head>

<body>
	<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>		
	<!-- header -->
	<div id="main-wrap">
		<div id="main-body">
			<c:import url="/WEB-INF/views/includes/sidebar.jsp"></c:import>
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
							<a href="${pageContext.request.contextPath}/set/${folderVo.folderNo }" id="userAlink" class="user-alink">
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
						${folderVo.folderName }
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
				<div class="folder-Area setCopyFolder">
					
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="setCopyModal-Button">복사</button>
				<input type="text" value="" id="setCopyNo"><br>
				<input type="text" value="" id="setCopyFolderNo"><br>
			</div>
		</div>
		
		<!-- modal-content  -->
	</div>
	<!-- modal-dialog  -->
</div>
<!-- 세트복사 모달창 -->

<!-- 폴더생성 모달창 -->
<div class="modal fade" id="folderCreateModal">
	<div class="modal-dialog">
		<div class="modal-content">
		<form action="${pageContext.request.contextPath }/folderCreate" method="post">
			<div class="modal-body">
				<input type="text" name="folderName" placeholder="폴더이름" id="folderCreate-folderName">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<button type="submit" class="btn btn-primary" id="folderCreateModal-Button">만들기</button>
				<input type="text" name="userNo" value="${sessionScope.authUser.userNo }" id="folderCreate-userNo"><br>
				<input type="text" name="folderNo" value="" id="folderCreate-folderNo"><br>
				<input type="text" name="groupNo" value="" id="folderCreate-groupNo"><br>
				<input type="text" name="orderNo" value="" id="folderCreate-orderNo"><br>
				<input type="text" name="depth" value="" id="folderCreate-depth"><br>
			</div>
		</form>
		</div>
		
		<!-- modal-content  -->
	</div>
	<!-- modal-dialog  -->
</div>
<!-- 폴더생성 모달창 -->


<!-- 폴더삭제 모달창 -->
<div class="modal fade" id="folderDeleteModal">
	<div class="modal-dialog">
		<div class="modal-content">
		<form action="${pageContext.request.contextPath }/folderDelete" method="get">
			<div class="modal-body">
				삭제하시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
				<button type="submit" class="btn btn-primary" id="folderDeleteModal-Button">예</button>
				<input type="text" name="folderNo" value="" id="folderDelete-folderNo"><br>
				<input type="text" name="groupNo" value="" id="folderDelete-groupNo"><br>
				<input type="text" name="orderNo" value="" id="folderDelete-orderNo"><br>
				<input type="text" name="depth" value="" id="folderDelete-depth"><br>
			</div>
		</form>
		</div>
		
		<!-- modal-content  -->
	</div>
	<!-- modal-dialog  -->
</div>
<!-- 폴더삭제 모달창 -->


<!-- 우클릭메뉴 -->
<!-- 내 세트일때 수정, 복사, 삭제
	  다른 사용자의 세트일때 복사 -->
<c:choose>
	<c:when test="${sessionScope.authUser.userNo == userVo.userNo }">
		<ul class='custom-menu set-menu'>
			<!-- 수정버튼 클릭시 세트수정폼(세트입력폼에서 약간 수정)으로 이동 -->
			<li id="setModify" class='custom-menu-attribute bottom-line'>수정</li>
			<li id="setCopy" class='custom-menu-attribute bottom-line'>복사</li>
			<li id="setDelete" class='custom-menu-attribute'>삭제</li>
		</ul>
	</c:when>
	
	<c:when test="${sessionScope.authUser.userNo != userVo.userNo }">
		<ul class='custom-menu set-menu'>
			<li id="setCopy" class='custom-menu-attribute bottom-line'>복사</li>
		</ul>
	</c:when>
</c:choose>
<!-- 우클릭메뉴 폴더 -->
		<ul class='custom-menu myfolder-menu'>
			<!-- 수정버튼 클릭시 세트수정폼(세트입력폼에서 약간 수정)으로 이동 -->
			<li id="folder-setCreate" class='custom-menu-attribute bottom-line' onclick="">세트 만들기</li>
			<li id="folderCreate" class='custom-menu-attribute bottom-line'>폴더 만들기</li>
			<li id="folderNameModify" class='custom-menu-attribute bottom-line'>이름변경</li>
			<li id="folderCopy" class='custom-menu-attribute bottom-line'>복사</li>
			<li id="folderDelete" class='custom-menu-attribute'>삭제</li>
		</ul>
		
<!-- 우클릭메뉴 폴더 -->
		<ul class='custom-menu otherfolder-menu'>
			<li id="folderCopy" class='custom-menu-attribute bottom-line'>복사</li>
		</ul>

</body>

<script type="text/javascript">
	
	/* 세트리스트 불러오기 */
	$(document).ready(function(){
		
		fetchList();
		
	});
	
	/* 세트에 마우스 올려졌을때 */
	
	/* $(document).on('mouseenter', '.userset-set', function(){
		console.log("mouseenter");
		
		var $this = $(this);
		$this.find('.setHeader-Save').css('visibility', 'visible');
			
	}); */
	
	/* 세트에서 마우스 벗어났을때 */
	
	/* $(document).on('mouseleave', '.userset-set', function(){
		console.log("mouseleave");
		
		var $this = $(this);
		$this.find('.setHeader-Save').css('visibility', 'hidden');
		
	}); */
	
	/* 세트우클릭 */
	$(document).on('contextmenu', '.userset-set', function() {
		event.preventDefault();
		var $this = $(this);
	    var no = $this.data("setno");
	    console.log(no);
	    
	    $("#setDelNo").val(no); //setNo값 전달
	    $("#setCopyNo").val(no); //setNo값 전달
	    
	    $(".set-menu").css({top: event.pageY + "px", left: event.pageX + "px"});
		$(".set-menu").show();
	/* 우클릭 후 클릭 */
	}).on('click', function() {
			$(".set-menu").hide();
	});
	
	/* 세트 우측상단 버튼클릭 */
	/* $(document).on('click', '.setHeader-Save-Button', function() {
		console.log("세트버튼클릭");
	    
		var $this = $(this);
	    var no = $this.data("setno");
	    console.log(no);

	}); */
	
	
	/* 수정버튼클릭 */
	$(document).on('click', '#setModify', function(){
		event.preventDefault(); //a태그 기능 막기
		console.log("수정버튼클릭");
		var setNo = $("#setDelNo").val();
		location.href = '${pageContext.request.contextPath}/set/setModify/' + setNo;
		//세트입력폼으로 이동
	});
	
	/* 복사버튼클릭 */
	$(document).on('click', '#setCopy', function(){
		event.preventDefault();
		console.log("복사버튼클릭");
		$("#setCopyModal").modal();
		
		/* var no = ${sessionScope.authUser.userNo};
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
		}); */
		
	});
	
	/* 세트복사 폴더클릭 */
	$(document).on('click', '.myContextmenu', function(){
		console.log("세트복사 폴더클릭");
		var $this = $(this);
		
		console.log("클릭한폴더 번호는: " + $this.data("folderno"));
		
		var clickfolderno = $this.data("folderno");
		
		$("#setCopyFolderNo").val(clickfolderno);
		
	});
	
	/* 삭제버튼클릭 */
	$(document).on('click', '#setDelete', function(){
		event.preventDefault();
		console.log("삭제버튼클릭");
		$("#setDeleteModal").modal();
	});
	
	/* 모달창 복사버튼클릭 */
	$(document).on('click', '#setCopyModal-Button', function(){
		console.log("모달창 복사버튼 클릭");
		
		var setNo = $("#setCopyNo").val();
		console.log("세트번호:" + setNo);
		
		
		var folderNo = $("#setCopyFolderNo").val();
		console.log("폴더번호:" + folderNo);
		
		var userNo = ${sessionScope.authUser.userNo};
		
		var vo = {
				setNo: setNo,
				folderNo: folderNo,
				userNo: userNo
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath }/setCopy",		
			type : "post",
			contentType : "application/json",
			dataType: "json",
			data : JSON.stringify(vo),
			success : function(count){
				console.log(count)

				
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
	
	
	/* 내 폴더우클릭 */
	$(document).on('contextmenu', '.myContextmenu', function() {
		event.preventDefault();
		$(".otherfolder-menu").hide();
		var $this = $(this);
		var folderNo = $this.data("folderno");
	    var groupNo = $this.data("groupno");
	    var orderNo = $this.data("orderno") + 1;
	    var myorderNo = $this.data("orderno");
	    var depth = $this.data("depth") + 1;
	    var mydepth= $this.data("depth");
		
	    console.log("폴더번호:" + folderNo);
	    console.log("그룹번호:" + groupNo);
	    console.log("정렬번호:" + orderNo);
	    console.log("depth:" + depth);
	    
	  	//create값 전달
	  	$("#folderCreate-folderNo").val(folderNo);
	    $("#folderCreate-groupNo").val(groupNo);
	    $("#folderCreate-orderNo").val(orderNo);
	    $("#folderCreate-depth").val(depth);
	    
	    //delete값 전달
	    $("#folderDelete-folderNo").val(folderNo);
	    $("#folderDelete-groupNo").val(groupNo); 
	    $("#folderDelete-orderNo").val(myorderNo);
	    $("#folderDelete-depth").val(mydepth);
	    
	    //세트만들기 링크 설정
	    $("#folder-setCreate").attr("onclick", "location.href='${pageContext.request.contextPath}/set/" + folderNo + "'");


	    
	    $(".myfolder-menu").css({top: event.pageY + "px", left: event.pageX + "px"});
		$(".myfolder-menu").show();
	/* 우클릭 후 클릭 */
	}).on('click', function() {
			$(".myfolder-menu").hide();
	});
	
	/* 방문폴더 우클릭 */
	$(document).on('contextmenu', '.otherContextmenu', function() {
		event.preventDefault();
		$(".myfolder-menu").hide();
		var $this = $(this);
		var folderNo = $this.data("folderno");
	    var groupNo = $this.data("groupno");
	    var orderNo = $this.data("orderno") + 1;
	    var myorderNo = $this.data("orderno");
	    var depth = $this.data("depth") + 1;
	    var mydepth= $this.data("depth");
		
	    console.log("폴더번호:" + folderNo);
	    console.log("그룹번호:" + groupNo);
	    console.log("정렬번호:" + orderNo);
	    console.log("depth:" + depth);
	    
	  	//create값 전달
	  	$("#folderCreate-folderNo").val(folderNo);
	    $("#folderCreate-groupNo").val(groupNo);
	    $("#folderCreate-orderNo").val(orderNo);
	    $("#folderCreate-depth").val(depth);
	    
	    //delete값 전달
	    $("#folderDelete-folderNo").val(folderNo);
	    $("#folderDelete-groupNo").val(groupNo); 
	    $("#folderDelete-orderNo").val(myorderNo);
	    $("#folderDelete-depth").val(mydepth);


	    
	    $(".otherfolder-menu").css({top: event.pageY + "px", left: event.pageX + "px"});
		$(".otherfolder-menu").show();
	/* 우클릭 후 클릭 */
	}).on('click', function() {
			$(".otherfolder-menu").hide();
	});
	
	/* 세트만들기 클릭 */
	$(document).on('click', '#folder-setCreate', function(){
		console.log("폴더 세트만들기");
	});
	
	/* 폴더만들기 클릭 */
	$(document).on('click', '#folderCreate', function(){
		console.log("폴더 폴더만들기");
		$("#folderCreateModal").modal();
	});
	
	$(document).on('click', '.newfolder', function(){
		console.log("사이드바 폴더만들기");
		var groupNo = 0;
		var depth = 0;
		var folderNo = 0;
		var orderNo = 0;
		$("#folderCreate-folderNo").val(folderNo);
	    $("#folderCreate-groupNo").val(groupNo);
	    $("#folderCreate-orderNo").val(orderNo);
	    $("#folderCreate-depth").val(depth);
		$("#folderCreateModal").modal();
	});
	
	/* 이름변경클릭 */
	$(document).on('click', '#folderNameModify', function(){
		console.log("폴더 이름변경");
	});
	
	/* 복사클릭 */
	$(document).on('click', '#folderCopy', function(){
		console.log("폴더 복사하기");
	});
	
	/* 삭제클릭 */
	$(document).on('click', '#folderDelete', function(){
		console.log("폴더 삭제");
		$("#folderDeleteModal").modal();
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
		$(".order-menu").hide();
		
		$("#userset-setArea").html("");
		fetchList();
		
	});
	
	$(document).on('click','.orderby-name', function(){
		event.preventDefault();
		console.log("이름순");
		$(".order-menu").hide();
		
		$("#userset-setArea").html("");
		fetchList();
	});
	
	
	/* 유저세트 클릭시 */
	$(document).on('click', '.userset-set', function(){
		
		var $this = $(this);
		var no = $this.data("setno");
		console.log(no);
	});
	
	
	
	/* 기본 setList 가져오기 */
	function fetchList() {
		var folderNo = ${folderVo.folderNo};
		var color = "#"
		var letters = ['6FC4FD', 'F4CC28', 'F8887D', '61E498'];
		
		var mainVo = {
				folderNo: folderNo
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
	}
	
	/* 클릭한 폴더 setList 가져오기 */
	function getSetList(folderno) {
		var color = "#"
		var letters = ['6FC4FD', 'F4CC28', 'F8887D', '61E498'];
		var folderNo = folderno;
		var folderName = folderName;
		var mainVo = {
				folderNo: folderNo
		};
		
		$.ajax({
			url : "${pageContext.request.contextPath }/setList",		
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(mainVo),
			dataType: "json",
			success : function(setList){
				console.log(setList);
				$("#userset-setArea").html('');
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
	}
	
	
	/* set 그리기 */
	function render(mainVo) {
		var str = "";
		str += "<div class='userset-set' draggable='true' data-setno="+mainVo.setNo+" id='userset-"+mainVo.setNo+"' OnClick='location.href =\"${pageContext.request.contextPath }/study/"+mainVo.setNo+"\"'>";
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

	
</script>

</html>