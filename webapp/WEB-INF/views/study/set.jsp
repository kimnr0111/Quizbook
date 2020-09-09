<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/study/set.css"
	rel="stylesheet" type="text/css">
	
<link href="${pageContext.request.contextPath}/assets/css/sidebar.css" rel="stylesheet" type="text/css">
	
<title>Set</title>

</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>
	<div class="main-wrap">
		<div class="main-body">
			<c:import url="/WEB-INF/views/includes/sidebar.jsp"></c:import>

			<div class="main">
				<h1 class="h1">
					<strong>학습 세트 만들기</strong>
				</h1>
				<div class="txtTitle">
					<input class="textTitle" type="text" name="title"
						placeholder="제목을 입력해주세요">
					<button class="madeBtn">만들기</button>
				</div>
				<div>
					<input class="textAccount" type="text" name="account"
						placeholder="설명을 추가하세요">
				</div>
				<div>
					<Button class="label">
						<img class="boxImg" src="${pageContext.request.contextPath}/assets/images/세트만들기/box.png" />
						<span class="p">다이어그램 추가 및 라벨붙이기</span>
					</Button>
				</div>

				<div class="content">

					<table>
						<tbody>
							<tr name="trCard">
								<td>
									<div class="box">
										<div class="box-head">
											<div class="box-headout">
												<span class="number">1</span> <span class="drag">
													<button class="dragBtn">
														<span>
														<img src="${pageContext.request.contextPath}/assets/images/세트만들기/drag.png" /></span>
													</button>
												</span> <span class="delete">
													<button class="deleteBtn">
														<span class="delete">
														<img src="${pageContext.request.contextPath}/assets/images/세트만들기/delete.png" /></span>
													</button>

												</span>
											</div>
										</div>
										<!-- head -->
										<div class="box-body">
											<div class="word">
												<div>
													<input id="textWord" type="text" name="word"> 
													<input id="textMean" type="text" name="mean"> 
														<label for="file-input"> 
															<img class="add" src="${pageContext.request.contextPath}/assets/images/세트만들기/addImg.png" />
														</label>
													<input id="file-input" type="file" style="display: none">
												</div>
												<div>
													<span class="word">단어</span> <span class="mean">뜻</span>
												</div>

											</div>
											<!-- word -->

										</div>
										<!-- box-body -->
									</div> <!-- box -->
								</td>
							</tr>
						</tbody>
					</table>

					<div class="underLine">
						<button class="cardBtn" name="addCard">+ 카드추가</button>
					</div>


					<div>
						<span class="tag"><strong>태그</strong><input class="txtTag" id="textTag" type="text" name="tag" placeholder="영어, 쉼표로 구분합니다"></span>
					</div>
					<script>
						//추가 버튼
						$(document) .on("click", "button[name=addCard]", function() {
									var addStaffText = '<tr name=""trCard"">'
													+ '    <td class="col-md-11">'
													+ '        <div class="box">'
													+ '			<div class="box-head">'
													+ '				<div class="box-headout">'
													+ '					<span class="number">1</span> '
													+ '					<span class="drag">'
													+ '						<button class="dragBtn">'
													+ '							<span><img src="${pageContext.request.contextPath}/assets/images/세트만들기/drag.png" /></span>'
													+ '						</button>'
													+ '				</div>'
													+ '			<div class="box-body">'
													+ '				<div class="word">'
													+ '					<div>'
													+ '						<input id="textWord" type="text" name="word"> '
													+ '						<input id="textMean" type="text" name="mean"> '
													+ '						<label for="file-input"> '
													+ '						<img class="add" src="${pageContext.request.contextPath}/assets/images/세트만들기/addImg.png" /></label>'
													+ '						<input id="file-input" type="file" style="display: none">'
													+ '					</div>'
													+ '					<div>'
													+ '						<span class="word">단어</span> '
													+ '						<span class="mean">뜻</span>'
													+ '					</div>'
													+ '				</div>'
													+ '			</div>'
													+ '			<button class="btn btn-default" name="deleteBtn"><img src="${pageContext.request.contextPath}/assets/images/세트만들기/delete.png" /></button>'
												 	+ '			  </div>'

											var trHtml = $("tr[name=trCard]:last"); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출

											trHtml.after(addStaffText); //마지막 trStaff명 뒤에 붙인다.
										});
						//삭제 버튼
						$(document).on("click", "button[name=deleteBtn]", function() {
									var trHtml = $(this).parent().parent();
									trHtml.remove(); //tr 테그 삭제
								}); 
					</script>

				</div>
				<!-- main -->
				


			</div>

		</div>
		<!-- main-body -->



	</div>
	<!-- main-wrap -->











</body>
</html>