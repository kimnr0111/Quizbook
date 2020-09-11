<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 사이드바 -->

	<nav class="col-sidenav">
		<ul class="nav-top">
			<li><a href=""> <img class="img-block"
					src="${pageContext.request.contextPath}/assets/images/05.사이드바/open-menu.png"
					alt="menu"><span id="home-txt">홈</span>
			</a></li>
			<li><a href=""> <img class="img-block"
					src="${pageContext.request.contextPath}/assets/images/05.사이드바/recently.png"
					alt="recently"> <span id="rec-txt">최근에 학습</span>
			</a></li>
			<li><a href=""> <img class="img-block"
					src="${pageContext.request.contextPath}/assets/images/05.사이드바/heart.png"
					alt="heart-Like"><span id="fol-txt">팔로우</span>
			</a></li>
		</ul>
		<div class="a">
			<hr>
		</div>
		<ul class="nav-mid">
			<li><a href="${pageContext.request.contextPath}/set/${sessionScope.authUserFolder.folderNo }"> <img class="img-block"
					src="${pageContext.request.contextPath}/assets/images/05.사이드바/puzzle.png"
					alt="set"><span id="set-txt">세트만들기</span>
			</a></li>
			<c:if test="${userVo != null }">
				<li class="myfolder-title"><a> <img class="fold-block"
					src="${pageContext.request.contextPath}/assets/images/05.사이드바/folder2.png"
					alt="folder"><span id="fold-txt">내 폴더</span></a></li>
			</c:if>
		</ul>
		<div class="folder-wrap">
			<!-- 내폴더 -->
			<div class="folder-Area myfolder">
							
			</div>
				
		</div>
		
		<c:if test="${userVo != null }">
			<div class="newfolder">
				폴더 +
			</div>
		
			<c:if test="${userVo.id != sessionScope.authUser.id }">
				<div class="otherfolder-title"> <img class="fold-block"
					src="${pageContext.request.contextPath}/assets/images/05.사이드바/folder2.png"
					alt="folder"><span id="otherfold-txt">${userVo.nickName }</span>
				</div>
			</c:if>
		</c:if>
		
		<div class="folder-wrap">
			<!-- 방문한 페이지 사용자폴더 -->
			<div class="folder-Area otherfolder">

			</div>
		</div>
		
		
		<div class="a">
			<hr>
		</div>
		<ul class="nav-bot">
			<li><a href=""> <img class="img-block"
					src="${pageContext.request.contextPath}/assets/images/05.사이드바/my.png"
					alt="mypage"><span id="mypage-txt">정보수정</span>
			</a></li>
			<li><a href=""> <img class="img-block"
					src="${pageContext.request.contextPath}/assets/images/05.사이드바/settings.png"
					alt="navy-setting"><span id="setting-txt">설정</span>
			</a></li>
		</ul>
	</nav>
	
