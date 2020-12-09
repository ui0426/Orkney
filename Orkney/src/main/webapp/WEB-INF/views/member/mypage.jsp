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
      <div>
<%--          <h1>안녕하세요, <c:out value="${ fn:substring(login.MEMBER_NAME,1,fn:length(login.MEMBER_NAME)) }"/>님!</h1> --%>
         <h1>안녕하세요, <span id="title-name"><c:out value="${ login.MEMBER_NAME }"/></span>님!</h1>
         <span>로그아웃을 하고 싶으신가요? <a href="${ path }/member/loginout.do" style="text-decoration: underline;">로그아웃</a></span>
      </div>
      <div class="mypage-row">
         <div class="mypage-row-box">
            <div class="mypage-row-content" onclick="location.href='${ path }/order/orderList.do'">
               <a>주문 내역</a>
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
         <div class="mypage-row-box" onclick="location.href='${ path }/review/reviewList.do'">
            <div class="mypage-row-content">
               <a>나의 리뷰</a>
               <span>작성 가능한 리뷰 없음</span>
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
                     <div id="personal-box" class="update-box" style="display: none;">
                        <div class="personal-information-row input-label-wrap">
                           <input type="text" id="update-name-input" class="origin-input-css" name="name" value="${ login.MEMBER_NAME }">
                           <label for="" class="input-label-2"><span>이름</span></label>
                           <span style="display: none;" class="msg-not-null">이름을 입력해 주세요.</span>
                        </div>
                        <div class="personal-information-row input-label-wrap">
                           <!-- 생일 형식 yyyy-dd-mm으로 바꾸기 -->
                           <c:set var="birReplace" value="${ fn:split(fn:replace(login.BIRTHDAY,'/','-'),' ')[0] }"/>
                           <input type="text" id="update-birth-input" class="origin-input-css" name="birth" value="${ birReplace }" >
                           <label for="" class="input-label-2"><span>생일</span></label>
                           <span style="display: none;" class="msg-style">생일을 입력해 주세요.</span>
                           <span style="display: none;" class ="msg-style" id="birth-type-ck">YYYY-MM-DD 형식으로 작성해야합니다.</span>
                           <span style="display: none;" class ="msg-style" id="birth-age-ck">만 15세 이상 이여야 합니다.</span>
                        </div>
                        <div class="personal-information-btn">
                           <button type="button">취소</button>
                           <button type="button" id="personal-submit">저장</button>
                        </div>
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
                        <span>확인되지 않음???</span>
                     </div>
                     <div class="flex-row-between">
                        <span><c:out value="${ login.MEMBER_ID }"/></span>
                        <span>확인됨???</span>
                     </div>
                     <div id="contact-box" class="update-box" style="display: none;">
                        <div class="personal-information-row input-label-wrap">
                           <input type="text" id="update-phone-input" class="origin-input-css" name="phone" value="${ login.PHONE }" >
                           <label for="" class="input-label-2"><span>휴대폰</span></label>
                           <span style="display: none;" class="msg-style">휴대폰 번호를 입력해 주세요.</span>
                           <span style="display: none;" class ="msg-style" id="phone-type-ck">휴대폰 번호가 올바르지 않습니다.</span>
                        </div>
                        <div class="personal-information-row">
                           <span class="title">이메일</span>
                           <input class="disabled" type="email" value="${ login.MEMBER_ID }" disabled>
                        </div>
                        <div class="personal-information-btn">
                           <button type="button">취소</button>
                           <button type="button" id="contact-submit">저장</button>
                        </div>
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
                     <div id="password-box" class="update-box" style="display: none;">
                        <div class="personal-information-row input-label-wrap">
                           <input type="password" id="update-originPw-input" class="origin-input-css" name="originPw">
                           <label for="update-originPw-input" class="input-label"><span>현재 비밀번호</span></label>
                           <span style="display: none;" class="msg-style">현재 비밀번호를 입력해 주세요.</span>
                        </div>
                        <div class="personal-information-row input-label-wrap">
                           <input type="password" id="update-newPw-input" class="origin-input-css" name="newPw">
                           <label for="update-newPw-input" class="input-label"><span>새 비밀번호</span></label>
                           <span style="display: none;" class="msg-style">새 비밀번호를 입력해 주세요.</span>
                           <span id="newPw-type-ck" style="display: none; color: #212529;" class="msg-style">비밀번호에는 다음이 포함되어야 합니다.</span>
                           <ul id="newPw-type-ck-ul" style="display: none;" class="msg-style">
                              <li id="ul1">8-20자를 입력해야 합니다</li>
                              <li id="ul2">소문자(a-z)</li>
                              <li id="ul3">대문자(A-Z)</li>
                              <li id="ul4">숫자 또는 특수 문자</li>
                           </ul>
                        </div>
                        <div class="personal-information-row input-label-wrap">
                           <input type="password" id="update-newPwCk-input" name="newPwCk">
                           <label for="update-newPwCk-input" class="input-label"><span>새 비밀번호 확인</sspan></label>
                           <span style="display: none;" class ="msg-style">새 비밀번호 다시 한번 입력해 주세요.</span>
                           <span style="display: none;" class ="msg-style" id="newPwCk-eq-ck">새 비밀번호가 일치하지 않습니다.</span>
                        </div>
                        <div class="personal-information-btn">
                           <button type="button">취소</button>
                           <button type="button" id="password-submit">저장</button>
                        </div>
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
                        <input type="text" id="update-addrDetail-input" value="${ add3 }">
                        <label for="update-addrDetail-input" class="input-label-2"><span>상세 주소</span></label>
                        <span style="display: none;" class="msg-style">상세주소를 입력해 주세요.</span>
                     </div>
                     <div class="personal-information-row">
                        <span class="title">우편번호</span>
                        <input class="disabled post" type="text" value="${ add1 }" readonly>
                     </div>
                     <div class="personal-information-btn">
                        <button type="button">취소</button>
                        <button class="submitBtn" id="address-submit">저장</button>
                     </div>
                  </div>
               </div>
               </form>
               
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
<!--                      <hr style="margin: 2.125rem 0 2.125rem 0; border-style: dashed;"> -->
                     
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
                        <div class="personal-information-row input-label-wrap">
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
         </div>
      </div>
   </div>
