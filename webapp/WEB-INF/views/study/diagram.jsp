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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
<link
	href="${pageContext.request.contextPath}/assets/css/headerfooter.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/sidebar.css"
	rel="stylesheet" type="text/css">
	
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">


<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
	rel="stylesheet" />


<link
	href="${pageContext.request.contextPath}/assets/css/study/main.css"
	rel="stylesheet" type="text/css">

<link
	href="${pageContext.request.contextPath}/assets/css/study/diagram.css"
	rel="stylesheet" type="text/css">
</head>


<body>
	<c:import url="/WEB-INF/views/includes/main-header.jsp"></c:import>
	<div id="body">

		<c:import url="/WEB-INF/views/includes/sidebar.jsp"></c:import>
		
			<div class="diagram">
			</div>
			
			<div id="studyTestResult">
				<div class="studyTestResult-title" id="prevPage">
					<i class='material-icons' style='font-size: 30px'>keyboard_arrow_left</i>
					<span class="studyTestResult-contents">세트</span>
					
				</div>
				
				<div class="studyTestResult-text">
					카드 맞추기
					<br><br>시간<br>
					<span id="time_out">0시0분0초</span>					
				</div>
			
			</div>
			
	</div>

</body>

<script type="text/javascript">
		
		var move;
		var transX=0;
		var transY=0;
			
	$('.diagram').on('mousedown','.gameCard',function(e){
		move = $(this);
		
		console.log(ArrayXnY.length);
		
		var divWidth = move.context.clientWidth;
		var divHeight = move.context.clientHeight;
		var x = move.context.offsetLeft;
		var y = move.context.offsetTop;
		
		var moveXnY = {left:x, top:y, width:divWidth, height:divHeight, no:move.data('order'), pk:move.data('pk')};

		ArrayXnY = jQuery.grep(ArrayXnY, function(value) {
			  return value.pk != moveXnY.pk;
		});
		
		
		
		
		var posX2 = move.context.offsetLeft;
        var posY2 = move.context.offsetTop;
        
        var posX4 = e.offsetX;
        var posY4 = e.offsetY;
        
		$('.gameCard').css('pointer-events','none');
		
		$('.diagram').on("mousemove", function(event1){	
			var posX1 = event1.offsetX;
	        var posY1 = event1.offsetY;
	       
	        /* pos1~3 diagram 기준 card 좌표 pos4 card기준 클릭 좌표*/
	        
	        transX = posX1-posX2-posX4;
	        transY = posY1-posY2-posY4;
	        
			move.css('transform','translate(' + transX + 'px, ' + transY + 'px)');
			
			/* 이벤트 막기 */
		});
			
			
			
			
	});
	
	$('.diagram').on("mouseup",function(e){
		$(this).off("mousemove");
		$('.gameCard').css('pointer-events','');
		
		var divWidth = move.context.clientWidth;
		var divHeight = move.context.clientHeight;
		var x = move.context.offsetLeft+transX;
		var y = move.context.offsetTop+transY;
		
		var moveXnY = {left:x, top:y, width:divWidth, height:divHeight, no:move.data('order'), pk:move.data('pk')};
		var result = false;
		var ping = false;
		
		for (var j=0;j<ArrayXnY.length;j++) {
	        if (checkOverlap(moveXnY,ArrayXnY[j])) {
	        	ping=true;
	        	console.log("중복");
	    		/* grep사용해서 ArrayXnY에서 moveXnY 제거했는데 어째서 중복체크를 두번해야 하는지 오류 원인 파악해야함 */
	    		
	    		if(moveXnY.pk==ArrayXnY[j].pk){
		    		console.log('같은것');
	    			continue;
	    		}
	    		
	        	if(move.data('order')==ArrayXnY[j].no){
		    		console.log('삭제');
	        		$('[data-order='+move.data('order')+']').remove();
	        		result=true;
	        		ping=false;
	        		break;
	        	}
	        		
	        }
		}
		
		console.log(result);
		console.log(ping);
		
		if(result==false&&ping==false){
			console.log("push");
    		ArrayXnY.push(moveXnY);
		}
		
		else if(result==false&&ping==true){
			console.log("팅");
			
			var posX2 = move.context.offsetLeft;
	        var posY2 = move.context.offsetTop;
	        
			var x;
			var y;

			var divWidth = move.context.clientWidth;
			var divHeight = move.context.clientHeight;
			
			
			while(true){
				
		        x = Math.random() * gameWidth-posX2;
		        y = Math.random() * gameHeight-posY2;
		        
		        var moveXnY = {left:move.context.offsetLeft+x, top:move.context.offsetTop+y, width:divWidth, height:divHeight, no:move.data('order'), pk:move.data('pk')};
				
		        var ovlFlag=0;
				
		        for(var j=0;j<ArrayXnY.length;j++){
		        	
		        	if(moveXnY.pk==ArrayXnY[j].pk){
						continue;
					}
		        	
		        	if (checkOverlap(moveXnY,ArrayXnY[j])) {
		        		ovlFlag++;
						console.log('중복');
			        }
		        	
		        }
		        console.log(ovlFlag);
		        if(ovlFlag==0){
		        	break;
		        }
			
			}
			
			move.css('transform','translate(' + x + 'px, ' + y + 'px)');
			
    		ArrayXnY.push(moveXnY);
		}
		

		
		
		if($('.gameCard').length==0){
			stop();
		}
		
		move='';
		
	});
	
	$('.diagram').on("mouseleave",function(e){
		$(this).off("mousemove");
		$('.gameCard').css('pointer-events','');
	});
	
