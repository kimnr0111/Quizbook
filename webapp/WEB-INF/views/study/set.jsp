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
					<input class="textTitle" type="text" name="title" value="" id="setTitle"
						placeholder="제목을 입력해주세요">
					<button class="madeBtn" onClick="location.href='${pageContext.request.contextPath}/${sessionScope.authUser.id }'">만들기</button>
				</div>
				<div>
					<input class="textAccount" type="text" name="account" value="" id="setExplain"
						placeholder="설명을 추가하세요">
				</div>
				<div>
					<Button class="label">
						<img class="boxImg" src="${pageContext.request.contextPath}/assets/images/세트만들기/box.png" />
						<span class="p">다이어그램 추가 및 라벨붙이기</span>
					</Button>
				</div>

				<div class="content" id="wordCardContent">

					<table>
						<tbody>
							<tr name="trcard" data-trcardno="1">
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
													<button name="deleteBtn" data-trcard="1">
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
													<input class="textWord" type="text" value="" name="word"> 
													<input class="textMean" type="text" value="" name="mean"> 
														<label for="file-input"> 
															<img class="add" src="${pageContext.request.contextPath}/assets/images/세트만들기/addImg.png" />
														</label>
													<input class="file-input" type="file" style="display: none">
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
				</div>
				
					<div class="underLine">
						<button class="cardBtn" name="addCard">+ 카드추가</button>
					</div>


					<div>
						<span class="tag"><strong>태그</strong><input class="txtTag" id="textTag" type="text" name="tag" placeholder="영어, 쉼표로 구분합니다"></span>
					</div>
					

				
				<!-- main -->
				


			</div>

		</div>
		<!-- main-body -->



	</div>
	<!-- main-wrap -->

</body>