</section>

<script>

   /* tab누르면 content 바뀌는 로직 */
   function fn_tab(e, panelNo){
      $(e).parent().children().attr('class','mypage-nonactive');
      $(e).attr('class','mypage-active');
      $('.panel').css('display','none');
      $('.'+panelNo).css('display','block');
   }


   /* 주소 api */
   $(".addAddressBtn").click(e=>{
      //클릭한 주소찾기 버튼의 인덱스
      var addAddressBtnIindex = $('.addAddressBtn').index(e.target);
//       $('.addr').eq(addAddressBtnIindex).addClass('addr'+addAddressBtnIindex);
//       $('.post').eq(addAddressBtnIindex).addClass('post'+addAddressBtnIindex);
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
   })
   
   /* 수정 누르면 열리게 하는 로직 */
   function fn_update(i,id){
      if($(i).text() == '수정'){ //수정누를떄
         $(i).parent().nextAll().hide();
         $(id + '-box').show();
         $(i).text('닫기');
         
         console.log(personalFlag1);
         console.log(personalFlag2);
         
         $.ajax({ //현재 로그인 된 사용자 정보 받아오기
            type: 'post',
            url: "${path}/member/currentMemberInformation.do",
            dataType: "json",
            success: data=>{
               console.log(data);
               $('#update-name-input').val(data['member_name']);
               $('#update-birth-input').val(data['birthday']);
               $('#update-phone-input').val(data['phone']);
            }
         })
         
         $('.origin-input-css').css('color','');
         $('.origin-input-css').siblings('span').css('display','none');
         $('.input-label-2').addClass('active');
         $('.input-label-2').css('font-size','.775rem');
         $('.input-label-2').css('font-weight','100');
         $('.input-label-2').css('transform','none');
         $('.input-label-2').css('color','rgb(33, 37, 41)');
         
         //수정창 열어서 이름 클릭 시 (체크 : not-null)
         $('#update-name-input').blur(e=>{
            
            if($(e.target).val() == ''){
               personalFlag1 = false;
               
                 $(e.target).css({'color':'red','border-bottom':'2px solid'});
                 $(e.target).next().css({'transform': 'translateY(110%)','font-size': '1rem','font-weight': '600','color':'#969393'});
                 $(e.target).next().next().css('display','block');
                 
              } else {
                personalFlag1 = true;
                 
                 $(e.target).css({'color': '#484848', 'border-bottom': '1px solid', 'font-size':'1rem'});
                 $(e.target).next().next().css('display','none');
              }
           }).click(e=>{
                 $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
                 $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});
           }).focus(e=>{
              $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
              $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});    
              
         })
           
           //수정창 열어서 생일 클릭시 (체크 : not-null, 형식)
         $('#update-birth-input').blur(e=>{
            
            if($(e.target).val() == ''){
               personalFlag2 = false;
               
                 $(e.target).css({'color':'red','border-bottom':'2px solid'});
                 $(e.target).next().css({'transform': 'translateY(110%)','font-size': '1rem','font-weight': '600','color':'#969393'});
                 $(e.target).next().next().css('display','block');
                 $('#birth-type-ck').css('display','none');
                 $('#birth-age-ck').css('display','none');
               } else {
                  
                 $(e.target).css({'color': '#484848', 'border-bottom': '1px solid', 'font-size':'1rem'});
                 $(e.target).next().next().css('display','none');
               
                 var v=$(e.target).val().length;//값 길이
                  var val=$(e.target).val();//값
                  var toyear=new Date().getFullYear();
                  var inyear=val.substr(0,4);
                  var reg=/^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/g;
                  var reg2= /^[0-9]*$/;
               
                  if (v == 8 && reg2.test(val)){ //여덟글자 쓰고 조건 ok일 때
                     personalFlag2 = true;
                  
                      val=val.substr(0,4)+"-"+val.substr(4,2)+"-"+val.substr(6,2);
                      console.log(val);
                      $(e.target).val(val);
                      $('#birth-type-ck').css('display','none');
                  } else if(reg.test(val)){ //-쓰고 조건 ok일 때
                     personalFlag2 = true;
                  
                      $('#birth-type-ck').css('display','none');
                  
                  } else { //조건 만족 안할 때
                     personalFlag2 = false;
                     
                     //"YYYY-MM-DD 형식으로 작성해야합니다.
                     $('#birth-type-ck').css('display','block');
               }
                  
                  if((toyear-inyear)<=14){
                     personalFlag2 = false;
                     
                     //만 15세 이상 이여야 합니다. msg 띄우기
                     $('#birth-age-ck').css('display','block');
                  } else{
                     personalFlag2 = true;
                     $('birth-age-ck').css('display','none');
                  }
               }
            
         }).click(e=>{
              $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
              $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});
      
         }).focus(e=>{
              $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
              $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});    
         })
         
         //수정창 열어서 연락처 클릭 시 (체크 : not-null, 형식 )
         $("#update-phone-input").blur(e=>{
            if($(e.target).val() == ''){
            	 contactFlag = false;
                 $(e.target).css({'color':'red','border-bottom':'2px solid'});
                 $(e.target).next().css({'transform': 'translateY(110%)','font-size': '1rem','font-weight': '600','color':'#969393'});
                 $(e.target).next().next().css('display','block');
                 $('#phone-type-ck').css('display','none');

               } else {
                 $(e.target).css({'color': '#484848', 'border-bottom': '1px solid', 'font-size':'1rem'});
                 $(e.target).next().next().css('display','none');
         
                 var v=$(e.target).val().length;
                  var val=$(e.target).val();
                  var reg2= /^[0-9]*$/g;
                   var reg=/^[01]{1}[1]{1}[0]{1}-[0-9]{4}-[0-9]{4}/g;
                  
                  if(v==11&&reg2.test(val)){
                	  contactFlag = true;
                      val=val.substr(0,3)+"-"+val.substr(3,4)+"-"+val.substr(7,4);
                      $(e.target).val(val);
                      $('#phone-type-ck').css('display','none');
                  } else if(reg.test(val)){
                	  contactFlag = true;
                     $('#phone-type-ck').css('display','none');
                  } else {
                	  contactFlag = false;
                     $('#phone-type-ck').css('display','block');
                  }
               }  
         }).click(e=>{
              $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
              $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});
         }).focus(e=>{
              $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
              $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});    
         })
         
