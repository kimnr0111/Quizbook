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
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath}/assets/css/headerfooter.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/sidebar.css" rel="stylesheet" type="text/css">


<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
	rel="stylesheet" />

	
<link
	href="${pageContext.request.contextPath}/assets/css/study/main.css"
	rel="stylesheet" type="text/css">

</head>


<body>
	<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>
	<div id="body">


	<c:import url="/WEB-INF/views/includes/sidebar.jsp"></c:import>
		
		<!-- study_area, study_user, bottom line을 위한 wrap  -->
		<div id="study_wrap">

			<!-- 세트 제목, 카드, 버튼 -->
			<div class="study_area">

				<!-- 제목 -->
				<div id="study_title">삼국시대 - 고구려</div>
				<!-- 제목 -->

				<!-- 카드 -->
				<div class="card_wrap">
					<!--id지우고 class="card" 뒤에 onclick="flip(event) -->
					<div class="card" id="card">

						<!-- 뒷면용 버튼 transform: rotateX(180deg)와 앞면용 버튼 transform: rotateX(0deg)있어야 뒤집었을때도 버튼이 보임-->
						<div class="card_left card_nav fontAwsome5">&#xf104</div>
						<div class="card_left button_back card_nav fontAwsome5">&#xf104</div>

						<div class="card_content">

							<div class="front">
								<div id="card_content">
									<!-- if조건 처리 후 ajax $(".card_content").html("element") 사용해서  -->

									<img
										src="${pageContext.request.contextPath}/assets/images/corn.jpg"
										class="imgWithText" />

									<div class="text">옥수수</div>

								</div>
							</div>
							<div class="back">
								<div id="card_content">

									<img
										src="${pageContext.request.contextPath}/assets/images/rabbit.jpg"
										class="imgWithText" />

									<div class="text">Lorem ipsum dolor sit amet, consectetur
										adipiscing elit, sed do eiusmod tempor incididunt ut labore et
										dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
										exercitation ullamco laboris nisi ut aliquip ex ea commodo
										consequat. Duis aute irure dolor in reprehenderit in voluptate
										velit esse cillum dolore eu fugiat nulla pariatur. Excepteur
										sint occaecat cupidatat non proident, sunt in culpa qui
										officia deserunt mollit anim id est laborum.</div>

								</div>

							</div>
						</div>


						<!-- 뒷면용 버튼 transform: rotateX(180deg)와 앞면용 버튼 transform: rotateX(0deg)있어야 뒤집었을때도 버튼이 보임-->
						<div class="card_right card_nav fontAwsome5">&#xf105</div>
						<div class="card_right button_back card_nav fontAwsome5">&#xf105</div>

					</div>

				</div>
				<!-- 카드 -->

				<!-- 버튼-->
				<div id="btn">
					<div class="CardsList-navControl previousButton">
						<span>
							<button title="이전 카드" type="button" class="card_btn">
								<span class="fontAwsome5">&#xf0d9</span>
							</button>
						</span>
					</div>


					<div class="CardsList-navControl progressIndex">
						<ul id="index">
							<li>1</li>
							<li>/</li>
							<li>150</li>
						</ul>
					</div>

					<div class="CardsList-navControl nextButton">
						<span>
							<button title="다음 카드" type="button" class="card_btn">
								<span class="fontAwsome5">&#xf0da</span>
							</button>
						</span>
					</div>
				</div>
				<!-- 버튼 -->

			</div>
			<!-- study_area 끝  -->

			<div id="user_wrap">
				<div class="fontAwsome5">
					<a href="#" id="icon_home">&#xf015</a>
				</div>
				<div id="study_user">
					<div id="addShadow">
						<div id="user_data">
							<div id="logo">
								<img
									src="${pageContext.request.contextPath}/assets/images/01.메인.png"
									id="logoImg" />
							</div>
							<div id="user_data_nick"><a href="#">크롱</a></div>
						</div>
						<div id="followNo">
							<div id="following">
								<a href="#">팔로잉 1</a>
							</div>
							<div id="follow_divider">|</div>
							<div id="follower">
								<a href="#">팔로워 10000</a>
							</div>
						</div>
						<div id="heart_wrap">
							<div id="heart">
								<a href="#" id="aHeart">&#xf004</a>
							</div>
						</div>
						<ul id="study_user_nav" class="fontAwsome5">
							<li><a href="#"><span>&#xf00c</span> 학습하기</a></li>
							<li><a href="#"><span>&#xF24d</span> 낱말 카드</a></li>
							<li><a href="#"><span>&#xf044</span> 테스트</a></li>
							<li><a href="#"><span>&#xf439</span> 게임</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- study_area, study_user, bottom line을 위한 wrap 끝 -->


	</div>



	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>





</body>

