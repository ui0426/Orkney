<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="">
<style>
	/* 특정 태그 클릭 시 생기는 테두리 없애기 */
    input:focus { outline:none; }
    button:focus { outline:none; }
	.mypage-container{
	    max-width: 70rem;
	    display: flex;
	    flex-direction: column;
	    padding: 2rem;
	    margin: auto;
    	
	}
	.mypage-container h1{
 	   	font-weight: 900;
    	font-size: 1.25rem;
	
	}
	.mypage-container > div:first-child{
		align-self: start;
		height: 220px;
		margin: 1rem;
	}
	.mypage-row{
		display: flex;
		flex-direction: column;
		margin-bottom: 1rem;
	}
	.mypage-row-box svg{
		width: 1.5rem;
		height: 1.5rem;
	}
	.mypage-row-box{
		border: 1px solid #dfdfdf;
	    padding: 1.875rem;
	    margin: 1rem;
	    border-radius: 0.5rem;
	    display: flex;
	    justify-content: space-between;
		
	}
	.mypage-row-box:hover{
		cursor: pointer;
	}
	.mypage-row-content{
		display: flex;
		flex-direction: column;
	}
	.mypage-row-content a{
		font-size: 0.875em;
		font-weight: 500;
	}
	.mypage-row-content span{
		font-size: 0.775em;
	}
	.mypage-row-svg{
		line-height: 33px;
	}
	.mypage-content{
		margin: 1rem;
	}
	.mypage-content-tabList{
		display: flex;
	}
	.mypage-active{
		border-bottom: 2px solid #0058a3;
		color: #111;
	}
	.mypage-nonactive{
		border-bottom: 2px solid #dfdfdf;
	    color: #484848;
	}
	.mypage-nonactive:hover{
		cursor: pointer;
		color: #111;
		border-bottom: 2px solid #b5b4b4;;
	}
	.mypage-content-tabList button{
	    flex: 1 0 auto;
	    font-size: .875rem;
	    font-weight: 700;
	    margin: 1rem 0;
	    padding: 0 .9375rem .9375rem 0;
	    text-align: left;
		cursor: default;
	}
	.mypage-content-tabList button:focus{
		outline: none;
	}
	.mypage-content-tab{
		padding: 3.125rem 0;
	}
	.mypage-content-tabList button:nth-child(2){
		margin: 1rem 1rem;
	}
	.panel-row{
		font-size: 0.875rem;
	}
	.panel-row-title{
	    font-weight: bold;
    	margin-bottom: 1.5rem;
	}
/* 	.panel-row-title span{ */
/* 		font-size: 0.990rem; */
/* 	} */
	.panel-row-title #personal,#contact,#password,#address,#deliveryAddress,#ad{
		text-decoration: underline;
	}
	.flex-row-between{
		display: flex;
		justify-content: space-between;
	}
	.update-box{
		display: flex;
		flex-direction: column;
	}
 	.update-box input{
 		color: #484848; 
 		font-size: 1rem;
 	} 
	.personal-information-row{
   		display: flex;
   		flex-direction: column;
   		margin-bottom: 3em;
	}
	.personal-information-row .title{
		font-size: 0.775rem;
	}
	.personal-information-row input{
	    border: none;
	    border-bottom: 1px solid;
	    padding: 1px 0;
	    margin: 0.5em 0;
	    font-weight: 600;
	}
	.personal-information-row input:focus{
		color: #0058a3;
		border-bottom: 2px solid;
	}
	.personal-information-btn{
		display: flex;
		flex-direction: column;
	}
	.input-label-wrap{
		position: relative;
		color: #969393;
	}
	.input-label-wrap .input-label{
	    position: absolute;
	    top: 7px;
	    transition: all .2s ease;
	    font-size: 1rem;
	    font-weight: 600;
	}
	.input-label-wrap input:focus{
		color: #0058a3;
		border-bottom: 2px solid;
	}
	#deleteBtn{
	    font-weight: bold;
    	margin-top: .625rem;
    	color: #484848;
	}
	#deleteBtn:hover{
	    text-decoration: underline !important;
	}
	/* 비밀번호 메세지 */
	#origin-msg, #new-msg1, #new-msg2, #pwck-msg{
		font-size: 0.775rem;
		color: red;
	}
	#new-msg2{
		margin: 1em;
		font-size: 0.675rem;
	}
	#new-msg2 li{
		margin: 0.4em 0;
	}
	/* 포커스가 지나간 상태에서 제어하려면 valid 선택자를 사용해야 함 */
	.input-label-wrap input:focus + .input-label{
		transform: translateY(-90%);
		font-size: 0.775rem !important;
		font-weight: 100 !important;
		color: #000;
	}
	@media (min-width: 800px){
		.mypage-container h1{
	    	font-weight: 700;	    	
	    	font-size: 2rem;
		}
		.mypage-row{
		    flex-direction: row;
		}
		.mypage-row-box{
			flex: 1 0 auto;
		}
		.update-box{
			width: 440px;
		}
	}
	@media (min-width: 1200px){
		.mypage-container{
			padding: 2rem 5.5em;
		}
		
	
	}
