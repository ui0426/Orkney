<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/member/mypage.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<section>
   
   
   <div class="mypage-container">
      <div class="mypage-title">
	      <div>
	<%--          <h1>안녕하세요, <c:out value="${ fn:substring(login.MEMBER_NAME,1,fn:length(login.MEMBER_NAME)) }"/>님!</h1> --%>
	         <h1>안녕하세요, <span id="title-name"><c:out value="${ login.MEMBER_NAME }"/></span>님!</h1>
	         <span>로그아웃을 하고 싶으신가요? <a href="${ path }/member/memberLogout.do" style="text-decoration: underline;">로그아웃</a></span>
	      </div>
	      <div class="point-box" onclick="location.href='${path}/point/pointForm.do'">
	      	<div>Orkney POINT</div>
	      	<div>사용가능 포인트</div>
	      	<div class="myPoint"><fmt:formatNumber value="${login.POINT }" pattern="###,###"/>p</div>
	      </div>   
      </div>
      <div class="mypage-row">
         <div class="mypage-row-box" onclick="location.href='${ path }/order/orderList.do'">
            <div class="mypage-row-content">
               <a>주문 내역</a>
               <span id="order-count">진행 중인 주문 없음</span>
            </div>
            <div class="mypage-row-svg">
               <svg focusable="false" viewBox="0 0 24 24" class="profile__svg-icon profile__link-box-arrow-right" aria-hidden="true"><path fill-rule="evenodd" clip-rule="evenodd" d="M19.2937 12.7074L20.0008 12.0003L19.2938 11.2932L12.0008 3.99927L10.5865 5.41339L16.1727 11.0003H4V13.0003H16.1723L10.5855 18.5868L11.9996 20.0011L19.2937 12.7074Z"></path></svg>
            </div>
         </div>
         <div class="mypage-row-box" onclick="location.href='${ path }/wishlist/wishlist.do'">
            <div class="mypage-row-content">
               <a>위시 리스트</a>
               <span id="wl-count">저장된 리스트 1개</span>
            </div>
            <div class="mypage-row-svg">
               <svg focusable="false" viewBox="0 0 24 24" class="profile__svg-icon profile__link-box-arrow-right" aria-hidden="true"><path fill-rule="evenodd" clip-rule="evenodd" d="M19.2937 12.7074L20.0008 12.0003L19.2938 11.2932L12.0008 3.99927L10.5865 5.41339L16.1727 11.0003H4V13.0003H16.1723L10.5855 18.5868L11.9996 20.0011L19.2937 12.7074Z"></path></svg>
            </div>
         </div>
		 <div class="mypage-row-box" onclick="location.href='${ path }/review/reviewList.do?s=reviewable'">
            <div class="mypage-row-content">
               <a>나의 리뷰</a>
               <span id="review-count">작성 가능한 리뷰 없음</span>
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
               <form id="personal-submit-form">
                  <div class="panel-row">
                     <div class="panel-row-title flex-row-between">
                        <span>개인 정보</span>
                        <a id="personal" onclick="fn_update(this,'#personal')">수정</a>
                     </div>
                     <div id="updateName"><c:out value="${ login.MEMBER_NAME }"/></div>
                     <div id="updateBirth">
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
                     <div id="personal-box" class="update-box" style="display: block;">
                     </div>
                  </div>
               </form>
               
               <hr style="margin: 3.125rem 0 3.125rem 0;">
               <form id="contact-submit-form">
                  <div class="panel-row">
                     <div class="panel-row-title flex-row-between">
                        <span>연락처</span>
                        <a id="contact" onclick="fn_update(this,'#contact')">수정</a>
                     </div>
                     <div class="flex-row-between">
                        <span id="updatePhone"><c:out value="${ login.PHONE }"/></span>
                        <span></span>
                     </div>
                     <div class="flex-row-between">
                        <span><c:out value="${ login.MEMBER_ID }"/></span>
                        <c:if test="${login.EMAIL_AUTH == 'Y'}">
                        <span class="email-auth auth-y">확인됨</span>
                        </c:if>
                        <c:if test="${login.EMAIL_AUTH == 'N'}">
                        <span class="email-auth auth-n">확인되지 않음</span>
                        </c:if>
                     </div>
                     <div id="contact-box" class="update-box" style="display: block;">
                     </div>
                  </div>
               </form>
               
               <hr style="margin: 3.125rem 0 3.125rem 0;">
               <form id="password-submit-form">
                  <div class="panel-row">
                     <div class="panel-row-title flex-row-between">
                        <span>비밀번호</span>
                        <a id="password" onclick="fn_update(this,'#password')">수정</a>
                     </div>
                     <div>
                        <span style="color: #929292; font-size: 1.50em; font-weight: 700;">••••••••</span>
                     </div>
                     <div id="password-box" class="update-box">
                     </div>
                  </div>
               </form>
               
               <hr style="margin: 3.125rem 0 3.125rem 0;">
               
            </div>
            <!-- 주소 페이지 -->
            <div class="panel 2" style="display: none;">
               <form id="address-submit-form">
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
                  <div id="addr"><c:out value="${ add2 }"/></div>
                  <div id="detail"><c:out value="${ add3 }"/></div>
                  <div id="post"><c:out value="${ add1 }"/></div>
                  <div id="address-box" class="update-box" style="display: block;">
                  </div>
               </div>
               </form>
               
               <hr style="margin: 3.125rem 0 3.125rem 0;">
               
               <div class="panel-row" id="addr-list-row">
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
                  	 <input type="hidden" value="${ addr.address_no }"/>
                     <a class="panel-row-update addAddr-aTag" onclick="fn_addAddrUpdate(this);">수정</a>
                     <div class="addr-disappear">
                        <div class="flex-row-between">
                           <div class="font-weight"><c:out value="${ addr.address_name }"/></div>
                        </div>
                        <div><c:out value="${ addr.address_addr }"/></div>
                        <div><c:out value="${ addr.address_detail }"/></div>
                        <div><c:out value="${ addr.address_post }"/></div>
                        <br>
                        <span class="font-weight">휴대폰 : </span><span><c:out value="${ addr.address_phone }"/></span>
                     </div>
