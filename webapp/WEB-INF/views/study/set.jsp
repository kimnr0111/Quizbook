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
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/study/set.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/headerfooter.css" rel="stylesheet" type="text/css">
	
<link href="${pageContext.request.contextPath}/assets/css/sidebar.css" rel="stylesheet" type="text/css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
	
<title>Set</title>

</head>
<body>
	<!-- header -->
	<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>
	<div class="main-wrap">
		<div class="main-body">
			<div id="main-bodyMarginLeft">
			<c:import url="/WEB-INF/views/includes/sidebar.jsp"></c:import>

			<div class="main">
				<h1 class="h1">
				<c:if test="${setFlag == 0 }">
					<strong>학습 세트 만들기</strong>
				</c:if>
				<c:if test="${setFlag == 1 }">
					<strong>학습 세트 수정</strong>
				</c:if>
					
				</h1>
				<div class="txtTitle">
					<input class="textTitle" type="text" name="title" value="" id="setTitle"
						placeholder="제목을 입력해주세요">
					<c:if test="${setFlag == 0 }">
						<button class="madeBtn" id="createBtn">만들기</button>
					</c:if>
					
					<c:if test="${setFlag == 1 }">
						<button class="madeBtn" id="modifyBtn">수정</button>
					</c:if>
					
					
				</div>
				<div>
					<input class="textAccount" type="text" name="account" value="" id="setExplain"
						placeholder="설명을 추가하세요">
				</div>
				<div>
					<Button class="label">
						<c:if test="${setFlag == 0 }">
							<img class="boxImg" src="${pageContext.request.contextPath}/assets/images/세트만들기/box.png" />
						</c:if>
						
						<c:if test="${setFlag == 1 }">
							<c:if test="${setVo.setImg != null }">
								<img class="boxImg" src="${pageContext.request.contextPath}/setImg/${setVo.setImg }" />
							</c:if>
							
							<c:if test="${setVo.setImg == null }">
								<img class="boxImg" src="${pageContext.request.contextPath}/assets/images/세트만들기/box.png" />
							</c:if>
						</c:if>
						<span class="p">세트이미지 추가</span>
						
					</Button>
					<input type="file" name="file" id="setFileUpload" accept="image/*" style="display: none">
				</div>

				<div class="content" id="wordCardContent">

					<table>
						<tbody>
							<tr name="trcard" data-trcardno="1" data-wordno="0">
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
														<input type="file" name="file" data-wordimgcheck="0" data-wordupload="1" id="cardFileUpload" accept="image/*" style="display: none">
															<img class="wordAdd" data-wordimg="1" src="${pageContext.request.contextPath}/assets/images/세트만들기/addImg.png" />
														</label>
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
					

				</div>
				<!-- main -->
				


			</div>

		</div>
		<!-- main-body -->



	</div>
	<!-- main-wrap -->
	
<!-- 카드 null체크 -->
<div class="modal fade" id="setNullCheckModal">
	<div class="modal-dialog">
		<div class="modal-content" id="setNullCheckModal-Content">
			<div class="modal-body" id="setNullCheckModal-Body">
				<p id="setNullCheckModal-CheckText">
					
					저장하시겠습니까?
				</p>
			</div>
			
			<button type="button" class="btn btn-default" data-dismiss="modal" id="setNullCheckModal-Cancel">아니오</button>
				
			<c:if test="${setFlag == 0 }">
				<button type="button" class="btn btn-primary" id="setCreateBtn-modal">예</button>
			</c:if>
				
			<c:if test="${setFlag == 1 }">
				<button type="button" class="btn btn-primary" id="setModifyBtn-modal">예</button>
			</c:if>
			<div class="setNullCheckModal-Footer">
				
				
			</div>
		</div>
		<!-- modal-content  -->
	</div>
	<!-- modal-dialog  -->
</div>
<!-- 카드 null체크 -->

</body>

