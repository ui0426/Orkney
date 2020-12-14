<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

						<div class="personal-information-row input-label-wrap">
						   <input type="hidden" class="only_address_no update-no-input${ address.address_no }" name="address_no" value="${address.address_no }"/>
                           <input type="text" class="origin-input-css update-name-input${ address.address_no }" value="${ address.address_name }">
                           <label for="update-name-input" class="input-label-2"><span>이름</span></label>
                           <span style="display: none;" class="msg-not-null">이름을 입력해 주세요.</span>
                        </div>
                        <div class="personal-information-row input-label-wrap">
                           <input type="text" class="origin-input-css update-phone-input${ address.address_no }" value="${ address.address_phone }">
                           <label for="" class="input-label-2"><span>휴대폰</span></label>
                           <span style="display: none;" class="msg-style">휴대폰 번호를 입력해 주세요.</span>
                           <span style="display: none;" class ="msg-style" id="phone-type-ck">휴대폰 번호가 올바르지 않습니다.</span>
                        </div>
                        <button type="button" class="addAddressBtn${ address.address_no }">우편번호 찾기</button>
                        <div class="personal-information-row">
                           <span class="title">도로명 주소</span>
                           <input class="disabled address_addr${address.address_no }" type="text" value="${ address.address_addr }" readonly>
                        </div>
                        <div class="personal-information-row input-label-wrap">
                           <input class="address_detail${address.address_no }" type="text" value="${ address.address_detail }">
                           <label for="" class="input-label-2"><span>상세 주소</span></label>
                           <span style="display: none;" class="msg-style">상세주소를 입력해 주세요.</span>
                        </div>
                        <div class="personal-information-row">
                           <span class="title">우편번호</span>
                           <input class="disabled address_post${address.address_no }" type="text" value="${ address.address_post }" readonly>
                        </div>
                        <div class="personal-information-btn">
                           <button type="button" class="resetBtn">취소</button>
                           <button type="button" class="submitBtn">저장</button>
                           <button type="button" class="deleteBtn">주소삭제</button>
                        </div>

<script>
//취소 눌렀을 때 
$('.resetBtn').click(e=>{
	let t = $(e.target);
	let i = $('.resetBtn').index(t);
	$('.addr-disappear').eq(i).css('display','block');
//     $('.addr-disappear').eq(i).next('hr').css('display','none');
    $('.addr-update-box').eq(i).css('display','none');
	$('.addAddr-aTag').eq(i).text('수정');
})
//수정창 열어서 이름 클릭 시 (체크 : not-null)
$('.update-name-input${ address.address_no }').blur(e=>{
   
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

//수정창 열어서 연락처 클릭 시 (체크 : not-null, 형식 )
$(".update-phone-input${ address.address_no }").blur(e=>{
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

//기본주소 수정창 열어서 상세주소 클릭 시 (not null)
$('.address_detail${address.address_no }').blur(e=>{
     if($(e.target).val() == ''){
    	addressFlag = false;
        $(e.target).css({'color':'red','border-bottom':'2px solid'});
        $(e.target).next().css({'transform': 'translateY(110%)','font-size': '1rem','font-weight': '600','color':'#969393'});
        $(e.target).next().next().css('display','block');
     } else {
    	addressFlag = true;
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

//기본주소 수정
$('.submitBtn').click(function(e){
	let addrUpdateBox = $('.submitBtn').parent().parent();
	let i = $('.addr-update-box').index(addrUpdateBox);
	
	let no = $('.update-no-input${ address.address_no }').val();
	let name = $('.update-name-input${ address.address_no }').val();
	let phone = $('.update-phone-input${ address.address_no }').val();
	let addr = $('.address_addr${address.address_no }').val();
	let detail = $('.address_detail${address.address_no }').val();
	let post = $('.address_post${address.address_no }').val();
	
	console.log(i);
	console.log(personalFlag1 + "/" +  contactFlag + "/" +  addressFlag);
	
   if(personalFlag1 == false || contactFlag == false || addressFlag == false) {
	      return;
	   }
   
   		
   		let data = {address_no:no, address_name:name, address_phone:phone, address_addr:addr, address_detail:detail, address_post:post};
   		
	   $.ajax({
	      type: 'post',
	      url: "${path}/member/updateMemberAddress.do",
	      data: data,            
	      success: data=>{
	         console.log(data);
	         $('.addAddr-aTag').eq(i).text('수정');
	         $('.addr-disappear').eq(i).css('display','block');
// 	         $('.addr-disappear').eq(i).next('hr').css('display','block');
	         $('.addr-update-box').eq(i).css('display','none');
	         
	         
	         $('.addr-disappear').eq(i).children().eq(0).children().text(name);
	         $('.addr-disappear').eq(i).children().eq(1).text(addr);
	         $('.addr-disappear').eq(i).children().eq(2).text(detail);
	         $('.addr-disappear').eq(i).children().eq(3).text(post);
	         $('.addr-disappear').eq(i).children().eq(6).text(phone);
	         alert('주소가 저장되었습니다.');
	      }
	})
	
 })

 $('.deleteBtn').click(e=>{
	 let t = $(e.target);
	 let i = $('.deleteBtn').index(t);
	 let addrNo = $('.only_address_no').eq(i).val();
	 
	 $.ajax({
		 type: 'post',
		 data: {addrNo : addrNo},
		 url: '${path}/member/deleteAddress.do',
		 success: data=>{
			 console.log(data);
			 $.parseHTML(data);
			 $('#addr-list-row').html(data);
		 }
	 })
 })


/* 주소 api */
$(".addAddressBtn${address.address_no}").click(e=>{
   //클릭한 주소찾기 버튼의 인덱스
   var addAddressBtnIindex = $('.addAddressBtn').index(e.target);
//    $('.addr').eq(addAddressBtnIindex).addClass('addr'+addAddressBtnIindex);
//    $('.post').eq(addAddressBtnIindex).addClass('post'+addAddressBtnIindex);
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
            $('.address_post${address.address_no }').eq(addAddressBtnIindex).val(data.zonecode);
            $('.address_addr${address.address_no }').eq(addAddressBtnIindex).val(addr);
            // 커서를 상세주소 필드로 이동한다.
            $("#detailadr").focus();
            console.log(data.zonecode+" : "+addr+" : "+extraAddr);
        }
    }).open();
})
</script>