<script type="text/javascript">

	$(document).ready(function(){
		var myuserNo = ${sessionScope.authUser.userNo};
		console.log("내번호:" + myuserNo);
		
		var userNo = ${userVo.userNo};
		console.log("방문한페이지번호" + userNo);
		
		var myVo = {
				userNo: myuserNo
		}
		
		var otherVo = {
				userNo: userNo
		}
		
		/* 내 폴더 불러오기 */
		$.ajax({
			url : "${pageContext.request.contextPath }/getFolderList",		
			type : "post",
			contentType : "application/json",
			dataType: "json",
			data : JSON.stringify(myVo),
			success : function(myfolderList){
				console.log(myfolderList.length);
				for(var i=0;i<myfolderList.length;i++) {
					myfolderRender(myfolderList[i]);
				}
				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
		/* 세트복사 폴더리스트 */
		$.ajax({
			url : "${pageContext.request.contextPath }/getFolderList",		
			type : "post",
			contentType : "application/json",
			dataType: "json",
			data : JSON.stringify(myVo),
			success : function(myfolderList){
				console.log(myfolderList.length);
				for(var i=0;i<myfolderList.length;i++) {
					setCopyFolderRender(myfolderList[i]);
				}
				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
		/* 상대 폴더 불러오기 */
		$.ajax({
			url : "${pageContext.request.contextPath }/getFolderList",		
			type : "post",
			contentType : "application/json",
			dataType: "json",
			data : JSON.stringify(otherVo),
			success : function(otherfolderList){
				console.log(otherfolderList.length);
				for(var i=0;i<otherfolderList.length;i++) {
					otherfolderRender(otherfolderList[i]);
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	$(document).on('click', '.myfolder-title', function(){
		console.log("내폴더클릭");
		if($(".myfolder").css('display') == 'none') {
			$(".myfolder").slideDown();
		} else if($(".myfolder").css('display') == 'block') {
			$(".myfolder").slideUp();
		}
	});
	
	$(document).on('click', '.otherfolder-title', function(){
		console.log("다른사람폴더클릭");
		if($(".otherfolder").css('display') == 'none') {
			$(".otherfolder").slideDown();
		} else if($(".otherfolder").css('display') == 'block') {
			$(".otherfolder").slideUp();
		}
		
	});
	
	/* 사이드바 폴더 클릭 */
	/* 내폴더클릭 */
	$(document).on('click', '.myfolderContents', function(event){
		console.log("폴더클릭");
		event.stopPropagation();
		
		var $this = $(this);
		
		/* 클릭강조 */
		/* $this.addClass('selected').siblings().removeClass('selected'); */
		
		/* 폴더번호, 그룹번호, depth번호 가져옴 */
		console.log("폴더번호:" + $this.data("folderno"));
		console.log("상위폴더번호:" + $this.data("rootno"));
		console.log("그룹번호:" + $this.data("groupno"));
		console.log("정렬번호:" + $this.data("orderno")) + 1;
		console.log("depth:" + $this.data("depth"));
		console.log("폴더이름:" + $this.data("foldername"));

		var folderno = $this.data("folderno");
		var foldername = $this.data("foldername");
		
		$("#userAlink").attr("href", "${pageContext.request.contextPath}/set/" + folderno);
		
		
		
		var folderStatus = $(".myfolderContents[data-rootno=" + folderno + "]");
		var display = $(".myfolderContents[data-rootno=" + folderno + "]").css('display');
		
		console.log(display);
		
		/* 디스플레이가 none일때 보이고 block일때 안보이게 */
		if(display == 'none') {
			console.log("display:none");
			folderStatus.slideDown();
			$this.find($(".material-icons[data-ino=" + folderno + "]")).text('keyboard_arrow_down');
		} else if(display == 'block') {
			console.log("display:block");
			folderStatus.slideUp();
			$this.find($(".material-icons[data-ino=" + folderno + "]")).text('keyboard_arrow_right');			
		}
		
		$("#userset-folderName").html(foldername);
		
		getSetList(folderno);
	});
	
	/* 클릭한 폴더 강조 */
	$(document).on('click', '.folderContents-hover', function(){
		console.log("클릭한폴더강조");
		event.stopPropagation();
		
		var $this = $(this);
		$(".folderContents-hover").removeClass('selected');
		
		$this.addClass('selected');
	});
	
	/* 다른사람폴더클릭 */
	$(document).on('click', '.otherfolderContents', function(event){
		console.log("폴더클릭");
		event.stopPropagation();
		
		var $this = $(this);
		/* $this.addClass('selected').siblings().removeClass('selected'); */
		
		/* 폴더번호, 그룹번호, depth번호 가져옴 */
		console.log("폴더번호:" + $this.data("folderno"));
		console.log("상위폴더번호:" + $this.data("rootno"));
		console.log("그룹번호:" + $this.data("groupno"));
		console.log("정렬번호:" + $this.data("orderno")) + 1;
		console.log("depth:" + $this.data("depth"));
		console.log("폴더이름:" + $this.data("foldername"));

		var folderno = $this.data("folderno");
		var foldername = $this.data("foldername");
		
		var folderStatus = $(".otherfolderContents[data-rootno=" + folderno + "]");
		var display = $(".otherfolderContents[data-rootno=" + folderno + "]").css('display');
		
		/* 디스플레이가 none일때 보이고 block일때 안보이게 */
		if(display == 'none') {
			folderStatus.slideDown();
			$this.find($(".material-icons[data-ino=" + folderno + "]")).text('keyboard_arrow_down');
		} else if(display == 'block') {
			folderStatus.slideUp();
			$this.find($(".material-icons[data-ino=" + folderno + "]")).text('keyboard_arrow_right');
		}
		
		$("#userset-folderName").html(foldername);
		
		getSetList(folderno);
	});
	
	/* 세트복사 폴더클릭 */
	$(document).on('click', '.setCopyFolderContents', function(event){
		console.log("폴더클릭");
		event.stopPropagation();
		
		var $this = $(this);
		
		/* 클릭강조 */
		/* $this.addClass('selected').siblings().removeClass('selected'); */
		
		/* 폴더번호, 그룹번호, depth번호 가져옴 */
		console.log("폴더번호:" + $this.data("folderno"));
		console.log("상위폴더번호:" + $this.data("rootno"));
		console.log("그룹번호:" + $this.data("groupno"));
		console.log("정렬번호:" + $this.data("orderno")) + 1;
		console.log("depth:" + $this.data("depth"));
		console.log("폴더이름:" + $this.data("foldername"));

		var folderno = $this.data("folderno");
		var foldername = $this.data("foldername");
		
		var folderStatus = $(".setCopyFolderContents[data-rootno=" + folderno + "]");
		var display = $(".setCopyFolderContents[data-rootno=" + folderno + "]").css('display');
		
		console.log(display);
		
		/* 디스플레이가 none일때 보이고 block일때 안보이게 */
		if(display == 'none') {
			console.log("display:none");
			folderStatus.slideDown();
			$this.find($(".material-icons[data-ino=" + folderno + "]")).text('keyboard_arrow_down');
		} else if(display == 'block') {
			console.log("display:block");
			folderStatus.slideUp();
			$this.find($(".material-icons[data-ino=" + folderno + "]")).text('keyboard_arrow_right');			
		}
		
	});
	
	
	
	/* 세트복사폴더기능 */
	
	
	/* myfolder 그리기 */
	function myfolderRender(myfolderList) {
		
		if(myfolderList.depth <= 2) {
			var str = "";
			str += "<div class='folder-contents myfolderContents folderDepth-" + myfolderList.depth + "' data-folderno=" + myfolderList.folderNo + " data-groupno=" + myfolderList.groupNo + " data-rootno=" + myfolderList.rootNo + " data-orderno=" + myfolderList.orderNo + " data-depth=" + myfolderList.depth + " data-foldername=" + myfolderList.folderName + ">";
			str += "<div class='folderContents-hover myContextmenu' data-folderno=" + myfolderList.folderNo + " data-groupno=" + myfolderList.groupNo + " data-rootno=" + myfolderList.rootNo + " data-orderno=" + myfolderList.orderNo + " data-depth=" + myfolderList.depth + " data-foldername=" + myfolderList.folderName + ">";
			str += "<div class='folderContents-padding-" + myfolderList.depth + "'>";
			str += "<i class='material-icons' data-ino=" + myfolderList.folderNo + " style='font-size: 20px'>keyboard_arrow_right</i>" + myfolderList.folderName + "";
			str += "</div>";
			str += "</div>";
			str += "</div>";
			str += "";
		} else {
			var str = "";
			str += "<div class='folder-contents myfolderContents folderDepth-3' data-folderno=" + myfolderList.folderNo + " data-groupno=" + myfolderList.groupNo + " data-rootno=" + myfolderList.rootNo + " data-orderno=" + myfolderList.orderNo + " data-depth=" + myfolderList.depth + " data-foldername=" + myfolderList.folderName + ">";
			str += "<div class='folderContents-hover myContextmenu' data-folderno=" + myfolderList.folderNo + " data-groupno=" + myfolderList.groupNo + " data-rootno=" + myfolderList.rootNo + " data-orderno=" + myfolderList.orderNo + " data-depth=" + myfolderList.depth + " data-foldername=" + myfolderList.folderName + ">";
			str += "<div class='folderContents-padding-3'>";
			str += "<i class='material-icons' data-ino=" + myfolderList.folderNo + " style='font-size: 20px'>keyboard_arrow_right</i>" + myfolderList.folderName + "";
			str += "</div>";
			str += "</div>";
			str += "</div>";
			str += "";
		}
		
		console.log(str);
		
		if(myfolderList.depth == 0) {
			console.log("depth:0");
			$(".myfolder").append(str);
		} else {
			console.log("depth:else")
			$(".myfolderContents[data-groupno=" + myfolderList.groupNo + "][data-folderno=" + myfolderList.rootNo + "]").append(str);
		}
	}
	
	/* 세트복사 모달창 폴더그리기 */
	function setCopyFolderRender(myfolderList) {
		if(myfolderList.depth <= 2) {
			var str = "";
			str += "<div class='folder-contents setCopyFolderContents folderDepth-" + myfolderList.depth + "' data-folderno=" + myfolderList.folderNo + " data-groupno=" + myfolderList.groupNo + " data-rootno=" + myfolderList.rootNo + " data-orderno=" + myfolderList.orderNo + " data-depth=" + myfolderList.depth + " data-foldername=" + myfolderList.folderName + ">";
			str += "<div class='folderContents-hover myContextmenu' data-folderno=" + myfolderList.folderNo + " data-groupno=" + myfolderList.groupNo + " data-rootno=" + myfolderList.rootNo + " data-orderno=" + myfolderList.orderNo + " data-depth=" + myfolderList.depth + " data-foldername=" + myfolderList.folderName + ">";
			str += "<div class='folderContents-padding-" + myfolderList.depth + "'>";
			str += "<i class='material-icons' data-ino=" + myfolderList.folderNo + " style='font-size: 20px'>keyboard_arrow_right</i>" + myfolderList.folderName + "";
			str += "</div>";
			str += "</div>";
			str += "</div>";
			str += "";
		} else {
			var str = "";
			str += "<div class='folder-contents setCopyFolderContents folderDepth-3' data-folderno=" + myfolderList.folderNo + " data-groupno=" + myfolderList.groupNo + " data-rootno=" + myfolderList.rootNo + " data-orderno=" + myfolderList.orderNo + " data-depth=" + myfolderList.depth + " data-foldername=" + myfolderList.folderName + ">";
			str += "<div class='folderContents-hover myContextmenu' data-folderno=" + myfolderList.folderNo + " data-groupno=" + myfolderList.groupNo + " data-rootno=" + myfolderList.rootNo + " data-orderno=" + myfolderList.orderNo + " data-depth=" + myfolderList.depth + " data-foldername=" + myfolderList.folderName + ">";
			str += "<div class='folderContents-padding-3'>";
			str += "<i class='material-icons' data-ino=" + myfolderList.folderNo + " style='font-size: 20px'>keyboard_arrow_right</i>" + myfolderList.folderName + "";
			str += "</div>";
			str += "</div>";
			str += "</div>";
			str += "";
		}
		
		console.log(str);
		
		if(myfolderList.depth == 0) {
			console.log("depth:0");
			$(".setCopyFolder").append(str);
		} else {
			console.log("depth:else")
			$(".setCopyFolderContents[data-groupno=" + myfolderList.groupNo + "][data-folderno=" + myfolderList.rootNo + "]").append(str);
		}
	}
	
	function otherfolderRender(otherfolderList) {
		if(otherfolderList.depth <= 2) {
			var str = "";
			str += "<div class='folder-contents otherfolderContents folderDepth-" + otherfolderList.depth + "' data-folderno=" + otherfolderList.folderNo + " data-groupno=" + otherfolderList.groupNo + " data-rootno=" + otherfolderList.rootNo + " data-orderno=" + otherfolderList.orderNo + " data-depth=" + otherfolderList.depth + " data-foldername=" + otherfolderList.folderName + ">";
			str += "<div class='folderContents-hover otherContextmenu' data-folderno=" + otherfolderList.folderNo + " data-groupno=" + otherfolderList.groupNo + " data-rootno=" + otherfolderList.rootNo + " data-orderno=" + otherfolderList.orderNo + " data-depth=" + otherfolderList.depth + " data-foldername=" + otherfolderList.folderName + ">";
			str += "<div class='folderContents-padding-" + otherfolderList.depth + "'>";
			str += "<i class='material-icons' data-ino=" + otherfolderList.folderNo + " style='font-size: 20px'>keyboard_arrow_right</i>" + otherfolderList.folderName + "";
			str += "</div>";
			str += "</div>";
			str += "</div>";
			str += "";
		} else {
			var str = "";
			str += "<div class='folder-contents otherfolderContents folderDepth-3' data-folderno=" + otherfolderList.folderNo + " data-groupno=" + otherfolderList.groupNo + " data-rootno=" + otherfolderList.rootNo + " data-orderno=" + otherfolderList.orderNo + " data-depth=" + otherfolderList.depth + " data-foldername=" + otherfolderList.folderName + ">";
			str += "<div class='folderContents-hover otherContextmenu' data-folderno=" + otherfolderList.folderNo + " data-groupno=" + otherfolderList.groupNo + " data-rootno=" + otherfolderList.rootNo + " data-orderno=" + otherfolderList.orderNo + " data-depth=" + otherfolderList.depth + " data-foldername=" + otherfolderList.folderName + ">";
			str += "<div class='folderContents-padding-3'>";
			str += "<i class='material-icons' data-ino=" + otherfolderList.folderNo + " style='font-size: 20px'>keyboard_arrow_right</i>" + otherfolderList.folderName + "";
			str += "</div>";
			str += "</div>";
			str += "</div>";
			str += "";
		}
		
		console.log(str);
		
		if(otherfolderList.depth == 0) {
			console.log("depth:0");
			$(".otherfolder").append(str);
		} else {
			console.log("depth:else")
			$(".otherfolderContents[data-groupno=" + otherfolderList.groupNo + "][data-folderno=" + otherfolderList.rootNo + "]").append(str);
		}
	}
	
</script>
<!-- 사이드바 끝 -->