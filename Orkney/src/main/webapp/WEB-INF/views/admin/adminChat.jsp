<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<style>
    body,html{height:100%}
    .wid{width:100%;}
    .wid3{width:46%;}
    .userInfo{height:500px;margin-left: 1.6rem;margin-top:1rem;margin-bottom: 1rem; border:1px black solid;}
    .userWrap{display:flex;flex-wrap: wrap;width:100%;padding: 0rem 4rem 0rem;}
    .topContent{height:60px;padding: 1rem 1.5rem 0rem;text-align-last: justify; border-bottom:1px black solid;}
    .bottomContent{display:flex;}
    .roomList{width:30%;height:440px;}
    .chatRoom{width:100%;height:440px;position: relative;padding: 1rem 0rem 3rem;padding-left: .5rem;}
    .cr1{width:100%;height:440px;position: relative;padding: 1rem 0rem 3rem;padding-left: .5rem;}
    .roomNoWrap{height:362px;overflow-y: scroll;min-height:362px;}
    .msInput{position: absolute; bottom:0;left:0;}
    .sendMs{width:100%;padding: .5rem .5rem .5rem;}
    .sendBtn{position:absolute;bottom: 15%;right: 3%;}
    .chatContent{height:98%;overflow-y: scroll;}
    .roomNo{text-align: center;}

    .mbody{
            max-width: 280px;
            padding: 10px;
            border-radius: 12px;
            background-color: rgb(240, 240, 241);
            color: rgb(36, 36, 40);
            width: max-content;
            overflow-wrap: anywhere;
        }

    .time{font-size:11px;color:rgb(167,167,170);}
    .disno{display:none;}
    .marb{margin-bottom: 2%;}
    .flexEnd{justify-content: flex-end;}
    .disflex{display:flex;}
    .rtime{text-align: end;}
	.roomAlarm{display: flex;flex-direction: column;height: 76px;justify-content: center;border-top: 1px solid;border-right: 1px solid;}
   	.alarmImg{text-align:center; color:red;}
   	.top{min-height:534px;}
   	.roomData{border-top: 1px solid;}
</style>
    <div class="reciver marb disno" id="cloneDiv">
        <div class="time">qweqw</div>
        <div class="disflex"><!-- 플렉스를 주기위해 -->                                    
        <div class="mbody rbody">
            <div class="rcontent">
            </div>
        </div>
    </div>
    </div>

    <div class="sender marb disno" id="cloneDiv2">
        <div class="time rtime">qweqw</div>
        <div class="disflex flexEnd"><!-- 플렉스를 주기위해 -->                                    
        <div class="mbody rbody">
            <div class="rcontent">
            </div>
        </div>
    </div>
    </div>
     <div class="reciver marb disno" id="cloneDiv3">
        <div class="time">qweqw</div>
        <div class="disflex"><!-- 플렉스를 주기위해 -->                                    
        <div class="mbody rbody">
            <div class="rcontent">
            </div>
        </div>
    </div>
    </div>
     <div class="sender marb disno" id="cloneDiv4">
        <div class="time">qweqw</div>
        <div class="disflex flexEnd"><!-- 플렉스를 주기위해 -->                                    
        <div class="mbody rbody">
            <div class="rcontent">
            </div>
        </div>
    </div>
    </div>
    <div class="wid top"> <!-- 제일 상위 div -->
		
		<div class="wid3 userInfo baseDiv disno">
            <input type="hidden" class="userVal">
                <div class="topContent"> <!-- 유저 아이디 정보등 작성 예정 -->
                    <span class="userId">아이디</span>
                    <span class="userName">사용자</span>
                </div>
                <div class="bottomContent"> <!-- 채팅룸목록과 채팅방내용 -->
                    <div class="roomList"> <!-- 채팅룸목록 -->
                      <div class="roomNoWrap">
                        <div class="roomNo"> <!-- 룸번호를 출력 -->
                            <div class="rNo">룸번호</div>
                            <div class="roomData"></div>
                        </div>
                      </div>
                      <div class="roomAlarm"> <!-- 새로운 룸 알림을 위해 -->
                          <div class="alarmImg disno"><i class="fas fa-circle"></i></div>
                      </div>
                    </div>
                    <div class="wid ajaxRoom">
                    <div class="chatRoom disno cr1"> <!-- 채팅방 -->
                        <div class="chatContent"> <!-- 방을 누를때마다 바뀌는 데이터 -->
                           
                        </div>
                        <div class="msInput wid">
                            <div class="btnDiv">
                                <input class="sendMs" type="text">
                                <button class="sendBtn">보내기</button>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
		
		
        <div class="userWrap"><!-- 전체내용을 감싸는 div -->
            <!-- <div class="wid3 userInfo baseDiv">
            <input type="hidden" class="userVal">
                <div class="topContent"> 유저 아이디 정보등 작성 예정
                    <span class="userId">아이디</span>
                    <span class="userName">이름</span>
                </div>
                <div class="bottomContent"> 채팅룸목록과 채팅방내용
                    <div class="roomList"> 채팅룸목록
                      <div class="roomNoWrap">
                        <div class="roomNo"> 룸번호를 출력
                            <div class="rNo">룸번호</div>
                            <div class="roomData"></div>
                        </div>
                      </div>
                      <div class="roomAlarm"> 새로운 룸 알림을 위해
                          <div class="alarmImg disno"><i class="fas fa-circle"></i></div>
                      </div>
                    </div>
                    <div class="wid ajaxRoom">
                    <div class="chatRoom disno cr1"> 채팅방
                        <div class="chatContent"> 방을 누를때마다 바뀌는 데이터
                           
                        </div>
                        <div class="msInput wid">
                            <div class="btnDiv">
                                <input class="sendMs" type="text">
                                <button class="sendBtn">보내기</button>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div> -->
            
            
        </div>

    </div>