<script>
	
	//폴더번호 잘 받아와짐
	var wordCardNo = 1;
	var folderno = ${folderNo};
	console.log("세트만들어지는폴더번호: " + folderno);
					
	//추가 버튼
	$(document).on("click", "button[name=addCard]", function() {
		console.log("추가버튼클릭");
		wordCardNo = wordCardNo + 1;
		console.log("추가후 wordCardNo:" + wordCardNo);
		wordCardRender(wordCardNo);				
	});
	
	//삭제 버튼
	$(document).on("click", "button[name=deleteBtn]", function() {
		console.log("삭제버튼클릭");
		wordCardNo = wordCardNo - 1;
		console.log("삭제후 wordCardNo:" + wordCardNo);
		var $this = $(this);
		
		console.log($this.data("trcard"));
		var trCardNo = $this.data("trcard");
		var trCardNo2 = trCardNo + 1;
	
		$("tr[data-trcardno='" + trCardNo + "']").remove(); //tr 테그 삭제
		//$("tr[data-trcardno='" + trCardNo2 + "']").attr("data-trcardno", "1"); //됨
		console.log("다음카드번호" + $("tr[data-trcardno='" + trCardNo2 + "']").data("trcardno"));
		//$("tr[data-trcardno='" + trCardNo2 + "']").data("trcardno"); //다음카드번호
		
		while(true) {
			trCardNo = trCardNo + 1;
			console.log("반복문 카드번호:" + trCardNo);
			if($("tr[data-trcardno='" + trCardNo + "']").data("trcardno") == null) {
				console.log("탈출");
				break;
			} else {
				$("tr[data-trcardno='" + trCardNo + "']").attr("data-trcardno", trCardNo - 1);
				$("button[data-trcard='" + trCardNo + "']").attr("data-trcard", trCardNo - 1);
				$("span[data-cardindex='" + trCardNo + "']").html(trCardNo - 1);
				$("span[data-cardindex='" + trCardNo + "']").attr("data-cardindex", trCardNo - 1);
			}
			console.log("반복");
			
		}
		
		/* $("tr[data-trcardno]").each(function(){
			var $this = $(this);
			var trCardNoData = $this.data("trcardno");
			console.log("내번호:" + trCardNoData);
			console.log("지워진카드번호:" + trCardNo);
			if(trCardNoData > trCardNo) {
				console.log("ifttteeesssttt");
				$this.attr("data-trcardno", trCardNoData - 1);
				$("[data-trcard='"+trCardNoData+"']").attr("data-trcard", trCardNoData - 1);
				
				
			} 
		}); */
	
		});
	
	//세트 만들기 클릭
	$(document).on('click', '.madeBtn', function(){
		console.log("세트만들기클릭");
		
		var setTitle = $("#setTitle").val();
		var setExplain = $("#setExplain").val();
		var setTag = $("#textTag").val();
		var authUserId = ${sessionScope.authUser.id};
		var userNo = ${sessionScope.authUser.userNo};
		
		

		
		console.log(setTitle);
		console.log(setExplain);
		console.log(setTag);
		console.log(folderno);
		console.log("id:" + authUserId);
		console.log("카드번호:" + wordCardNo);
		
		var setVo = {
				setName: setTitle,
				setExplain: setExplain,
				userNo: userNo,
				id: authUserId,
				search_tag: setTag,
				folderNo: folderno
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath }/set/setCreate",		
			type : "post",
			contentType : "application/json",
			dataType: "json",
			data : JSON.stringify(setVo),
			success : function(no){
				
				console.log("성공:" + no);
				var createSetNo = no;
				
				/* 카드갯수만큼 반복해서 insert실행 */
				for(var i=1;i<=wordCardNo;i++) {
					console.log("createSetNo:" + createSetNo);
					console.log("워드카드번호반복테스트");
					var orderNo = i;
					var word = $("tr[data-trcardno='" + i + "']").find(".textWord").val();
					var meaning = $("tr[data-trcardno='" + i + "']").find(".textMean").val();
					var wordImg = 0;
					var setCreateMap = {
							createSetNo: createSetNo,
							orderNo: orderNo,
							authUserId: authUserId,
							word: word,
							meaning: meaning
					}
					console.log(setCreateMap);
					
					$.ajax({
						url : "${pageContext.request.contextPath }/set/cardCreate",		
						type : "post",
						contentType : "application/json",
						dataType: "json",
						data : JSON.stringify(setCreateMap),
						success : function(count){
							console.log("성공:" + count);
						},
						error : function(XHR, status, error) {
							console.error(status + " : " + error);
						}
					});
				}
				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		

		
		
		
		
		
		
	});
	
	function wordCardRender(wordCardNo) {
		var str = "";
		str += "<table>";
		str += "<tbody>";
		str += "	<tr name='trcard' data-trcardno=" + wordCardNo + ">";
		str += "		<td>";
		str += "			<div class='box'>";
		str += "				<div class='box-head'>";
		str += "					<div class='box-headout'>";
		str += "						<span class='number' data-cardindex='" + wordCardNo + "'>" + wordCardNo + "</span> <span class='drag'>";
		str += "							<button class='dragBtn'>";
		str += "								<span><img src='${pageContext.request.contextPath}/assets/images/세트만들기/drag.png'/></span>";
		str += "							</button>";
		str += "						</span> <span class='delete'>";
		str += "							<button name='deleteBtn' data-trcard=" + wordCardNo + ">";
		str += "								<span class='delete'><img src='${pageContext.request.contextPath}/assets/images/세트만들기/delete.png'/></span>";
		str += "							</button>";
		str += "						</span>";
		str += "					</div>";
		str += "				</div>";
		str += "				<div class='box-body'>";
		str += "					<div class='word'>";
		str += "						<div>";
		str += "							<input class='textWord' type='text' value='' name='word'>";
		str += "							<input class='textMean' type='text' value='' name='mean'>";
		str += "								<label for='file-input'>";
		str += "									<img class='add' src='${pageContext.request.contextPath}/assets/images/세트만들기/addImg.png'/>";
		str += "								</label>";
		str += "							<input class='file-input' type='file' style='display: none'>";
		str += "						</div>";
		str += "						<div>";
		str += "							<span class='word'>단어</span> <span class='mean'>뜻</span>";
		str += "						</div>";
		str += "					</div>";
		str += "				</div>";
		str += "			</div>";
		str += "		</td>";
		str += "	</tr>";
		str += "</tbody>";
		str += "</table>";
		str += "";
		
		$("#wordCardContent").append(str);
	}
		
</script>
</html>