<script>

	var wordCardNo = 1;
	var folderno = "${folderNo}";
	var setFlag = "${setFlag}";
	var setNo = "${setVo.setNo}";
	var nullcheck = "";
	var setImgcheck = 0;
	console.log("세트만들어지는폴더번호: " + folderno);
	console.log("setNo = " + setNo);
	
	
	$(document).ready(function(){
		if(setFlag == 0) {
			console.log("세트만들기");
		} else if(setFlag == 1) {
			/* 세트수정으로 들어왔을경우 */
			console.log("세트수정");
			$("#setTitle").val("${setVo.setName}");
			$("#setExplain").val("${setVo.setExplain}");
			$("#textTag").val("${setVo.tag}");
			$("#wordCardContent").html('');
			
			console.log(setNo);
			var setVo = {
					setNo: setNo
			}
			
			$.ajax({
				url : "${pageContext.request.contextPath }/set/setModifyList",		
				type : "post",
				contentType : "application/json",
				dataType: "json",
				data : JSON.stringify(setVo),
				success : function(wordList){
					console.log(wordList);
					for(var i=0;i<wordList.length;i++) {
						console.log("반복");
						wordCardModifyRender(wordList[i]);
					}
					wordCardNo = wordCardNo - 1;

					
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}
	});
				
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
				$("input[data-wordUpload='" + trCardNo + "']").attr("data-wordUpload", trCardNo - 1);
				$("img[data-wordimg='" + trCardNo + "']").attr("data-wordimg", trCardNo - 1);
			}
			console.log("반복");
			
		}
	
		});
	
	//선택한 세트이미지
	$("#setFileUpload").change(function(){
		setImgcheck = 1;
		setReadURL(this);
	});
	
	//선택한 카드이미지
	$(document).on('change', "#cardFileUpload", function(){
		console.log("변경");
		
		var $this = $(this);
		
		var cardImgNo = $this.data("wordupload");
		$this.attr('data-wordimgcheck', 1);
		console.log(cardImgNo);
		
		wordReadURL(this, cardImgNo);
	});
	
	//세트이미지 업로드 클릭
	$(document).on('click', '.label', function(){
		console.log("세트이미지 업로드 클릭");
		$("#setFileUpload").click();
	});
	
	//카드이미지 업로드 클릭
	$(document).on('click', '.wordAdd', function(){
		console.log("이미지 업로드 클릭");
		var $this = $(this);
		
		var no = $this.data("wordimg");
		console.log("this.data.wordImg:" + no);
		$("[data-wordupload=" + no + "]").click();
	});
	
	//세트 만들기 클릭
	$(document).on('click', '#createBtn', function(){
		console.log("세트만들기클릭");
		
		nullcheck = '';
		
		
		for(var i=1;i<=wordCardNo;i++) {
			
			
			var textWord = $.trim($("tr[data-trcardno='" + i + "']").find(".textWord").val());
			var textMean = $.trim($("tr[data-trcardno='" + i + "']").find(".textMean").val());
			console.log(textWord);
			console.log(textMean);
			
			
			console.log("null체크");
			console.log(i);
			if(textWord == '' || textMean == '') {
				console.log("null있음");
				nullcheck += i + " ";
				console.log("nullcheck:" + nullcheck);
			} else {
				console.log("null없음");
			}
		}
		
		if(nullcheck == '') {
			$("#setNullCheckModal-CheckText").text("저장하시겠습니까?");
			$("#setNullCheckModal").modal();
		} else {
			$("#setNullCheckModal-CheckText").html("단어나 뜻이 없는 카드가 존재합니다.<br><br>저장하시겠습니까?<br>");
			$("#setNullCheckModal").modal();
		}
		
	});
	
	//모달 세트만들기 클릭
	$(document).on("click", "#setCreateBtn-modal", function(){
		var setTitle = $("#setTitle").val();
		var setExplain = $("#setExplain").val();
		var setTag = $("#textTag").val();

		var authUserId = "${sessionScope.authUser.id}";
		var userNo = "${sessionScope.authUser.userNo}";
		var fileName = "";
		
		var setUploadData = new FormData();
		setUploadData.append("file", $("#setFileUpload").prop('files')[0]);
		
		$.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "${pageContext.request.contextPath }/set/setImgUpload",
            data: setUploadData,
            processData: false,
            contentType: false,
            cache: false,
            async: false,
            timeout: 600000,
            success: function (saveName) {
                console.log("SUCCESS : " + saveName);
                fileName = saveName;
            },
            error: function (e) {
                console.log("ERROR : ", e);
            }

        });
	
		console.log(setTitle);
		console.log(setExplain);
		console.log(setTag);
		console.log(folderno);
		console.log("id:" + authUserId);
		console.log("카드번호:" + wordCardNo);
		console.log(fileName);
		
		
		var setVo = {
				setName: setTitle,
				setExplain: setExplain,
				userNo: userNo,
				id: authUserId,
				tag: setTag,
				folderNo: folderno,
				setImg: fileName
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
					var cardUploadData = new FormData();
					
					cardUploadData.append("file", $("[data-wordupload=" + i + "]").prop('files')[0]);
					console.log("cardUploadData: " + cardUploadData);
					
					var orderNo = i;
					console.log("오더넘버:::" + orderNo);
					
					var word = $("tr[data-trcardno='" + i + "']").find(".textWord").val();
					var meaning = $("tr[data-trcardno='" + i + "']").find(".textMean").val();
					var wordImg = 0;
					
					
					$.ajax({
			            type: "POST",
			            enctype: 'multipart/form-data',
			            url: "${pageContext.request.contextPath }/set/cardImgUpload",
			            data: cardUploadData,
			            processData: false,
			            contentType: false,
			            cache: false,
			            async: false,
			            timeout: 600000,
			            success: function (saveName) {
			                console.log("SUCCESS : " + saveName);
			                fileName = saveName;
			              
			                var setCreateMap = {
									createSetNo: createSetNo,
									orderNo: orderNo,
									authUserId: authUserId,
									word: word,
									meaning: meaning,
									wordImg: fileName
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
			                
			            },
			            error: function (e) {
			                console.log("ERROR : ", e);
			                
			                var setCreateMap = {
									createSetNo: createSetNo,
									orderNo: orderNo,
									authUserId: authUserId,
									word: word,
									meaning: meaning,
									wordImg: ""
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

			        });
					
					
				}
				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
		$("#setNullCheckModal").modal("hide");
		location.href = '${pageContext.request.contextPath}/${sessionScope.authUser.id }';
		
	});
	
	
	//세트 수정 클릭
	$(document).on('click', '#modifyBtn', function(){
		console.log("세트수정클릭");
		
		nullcheck = '';
		
		for(var i=1;i<=wordCardNo;i++) {
			
			
			var textWord = $.trim($("tr[data-trcardno='" + i + "']").find(".textWord").val());
			var textMean = $.trim($("tr[data-trcardno='" + i + "']").find(".textMean").val());
			console.log(textWord);
			console.log(textMean);
			
			
			console.log("null체크");
			console.log(i);
			if(textWord == '' || textMean == '') {
				console.log("null있음");
				nullcheck += i + " ";
				console.log("nullcheck:" + nullcheck);
			} else {
				console.log("null없음");
			}
		}
		
		if(nullcheck == '') {
			$(".modal-title").text("수정하시겠습니까?");
			$("#setNullCheckModal").modal();
		} else {
			$(".modal-title").html("단어나 뜻이 없는 카드가 존재합니다.<br><br>수정하시겠습니까?<br>");
			$("#setNullCheckModal").modal();
		}
		
	});
	
	//모달 세트수정 클릭
	$(document).on("click", "#setModifyBtn-modal", function(){
		var authUserId = "${sessionScope.authUser.id}";
		var userNo = "${sessionScope.authUser.userNo}";
		var setFolderNo = "${setVo.folderNo}";
		var setTitle = $("#setTitle").val();
		var setExplain = $("#setExplain").val();
		var setTag = $("#textTag").val();
		var fileName = "${setVo.setImg}";
		
		var setUploadData = new FormData();
		setUploadData.append("file", $("#setFileUpload").prop('files')[0]);
		
		console.log("fileName:::" + fileName);
		
		if(setImgcheck != 0) {
			console.log("setModify notNull");
			
			$.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "${pageContext.request.contextPath }/set/setImgUpload",
	            data: setUploadData,
	            processData: false,
	            contentType: false,
	            cache: false,
	            async: false,
	            timeout: 600000,
	            success: function (saveName) {
	                console.log("SUCCESS : " + saveName);
	                fileName = saveName;
	            },
	            error: function (e) {
	                console.log("ERROR : ", e);
	            }

	        });
			
		} else {
			console.log("setModify null");
		}
		
		var setVo = {
				setNo: setNo,
				setName: setTitle,
				setExplain: setExplain,
				tag: setTag,
				setImg: fileName
		}
		
		var deleteSetNo = {
				setNo: setNo
		}
		
		console.log("setVo: " + setVo.toString());
		
		$.ajax({
			url : "${pageContext.request.contextPath }/set/setUpdate",		
			type : "post",
			contentType : "application/json",
			dataType: "json",
			data : JSON.stringify(setVo),
			success : function(no){
				console.log("세트수정성공");
				
				/*
				for(var i=1;i<=wordCardNo;i++) {
					
					console.log("UpdatesetNo:" + setNo);
					console.log("워드카드번호반복테스트");
					var orderNo = i;
					var word = $("tr[data-trcardno='" + i + "']").find(".textWord").val();
					var meaning = $("tr[data-trcardno='" + i + "']").find(".textMean").val();
					var wordNo = $("tr[data-trcardno='" + i + "']").attr("data-trwordno");
					var wordImg = $("[data-wordImg='" + i + "']").attr("src");
					// /까지 받아와짐
					//var wordImg2 = wordImg.substring(wordImg.lastIndexOf("/"));
					var wordImgSplit = wordImg.split("/");
					var wordImgModify = wordImgSplit[3];
					
					console.log("wordImg-" + i + ": " + wordImgModify);
					var wordVo = {
							wordNo: wordNo,
							setNo: setNo,
							orderNo: orderNo,
							word: word,
							meaning: meaning
					}
					console.log(wordVo);
				}
				*/
				
				console.log("카드초기화");
				$.ajax({
					url : "${pageContext.request.contextPath }/set/cardReset",		
					type : "post",
					contentType : "application/json",
					dataType: "json",
					data : JSON.stringify(deleteSetNo),
					success : function(no){
						console.log("카드초기화 성공============================");
						
						console.log(setFolderNo);
						console.log("id:" + authUserId);
						console.log("카드번호:" + wordCardNo);
						console.log("세트번호:" + setNo);
						
						
						for(var i=1;i<=wordCardNo;i++) {
							
							console.log("UpdatesetNo:" + setNo);
							console.log("워드카드번호반복테스트");
							var orderNo = i;
							var word = $("tr[data-trcardno='" + i + "']").find(".textWord").val();
							var meaning = $("tr[data-trcardno='" + i + "']").find(".textMean").val();
							var wordNo = $("tr[data-trcardno='" + i + "']").attr("data-trwordno");
							var wordImg = $("[data-wordImg='" + i + "']").attr("src");
							var wordImgModify = "";
							
							if($("[data-wordupload='" + i + "']").attr("data-wordimgcheck") == 0) {
								console.log("wordImg not change:::");
								var wordImgSplit = wordImg.split("/");
								wordImgModify = wordImgSplit[3];
								
								if(wordImgModify == 'images') {
									wordImgModify = "";
								}
							} else {
								console.log("wordImg change:::");
								
								var cardUploadData = new FormData();
								cardUploadData.append("file", $("[data-wordupload=" + i + "]").prop('files')[0]);
								console.log("cardUploadData: " + cardUploadData);
								
								$.ajax({
						            type: "POST",
						            enctype: 'multipart/form-data',
						            url: "${pageContext.request.contextPath }/set/cardImgUpload",
						            data: cardUploadData,
						            processData: false,
						            contentType: false,
						            cache: false,
						            async: false,
						            timeout: 600000,
						            success: function (saveName) {
						                console.log("SUCCESS : " + saveName);
						                wordImgModify = saveName;
						                
						            },
						            error: function (e) {
						                console.log("ERROR : ", e);
						                
						            }

						        });
								
								
							}
							
							
							var wordVo = {
									setNo: setNo,
									orderNo: orderNo,
									word: word,
									meaning: meaning,
									wordImg: wordImgModify
							}
							console.log(wordVo);
							
							
							$.ajax({
								url : "${pageContext.request.contextPath }/set/cardUpdate",		
								type : "post",
								contentType : "application/json",
								dataType: "json",
								data : JSON.stringify(wordVo),
								success : function(no){
									console.log("카드업데이트성공");
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
				
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
		$("#setNullCheckModal").modal("hide");
		location.href = '${pageContext.request.contextPath}/${sessionScope.authUser.id }';
	});
	

	function wordCardRender(wordCardNo) {
		var str = "";
		str += "<table>";
		str += "<tbody>";
		str += "	<tr name='trcard' data-trcardno=" + wordCardNo + " data-wordno='0'>";
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
		str += "								<input type='file' name='file' data-wordimgcheck='0' data-wordupload='" + wordCardNo + "'  id='cardFileUpload' accept='image/*' style='display: none'>"
		str += "									<img class='wordAdd' data-wordImg='" + wordCardNo + "' src='${pageContext.request.contextPath}/assets/images/세트만들기/addImg.png'/>";
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
	
	function wordCardModifyRender(wordList) {
		var str = "";
		str += "<table>";
		str += "<tbody>";
		str += "	<tr name='trcard' data-trcardno=" + wordList.orderNo + " data-trwordno=" + wordList.wordNo + ">";
		str += "		<td>";
		str += "			<div class='box'>";
		str += "				<div class='box-head'>";
		str += "					<div class='box-headout'>";
		str += "						<span class='number' data-cardindex='" + wordList.orderNo + "'>" + wordList.orderNo + "</span> <span class='drag'>";
		str += "							<button class='dragBtn'>";
		str += "								<span><img src='${pageContext.request.contextPath}/assets/images/세트만들기/drag.png'/></span>";
		str += "							</button>";
		str += "						</span> <span class='delete'>";
		str += "							<button name='deleteBtn' data-trcard=" + wordList.orderNo + ">";
		str += "								<span class='delete'><img src='${pageContext.request.contextPath}/assets/images/세트만들기/delete.png'/></span>";
		str += "							</button>";
		str += "						</span>";
		str += "					</div>";
		str += "				</div>";
		str += "				<div class='box-body'>";
		str += "					<div class='word'>";
		str += "						<div>";
		str += "							<input class='textWord' type='text' value='" + wordList.word + "' name='word'>";
		str += "							<input class='textMean' type='text' value='" + wordList.meaning + "' name='mean'>";
		str += "								<label for='file-input'>";
		str += "								<input type='file' name='file' data-wordimgcheck='0' data-wordupload='" + wordList.orderNo + "' id='cardFileUpload' accept='image/*' style='display: none'>"
		if(wordList.wordImg == null) {
			str += "									<img class='wordAdd' data-wordImg='" + wordList.orderNo + "' src='${pageContext.request.contextPath}/assets/images/세트만들기/addImg.png'/>";
		} else {
			str += "									<img class='wordAdd' data-wordImg='" + wordList.orderNo + "' src='${pageContext.request.contextPath}/wordImg/" + wordList.wordImg + "'/>";
		}
		
		
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
		wordCardNo = wordCardNo + 1;
	}
	
	function setReadURL(input) {
		
		 if (input.files && input.files[0]) {
		  var reader = new FileReader();
		  
		  reader.onload = function (e) {
		   $('.boxImg').attr('src', e.target.result);  
		  }
		  
		  reader.readAsDataURL(input.files[0]);
		  }
		}
	
	function wordReadURL(input, cardImgNo) {
		 if (input.files && input.files[0]) {
		  var reader = new FileReader();
		  
		  reader.onload = function (e) {
		   $("[data-wordimg='" + cardImgNo + "']").attr('src', e.target.result);  
		  }
		  
		  reader.readAsDataURL(input.files[0]);
		  }
		}
		
</script>
</html>