<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    	color: #111;
	}
	.panel-row-update{
	    font-weight: bold;
    	color: #111 important;
    	text-decoration: underline !important;
	}
/* 	.panel-row-title span{ */
/* 		font-size: 0.990rem; */
/* 	} */
	.divForAddAdddrUpdate{
		display: flex;
	    flex-direction: row-reverse;
	    justify-content: space-between;
	    border-bottom: 1px dotted #ccc;
    	padding-bottom: 2.125em;
    	margin-bottom: 2.125em;
	}
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
		margin-top: 2.5rem;
	}
	[class*='addr-update-box']{
		margin-top: 1.5rem !important;
		flex-grow: 1;
		
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
	.input-label-wrap .input-label-2{
	    position: absolute;
	    top: -19px;
	    font-size: 0.775rem;
	    font-weight: 100;
    	color: #212529;
	    transition: all .2s ease;
	}
	/* .origin-label-status{
		font-size: 0.775rem;
		font-weight: 100;
		color: #212529;
		transform: none;
	} */
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
	#origin-msg, #new-msg1, #new-msg2, #pwck-msg, .msg-not-null{
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
	.disabled{
		color: #ccc !important;
        cursor: context-menu;
	}
	.font-weight{
		font-weight: 600;
		color: #333;
	}
	.addAddrBtn{
		color: #484848 !important;
	}
	.addAddrBtn:hover{
		color: #111 !important;
		text-decoration: underline !important;
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
		[class*='addr-update-box']{
		
			flex-grow: 0;
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
			<h1>안녕하세요, <c:out value="${ fn:substring(login.MEMBER_NAME,1,fn:length(login.MEMBER_NAME)) }"/>님!</h1>
			<span>로그아웃을 하고 싶으신가요? <a href="${ path }/member/loginout.do" style="text-decoration: underline;">로그아웃</a></span>
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
				<form id="updateForm">
				<!-- 계정페이지 -->
				<div class="panel 1">
					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<span>개인 정보</span>
							<a id="personal" onclick="fn_update(this,'#personal')">수정</a>
						</div>
						<div><c:out value="${ login.MEMBER_NAME }"/></div>
						<div>
							<c:forTokens var="bTokens" items="${ login.BIRTHDAY }" delims="-" varStatus="status">
								<c:if test="${ status.first }">
									<c:out value="${ bTokens }년도"/>
								</c:if>
								<c:if test="${ !status.first && !status.last }">
									<c:out value=" ${bTokens }월"/>
								</c:if>
								<c:if test="${ status.last }">
									<c:out value="${ fn:substring(bTokens,0,2) }일"/>
								</c:if>	
							</c:forTokens>
						</div>
						<div id="personal-box" class="update-box" style="display: none;">
							<div class="personal-information-row input-label-wrap">
								<input type="text" class="input-event not-null" name="name" value="${ login.MEMBER_NAME }">
								<label for="" class="input-label-2"><span>이름</span></label>
								<span style="display: none;" class="msg-not-null">이름을 입력해 주세요.</span>
							</div>
							<div class="personal-information-row input-label-wrap">
								<!-- 생일 형식 yyyy-dd-mm으로 바꾸기 -->
								<c:set var="birReplace" value="${ fn:split(fn:replace(login.BIRTHDAY,'/','-'),' ')[0] }"/>
								<input type="text" id="" name="birth" value="${ birReplace }" placeholder="YYYY-MM-DD">
								<label for="" class="input-label-2"><span>생일</span></label>
								<span style="display: none;" id="">생일을 입력해 주세요.</span>
							</div>
							<div class="personal-information-btn">
								<button type="button">취소</button>
								<button class="submitBtn" id="personal-submit">저장</button>
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
							<span><c:out value="${ login.PHONE }"/></span>
							<span>확인되지 않음???</span>
						</div>
						<div class="flex-row-between">
							<span><c:out value="${ login.MEMBER_ID }"/></span>
							<span>확인됨???</span>
						</div>
						<div id="contact-box" class="update-box" style="display: none;">
							<div class="personal-information-row">
								<span class="title">휴대폰</span>
								<input type="text" name="phone" value="${ login.PHONE }">
							</div>
							<div class="personal-information-row">
								<span class="title">이메일</span>
								<input class="disabled" type="email" value="${ login.MEMBER_ID }">
							</div>
							<div class="personal-information-btn">
								<button type="button">취소</button>
								<button class="submitBtn" id="personal-submit">저장</button>
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
									<label for="new-pwck" class="input-label"><span>새 비밀번호 확인</span></label>
									<span style="display: none;" id="pwck-msg">새 비밀번호 확인을 입력해 주세요.</span>
								</div>
								<div class="personal-information-btn">
									<button type="button">취소</button>
									<button class="submitBtn" id="password-submit">저장</button>
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
						<c:forTokens items="${ login.address }" delims="/" var="add" varStatus="addStatus">
							<c:if test="${ addStatus.first }">
								<c:set var="add1" value="${ add }"/>
							</c:if>
							<c:if test="${ !addStatus.first && !addStatus.last }">
								<c:set var="add2" value="${ add }"/>
							</c:if>
							<c:if test="${ addStatus.last }">
								<c:set var="add3" value="${ add }"/>
							</c:if>
						</c:forTokens>
						<div><c:out value="${ add2 }"/></div>
						<div><c:out value="${ add3 }"/></div>
						<div><c:out value="${ add1 }"/></div>
						<div id="address-box" class="update-box" style="display: none;">
							<button class="addAddressBtn">우편번호 찾기</button>
							<div class="personal-information-row">
								<span class="title">도로명 주소</span>
								<input class="disabled addr" type="text" id="" name="" value="${ add2 }" readonly>
							</div>
							<div class="personal-information-row input-label-wrap">
								<input type="text" class="input-event not-null" value="${ add3 }">
								<label for="" class="input-label-2"><span>상세 주소</span></label>
								<span style="display: none;" class="msg-not-null">상세주소를 입력해 주세요.</span>
							</div>
							<div class="personal-information-row">
								<span class="title">우편번호</span>
								<input class="disabled post" type="text" value="${ add1 }" readonly>
							</div>
							<div class="personal-information-btn">
								<button type="button">취소</button>
								<button class="submitBtn" id="personal-submit">저장</button>
							</div>
						</div>
					</div>
					
					<hr style="margin: 3.125rem 0 3.125rem 0;">
					
					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<span>배송 주소(<c:out value="${ fn:length(addrList)}"/>)</span>
						</div>
						<!-- 등록된 배송지 없을경우 -->
						<c:if test="${ addrList.size() == 0 }">
							<div>저장된 주소가 없습니다. 편리한 쇼핑을 위해 주소를 입력해주세요.</div>
						</c:if>
						<!-- 등록된 배송지가 있을 경우 -->
						<c:if test="${ addrList.size() != 0 }">
						<c:forEach var="addr" items="${ addrList }" varStatus="status">
						<div class="divForAddAdddrUpdate">
							<a class="panel-row-update addAddr-aTag-${status.index }" onclick="fn_addAddrUpdate(this);">수정</a>
							<div class="addr-disappear-${ status.index }">
								<div class="flex-row-between">
									<div class="font-weight"><c:out value="${ addr.address_name }"/></div>
								</div>
								<div><c:out value="${ addr.address_addr }"/></div>
								<div><c:out value="${ addr.address_detail }"/></div>
								<div><c:out value="${ addr.address_post }"/></div>
								<br>
								<span class="font-weight">휴대폰 : </span><span><c:out value="${ addr.address_phone }"/></span>
							</div>
<!-- 							<hr style="margin: 2.125rem 0 2.125rem 0; border-style: dashed;"> -->
							
							<div class="update-box addr-update-box-${status.index }" style="display: none;">
								<div class="personal-information-row input-label-wrap">
									<input type="text" class="input-event not-null" value="${ addr.address_name }">
									<label for="" class="input-label-2"><span>이름</span></label>
									<span style="display: none;" class="msg-not-null">이름을 입력해 주세요.</span>
								</div>
								<div class="personal-information-row input-label-wrap">
									<input type="text" class="input-event not-null" value="${ addr.address_phone }">
									<label for="" class="input-label-2"><span>휴대폰</span></label>
									<span style="display: none;" class="msg-not-null">휴대폰 번호를 입력해 주세요.</span>
								</div>
								<button class="addAddressBtn" >우편번호 찾기</button>
								<div class="personal-information-row">
									<span class="title">도로명 주소</span>
									<input class="disabled addr" type="text" value="${ addr.address_addr }" readonly>
								</div>
								<div class="personal-information-row input-label-wrap">
									<input type="text" class="input-event not-null" value="${ addr.address_detail }">
									<label for="" class="input-label-2"><span>상세 주소</span></label>
									<span style="display: none;" class="msg-not-null">상세주소를 입력해 주세요.</span>
								</div>
								<div class="personal-information-row">
									<span class="title">우편번호</span>
									<input class="disabled post" type="text" value="${ addr.address_post }" readonly>
								</div>
								<div class="personal-information-btn">
									<button type="button">취소</button>
									<button class="submitBtn" id="personal-submit">저장</button>
									<button class="">주소삭제</button>
								</div>
							</div>
						</div>
						</c:forEach>
						</c:if>
					</div>
					
					<div class="panel-row">
						<div class="panel-row-title flex-row-between">
							<a class="addAddrBtn" >새 배송 주소 추가</a>
						</div>
						<div id="addAddrBtn-updatebox" class="update-box" style="display: none;">
								<div class="personal-information-row">
									<span class="title">이름</span>
									<input type="text" value="tjd">
								</div>
								<div class="personal-information-row">
									<span class="title">휴대폰</span>
									<input type="text" value="01011111111">
								</div>
								<button class="addAddressBtn">우편번호 찾기</button>
								<div class="personal-information-row">
									<span class="title">도로명 주소</span>
									<input class="disabled addr" type="text" value="도로명 주소" readonly>
								</div>
								<div class="personal-information-row">
									<input type="text" id="origin-pw">
									<label for="origin-pw" class="input-label"><span>상세 주소</span></label>
									<span style="display: none;" id="origin-msg">상세 주소를 입력해주세요.</span>
								</div>
								<div class="personal-information-row">
									<span class="title">우편번호</span>
									<input class="disabled post" type="text" value="우편번호" readonly>
								</div>
								<div class="personal-information-btn">
									<button type="button">취소</button>
									<button>저장</button>
								</div>
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
								<button type="button">취소</button>
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
								<button type="button">취소</button>
								<button>저장</button>
							</div>
						</div>
						
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</section>

<script>

	/* 주소 api */
	$(".addAddressBtn").click(e=>{
		//클릭한 주소찾기 버튼의 인덱스
		var addAddressBtnIindex = $('.addAddressBtn').index(e.target);
// 		$('.addr').eq(addAddressBtnIindex).addClass('addr'+addAddressBtnIindex);
// 		$('.post').eq(addAddressBtnIindex).addClass('post'+addAddressBtnIindex);
		console.log($(e.target));
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	            var test=data.postcode;
				console.log(test);
				console.log(data.zonecode);
	            
	            
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                //document.getElementById("sample6_extraAddress").value = extraAddr;
	            
	            } else {
	                //document.getElementById("sample6_extraAddress").value = '';
	            }
				

	            console.log(data.zonecode+" : "+addr);
	            
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            $('.post').eq(addAddressBtnIindex).val(data.zonecode);
	            $('.addr').eq(addAddressBtnIindex).val(addr);
	            // 커서를 상세주소 필드로 이동한다.
	            $("#detailadr").focus();
	            console.log(data.zonecode+" : "+addr+" : "+extraAddr);
	        }
	    }).open();
	})
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
	
	/* 새 배송지 추가 누르면 열리는 버튼*/
	$(function(){
		$('.addAddrBtn').click(function(e){
			if($(e.target).text() == '새 배송 주소 추가'){ //수정누를떄
				
				$(e.target).text('주소 추가 창 닫기')
				$('#addAddrBtn-updatebox').css('display','block');
			} else {
				$(e.target).text('새 배송 주소 추가')
				$('#addAddrBtn-updatebox').css('display','none');
				
			}
		})
	})
	
	/* 	새 배송지 칸에서 수정 누르면  업데이트 창 나오게*/
	function fn_addAddrUpdate(e){
		var cs = ($(e).attr('class')).split(' ');
		var c = cs[1]; //두번째 클래스 네임 가져오기
		var i = (cs[1].split('-'))[2];
		console.log(i);
		if($(e).text() == '수정'){ //수정 누르면
				console.log($('.addr-disappear-'+i).attr('class'));
			if($('.addr-disappear-'+i).attr('class') == 'addr-disappear-'+i){
				$('.addr-disappear-'+i).css('display','none');
				$('.addr-disappear-'+i).next('hr').css('display','none');
				$('.addr-update-box-'+i).css({'display':'block','margin-top':'0'});
				$(e).text('닫기');
			} 
			
		} else {
			$('.addr-disappear-'+i).css('display','block');
			$('.addr-disappear-'+i).next('hr').css('display','block');
			$('.addr-update-box-'+i).css('display','none');
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
		
		/* 인풋 클릭 했을 때 */
		$('.input-event').click(e=>{
			console.log($(e.target));
			
			//빈칸 안된다...
			if($(e.target).hasClass('not-null')){
				
				$(e.target).blur(e=>{
					if($(e.target).val() == ''){
						$(e.target).css({'color':'red','border-bottom':'2px solid'});
						$(e.target).next().css({'transform': 'translateY(110%)','font-size': '1rem','font-weight': '600','color':'#969393'});
						$(e.target).next().next().css('display','block');
					} else {
 						$(e.target).css({'color': '#484848', 'border-bottom': '1px solid', 'font-size':'1rem'});
						$('.msg-not-null').css('display','none');
					}
				}).click(e=>{
						$(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
 						$(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});
				})
			}
		})
		
		//회원정보수정
		$('.submitBtn').click(function(e){
			
			$.ajax({
				type: 'post',
				url: "${path}/member/updateMember.do",
				data: $('#updateForm').serialize(),				
				success: data=>{
					console.log(data);
				}
				
			})
		})
			
	})
	
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>