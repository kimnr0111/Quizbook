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
			<li><a href=""> <img class="img-block"
					src="${pageContext.request.contextPath}/assets/images/05.사이드바/puzzle.png"
					alt="set"><span id="set-txt">세트</span>
			</a></li>
			<li class="myfolder-title"><a> <img class="fold-block"
					src="${pageContext.request.contextPath}/assets/images/05.사이드바/folder2.png"
					alt="folder"><span id="fold-txt">내 폴더</span></a></li>
		</ul>
		<div class="folder-wrap">
			<!-- 내폴더 -->
			<div class="folder-Area myfolder">
				<!-- 그룹번호는 상위폴더의 그룹번호, 상위폴더가 없을경우 폴더번호
					 depth는 상위폴더의 depth+1, 상위폴더가 없을경우 0
					 ino는 폴더번호 -->
				<%-- <c:forEach items="${myfolderList }" var="folderList">
				<c:choose>
					<c:when test="${folderList.depth <= 2}">
						<div class="folder-contents myfolderContents myfolderDepth-${folderList.depth }" data-folderno="${folderList.folderNo }" data-groupno="${folderList.groupNo }" data-rootno="${folderList.rootNo }" data-orderno="${folderList.orderNo }" data-depth="${folderList.depth }">
							<i class="material-icons" data-ino="${folderList.folderNo }" style="font-size: 20px">keyboard_arrow_right</i>${folderList.folderName}
						</div>
					</c:when>
					<c:otherwise>
						<div class="folder-contents myfolderContents myfolderDepth-3" data-folderno="${folderList.folderNo }" data-groupno="${folderList.groupNo }" data-rootno="${folderList.rootNo }" data-orderno="${folderList.orderNo }" data-depth="${folderList.depth }">
							<i class="material-icons" data-ino="${folderList.folderNo }" style="font-size: 20px">keyboard_arrow_right</i>${folderList.folderName}
						</div>
					</c:otherwise>
				</c:choose>
				</c:forEach> --%>
				
				
			</div>
				
		</div>
		
		<div class="newfolder">
			폴더 +
		</div>
		
		<div class="otherfolder-title"> <img class="fold-block"
				src="${pageContext.request.contextPath}/assets/images/05.사이드바/folder2.png"
				alt="folder"><span id="otherfold-txt">${userVo.nickName }</span>
		</div>
		
		<div class="folder-wrap">
			<!-- 방문한 페이지 사용자폴더 -->
			<div class="folder-Area otherfolder">
			
			
				<%-- <c:forEach items="${otherfolderList }" var="folderList">
					<div class="folder-contents otherfolderContents" data-folderno="${folderList.folderNo }" data-groupno="${folderList.groupNo }" data-rootno="${folderList.rootNo }" data-orderno="${folderList.orderNo }" data-depth="${folderList.depth }">
						<i class="material-icons" data-ino="${folderList.folderNo }" style="font-size: 20px">keyboard_arrow_right</i>${folderList.folderName}
					</div>
				</c:forEach> --%>
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

		var folderno = $this.data("folderno");
		
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
		console.log("depth:" + $this.data("depth")) + 1;

		var folderno = $this.data("folderno");
		
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
	});
	
</script>
<!-- 사이드바 끝 -->