//          //수정창 열어서 현재 비밀번호 클릭 시 (체크 : not-null )
         $('#update-originPw-input').blur(e=>{
            if($(e.target).val() == ''){
            	 passwordFlag1 = false;
                 $(e.target).css({'color':'red','border-bottom':'2px solid'});
                 $(e.target).next().css({'font-size': '1rem','font-weight': '600','transform':'none', 'color':'#969393'});
                 $(e.target).next().next().css('display','block');
            } else {
               passwordFlag1 = true;
               $(e.target).css({'color':'#484848','border-bottom':'1px solid'});
               $(e.target).next().next().css('display','none');
               $(e.target).next().css({'transform': 'translateY(-110%)','font-size': '0.775rem','font-weight': '100'});
               
            }
         }).click(e=>{
              $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
              $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'translateY(-110%)', 'color':'#212529'});
         }).focus(e=>{
              $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
              $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'translateY(-110%)', 'color':'#212529'});
            
         })
         
//          //수정창 열어서  새 비밀번호 클릭 시 (체크 : not-null, 형식 )
         $('#update-newPw-input').blur(e=>{
            if($(e.target).val() == ''){
            	 passwordFlag2_1 = false;
                 $(e.target).css({'color':'red','border-bottom':'2px solid'});
                 $(e.target).next().css({'font-size': '1rem','font-weight': '600','transform':'none', 'color':'#969393'});
                 $(e.target).next().next().css('display','block');
                 $("#newPw-type-ck, #newPw-type-ck-ul").css('display','none');
            } else {
            	passwordFlag2_1 = true;
               $(e.target).css({'color':'#484848','border-bottom':'1px solid'});
               $(e.target).next().next().css('display','none');
               $(e.target).next().css({'transform': 'translateY(-110%)','font-size': '0.775rem','font-weight': '100'});
               
               
            }
         }).click(e=>{
              $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
              $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'translateY(-110%)', 'color':'#212529'});
              $(e.target).next().next().css('display','none');
              $("#newPw-type-ck, #newPw-type-ck-ul").css('display','block');
              
         }).keyup(e=>{//비밀번호의 조건마다 밑에 글씨색을 바꿈.
               var val=$(e.target).val();
               var len=$(e.target).val().length;

               var t1=/[a-z]+/;
               var t2=/[A-Z]+/;
               var t3=/[0-9!@#$%^&*()-+=`~]+/;
               
               var ch=0;

               if(len>=8&&len<=20){
            	   passwordFlag2_2 = true;
                   $("#ul1").css({"color":"#0058a3", "font-weight":"500"});
               }else{
            	   passwordFlag2_2 = false;
                   $("#ul1").css({"color":"#212529", "font-weight":"100"});
               }
               if(t1.test(val)){
            	   passwordFlag2_3 = true;
                   $("#ul2").css({"color":"#0058a3", "font-weight":"500"});
               }else{
            	   passwordFlag2_3 = false;
                  $("#ul2").css({"color":"#212529", "font-weight":"100"});
               }
               if(t2.test(val)){
            	   passwordFlag2_4 = true;
                  $("#ul3").css({"color":"#0058a3", "font-weight":"500"});
               }else{
            	   passwordFlag2_4 = false;
                  $("#ul3").css({"color":"#212529", "font-weight":"100"});
               }
               if(t3.test(val)){
            	   passwordFlag2_5 = true;
                  $("#ul4").css({"color":"#0058a3", "font-weight":"500"});
               }else{
            	   passwordFlag2_5 = false;
                  $("#ul4").css({"color":"#212529", "font-weight":"100"});
               }
               console.log("키업 프래그2" + passwordFlag2_1 + passwordFlag2_2 + passwordFlag2_3 + passwordFlag2_4 + passwordFlag2_5);
           }).focus(e=>{
              $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
              $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'translateY(-110%)', 'color':'#212529'});
              $(e.target).next().next().css('display','none');
              $("#newPw-type-ck, #newPw-type-ck-ul").css('display','block');
            
         })
         
           //수정창 열어서 새 비밀번호 확인 창 클릭 시 (not null, 동일비밀번호체크)
         $('#update-newPwCk-input').blur(e=>{
            if($(e.target).val() == ''){
            	 passwordFlag3 = false;
                 $(e.target).css({'color':'red','border-bottom':'2px solid'});
                 $(e.target).next().css({'font-size': '1rem','font-weight': '600','transform':'none', 'color':'#969393'});
                 $(e.target).next().next().css('display','block');
                 $("#newPwCk-eq-ck").css('display','none');
            } else {
               $(e.target).css({'color':'#484848','border-bottom':'1px solid'});
               $(e.target).next().next().css('display','none');
               $(e.target).next().css({'transform': 'translateY(-110%)','font-size': '0.775rem','font-weight': '100'});
               
               console.log($("#update-newPw-input").val() + "/" + $("#update-newPwCk-input").val());
               if($("#update-newPw-input").val() != $("#update-newPwCk-input").val()){
            	   passwordFlag3 = false;
                  $(e.target).next().next().css('display','none');
                  $("#newPwCk-eq-ck").css('display','block');
               } else {
            	   passwordFlag3 = true;
                  $("#newPwCk-eq-ck").css('display','none');
               }
            }   
            
            
         }).click(e=>{
              $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
              $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'translateY(-110%)', 'color':'#212529'});
         }).focus(e=>{
              $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
              $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'translateY(-110%)', 'color':'#212529'});
            
         })
         //기본주소 수정창 열어서 상세주소 클릭 시 (not null)
         $('#update-addrDetail-input').blur(e=>{
              if($(e.target).val() == ''){
                 $(e.target).css({'color':'red','border-bottom':'2px solid'});
                 $(e.target).next().css({'transform': 'translateY(110%)','font-size': '1rem','font-weight': '600','color':'#969393'});
                 $(e.target).next().next().css('display','block');
              } else {
                 $(e.target).css({'color': '#484848', 'border-bottom': '1px solid', 'font-size':'1rem'});
                 $(e.target).next().next().css('display','none');
              }
              }).click(e=>{
                 $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
                 $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});
           }).focus(e=>{
              $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
              $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'none', 'color':'#212529'});    
         })
         
      
