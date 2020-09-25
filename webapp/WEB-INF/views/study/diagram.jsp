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

<link
	href="${pageContext.request.contextPath}/assets/css/headerfooter.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/sidebar.css"
	rel="stylesheet" type="text/css">


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
		
			<span id="time_out">0시0분0초</span>
			<div class="diagram">
			</div>
			
	</div>

</body>

<script type="text/javascript">
		
		var move;
		var transX;
		var transY;
		
	$('.diagram').on('mousedown','.gameCard',function(e){
		
		move = $(this);
		
		var posX2 = move.context.offsetLeft;
        var posY2 = move.context.offsetTop;
        
        var posX4 = e.offsetX;
        var posY4 = e.offsetY;
		
			$('.diagram').on("mousemove", function(event1){	
				
				var posX1 = event1.offsetX;
		        var posY1 = event1.offsetY;
		       
		        /* pos1~3 diagram 기준 card 좌표 pos4 card기준 클릭 좌표*/
		        
		        transX = posX1-posX2-posX4;
		        transY = posY1-posY2-posY4;
		        
				move.css('transform','translate(' + transX + 'px, ' + transY + 'px)');
				
				/* 이벤트 막기 */
				$('.gameCard').css('pointer-events','none');
			});
			
			
			
			
	});
	
	$('.diagram').on("mouseup",function(e){
		$(this).off("mousemove");
		$('.gameCard').css('pointer-events','');
		
		var x = move.context.offsetLeft+transX;
		var y = move.context.offsetTop+transY;
		var divWidth = move.context.clientWidth;
		var divHeight = move.context.clientHeight;
		
		var moveXnY = {left:x, top:y, width:divWidth, height:divHeight, no:move.text()};
		
		for (var j=0;j<ArrayXnY.length;j++) {
			
	        if (checkOverlap(moveXnY,ArrayXnY[j])) {
	        	console.log(moveXnY.no+"가"+ArrayXnY[j].no+"와 겹친다");
	        	console.log(move.data('order'));
	        	console.log(ArrayXnY[j].no);
	        	if(move.data('order')==ArrayXnY[j].no){
	        		$('[data-order='+move.data('order')+']').remove();
	        	}
	        }
		}
		
		if($('.gameCard').length==0){
			stop();
		}
		
	});
	
	$('.diagram').on("mouseleave",function(e){
		$(this).off("mousemove");
		$('.gameCard').css('pointer-events','');
	});
	
</script>

<script type="text/javascript">
function checkOverlap(a, b) {
	
	var padding = 5;
	
	var x1 = a.left
	var x2 = b.left;

	var y1 = a.top;
	var y2 = b.top;
	
	var w1 = a.width;
	var w2 = b.width;

	var h1 = a.height;
	var h2 = b.height;
	
	
	var minX = (w1/2)+(w2/2);
	var minY = (h1/2)+(h2/2);
	
	var X = Math.abs(x1-x2);
	var Y = Math.abs(y1-y2);
	
	if (X <= minX+padding && Y <= minY+padding) return true;
	return false;
}
	
</script>

<script type="text/javascript">
var sel;
function putCard(sel) {
	var flag = false;

	
	
	
	
	
	
	
	
	do{
		var element = document.createElement("div"); 

		switch(sel){
		
			case 1:
				$(element).addClass("gameCard");
				$(element).text(""+list[i].word);
				break;
				
			case 2:
				$(element).addClass("gameCard");
				$(element).text(""+list[i].meaning);
				break;
				
			case 3:
				$(element).addClass("gameCard");
				$(element).html('<div id="card_content"> <img src="${pageContext.request.contextPath}/quizbook/'+list[i].wordImg+'"class="imgWithText" /><div class="text">'+list[i].word+'</div></div>');
				break;
			
			case 4:
				$(element).addClass("gameCard");
				$(element).html('<img class="imgOnly" src="${pageContext.request.contextPath}/quizbook/'+list[i].wordImg+'"/>');
				break;
			
		}
		
		var x = Math.random() * gameWidth;
		var y = Math.random() * gameHeight;
		
		$(element).css('position', 'absolute').css('left', x).css('top', y);
		
		
		/* element.setAttribute("data", "myId"); */
		
		$(element).attr('data-order', list[i].orderNo);
		
		/* $(element).data('orderno', list[i].orderNo);
		$(element).attr('data-'+list[i].orderNo); */
		
		
		$(".diagram").append(element);
		
		
		
		var divWidth = $(element).width();
		var divHeight = $(element).height();
		
		var XnY = {left:x, top:y, width:divWidth, height:divHeight, no:list[i].orderNo};
		
		for (var j=0;j<ArrayXnY.length;j++) {
	        if (checkOverlap(XnY,ArrayXnY[j])) {
	        	element.remove();
	        	flag=true;
	        	break;
	        } 
	        
	        flag=false;
		}
		
		
		if(ArrayXnY.length==0||!flag){
			ArrayXnY.push(XnY);
		}
		
	}while(flag!=false)
		
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
		putCard(1);
		putCard(2);
	}
	
	
	//글과 그림이 있는경우
	else if(list[i].wordImg != null && list[i].word != null){
		putCard(2);
		putCard(3);
	}
	
	
	//그림이 있는경우
	else if(list[i].wordImg != null && list[i].word == null){
		putCard(2);
		putCart(4);
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