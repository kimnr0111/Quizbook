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
<title>Quizbook</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/assets/css/headerfooter.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/sidebar.css" rel="stylesheet" type="text/css">
</head>
<body>
	<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>
	<!-- header -->
	<div id="main-wrap">
		<div id="main-body">
			<c:import url="/WEB-INF/views/includes/sidebar.jsp"></c:import>
			<!-- sidebar -->
			<div id="main">
				<div id="user-set">
					<div id="userset-folderName">
						검색결과
					</div>
					
					<div id="userset-setArea">
						
					</div>
				</div>
			</div>
		</div>
	</div>


<!-- 세트복사 모달창 -->
<div class="modal fade" id="setCopyModal">
	<div class="modal-dialog">
		<div class="modal-content" id="setCopy-Content">
			<div class="modal-body">
				<div class="folder-Area setCopyFolder">
					
				</div>
			</div>
			
			<div class="modal-footer" id="setModal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="setCopyModal-Button">복사</button>
				<input type="hidden" value="" id="setCopyNo"><br>
				<input type="hidden" value="" id="setCopyFolderNo"><br>
			</div>
		</div>
		
		<!-- modal-content  -->
	</div>
	<!-- modal-dialog  -->
</div>
<!-- 세트복사 모달창 -->	

<!-- 우클릭메뉴 -->
<ul class='custom-menu set-menu'>
	<li id="setCopy" class='custom-menu-attribute bottom-line'>복사</li>
</ul>

</body>

<script type="text/javascript">

/* 세트리스트 불러오기 */
$(document).ready(function(){
	//var list = ${jsonSearchSetList};
	var color = "#"
	var letters = ['6FC4FD', 'F4CC28', 'F8887D', '61E498'];
	var keyword = "${keyword}";
	
	/* for(var i=0;i<list.length;i++) {
		searchSetListRender(list[i]);
		color += letters[Math.floor(Math.random() * letters.length)];
		$("#userset-"+list[i].setNo).css('background-color', color);
	} */
	
	$.ajax({
		url : "${pageContext.request.contextPath }/getSearchList",		
		type : "post",
		data : {keyword: keyword},
		success : function(searchSetList){
			console.log(searchSetList);
			for(var i=0;i<searchSetList.length;i++) {
				color = "#"
					searchSetListRender(searchSetList[i]);
				color += letters[Math.floor(Math.random() * letters.length)];
				console.log(color);
				$("#userset-"+searchSetList[i].setNo).css('background-color', color);
			}
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
	
});

/* 세트우클릭 */
$(document).on('contextmenu', '.userset-set', function() {
	event.preventDefault();
	var $this = $(this);
    var no = $this.data("setno");
    console.log(no);
    
    $("#setCopyNo").val(no); //setNo값 전달
    
    $(".set-menu").css({top: event.pageY + "px", left: event.pageX + "px"});
	$(".set-menu").show();
/* 우클릭 후 클릭 */
}).on('click', function() {
		$(".set-menu").hide();
});

/* 복사버튼클릭 */
$(document).on('click', '#setCopy', function(){
	event.preventDefault();
	console.log("복사버튼클릭");
	$("#setCopyModal").modal();
	
	});
	
/* 세트복사 폴더클릭 */
$(document).on('click', '.myContextmenu', function(){
	console.log("세트복사 폴더클릭");
	var $this = $(this);
	
	console.log("클릭한폴더 번호는: " + $this.data("folderno"));
	
	var clickfolderno = $this.data("folderno");
	
	$("#setCopyFolderNo").val(clickfolderno);
	
});
	
/* 모달창 복사버튼클릭 */
$(document).on('click', '#setCopyModal-Button', function(){
	console.log("모달창 복사버튼 클릭");
	
	var setNo = $("#setCopyNo").val();
	console.log("세트번호:" + setNo);
	
	
	var folderNo = $("#setCopyFolderNo").val();
	console.log("폴더번호:" + folderNo);
	
	var userNo = "${sessionScope.authUser.userNo}";
	
	var vo = {
			setNo: setNo,
			folderNo: folderNo,
			userNo: userNo
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath }/set/setCopy",		
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

/* set 그리기 */
function searchSetListRender(mainVo) {
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
/* 		str += "		<span class='setFooter-like'>♥"+mainVo.setlike+"</span>";
	str += "		<span class='setFooter-dislike'>♡"+mainVo.setdislike+"</span>"; */
	str += "	</div>";
	str += "</div>";
	str += "";
	
	$("#userset-setArea").append(str);

}

</script>

</html>