<script type="text/javascript">

let id="${login.MEMBER_NO}";

let sock = new SockJS("http://localhost:9090/orkney/echo");
sock.onmessage = onMessage;
sock.onclose = onClose;

$(document).on('click','.sendBtn',e=>{
	let user=$(e.target).parent().attr('id');
	let roomNumber=$(e.target).val();
	let message=$(e.target).prev().val();
	sendMessage(user,roomNumber,message);
	
})

// 메시지 전송
function sendMessage(user,roomNumber,message) {//기본 메세지 일반 아이디 메세지 전송
	var test={
			type:"text",
			user:id,
			ms:message,
			sendId:user,
			'room':roomNumber
	}
	sock.send(JSON.stringify(test));
	$(".sendMs").val('');
}

// 서버로부터 메시지를 받았을 때
function onMessage(msg) {
	var data = msg.data;
	var ms=JSON.parse(data);
	let div;
	let div2;
	console.log(ms);
	if(id==ms["user"]){//내가 보낸 메세지
		div=$("#cloneDiv4").clone();
		$(div).removeClass("disno");
		$(div).find(".rtime").html('3:30PM');
		$(div).find(".rcontent").html(ms["ms"]);
	}else if(id!=ms["user"]){//나는 관리자  || 일반 유저가 보낸 것
		div=$("#cloneDiv3").clone();
		$(div).removeClass("disno");
		//$(div).find(".rtime").css('display','none');
		$(div).find(".rtime").html('3:30PM');
		$(div).find(".rcontent").html(ms["ms"]);
	}
	let mNo;
	console.log(ms["user"]);
	console.log(ms["sendId"]);
	if(ms["user"]==id){
		mNo=ms["sendId"];
	}else{
		mNo=ms["user"];
	}
	console.log(mNo);
		$(".userInfo").each((i,v)=>{
			if($(v).find(".userVal").val()==mNo){
				let b=$(v).find(".cr1");
				if(ms["room"]=='new'){
					$(v).find(".alarmImg").removeClass("disno");
					console.log($(v).find(".alarmImg"));
					console.log(11111);
				}else{
					$(v).find(".alarmImg").addClass("disno");
					console.log(22222);
				}
				$(b).each((j,k)=>{
					if($(k).hasClass(ms["room"])){
						console.log($(k).find(".chatContent"));
						console.log(div);
						$(k).find(".chatContent").append(div);
						console.log(1231);
					}
				})
			}
	})
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




	/* 사용자목록뿌려주는 스크립트 ↓ */
	
	userChatList();
	
	function userChatList(){
		$.ajax({
			url:"${path}/admin/adminChatData.do",
			success:data => {
				console.log(data);
				/* console.log(data); data.length -> 유저 숫자
				console.log(data[0]); data[0].length -> 유저의 룸개수
				console.log(data[0][0]); data[0][0].length -> 룸에 대한 데이터 개수
				console.log(data[0][0][0]); data[0][0][0].length -> 실직적 데이터 */
				$(".userWrap").html('');
				let divAmount=[];
				let roomAmount=[];
				for(let i=0;i<data.length;i++){//사용자 숫자만큼
					
					let div=$(".baseDiv").clone(true);
					$(div).removeClass("baseDiv disno");
					$(div).find(".userId").html(data[i][0][0]["MEMBER_NO"]);
					$(div).find(".userVal").val(data[i][0][0]["MEMBER_NO"]);
					$(div).find(".roomNo").attr('id',data[i][0][0]["MEMBER_NO"]);
					divAmount[i]=div;
					for(let j=0;j<data[i].length;j++){
						let rNo=$("<div id="+data[i][j][0]["CHAT_ROOM"]+">");
						$(rNo).html(data[i][j][0]["CHAT_ROOM"]);
						$(rNo).addClass("roomData");
						$(div).find(".roomNo").append(rNo);
						let room=$(".chatRoom").clone(true);
						$(room).removeClass("chatRoom");
						$(room).find(".sendBtn").val(data[i][j][0]["CHAT_ROOM"]);
						$(room).find(".btnDiv").attr("id",data[i][j][0]["MEMBER_NO"]);
						$(room).addClass(data[i][j][0]["CHAT_ROOM"]);
						$(room).addClass(data[i][j][0]["MEMBER_NO"]);
						for(let k=0;k<data[i][j].length;k++){
							if(data[i][j][k]["SENDER"]=="m11"){
								let send=$("#cloneDiv2").clone();
								$(send).removeClass("disno");
								$(send).find(".rcontent").html(data[i][j][k]["CHAT_CONTENT"]);
								$(send).find(".time").html(dateFormat(data[i][j][k]["CHAT_DATE"]));
								$(room).find(".chatContent").append(send);
							}else if(data[i][j][k]["RECIVER"]=="m11"){
								let recive=$("#cloneDiv").clone();
								$(recive).removeClass("disno");
								$(recive).find(".rcontent").html(data[i][j][k]["CHAT_CONTENT"]);
								$(recive).find(".time").html(dateFormat(data[i][j][k]["CHAT_DATE"]));
								$(room).find(".chatContent").append(recive);
							}
							$(div).find(".ajaxRoom").append(room);
						}
					}
				}
				
				for(let i=0;i<divAmount.length;i++){
					$(".userWrap").append(divAmount[i]);
				}
			}
			
		})
	}
	$(document).on('click','.roomData',e=>{
		let val=$(e.target).parent().attr('id');
		let no=$(e.target).attr('id');
		$(".cr1").each((i,v)=>{
			if($(v).hasClass(val)){
				$(v).css("display","none");
			if($(v).hasClass(no)){
				$(v).css("display","block");
			}
			}
		})
	})
	$(document).on('click','.alarmImg',e=>{
		userChatList();
	})
	
	function dateFormat(data){
		let date=new Date(data);
        let m=date.getMonth()+1;
        let d=date.getDate();
        let y=date.getFullYear().toString().substr(2);
        let t=date.getHours();
        let mi=date.getMinutes();
        let c=y+"/"+m+"/"+d+" "+t+":"+mi;
        return c;
	}
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>