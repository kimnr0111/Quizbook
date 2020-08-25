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
			<li><a> <img class="fold-block"
					src="${pageContext.request.contextPath}/assets/images/05.사이드바/folder2.png"
					alt="folder"><span id="fold-txt">폴더</span></a></li>
		</ul>
		<div class="folder-Area">
			<!-- 그룹번호는 상위폴더의 그룹번호, 상위폴더가 없을경우 폴더번호
				 depth는 상위폴더의 depth+1, 상위폴더가 없을경우 0
				 ino는 폴더번호 -->
			<div class="folder" data-folderno="1" data-groupno="1" data-depth="0">
				<i class="material-icons" data-ino="1" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="2" data-groupno="1" data-depth="1">
				<i class="material-icons" data-ino="2" style="font-size: 20px">keyboard_arrow_right</i>depth일이삼사오육칠팔구십십일십이
			</div>
			<div class="folder" data-folderno="3" data-groupno="1" data-depth="2">
				<i class="material-icons" data-ino="3" style="font-size: 20px">keyboard_arrow_right</i>depth이삼사오육칠팔구십십일십이
			</div>
			<div class="folder" data-folderno="4" data-groupno="4" data-depth="0">
				<i class="material-icons" data-ino="4" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="5" data-groupno="4" data-depth="1">
				<i class="material-icons" data-ino="5" style="font-size: 20px">keyboard_arrow_right</i>depth1
			</div>
			<div class="folder" data-folderno="6" data-groupno="4" data-depth="1">
				<i class="material-icons" data-ino="6" style="font-size: 20px">keyboard_arrow_right</i>depth1
			</div>
			<div class="folder" data-folderno="7" data-groupno="7" data-depth="0">
				<i class="material-icons" data-ino="7" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="8" data-groupno="8" data-depth="0">
				<i class="material-icons" data-ino="8" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
			</div>
			<div class="folder" data-folderno="9" data-groupno="9" data-depth="0">
				<i class="material-icons" data-ino="9" style="font-size: 20px">keyboard_arrow_right</i>최상위폴더
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
	
	/* 사이드바 폴더 클릭 */
	$(document).on('click', '.folder', function(){
		console.log("폴더클릭");
		
		var $this = $(this);
		
		$this.addClass('selected').siblings().removeClass('selected');
		
		/* 폴더번호, 그룹번호, depth번호 가져옴 */
		console.log("폴더번호:" + $this.data("folderno"));
		console.log("그룹번호:" + $this.data("groupno"));
		console.log("depth번호:" + $this.data("depth"));
		var folderno = $this.data("folderno");
		var groupno = $this.data("groupno");
		var depth = $this.data("depth") + 1;
		
		/* 아이콘모양변경 */
		var text = $("[data-ino=" + folderno + "]").text();
		
		var folderStatus = $("[data-groupno=" + groupno + "][data-depth=" + depth + "]");
		var display = $("[data-groupno=" + groupno + "][data-depth=" + depth + "]").css('display');
		
		/* 디스플레이가 none일때 보이고 block일때 안보이게 */
		if(display == 'none') {
			folderStatus.slideDown();
		} else if(display == 'block') {
			for(var i=depth;;i++) {
				$("[data-groupno=" + groupno + "][data-depth=" + i + "]").slideUp();
				if($("[data-groupno=" + groupno + "][data-depth=" + i + "]").attr('class') == null) {
					break;
				}
			}
			
		}
		
		if(text == 'keyboard_arrow_right') {
			$("[data-ino=" + folderno + "]").text('keyboard_arrow_down');
		} else {
			$("[data-ino=" + folderno + "]").text('keyboard_arrow_right');
		}

		
	});
	
</script>
<!-- 사이드바 끝 -->