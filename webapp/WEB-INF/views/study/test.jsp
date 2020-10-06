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
	
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/headerfooter.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/sidebar.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/study/test.css" rel="stylesheet" type="text/css">

<title>test</title>
</head>
<body>
	<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>
	
	<div id="main-wrap">
		<div id="main-body">
		<c:import url="/WEB-INF/views/includes/sidebar.jsp"></c:import>
		
			<div id="studyTest-Area">
			
			
				<div id="studyTest-contentsArea">
					
				</div>
				<div id="studyTest-answerArea">
					<input type="text" value="" id="studyTest-answerBox"><br>
					<span id="studyTest-answerSpan">정답을 입력해 주세요</span>
				</div>
				
				<div id="studyTest-buttonArea">
					<button id="studyTest-button">정답</button>
				</div>
				
				
			</div>
			
			<!-- 학습진행도 -->
			<div id="studyTestResult">
				<div class="studyTestResult-title" id="prevPage">
					<i class='material-icons' style='font-size: 30px'>keyboard_arrow_left</i>
					<span class="studyTestResult-contents">세트</span>
					
				</div>
				
				<div class="studyTestResult-text" id="studyTest-correct">
					<span class="studyTest-correct-color">3</span>
					<br>
					정답
				</div>
				
				<div class="studyTestResult-text" id="studyTest-incorrect">
					<span class="studyTest-incorrect-color">1</span>
					<br>
					오답
				</div>
				
				<div class="studyTestResult-text" id="studyTest-left">
					<span class="studyTest-left-color"></span>
					<br>
					남은 문제
				</div>
			
			</div>
		
		</div>
	</div>
	
	
</body>