//========================================================================================================================================================         
         
         //이름 생일 정보수정
         $('#personal-submit').click(function(e){
            console.log(personalFlag1);
            console.log(personalFlag2);
            if(personalFlag1 == false || personalFlag2 == false) {
               return;
            }
            $.ajax({
               type: 'post',
               url: "${path}/member/updateMemberPersonal.do",
               data: $('#personal-submit-form').serialize(),            
               success: data=>{
                  console.log(data);
                  console.log($(i));
                  $(i).parent().nextAll().css('display','flex');
                  $(id + '-box').hide();
                  $(i).text('수정');
                  $('#updateName').text(data["name"]);
                  $('#title-name').text(data["name"]);
                  $('#updateBirth').text(data['birth']);
                  alert('개인정보가 저장되었습니다.');
               }
            })
         })
         
         //전화번호 수정
         $('#contact-submit').click(function(e){
            if(!contactFlag){
               return;
            }
            $.ajax({
               type: 'post',
               url: "${path}/member/updateMemberContact.do",
               data: $('#contact-submit-form').serialize(),            
               success: data=>{
                  console.log(data);
                  console.log($(i));
                  $(i).parent().nextAll().css('display','flex');
                  $(id + '-box').hide();
                  $(i).text('수정');
                  $('#updatePhone').text(data["phone"]);
                  alert('연락처가 저장되었습니다.');
               }
            })
         })
         
         //비밀번호 수정
         $('#password-submit').click(function(e){
            if(!passwordFlag1 || !passwordFlag2_1 || !passwordFlag2_2 || !passwordFlag2_3 || !passwordFlag2_4 || !passwordFlag2_5 || !passwordFlag3){
               return;
            }
            $.ajax({
               type: 'post',
               url: "${path}/member/updateMemberPassword.do",
               data: $('#password-submit-form').serialize(),            
               success: data=>{
                  console.log(data);
                  console.log($(i));
                  if(data == -2){
                	  alert('현재 패스워드가 맞지 않습니다.')
                  } else {
	                  $(i).parent().nextAll().css('display','flex');
	                  $(id + '-box').hide();
	                  $(i).text('수정');
	                  if(data > 0){
		                  alert('패스워드가 변경되었습니다.');
	                  } else{
	                	  alert('패스워드 변경에 실패하였습니다.');
	                  }
                  }
               }
            })
         })
         
         
      } else{ //닫기누를떄
         $(i).parent().nextAll().css('display','flex');
         $(id + '-box').hide();
         $(i).text('수정');
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
   
   /*    새 배송지 칸에서 수정 누르면  업데이트 창 나오게*/
   function fn_addAddrUpdate(e){
      var cs = ($(e).attr('class')).split(' ');
      var c = cs[1]; //두번째 클래스 네임 가져오기
      var i = (cs[1].split('-'))[2];
      console.log(i);
      if($(e).text() == '수정'){ //수정 누르면
            console.log($('.addr-disappear-'+i).attr('class'));
//          $.ajax({
//             url: '/'
//          })
      
      
      
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
   
</script>
   
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>