<!--                      <hr style="margin: 2.125rem 0 2.125rem 0; border-style: dashed;"> -->
                     
                     <div class="update-box addr-update-box" style="display: none;">
                     </div>
                  </div>
                  </c:forEach>
                  </c:if>
               </div>
               
               <form id="addrInsert-submit-form">
               <div class="panel-row">
                  <div class="panel-row-title flex-row-between">
                     <a class="addAddrBtn" >새 배송 주소 추가</a>
                  </div>
                  <div id="addAddrBtn-updatebox" class="update-box" style="display: none;">
                  </div>
               </div>
               </form>
            </div>
            
            <!-- 설정페이지 -->
            <div class="panel 3" style="display: none;">
               <div class="panel-row">
                  <div class="panel-row-title flex-row-between">
                     <span>마케팅 수신 설정</span>
                  </div>
                  <div>이메일로 혜택, 팁, 뉴스를 받아보시겠습니까?</div>
                  <div class="form-check form-switch ckBtn">
                  <c:if test="${ login.EMAIL_CH == 'Y'}">
				  <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" checked/>
				  </c:if>
				   <c:if test="${ login.EMAIL_CH == 'N'}">
				  <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"/>
				  </c:if>
				  <label class="form-check-label" for="flexSwitchCheckDefault"
				    >이메일 수신을 받겠습니다.</label>
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
         </div>
      </div>
   </div>
   
   