</style>

<section>
	<div class="mypage-container">
		<div>
			<h1>안녕하세요, 하영님!</h1>
			<span>로그아웃을 하고 싶으신가요? <a href="" style="text-decoration: underline;">로그아웃</a></span>
		</div>
		<div class="mypage-row">
			<div class="mypage-row-box">
				<div class="mypage-row-content">
					<a href="">주문 내역</a>
					<span>진행 중인 주문 없음</span>
				</div>
				<div class="mypage-row-svg">
					<svg focusable="false" viewBox="0 0 24 24" class="profile__svg-icon profile__link-box-arrow-right" aria-hidden="true"><path fill-rule="evenodd" clip-rule="evenodd" d="M19.2937 12.7074L20.0008 12.0003L19.2938 11.2932L12.0008 3.99927L10.5865 5.41339L16.1727 11.0003H4V13.0003H16.1723L10.5855 18.5868L11.9996 20.0011L19.2937 12.7074Z"></path></svg>
				</div>
			</div>
			<div class="mypage-row-box" onclick="location.href='${ path }/wishlist/wishlist.do'">
				<div class="mypage-row-content">
					<a>위시 리스트</a>
					<span>저장된 리스트 없음</span>
				</div>
				<div class="mypage-row-svg">
					<svg focusable="false" viewBox="0 0 24 24" class="profile__svg-icon profile__link-box-arrow-right" aria-hidden="true"><path fill-rule="evenodd" clip-rule="evenodd" d="M19.2937 12.7074L20.0008 12.0003L19.2938 11.2932L12.0008 3.99927L10.5865 5.41339L16.1727 11.0003H4V13.0003H16.1723L10.5855 18.5868L11.9996 20.0011L19.2937 12.7074Z"></path></svg>
				</div>
			</div>
			<div class="mypage-row-box">
				<div class="mypage-row-content">
					<a href="">배송 관리</a>
					<span>진행 중인 배송 없음</span>
				</div>
				<div class="mypage-row-svg">
					<svg focusable="false" viewBox="0 0 24 24" class="profile__svg-icon profile__link-box-arrow-right" aria-hidden="true"><path fill-rule="evenodd" clip-rule="evenodd" d="M19.2937 12.7074L20.0008 12.0003L19.2938 11.2932L12.0008 3.99927L10.5865 5.41339L16.1727 11.0003H4V13.0003H16.1723L10.5855 18.5868L11.9996 20.0011L19.2937 12.7074Z"></path></svg>
				</div>
			</div>
		</div>
		<div class="mypage-content">
			<div class="mypage-content-tabList">
				<button class="mypage-active" onclick="fn_tab(this,'1')">계정</button>
				<button class="mypage-nonactive" onclick="fn_tab(this,'2')">주소</button>
				<button class="mypage-nonactive" onclick="fn_tab(this,'3')">설정</button>
			</div>
			<div class="mypage-content-tab">
				<!-- 계정페이지 -->
				<div class="panel 1">
					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<span>개인 정보</span>
							<a id="personal" onclick="fn_update(this,'#personal')">수정</a>
						</div>
						<div>이름</div>
						<div>생년월일</div>
						<div>성별</div>
						<div id="personal-box" class="update-box" style="display: none;">
							<div class="personal-information-row">
								<span class="title">성</span>
								<input type="text" value="이하영">
							</div>
							<div class="personal-information-row">
								<span class="title">생일</span>
								<input type="text" value="1992-03-12" placeholder="YYYY-MM-DD">
							</div>
							<div class="personal-information-row">
								<span class="title">성별</span>
								<input type="text" value="여">
								<div style="display:none;">
									<span>남성</span>
									<span>여성</span>
									<span>응답거부</span>
								</div>
							</div>
							<div class="personal-information-btn">
								<button>취소</button>
								<button>저장</button>
							</div>
						</div>
					</div>
					
					<hr style="margin: 3.125rem 0 3.125rem 0;">
					
					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<span>연락처</span>
							<a id="contact" onclick="fn_update(this,'#contact')">수정</a>
						</div>
						<div class="flex-row-between">
							<span>전화번호</span>
							<span>확인되지 않음???</span>
						</div>
						<div class="flex-row-between">
							<span>이메일</span>
							<span>확인됨???</span>
						</div>
						<div id="contact-box" class="update-box" style="display: none;">
							<div class="personal-information-row">
								<span class="title">휴대폰</span>
								<input type="text" value="01011111111">
							</div>
							<div class="personal-information-row">
								<span class="title">이메일</span>
								<input type="email" value="asdf@asdf.com" placeholder="orkney@orkney.com">
							</div>
							<div class="personal-information-btn">
								<button>취소</button>
								<button>저장</button>
							</div>
						</div>
						
					</div>
					
					<hr style="margin: 3.125rem 0 3.125rem 0;">
					
					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<span>비밀번호</span>
							<a id="password" onclick="fn_update(this,'#password')">수정</a>
						</div>
						<div>
							<span style="color: #929292; font-size: 1.50em; font-weight: 700;">••••••••</span>
						</div>
						<div id="password-box" class="update-box" style="display: none;">
							<form>
								<div class="personal-information-row input-label-wrap">
									<input type="password" id="origin-pw">
									<label for="origin-pw" class="input-label"><span>현재 비밀번호</span></label>
									<span style="display: none;" id="origin-msg">현재 비밀번호를 입력해 주세요.</span>
								</div>
								<div class="personal-information-row input-label-wrap">
									<input type="password" id="new-pw">
									<label for="new-pw" class="input-label"><span>새 비밀번호</span></label>
									<span id="new-msg1" style="display: none;">비밀번호에는 다음이 포함되어야 합니다.</span>
									<ul id="new-msg2" style="display: none;">
										<li>8-20자를 입력해야 합니다</li>
										<li>한 줄에 동일한 문자를 3개 이상 포함할 수 없습니다.</li>
										<li>소문자(a-z)</li>
										<li>대문자(A-Z)</li>
										<li>숫자 또는 특수 문자</li>
									</ul>
								</div>
								<div class="personal-information-row input-label-wrap">
									<input type="password" id="new-pwck">
									<label for="origin-pw" class="input-label"><span>새 비밀번호 확인</span></label>
									<span style="display: none;" id="pwck-msg">새 비밀번호 확인을 입력해 주세요.</span>
								</div>
								<div class="personal-information-btn">
									<button>취소</button>
									<button>저장</button>
								</div>
							</form>
						</div>
					</div>
					
					<hr style="margin: 3.125rem 0 3.125rem 0;">
					
				</div>
				<!-- 주소 페이지 -->
				<div class="panel 2" style="display: none;">
					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<span>기본 주소</span>
							<a id="address" onclick="fn_update(this,'#address')" >수정</a>
						</div>
						<div>경기 또기시 또기동 또기로 1번길 11</div>
						<div>101</div>
						<div>12121</div>
						<div id="address-box" class="update-box" style="display: none;">
							<button>우편번호 찾기</button>
							<div class="personal-information-row">
								<span class="title">도로명 주소</span>
								<input type="text" value="경기 또기시 또기동 또기로 1번길 11" readonly>
							</div>
							<div class="personal-information-row">
								<span class="title">상세 주소</span>
								<input type="text" value="101" placeholder="상세 주소">
							</div>
							<div class="personal-information-row">
								<span class="title">우편번호</span>
								<input type="text" value="12121" readonly>
							</div>
							<div class="personal-information-btn">
								<button>취소</button>
								<button>저장</button>
							</div>
						</div>
					</div>
					
					<hr style="margin: 3.125rem 0 3.125rem 0;">
					
					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<span>배송 주소</span>
							<a id="deliveryAddress" onclick="fn_update(this,'#deliveryAddress')">수정</a>
						</div>
						<!-- 등록된 배송지 없을경우 -->
						<div>저장된 주소가 없습니다. 편리한 쇼핑을 위해 주소를 입력해주세요.</div>
						<!-- 등록된 배송지가 있을 경우 -->
						<div>이하영</div>
						<div>경기 또기시 또기동 또기로 1번길 11</div>
						<div>101</div>
						<div>12121</div>
						<br>
						<span>휴대폰 : </span><span>010 1111 1111</span>
						<div id="deliveryAddress-box" class="update-box" style="display: none;">
							<div class="personal-information-row">
								<span class="title">성</span>
								<input type="text" value="이하영">
							</div>
							<div class="personal-information-row">
								<span class="title">휴대폰</span>
								<input type="text" value="01011111111">
							</div>
							<button>우편번호 찾기</button>
							<div class="personal-information-row">
								<span class="title">도로명 주소</span>
								<input type="text" value="경기 또기시 또기동 또기로 1번길 11" readonly>
							</div>
							<div class="personal-information-row">
								<span class="title">상세 주소</span>
								<input type="text" value="101" placeholder="상세 주소">
							</div>
							<div class="personal-information-row">
								<span class="title">우편번호</span>
								<input type="text" value="12121" readonly>
							</div>
							<div class="personal-information-btn">
								<button>취소</button>
								<button>저장</button>
							</div>
						</div>
						
					</div>
					
					<hr style="margin: 3.125rem 0 3.125rem 0;">
					
					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<a>새 배송 주소 추가</a>
						</div>
					</div>
				</div>
				
				<!-- 설정페이지 -->
				<div class="panel 3" style="display: none;">
					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<span>마케팅 수신 설정</span>
							<a id="ad" onclick="fn_update(this,'#ad')" >수정</a>
						</div>
						<div>경기 또기시 또기동 또기로 1번길 11</div>
						<div>101</div>
						<div>12121</div>
						<div id="address-box" class="update-box" style="display: none;">
							<div class="personal-information-row">
								<span class="title">도로명 주소</span>
								<input type="text" value="경기 또기시 또기동 또기로 1번길 11" readonly>
							</div>
							<div class="personal-information-row">
								<span class="title">상세 주소</span>
								<input type="text" value="101" placeholder="상세 주소">
							</div>
							<div class="personal-information-row">
								<span class="title">우편번호</span>
								<input type="text" value="12121" readonly>
							</div>
							<div class="personal-information-btn">
								<button>취소</button>
								<button>저장</button>
							</div>
						</div>
					</div>
					
					<hr style="margin: 3.125rem 0 3.125rem 0;">
					
					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<span>회원 정보 삭제</span>
						</div>
						<div>orkney를 더이상 이용하지 않는다면 언제든 탈퇴할 수 있습니다.</div>
						<div>단, 회원 정보 및 구매 내역이 함께 삭제된다는 점을 참고해 주세요.</div>
						<a id="deleteBtn">계정을 삭제하시겠어요?</a>
						<div id="contact-box" class="update-box" style="display: none;">
							<div class="personal-information-row">
								<span class="title">휴대폰</span>
								<input type="text" value="01011111111">
							</div>
							<div class="personal-information-row">
								<span class="title">이메일</span>
								<input type="email" value="asdf@asdf.com" placeholder="orkney@orkney.com">
							</div>
							<div class="personal-information-btn">
								<button>취소</button>
								<button>저장</button>
							</div>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	/* 수정 누르면 열리게 하는 로직 */
	function fn_update(e,id){
		if($(e).text() == '수정'){ //수정누를떄
			$(e).parent().nextAll().hide();
			$(id + '-box').show();
			$(e).text('닫기');
		} else{ //닫기누를떄
			$(e).parent().nextAll().css('display','block');
			$(id + '-box').hide();
			$(e).text('수정');
		}
	}
	
	/* tab누르면 content 바뀌는 로직 */
	function fn_tab(e, panelNo){
		$(e).parent().children().attr('class','mypage-nonactive');
		$(e).attr('class','mypage-active');
		$('.panel').css('display','none');
		$('.'+panelNo).css('display','block');
	}

	$(function(){
		/* 개인정보수정 */
// 		$('#personal').click(function(){
// 			if($(this).text() == '수정'){ //수정누를떄
// 				$(this).parent().nextAll().hide();
// 				$('#personal-information-box').show();
// 				$(this).text('닫기');
// 			} else{ //닫기누를떄
// 				$(this).parent().nextAll().css('display','block');
// 				$('#personal-information-box').hide();
// 				$(this).text('수정');
// 			}
				
// 		});
		
		
		/* 연락처수정 */
// 		$('#contact').click(function(){
// 			if($(this).text() == '수정'){ //수정누를떄
// 				$(this).parent().nextAll().hide();
// 				$('#contact-box').show();
// 				$(this).text('닫기');
// 			} else{ //닫기누를떄
// 				$(this).parent().nextAll().css('display','block');
// 				$('#contact-box').hide();
// 				$(this).text('수정');
// 			}
				
// 		});
		
		/* 비밀번호수정 */
// 		$('#password').click(function(){
// 			if($(this).text() == '수정'){ //수정누를떄
// 				$(this).parent().nextAll().hide();
// 				$('#password-box').show();
// 				$(this).text('닫기');
// 			} else{ //닫기누를떄
// 				$(this).parent().nextAll().css('display','block');
// 				$('#password-box').hide();
// 				$(this).text('수정');
// 			}
				
// 		});
		
		/* 비밀번호 입력칸 클릭했을 때 */
		$('#origin-pw').blur(function(){
			if($(this).val() == ""){
				$(this).css({'color':'red','border-bottom':'2px solid'});
				$('#origin-msg').css('display','block');
			} else {
				$(this).css({'color':'#484848','border-bottom':'1px solid'});
				$('#origin-msg').css('display','none');
				$(this).next().css({'transform': 'translateY(-90%)','font-size': '0.775rem','font-weight': '100'});
			}
		}).click(function(){
			$(this).css({'color': '#0058a3', 'border-bottom': '2px solid'});
		})
		
		/* 새 비밀번호 입력칸 클릭했을 때 */
		$('#new-pw').click(function(){
			$(this).css({'color': '#0058a3', 'border-bottom': '2px solid'});
			$('#new-msg1,#new-msg2').css({'display':'block','color':'#000'});
		}).blur(function(){
			if($(this).val() == ""){
				$(this).css({'color':'red','border-bottom':'2px solid'});
				$('#new-msg1').css({'display':'block','color':'red'}).text('새 비밀번호를 입력해 주세요.');
				$('#new-msg2').css('display','none');
			} else {
				$(this).css({'color':'#484848','border-bottom':'1px solid'});
				$('#new-msg1,#new-msg2').css('display','none');
				$(this).next().css({'transform': 'translateY(-90%)','font-size': '0.775rem','font-weight': '100'});
			}
		})
		$('#new-pw').blur(function(){
			if($(this).val() == ""){
				$(this).prev().css('color','white');
				$(this).css({'color':'red','border-bottom':'2px solid'});
				
			} else {
				$(this).css({'color':'#484848','border-bottom':'1px solid'});
				$(this).prev().css('color','#212529');
			}
		})
		
		/* 새 비밀번호 확인 입력칸 클릭했을 때 */
		$('#new-pwck').blur(function(){
			if($(this).val() == ""){
				$(this).css({'color':'red','border-bottom':'2px solid'});
				$('#pwck-msg').css('display','block');
			} else {
				$(this).css({'color':'#484848','border-bottom':'1px solid'});
				$('#pwck-msg').css('display','none');
				$(this).next().css({'transform': 'translateY(-90%)','font-size': '0.775rem','font-weight': '100'});
			}
		}).click(function(){
			$(this).css({'color': '#0058a3', 'border-bottom': '2px solid'});
		})
			
	})
	
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>