<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fc" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<link rel="stylesheet" href="${path}/resources/css/member/chat.css">

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
    
    			<div class="chatdiv2 chatClone" id="chatClone">
                        <div class="w1"><div class="logoimg"></div></div>
                        <div class="chatlist w2">
                        <span id="chatContent" class="cct contentIndex"></span>
                        <input type="hidden" class="roomData">
                        </div>
                        <div class="w3"><div id="dateData"></div>
                        <div class="alarm"><i class="fas fa-circle"></i></div>
                        </div>
                    </div>
                    
    	<div id="myChatList"> <!--전체 채팅리스트-->
                <div id="chatlistAll2">
                
                </div>
            </div>

            <!--채팅창을 열었을 때 맨처음 나오는 화면 -->
			<div id="div1">
                <div id="topcomment">
                    <div>
                        <p class="mb0" style="font-size:13px;font-weight: 600;" id="optime">운영 시간 아님</p>
                        <p class="mb0" style="font-size:12px;" id="optime2">일 뒤 상담이 운영됩니다.</p>
                    </div>
                    <div class="smicon">
                    <span id="sun"><i class="fas fa-sun fa-2x"></i></span>
                    <span id="moon"><i class="fas fa-moon fa-2x"></i></span>
                    </div>
                </div>
            <div id="div2">
                <div id="div3">
                    <div id="chatInfo">진행중인 채팅</div><div style="font-size: 12px;padding: 0.3rem 0.4rem 0rem;" id="newChat"><i class="fab fa-atlassian fa-rotate-90"></i>새 대화 시작</div>
                </div>
                <div id="chatlistAll"> <!-- 3개만 나오는 채팅창 목록 내용 -->
           
            </div>
            <div id="div_footer"></div>
            </div>
            <div id="bottomcomment"><div id="moreInfo"><a>더보기</a></div></div>
            </div>
			
			<div class="sender" id="chatLogo2" style="display:none">
                    <div class="mark"></div><div class="bName">Orkeny_furniture</div><div class="time">3:01&nbsp;PM</div>
                </div>
			
			<div id="basicBody">
			<div id="ajaxSend">
			</div>
            <div id="messageBody" class="mb new">
                <div class="day">오늘</div>
                <div class="marbb" id="managerChat">
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
            <div id="inputData">
            </div>
                <div class="reciver marbb rec" id="cloneDiv">
                    <div class="time rtime"></div>
                    <div class="mbody rbody">
                        <div class="rcontent">
                    	</div>
                    </div>
                </div>
                <div class="reciver marbb rec" id="cloneDiv2">
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
            <button type="button" class=" btn-email in sendBtn" id="sendBtn" value="new"><i class="fas fa-envelope" style="color:gray;"></i></button>
            </div>
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
	function sendMessage() {//기본 메세지 일반 아이디 메세지 전송
		var message=$("#message").val();
		let room=$("#sendBtn").val();
		
		var test={
				type:"text",
				user:id,
				ms:message,
				sendId:'m11',
				'room':room
		}
		sock.send(JSON.stringify(test));
		$("#message").val('');
	}
	
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		var ms=JSON.parse(data);
		let div;
		let div2;
		
		if(ms["newroom"]==null){
		if(id==ms["user"]){//내가 보낸 메세지
			div=$("#cloneDiv").clone();
			$(div).removeClass("rec");
			$(div).css("style","display:grid;");
			$(div).find(".rtime").html(fDate2(new Date().getTime()));
			$(div).find(".rcontent").html(ms["ms"]);
			
			$("#sendBtn").val(ms["room"]);
			div2=$("#cloneDiv2").clone();
			$(div2).removeClass("rec");
			$(div2).css("style","display:grid;");
			$(div2).find(".rtime").html(fDate2(new Date().getTime()));
			$(div2).find(".rcontent").html(ms["ms"]);
		}else if(id!="m11"&&"m11"==ms["user"]){//나한테 보낸 사람이 관리자
			$("#msAlarm").css("animation-name","a");
			$("#msAlarm").css("animation-name","msAlarm");
			div=$("#cloneDiv").clone();
			let logo=$("#chatLogo").clone();
			$(div).removeClass("rec");
			$(div).css("style","display:grid;");
			$(div).css("justify-content","flex-start");
			$(logo).find(".time").html(fDate2(new Date().getTime()));
			$(div).prepend(logo);
			$(div).find(".rtime").css('display','none');
			$(div).find(".rcontent").html(ms["ms"]);
			$("#sendBtn").val(ms["room"]);
			
			div2=$("#cloneDiv2").clone();
			let logo2=$("#chatLogo2").clone();
			$(logo2).css("display","flex");
			$(div2).removeClass("rec");
			$(div2).css("style","display:grid;");
			$(div2).css("justify-content","flex-start");
			$(div2).prepend(logo2);
			$(div2).find(".rtime").css('display','none');
			$(div2).find(".rcontent").html(ms["ms"]);
			
		}else if(id=="m11"&&"m11"!=ms["user"]){//나는 관리자  || 일반 유저가 보낸 것
			div=$("#cloneDiv").clone();
			$(div).removeClass("rec");
			$(div).css("style","display:grid;");
			$(div).css("justify-content","flex-start");
			//$(div).find(".rtime").css('display','none');
			$(div).find(".rtime").html(fDate2(data[i]["CHAT_DATE"]));
			$(div).find(".rcontent").html(ms["ms"]);
		}
		$(".mb").each((i,v)=>{//넘어온 room 값이 있는 채팅방에다가 값을 추가시킴.
			if($(v).hasClass(ms["room"])){
				$(v).find("#inputData").append(div);
				$(v).scrollTop($(v)[0].scrollHeight);
			}
			$(".new").find("#inputData").append(div2);
			$(".new").scrollTop($(".new")[0].scrollHeight);
		})
		}
		
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
	 $("#chaticon").on("click",function(){//아이콘 클릭시 활성화
	       $("#chatAll").css("visibility","visible");
	       $("#chaticon").css("visibility","hidden"); 
	    })
	    $("#xicon").click(e=>{//x클릭했을떄 사라짐
	        $("#chatAll").css("visibility","hidden");
	        $("#chaticon").css("visibility","visible");
	    })
	 
	 $("#moreInfo").click(e=>{//더보기 버튼
        $("#div1").css("display","none");
        $("#myChatList").css("display","block");
        $("#leftangle").css("display","block");
        chatData2(id);
    })
    $("#leftangle").click(e=>{//뒤로가기 버튼 대화창에서
    	$("#div1").css("display","block");
    	$(".mb").each((i,v)=>{
    		$(v).css("display","none");
    	});
    	$("#sendMessage").css("display","none");
    	$("#myChatList").css("display","none");
    	$("#leftangle").css("display","none");
    ajaxSend(id);
    chatData(id);
    })
	
    $("#newChat").click(e=>{//새로운 대화 시작 버튼
    	
    	let rNo2=[];
    	$("#sendBtn").val('new');
    	$("#div1").css("display","none");
    	$.ajax({
			 url:"${path}/member/chatAllData.do",
			 data:{'id':id},
			 success:data=>{
				 for(let i=0;i<data.length;i++){
				 let rNo=data[i][0]["CHAT_ROOM"];
				 rNo2[i]=rNo;
				 }
				 $(".mb").css("display","block");
				 $(".mb").each((i,v)=>{
					 for(let j=0;j<rNo2.length;j++){
					 if($(v).hasClass(rNo2[j])){
						$(v).css("display","none");
					 }
					 }
				 });
				 $(".new").find("#inputData").html('');
			 }
			 })
    	$("#sendMessage").css("display","flex");
    	$("#leftangle2").css("display","block");
    })
    
    $("#leftangle2").click(e=>{//채탕 내용 창에서 뒤로가기
    	ajaxSend(id);
    	chatData(id);
    	$(".mb").each((i,v)=>{
    		$(v).css("display","none");
    	});
    	$("#div1").css("display","block");
    	$("#leftangle2").css("display","none");
    	$("#sendMessage").css("display","none");
    })
    
    $(".w2").click(e=>{//채팅내용누르면 그 대화창으로
    	var room=$(e.target).find("input[type=hidden]").val();
    	ajaxChatData(room);
    	$("#sendBtn").val(room);
    });
	 function ajaxChatData(room){//채팅 룸 데이터를 받아와서 이 값으로 채팅창에 값을 뿌려줌.
		   	$.ajax({
	    		url:"${path}/member/chatRoom.do",
	    		type:"post",
	    		data:{"memberNo":id,"roomNo":room},
	    		success:data=>{
	    			
	    			$(".mb").each((i,v)=>{
   		    		 if($(v).hasClass(room)){
   		    			let c=$(v).find("#ajaxData");
   		    			$(c).html('');
   		    			$(v).find("#inputData").html('');
	    			for(let i=0;i<data.length;i++){
	    				if(id==data[i]["SENDER"]){
	    					div=$("#cloneDiv").clone();
	    					$(div).removeClass("rec");
	    					$(div).css("style","display:grid;");
	    					$(div).find(".rtime").html(fDate2(data[i]["CHAT_DATE"]));
	    					$(div).find(".rcontent").html(data[i]["CHAT_CONTENT"]);
	    				}else if(id!=data[i]["SENDER"]){
	    					div=$("#cloneDiv").clone();
	    					let logo=$("#chatLogo").clone();
	    					$(logo).find(".time").html(fDate2(data[i]["CHAT_DATE"]));
	    					$(div).removeClass("rec");
	    					$(div).css("style","display:grid;");
	    					$(div).find(".rtime").html(fDate2(data[i]["CHAT_DATE"]));
	    					$(div).css("justify-content","flex-start");
	    					$(div).prepend(logo);
	    					$(div).find(".rtime").css('display','none');
	    					$(div).find(".rcontent").html(data[i]["CHAT_CONTENT"]);
	    				}
	    				
	    		    		$(c).append(div);
	    		    		$(v).scrollTop($(v)[0].scrollHeight);
	    		    		$("#div1").css("display","none");
	    		    		$("#myChatList").css("display","none");
	    		    		$("#sendMessage").css("display","flex");
	    		    		$(v).css("display","block");
	    		    		$("#leftangle2").css("display","block");
		    			 
   					 }
   				
   					}
   				})
   			}
   		
   		});
	}
	 ajaxSend(id);
	 chatData(id);
	 function ajaxSend(id){//이 아이디에 채팅방이 몇개가있는지에 따라 채팅방갯수를 생성
		 let a=[];
		 $.ajax({
			 url:"${path}/member/chatAllData.do",
			 data:{'id':id},
			 success:data=>{
				 $("#ajaxSend").html('');
				 for(let i=0;i<data.length;i++){
				 let divAll=$("#messageBody").clone();
				 $(divAll).removeClass("new");
				 let rNo=data[i][0]["CHAT_ROOM"];
				 $(divAll).addClass(rNo);
				 $(divAll).css("display","none");
				 a[i]=divAll;
				 }
				for(let i=0;i<a.length;i++){
					$("#ajaxSend").prepend(a[i]);
					
				}console.log('갱신');
			 }
		 });
	 }
	 
	 function chatData(id){//채팅방목록 값 뿌려주기
		 let b=[];
		 $.ajax({
			 url:"${path}/member/chatAllData.do",
			 data:{'id':id},
			 success:data=>{
				 $("#chatlistAll").html('');
				 for(let i=0;i<data.length;i++){
				 let chatDiv=$(".chatClone").clone(true);
				 let size=data[i].length-1;
				 console.log(size);
				 $(chatDiv).removeClass("chatClone");
				 $(chatDiv).find("#chatContent").html(data[i][size]["CHAT_CONTENT"]);
				 $(chatDiv).find("#dateData").html(fDate(data[i][0]["CHAT_DATE"]));
				 $(chatDiv).find("[type='hidden']").val(data[i][0]["CHAT_ROOM"]);
				 b[i]=chatDiv;
				 }
				for(let i=0;i<b.length;i++){
					$("#chatlistAll").prepend(b[i]);
				}
			 }
		 });
	 };
	 
	 function chatData2(id){//전체 채팅창 목록 뿌려주기
		 let b=[];
		 $.ajax({
			 url:"${path}/member/chatAllData.do",
			 data:{'id':id},
			 success:data=>{
				 
				 $("#chatlistAll2").html('');
				 for(let i=0;i<data.length;i++){
				 let chatDiv=$(".chatClone").clone(true);
				 $(chatDiv).removeClass("chatClone");
				 let size=data[i].length-1;
				 $(chatDiv).find("#chatContent").html(data[i][size]["CHAT_CONTENT"]);
				 $(chatDiv).find("#dateData").html(fDate(data[i][0]["CHAT_DATE"]));
				 $(chatDiv).find("[type='hidden']").val(data[i][0]["CHAT_ROOM"]);
				 b[i]=chatDiv;
				 }
				for(let i=0;i<b.length;i++){
					$("#chatlistAll2").prepend(b[i]);
				}
			 }
		 });
	 };
	 
    $(function(){//운영시간 해랑 달
    	let time=new Date(2020,11,26,13);
    	//let time=new Date();
    	if(time.getHours()>=18||time.getHours()<9){
    		$("#moon").css("display","block");
    		$("#sun").css("display","none");
    		$("#optime").html('운영시간 아님');
    		$("#sendBtn").prop("disabled",true);
    		$("#message").css("cursor","no-drop");
    		if(time.getHours()>=18){
    		let hour=24-time.getHours()+9;
        	$("#optime2").html(hour+'시간 뒤 상담이 운영됩니다.');
    		}else{
    			let hour=9-time.getHours();
            	$("#optime2").html(hour+'시간 뒤 상담이 운영됩니다.');
    		}
    	}else{
    		$("#sun").css("display","block");
    		$("#moon").css("display","none");
    		$("#optime").html('운영시간 9:00 - 18:00');
    		$("#optime2").html('');
    		$("#sendBtn").prop("disabled",false);
    	}
    })
    
    function fDate(a){
    	let date=new Date(a);
    	let reDate;
    	reDate=(date.getMonth()+1)+"/"+date.getDate();
    	return reDate;	
    }
    function fDate2(b){
    	let date=new Date(b);
    	let h=date.getHours();
    	let m=date.getMinutes();
    	if(m<10){
			m="0"+m;	
		}
    	
    	if(h>12){
    		let dd=(h-12);
    		if(dd<10){
    			dd="0"+dd;
    		}
    		return dd+":"+m+"&nbspPM";
        }else{
        	if(h<10){
    			h="0"+h;
    		}
            return h+":"+m+"&nbspAM";
        }
    	
    }
    
    
</script>