</section>

	<!-- 탈퇴하기 모달 -->
    <div onclick="history.back();" class="delete-modal-cover"></div>
    <div id="delete-modal">
       
    </div>
    
    
    <!-- 이메일 인증안했을떄 알람 -->
    <div class="auth">
    	<div class="auth-title">계정을 안전하게 유지하세요.</div>
    	<div class="auth-content">
    		<div class="auth-msg">이메일 인증을 위해 고객님의 이메일로 인증 링크를 보내드립니다.</div>
    		<div class="auth-close">닫기</div>
    	</div>
    	<div class="email-send">이메일 보내기</div>
    </div>
    
<script>
//주문, 위시, 리뷰 개수 가져오기~
$(function(){
	$.ajax({
		url: '${path}/wishlist/wlCount.do',
		success: data=>{
			console.log(data);
			if(data > 1){
				$('#wl-count').text('저장된 리스트 ' + data + '개');
			}
		}
	})
	
	$.ajax({
		url: '${path}/order/orderQty',
		success: data=>{
			console.log(data);
			if(data > 1){
				$('#order-count').text('진행 중인 주문 ' + data + '개');
			}
		}
	})
	
	$.ajax({
		url: '${path}/review/reviewQty',
		success: data=>{
			console.log(data);
			if(data > 0){
				$('#review-count').text('작성 가능한 리뷰 ' + data + '개');
			}
		}
	})
	
})

$('.auth-close').click(e=>{
	$('.auth').removeClass('auth-show');
});
$('.email-send').click(e=>{
	location.href='${path}/member/emailAuthAfter.do';
});

$(function(){
	if('${ login.EMAIL_CH }' == 'Y'){
		$('.ckBtn').css({'color': '#0075ff'});
	} 
	
		console.log('이메일' + '${ login.EMAIL_AUTH }');
	if('${ login.EMAIL_AUTH }' == 'N'){ 
		
		$('.auth').addClass('auth-show');
		
	} else {
		$('.auth').removeClass('auth-show');
	}
});

$('.form-check-input').click(e=>{
	console.log($('#flexSwitchCheckDefault').is(':checked') == true);
	let ck = '';
	if($('#flexSwitchCheckDefault').is(':checked') == true){
		ck = 'Y';
		$('.ckBtn').css({'color': '#0075ff'});
	} else {
		ck = 'N';
		$('.ckBtn').css({'color': '#484848'});
	}
		$.ajax({
			type: 'post',
			data: {ck:ck},
			url: '${path}/member/emailCk.do',
			success: data =>{
			}
		})
})



$('.point-box').mouseenter(e=>{
	$('.point-box').css('cursor','pointer');
	$('.myPoint').css({'text-decoration':'underline', 'text-underline-position':'under'});
}).mouseleave(e=>{
	$('.myPoint').css('text-decoration','none');
})
let makeAjax = function(url, data, success){
		   $.ajax({
			   type: 'post',
			   url: url,
			   data: data,
			   success: success
		   })
};
   
	/* 회원탈퇴 */
$("#deleteBtn").click(function() {
// 	location.href="${path}/test";  
  $("#delete-modal,.delete-modal-cover,html").addClass("open2");
  window.location.hash = "#open";
  
  makeAjax('${path}/member/insertForm.do', {form: 'member/mypageDiv/deleteModal'}, data=>{
		  console.log(data);
		  $.parseHTML(data);
		  $('#delete-modal').html(data);
	  
  })
  
});	

window.onhashchange = function() {
	
  if (location.hash != "#open") {
	  $("#menu,.page_cover,html").removeClass("open");
      $("#delete-modal,.delete-modal-cover,html").removeClass("open2");
  }
  
};