<script type="text/javascript">
	
	var testWordNum = 0;
	var testList = ${testList};
	var remainingWord = testList.length;
	var totalWord = testList.length;
	var correctWord = 0;
	var incorrectWord = 0;
	var studyNo = "${studyInfo.studyNo}";
	console.log("studyNo:" + studyNo);
	
	$(document).ready(function(){
		console.log("크기" + testList.length);
		testWordRender(testWordNum);

		$(".studyTest-left-color").text(remainingWord);
		$(".studyTest-correct-color").text(correctWord);
		$(".studyTest-incorrect-color").text(incorrectWord);

	});
	
	/* 정답버튼클릭 */
	$(document).on('click', '#studyTest-button', function(){
		console.log("정답버튼클릭");
		var wordNo = testList[testWordNum].wordNo;
		console.log(wordNo);
		
		var studyTestAnswer = $("#studyTest-answerBox").val();
		if(studyTestAnswer == testList[testWordNum].meaning) {
			correctWord = correctWord + 1;
			var correctFlag = 1;
			studyResult(wordNo, studyNo, correctFlag);
		} else {
			incorrectWord = incorrectWord + 1;
			var correctFlag = 0;
			studyResult(wordNo, studyNo, correctFlag);
		}
		
		testWordNum = testWordNum + 1;
		remainingWord = remainingWord - 1;
		
		if(testList.length == testWordNum) {
			console.log("끝");
			resultRender(totalWord, correctWord);
			
		} else {
			console.log("크기" + testList.length);
			console.log(testWordNum);
			
			testWordRender(testWordNum);
			
			
		}
		
		$(".studyTest-left-color").text(remainingWord);
		$(".studyTest-correct-color").text(correctWord);
		$(".studyTest-incorrect-color").text(incorrectWord);
		
		$("#studyTest-answerBox").val("");
		
		

	});
	
	/* 엔터키처리 */
	$("#studyTest-answerBox").keydown(function(key) {

		if (key.keyCode == 13) {
			console.log("엔터키입력");
			var wordNo = testList[testWordNum].wordNo;
			console.log(wordNo);
			
			var studyTestAnswer = $("#studyTest-answerBox").val();
			if(studyTestAnswer == testList[testWordNum].meaning) {
				correctWord = correctWord + 1;
				var correctFlag = 1;
				studyResult(wordNo, studyNo, correctFlag);
			} else {
				incorrectWord = incorrectWord + 1;
				var correctFlag = 0;
				studyResult(wordNo, studyNo, correctFlag);
			}
			
			testWordNum = testWordNum + 1;
			remainingWord = remainingWord - 1;
			
			if(testList.length == testWordNum) {
				console.log("끝");
				resultRender(totalWord, correctWord);
				
			} else {
				console.log("크기" + testList.length);
				console.log(testWordNum);
				
				testWordRender(testWordNum);
				
				
			}
			
			$(".studyTest-left-color").text(remainingWord);
			$(".studyTest-correct-color").text(correctWord);
			$(".studyTest-incorrect-color").text(incorrectWord);
			
			$("#studyTest-answerBox").val("");
		}

	});
	
	
	
	
	
	
	
	/* 테스트화면 카드그리기 */
	function testWordRender(i) {
		
		if(testList[i].word != null && testList[i].wordImg != null) {
			console.log("글 + 이미지");
					
			var str = "";
			str += "<div id='studyTest-textArea'>";
			str += "	<span id='studyTest-Text'>" + testList[i].word + "";
			str += "	</span>";
			str += "</div>";
			str += "<div id='studyTest-imgArea'>";
			str += "	<img src='${pageContext.request.contextPath}/wordImg/" + testList[i].wordImg + "' id='studyTest-Img' />";
			str += "</div>";
			str += "";
			
			$("#studyTest-contentsArea").html(str);
			
		} else if(testList[i].word != null && testList[i].wordImg == null) {
			console.log("글");
			
			var str = "";
			str += "<div id='studyTest-textAreaOnly'>";
			str += "	<span id='studyTest-Text'>" + testList[i].word + "";
			str += "	</span>";
			str += "</div>";
			str += "";
			
			$("#studyTest-contentsArea").html(str);
			
		} else if(testList[i].word == null && testList[i].wordImg != null){
			console.log("이미지");

			var str = "";
			str += "<div id='studyTest-imgAreaOnly'>";
			str += "	<img src='${pageContext.request.contextPath}/wordImg/" + testList[i].wordImg + "' id='studyTest-ImgOnly' />";
			str += "</div>";
			str += "";
			
			$("#studyTest-contentsArea").html(str);
			
		} else {
			console.log("없음");
			$("#studyTest-contentsArea").html("");
		}
	}
	
	
	function resultRender(totalWord, correctWord) {
		console.log("결과");
		var str = "";
		str += "<div id='studyTest-Result'>";
		str += "	<span id='studyTest-ResultCorrect'>" + correctWord + " </span>/";
		str += "	<span id='studyTest-ResultInCorrect'>" + totalWord + "</span><br>";
		str += "	<span>문제를 맞추셨습니다</span>";
		str += "	<div id='studyTest-ResultButtonArea'>";
		str += "		<div id='studyTest-Other' OnClick='location.href =&apos;${pageContext.request.contextPath}/${sessionScope.authUser.id }&apos;'>다른 세트 선택</div>";
		str += "		<div id='studyTest-Re' OnClick='location.href =&apos;${pageContext.request.contextPath}/study/test/${studyInfo.setNo}&apos;'>처음부터 다시하기</div>";
		str += "	</div>";
		str += "</div>";
		str += "";
		
		$("#studyTest-Area").html(str);
	}
	
	/* 학습결과저장 */
	function studyResult(wordNo, studyNo, correctFlag) {
		console.log("학습결과");
		console.log(wordNo);
		console.log(studyNo);
		console.log(correctFlag);
		
		var answerVo = {
				wordNo: wordNo,
				studyNo: studyNo,
				correctFlag: correctFlag
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath }/study/test/studyResult",		
			type : "post",
			contentType : "application/json",
			data : JSON.stringify(answerVo),
			dataType: "json",
			success : function(num){
				console.log("성공");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	}
	
	

	
</script>
</html>