<script type="text/javascript">
	function rotateX(deg) {
		$('.card').animate({
			deg : deg
		}, {
			duration : 500,
			step : function(now) {
				/* console.log(now); */

				$(".card").css({
					transform : 'rotateX(' + now + 'deg)'
				});
			}
		});
	}
	
	var card_front = true;

	$(".card_content").on('click',function() {
		
						console.log($('.card').css('transform'));

						//1. 만약 애니메이션이 여러개 있어서 복잡하게 되면 메소드를 하나 만드는게 낫다 (split)
						//2. now가 deg를 나타내므로 now를 if 조건문에 사용할수도..
						//3. 세세하게 조절해야할 경우 아래처럼 matrix 비교
						//주의 따로 변수 선언해서 front back if 조건으로 주면 다 뒤집히지 않았을때 문제 time out같은걸

						if (($('.card').css('transform')) != 'matrix3d(1, 0, 0, 0, 0, -1, 1.22465e-16, 0, 0, -1.22465e-16, -1, 0, 0, 0, 0, 1)') {
							console.log("앞->뒤");

							rotateX(180);
							card_front = false;
						}

						else {
							console.log("뒤->앞");

							rotateX(0);
							card_front = true;

						}
					});

	$(".nextButton,.card_right").on('click', function() {
		console.log("버튼클릭");
		$(".card_wrap").clearQueue();
		$(".card").clearQueue();

		console.log(card_front);

		if (card_front == true) {
			console.log('앞 next실행')

			$(".card_wrap").addClass('next');
			/* $(".card").css('transform','').dequeue(); */
			console.log("애니메이션 시작");

			setTimeout(function() {
				$('.front').text('next_front');
				$('.back').text('next_back!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');

			}, 1000);
			
			setTimeout(function() {
				$(".card_wrap").removeClass('next');
			}, 1000);

		}
		//back일때
		//elment에 transform요소를 중복해서 쓸수 없으므로(rotate, translate) card를 싸는 card_wrap을 만들어 각각 적용 card(rotate), card_wrap(translate)
		else {
			console.log('뒤 next실행')
			//우선순위 1.addClass에 콜백함수를 추가한 함수를 새로 선언하거나(실패) https://gist.github.com/gabrysiak/166befef3264d0c53f47 
			//2.queue dequeue를 사용(어중간하게 적용), 3.setTimeout
			$(".card_wrap").addClass('next').delay(1000).queue(function() {
				/* $(".card").css('transform','').dequeue(); */
				console.log("애니메이션 시작");
				$('.card').animate({
					deg : 0
				}, {
					duration : 1,
					step : function(now) {
						console.log(now);

						$(".card").css({
							transform : 'rotateX(' + now + 'deg)'
						});

					}
				}).dequeue();

				$('.front').text('next_front');
				$('.back').text('next_back!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');

				setTimeout(function() {
					$(".card_wrap").removeClass('next');
				}, 100);

			});
		}

	});

	$(".previousButton,.card_left")
			.on(
					'click',
					function() {
						console.log("버튼클릭");
						$(".card_wrap").clearQueue();
						$(".card").clearQueue();

						console.log(card_front);

						if (card_front == true) {
							console.log('앞 previous실행')

							$(".card_wrap").addClass('previous');
							/* $(".card").css('transform','').dequeue(); */
							console.log("애니메이션 시작");

							setTimeout(
									function() {
										$('.front').text('previous_front');
										$('.back').html('<img class="imgOnly" src="${pageContext.request.contextPath}/assets/images/black_test.jpg"/>');
										}, 1000);

							setTimeout(function() {
								$(".card_wrap").removeClass('previous');
							}, 1000);

						}
						//back일때
						//elment에 transform요소를 중복해서 쓸수 없으므로(rotate, translate) card를 싸는 card_wrap을 만들어 각각 적용 card(rotate), card_wrap(translate)
						else {
							console.log('뒤 previous실행')
							//우선순위 1.addClass에 콜백함수를 추가한 함수를 새로 선언하거나(실패) https://gist.github.com/gabrysiak/166befef3264d0c53f47 
							//2.queue dequeue를 사용(어중간하게 적용), 3.setTimeout
							$(".card_wrap")
									.addClass('previous')
									.delay(1000)
									.queue(
											function() {
												/* $(".card").css('transform','').dequeue(); */
												console.log("애니메이션 시작");
												$('.card').animate({deg : 0},{duration : 1, step : function(now) { $(".card").css({transform : 'rotateX('+ now + 'deg)'});}}).dequeue();
												
												$('.front').text('previous_front');
												$('.back').text('previous_back!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');

												setTimeout(function() {$(".card_wrap").removeClass('previous');}, 100);

											});
						}

					});
</script>

<!-- id 안쓰고 class="card" 뒤에 onclick="flip(event) 쓸 경우 
<script type="text/javascript">
	function flip(event) {
		var element = event.currentTarget;
		if (element.className === "card") {
			if (element.style.transform == "rotateX(180deg)") {
				element.style.transform = "rotateX(0deg)";
			} else {
				element.style.transform = "rotateX(180deg)";
			}
		}
	};
</script> -->
</html>