</script>

<script type="text/javascript">
function checkOverlap(a, b) {
	
	var result;
	var padding = 0;
	
	var aLeft = a.left;
	var bLeft = b.left;
	
	var aRight = aLeft+a.width;
	var bRight = bLeft+b.width;
	
	var aUp = a.top;
	var bUp = b.top;
	
	var aDown = aUp+a.height;
	var bDown = bUp+b.height;
	
	var cond1 = aLeft > bRight+padding;
	var cond2 = aRight+padding < bLeft;
	var cond3 = aUp > bDown+padding;
	var cond4 = aDown+padding < bUp;
	
	if (cond1||cond2||cond3||cond4){
		result =  false;		
	} else {
		result = true;
	}
	return result;
}
	
</script>

<script type="text/javascript">
var pk=0;
var dataPk=0;
function putCard(sel, cardVo) {
	var flag = false;

	do{
		var element = document.createElement("div"); 

		switch(sel){
		
			case 1:
				$(element).addClass("gameCard");
				$(element).text(""+cardVo.word);
				break;
				
			case 2:
				$(element).addClass("gameCard");
				$(element).text(""+cardVo.meaning);
				break;
				
			case 3:
				$(element).addClass("gameCard");
				$(element).html('<div><img id=img-'+pk+' src="${pageContext.request.contextPath}/wordImg/'+cardVo.wordImg+'"/></div>'+cardVo.word);
				break;
			
			case 4:
				$(element).addClass("gameCard");
				$(element).html('<div><img id=img-'+pk+' src="${pageContext.request.contextPath}/wordImg/'+cardVo.wordImg+'"/></div>');
				break;
			
		}
		
		var x = Math.random() * gameWidth;
		var y = Math.random() * gameHeight;
		
		$(element).css('position', 'absolute').css('left', x).css('top', y);
		
		
		$(element).attr('data-order', cardVo.orderNo);
		
		$(".diagram").append(element);
		
		if(sel==3||sel==4){
			
			$("#img-"+pk).load(function() {
				
				$(element).attr('data-pk', dataPk);
				
				var divWidth = $(element).width();
				var divHeight = $(element).height();
	
				var XnY = {left:x, top:y, width:divWidth, height:divHeight, no:cardVo.orderNo, pk:dataPk};
				dataPk=dataPk+1;

				
				for (var j=0;j<ArrayXnY.length;j++) {
					if(XnY.pk==ArrayXnY[j].pk){
						continue;
					}
					if (checkOverlap(XnY,ArrayXnY[j])) {
						console.log('삭제');
			        	element.remove();
			        	
			        	
			        	putCard(sel, cardVo);
			        	
			        	flag=true;
			        	break;
			        } 
			        
			        flag=false;
				}
				
				
				if(ArrayXnY.length==0||!flag){
					ArrayXnY.push(XnY);
					pk=pk+1;
				}
				

		    });
			
		}
		
		else {
			$(element).attr('data-pk', dataPk);

			var divWidth = $(element).width();
			var divHeight = $(element).height();

			var XnY = {left:x, top:y, width:divWidth, height:divHeight, no:cardVo.orderNo, pk:dataPk};
			dataPk=dataPk+1;

			
			for (var j=0;j<ArrayXnY.length;j++) {
	
				if (checkOverlap(XnY,ArrayXnY[j])) {
					console.log('삭제');
		        	element.remove();
		        	flag=true;
		        	break;
		        } 
		        
		        flag=false;
			}
			
			
			if(ArrayXnY.length==0||!flag){
				ArrayXnY.push(XnY);
				pk=pk+1;
			}
			

		}
	}while(flag!=false);
}
	
</script>

<script type="text/javascript">
var gameWidth = $(".diagram").width();
var gameHeight = $(".diagram").height();

var ArrayXnY = [];
var i;
var list = ${json};

		
	for(i=0; i<list.length; i++){
		
		if(list[i].wordImg == null){
			var cardVo=list[i];
			putCard(1, cardVo);
			putCard(2, cardVo);
		}
		
		
		//글과 그림이 있는경우
		else if(list[i].wordImg != null && list[i].word != null){
			var cardVo=list[i];
			putCard(2, cardVo);
			putCard(3, cardVo);
		}
		
		
		//그림이 있는경우
		else if(list[i].wordImg != null && list[i].word == null){
			var cardVo=list[i];
			putCard(2, cardVo);
			putCard(4, cardVo);
		}
		
	}
	
	
</script>

<script type="text/javascript">
	var timer,
	seconds = 0;
	
	$(".diagram").ready(function(){
		
		timer = self.setInterval('increment()', 1000);
		
	});
	
	function increment(){
		seconds++;
		var hour = parseInt(seconds/3600);
		var min = parseInt((seconds%3600)/60);
		var sec = seconds%60;
		
		document.getElementById('time_out').innerHTML = hour+"시"+min+"분" + sec+"초";
	}
	
	function stop(){
		 clearInterval(timer);
		 timer = null;
	}
</script>


</html>