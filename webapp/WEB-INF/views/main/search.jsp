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
	
	

</body>

<script type="text/javascript">

/* 세트리스트 불러오기 */
$(document).ready(function(){
	var list = ${jsonSearchSetList};
	var color = "#"
	var letters = ['6FC4FD', 'F4CC28', 'F8887D', '61E498'];
	console.log(list);
	
	for(var i=0;i<list.length;i++) {
		searchSetListRender(list[i]);
	}
	
	for(var i=0;i<list.length;i++) {
		color += letters[Math.floor(Math.random() * letters.length)];
		$("#userset-"+list[i].setNo).css('background-color', color);
	}
	
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