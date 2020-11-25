<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fc" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<style>
  .in{
        background: none;
        position: absolute;
        padding: .3rem 1rem .3rem;
        left: 84%;
        border:none;
        outline:none !important;
        top: 8%;
    }
   .pad{
        padding:0 !important;
   }
   .rad1{
       border-top-left-radius: 15px !important;
       border-top-right-radius: 15px !important;
   }
   #messageBody{
       padding:.1rem .9rem .0rem;
       overflow-y: scroll;
       min-height: 410px;
       max-height: 410px;
       display:none;
   }
   .h5{
    padding: 0px 0px 0px !important;
    justify-content: space-between;
    display:flex;
    background-color:#778899 !important;
   }
   #title1{
    text-align: left;
    margin-left: 7%;
    padding: 7px 0px 0px;
   }
   .bpad{
    border-bottom-left-radius: 15px;
    border-bottom-right-radius: 15px;
   }
   #xicon{cursor: pointer;}
   #xicon:hover{color:moccasin;}
	.st0{fill:#778899;}
	.st1{fill:#FFFFFF;}
    #chaticon{
    width: 75px;
    position: fixed;
    left: 87%;
    bottom: 2%;
    cursor: pointer;
    z-index: 10000000;
    }
    #chatdiv{position: relative;}
    
    #chatAll{
        position: fixed;
        min-width: 280px;
        max-width: 360px;
        min-height:515px;
        max-height:515px;
        width: 30%;
        border-radius: 20px !important;
        left: 62%;
        bottom: 4%;
        z-index: 10000000;
        
        visibility:hidden;
    }
    .mark{
        width: 24px;
    height: 24px;
    border-radius: 50%;
    background-image: url(https://cf.channel.io/avatar/text/ORKENY.778899.png);
    background-size: cover;
    background-position: center center;
    background-color: rgb(255, 255, 255);
    box-shadow: none;
    }
    .day{
        text-align: center;
        font-size: 11px;
        font-weight: 600;
        color: rgb(167,167,170);
        margin-top: 6%;
             margin-bottom: 4%;
    }
    .sender{display:flex;align-items: center;}
        
        .bName{
            font-size: 13px;
            font-weight: 800;
            margin-left: 2%;
            margin-right: 2%;
        }
        .time{font-size:11px;color:rgb(167,167,170);}
        
        .mbody{
            max-width: 280px;
            padding: 10px;
            border-radius: 12px;
            background-color: rgb(240, 240, 241);
            color: rgb(36, 36, 40);
            width: max-content;
        }
        .reciver{
            display: grid !important;
   		 	justify-content: flex-end;
  			margin: 0;
        }
        .rtime{text-align: end;}
        .rbody{/* margin-left: 12%; */}
        .marb{margin-bottom: 6%;}
        .rec{display:none !important;}
         #div1{background: linear-gradient(-173deg, #778899, transparent);max-height: 410px;min-height: 410px;display: flex;flex-direction: column; justify-content: center;}
        #div2{min-height:300px;border-radius: 10px;position: relative; background-color: white;margin-left: 1%;margin-right: 1%;}
        #div_footer{height:27px;width:100%;position: absolute;bottom: 0;}
        #div3{display: flex;justify-content: space-between;padding: 0rem 0.3rem 0rem;}
        #topcomment{height: 57px; display: flex;justify-content: space-between;padding: 0.5rem 1.5rem 0rem;}
        #bottomcomment{height: 50px;align-self: center;width: 45%;text-align: -webkit-center;}
        #moreInfo{border-radius: 10px;background-color: rgb(167, 167, 170);border: none;color: rgb(240, 240, 241);}
        .mb0{margin-bottom: 0; color:white;}
        #moon{color:white;}
        #chatInfo{color: rgb(167, 167, 170);font-size: 13px;font-weight: 600;margin: 0px;padding: 0px;}
        .chatlist{height:82px;overflow: hidden;padding: 0.5rem 1rem 0rem;text-align: left;}
        #chatlistAll{overflow: hidden;max-height: 248px;}
        .chatdiv2{display: flex; cursor:pointer;}
        .w1{width:24%;position: relative;}
        .w2{width:57%}
        .w3{width:21%;padding: 1rem 0rem 0rem;}
        .logoimg{
        position: absolute;
        left: 21%;
        top: 21%;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-image: url(https://cf.channel.io/avatar/text/ORKNEY.778899.png);
        background-size: cover;
        background-position: center center;
        background-color: rgb(255, 255, 255);
        box-shadow: none;
        }
        .chatdiv :hover{background-color:rgb(240, 240, 241);}
       /*  #sendMessage{display:none;} */
        #chat_content{max-height: 410px;}
        #myChatList{display:none;min-height:438px;}
        #titlewrap{position: relative;}
        #leftangle{position: absolute;left: 2%;cursor: pointer;display: none;}
        #leftangle2{position: absolute;left: 2%;cursor: pointer;display: none;}
        .borderbn{border-bottom: none;}
        #chatlistAll2{overflow-y: scroll;max-height: 450px;min-height:438px;}
        #newChat{cursor:pointer;}
        #sendMs{display:flex;position: relative;}
        #sendMessage{display:none;}
        #sendMs{width: 100%;}
        
</style>
<div id="chatdiv" style="text-align:-webkit-center;">
	<div id="chatAll" class="card pad rad1" style="width:30%;border-radius: 20px !important;">
    <div>
    <h5 class="card-header info-color white-text text-center py-4 h5 rad1">
        <div id="title1">
        <span id="leftangle"><i class="fas fa-angle-left"></i></span>
        <span id="leftangle2"><i class="fas fa-angle-left"></i></span>
        <span style="font-weight:900;">ORKENY</span>
        <p style="font-size:9px;">이제 대화가 시작됩니다.</p>
        </div>
        <span style="margin-right: 7%;padding: 10px 0px 0px;">
            <svg id="xicon" style="width:18px;height:26px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" class="svg-inline--fa fa-times fa-w-11" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512"><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg>
        </span>
        </h5>
</div>
    <!--Card content-->
    <div class="card-body px-lg-5 pad" id="chat_content">
    
    	<div id="myChatList"> <!--전체 채팅리스트-->
                <div id="chatlistAll2">
                <c:forEach items="${login.chatData}" var="c" varStatus="i">
                    <div class="chatdiv2">
                        <div class="w1"><div class="logoimg"></div></div>
                        <div class="chatlist w2">
                        ${c[0].CHAT_CONTENT}
                        <input type="hidden" value="${c[0].CHAT_ROOM }" class="roomData">
                        </div>
                        <div class="w3"><fmt:formatDate value="${c[0].CHAT_DATE }" pattern="MM/dd"/></div>
                        <input type="hidden" value="${c[0].CHAT_ROOM }" class="roomData">
                    </div>
                </c:forEach>
                </div>
            </div>

            <!--채팅창을 열었을 때 맨처음 나오는 화면 -->
			<div id="div1">
                <div id="topcomment">
                    <div>
                        <p class="mb0" style="font-size:13px;font-weight: 600;">운영 시간 아님</p>
                        <p class="mb0"style="font-size:12px;">일 뒤 상담이 운영됩니다.</p>
                    </div>
                    <div>
                        <i class="fas fa-moon fa-2x" id="moon"></i>
                    </div>
                </div>
            <div id="div2">
                <div id="div3">
                    <div id="chatInfo">진행중인 채팅</div><div style="font-size: 12px;padding: 0.3rem 0.4rem 0rem;" id="newChat"><i class="fab fa-atlassian fa-rotate-90"></i>새 대화 시작</div>
                </div>
                <div id="chatlistAll">
                <c:forEach items="${login.chatData}" var="c" varStatus="i">
                <div class="chatdiv2">
                    <div class="w1"><div class="logoimg"></div></div>
                    <div class="chatlist w2">
                    ${c[0].CHAT_CONTENT }
                    <input type="hidden" value="${c[0].CHAT_ROOM }" class="roomData">
                    </div>
                    <div class="w3"><fmt:formatDate value="${c[0].CHAT_DATE }" pattern="MM/dd"/></div>
                </div>
                </c:forEach>
            </div>
            <div id="div_footer"></div>
            </div>
            <div id="bottomcomment"><div id="moreInfo"><a>더보기</a></div></div>
            </div>
			
			
            <div id="messageBody">
                <div class="day">오늘</div>
                <div class="marb" id="managerChat">
                <div class="sender" id="chatLogo">
                    <div class="mark"></div><div class="bName">Orkeny_furniture</div><div class="time">3:01&nbsp;PM</div>
                </div>
                <div class="mbody" id="managerMs">
                    <div>
                   방문주셔서 감사드립니다! 😁<br>
🙆‍♀️채팅 운영시간🙆‍♀️<br>
[Mon - Fri] 09:00 - 18:00<br>
[Sat] 09:00 - 13:00<br>
[Lunch] 13:00-14:00<br>
[공휴일] 휴무<br>
🙆‍♀️고객만족센터🙆‍♀️<br>
[Mon - Fri] 09:00 - 18:00<br>
[공휴일] 휴무<br>
[Lunch] 13:00-14:00<br>
<br>
현재 고객 문의 폭주로 응대까지 다소 시간이 소요 될 수 있습니다.<br>
잠시만 기다려 주시면, 최대한 빨리 안내 드리도록 하겠습니다.<br>

운영시간에 문의 시, 빠르게 안내드리겠습니다.<br>
첫 응대까지 평균 3분 정도 걸리며, 상황에 따라 조금
늦어질 수도 있는 점 넓은 양해 부탁드립니다!
                </div>
                </div>
            </div>
            <div id="ajaxData">
            	
            </div>
                <div class="reciver marb rec" id="cloneDiv">
                    <div class="time rtime"></div>
                    <div class="mbody rbody">
                        <div class="rcontent">
                    </div>
                    </div>
                </div>
            </div>


            <!-- Sign in button -->
        <div id="sendMessage" class="pad">
            <div class="pad bpad" id="sendMs">
            <input type="text" id="message" class="form-control pad bpad"
            style="height:45px;padding:0rem 2rem 0rem !important;" placeholder="메세지를 입력해주세요.">
            <button type="button" class=" btn-email in" id="sendBtn"><i class="fas fa-envelope" style="color:gray;"></i></button>
            </div>
        </div>
        
        

    </div>
</div>
        <div>
        <svg id="chaticon" version="1.1" viewBox="0 0 128 128" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
        <circle class="st0" cx="64" cy="64" r="64"/><path class="st1" d="M100,37H28c-2.2,0-4,1.8-4,4v42c0,2.2,1.8,4,4,4h20v15c0,0.8,0.9,1.3,1.6,0.8L71.9,87H100c2.2,0,4-1.8,4-4V41  C104,38.8,102.2,37,100,37z M48,67c-2.8,0-5-2.2-5-5s2.2-5,5-5s5,2.2,5,5C53,64.8,50.8,67,48,67z M64,67c-2.8,0-5-2.2-5-5s2.2-5,5-5  c2.8,0,5,2.2,5,5C69,64.8,66.8,67,64,67z M80,67c-2.8,0-5-2.2-5-5s2.2-5,5-5s5,2.2,5,5C85,64.8,82.8,67,80,67z"/></svg>
    </div>
</div>
<script type="text/javascript">
	
	 var id='${login.MEMBER_NO}';
	if(id!='admin'){
		$("#userList").css("display","none");
	}
	
	
	$("#sendBtn").click(function() {
		if(id!='m11'){
		sendMessage();
		$('#message').val('');
		}else if(id == 'm11'){
			sendMessage2();
			$('#message').val('');
		}
	});

	let sock = new SockJS("http://localhost:9090/orkney/echo");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		var message=$("#message").val();
		var test={
				type:"text",
				user:id,
				ms:message
		}
		sock.send(JSON.stringify(test));
		$("#message").val('');
	}
	
	function sendMessage2() {
		var message=$("#message").val();
		var sendId=$("#sendId").val();
		var test={
				type:"text",
				user:id,
				ms:message,
				/* sendId:sendId */
				sendId:"user1"
		}
		sock.send(JSON.stringify(test));
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		var ms=JSON.parse(data);
		var div;
		if(id==ms["user"]){
			div=$("#cloneDiv").clone();
			$(div).removeClass("rec");
			$(div).css("style","display:grid;");
			$(div).find(".rtime").html('3:30PM');
			$(div).find(".rcontent").html(ms["ms"]);
		}else if(id!="admin"&&"admin"==ms["user"]){
			div=$("#cloneDiv").clone();
			let logo=$("#chatLogo").clone();
			$(div).removeClass("rec");
			$(div).css("style","display:grid;");
			$(div).css("justify-content","flex-start");
			$(div).prepend(logo);
			$(div).find(".rtime").css('display','none');
			$(div).find(".rcontent").html(ms["ms"]);
		}else if(id=="admin"&&"admin"!=ms["user"]){
			div=$("#cloneDiv").clone();
			$(div).removeClass("rec");
			$(div).css("style","display:grid;");
			$(div).css("justify-content","flex-start");
			//$(div).find(".rtime").css('display','none');
			$(div).find(".rtime").html('3:30PM');
			$(div).find(".rcontent").html(ms["ms"]);
		}
		$("#messageBody").append(div);
		$("#messageBody").scrollTop($("#messageBody")[0].scrollHeight);
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("연결 끊김");
	}
	// 서버와 연결됐을 때
	sock.onopen=function onOpen(){
		register();
	}
	function register(){
		var test={
				type:"register",
				user:id
		};
		sock.send(JSON.stringify(test));
	}
	 $("#chaticon").on("click",function(){
	       $("#chatAll").css("visibility","visible");
	       $("#chaticon").css("visibility","hidden"); 
	    })
	    $("#xicon").click(e=>{
	        $("#chatAll").css("visibility","hidden");
	        $("#chaticon").css("visibility","visible");
	    })
	 
	 $("#moreInfo").click(e=>{
        $("#div1").css("display","none");
        $("#myChatList").css("display","block");
        $("#leftangle").css("display","block");
    })
    $("#leftangle").click(e=>{
    	$("#div1").css("display","block");
    	$("#myChatList").css("display","none");
    	$("#leftangle").css("display","none");
    })
	
    $("#newChat").click(e=>{
    	$("#div1").css("display","none");
    	$("#messageBody").css("display","block");
    	$("#sendMessage").css("display","flex");
    	$("#leftangle2").css("display","block");
    })
    
    $("#leftangle2").click(e=>{
    	$("#messageBody").css("display","none");
    	$("#div1").css("display","block");
    	$("#leftangle2").css("display","none");
    	$("#sendMessage").css("display","none");
    })
    
    $(".chatdiv2").click(e=>{
    	var room=$(e.target).find("input[type=hidden]").val();
    	$.ajax({
    		url:"${path}/member/chatRoom.do",
    		type:"post",
    		data:{"memberNo":id,"roomNo":room},
    		success:data=>{
    			console.log(data);
    			for(let i=0;i<data.length;i++){
    			
    			}
    		}
    		
    	});
    });
    
</script>