$('.mypage-row-box').hover(e=>{
	$(e.target).children().children('a').css('text-decoration','underline');
}).mouseleave(e=>{
	$(e.target).children().children('a').css('text-decoration','none');
});



   /* tab누르면 content 바뀌는 로직 */
   function fn_tab(e, panelNo){
      $(e).parent().children().attr('class','mypage-nonactive');
      $(e).attr('class','mypage-active');
      $('.panel').css('display','none');
      $('.'+panelNo).css('display','block');
   }

   $(function(){
      personalFlag1 = true;
      personalFlag2 = true;
      contactFlag = true;
      passwordFlag1 = false;
      passwordFlag2_1 = false;
      passwordFlag2_2 = false;
      passwordFlag2_3 = false;
      passwordFlag2_4 = false;
      passwordFlag2_5 = false;
      passwordFlag3 = false;
      addressFlag = true;
      
   })
   
   /* 수정 누르면 열리게 하는 로직 */
   function fn_update(i,id){
      if($(i).text() == '수정'){ //수정누를떄
         $(i).parent().nextAll().hide();
      	 $(id + '-box').css('display','flex');
         $(i).text('닫기');
         
         if(id == '#personal'){
	         makeAjax('${path}/member/currentMemberInformation.do', {param:id}, data=>{
	        	 console.log(data);
	        	 $.parseHTML(data);
	        	 $('#personal-box').html(data);
	       	});
         } else if(id == '#contact') {
        	 makeAjax('${path}/member/currentMemberInformation.do', {param:id}, data=>{
	        	 console.log(data);
	        	 $.parseHTML(data);
	        	 $('#contact-box').html(data);
	       	});
         } else if(id == '#password') {
        	 makeAjax('${path}/member/currentMemberInformation.do', {param:id}, data=>{
	        	 console.log(data);
	        	 $.parseHTML(data);
	        	 $('#password-box').html(data);
	       	});
         } else if(id == '#address'){
        	 makeAjax('${path}/member/currentMemberInformation.do', {param:id}, data=>{
	        	 console.log(data);
	        	 $.parseHTML(data);
	        	 $('#address-box').html(data);
	       	});
         }
         
//========================================================================================================================================================         
         
      } else{ //닫기누를떄
         $(i).parent().nextAll().css('display','flex');
         $(id + '-box').empty().css('display','block');
         $(i).text('수정');
      }
   }
   
   
   
   /*    새 배송지 칸에서 수정 누르면  업데이트 창 나오게*/
   function fn_addAddrUpdate(e){
	   let t = $(e);
	   let i = $('.addAddr-aTag').index(t);
	   
      if($(e).text() == '수정'){ //수정 누르면
    	  
		  let addrNo = t.prev().val();
		  console.log(addrNo);
    	 
		  makeAjax('${path}/member/addAddrInformation.do', {addrNo:addrNo}, data=>{
    		  console.log(data);
    		  $.parseHTML(data);
    		  $('.addr-update-box').eq(i).html(data);
    	  });
          
		  $('.addr-disappear').eq(i).css('display','none');
          $('.addr-disappear').eq(i).next('hr').css('display','none');
          $('.addr-update-box').eq(i).css({'display':'flex','margin-top':'0'});
          $(e).text('닫기');
         
      
      
      
      } else {
         $('.addr-disappear').eq(i).css('display','block');
         $('.addr-disappear').eq(i).next('hr').css('display','block');
         $('.addr-update-box').eq(i).css('display','none');
         $(e).text('수정');
         
      }
   }

   
   /* 새 배송지 추가 누르면 열리는 버튼*/
   $(function(){
      $('.addAddrBtn').click(function(e){
         if($(e.target).text() == '새 배송 주소 추가'){ //수정누를떄
            $(e.target).text('창 닫기')
            $('#addAddrBtn-updatebox').css('display','flex');
         	
            makeAjax('${path}/member/insertForm.do', {form:'member/mypageDiv/addrInsert'} , data=>{
      		  console.log(data);
      		  $.parseHTML(data);
      		  $('#addAddrBtn-updatebox').html(data);
      	  });
         
         } else {
            $(e.target).text('새 배송 주소 추가')
            $('#addAddrBtn-updatebox').css('display','none');
            
         }
      })
   })
   
   

</script>
   
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>