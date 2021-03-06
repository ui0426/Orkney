<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

						
                        <div class="personal-information-row input-label-wrap">
                           <input type="text" id="name-input" class="origin-input-css" name="name">
                           <label for="name-input" class="input-label"><span>이름</span></label>
                           <span style="display: none;" class="msg-style">이름을 입력해 주세요.</span>
                        </div>
                        <div class="personal-information-row input-label-wrap">
                           <input type="text" id="phone-input" class="origin-input-css" name="phone">
                           <label for="phone-input" class="input-label"><span>휴대폰</span></label>
                           <span style="display: none;" class="msg-style">휴대폰 번호를 입력해 주세요.</span>
                           <span style="display: none;" class ="msg-style" id="phone-type-ck">휴대폰 번호가 올바르지 않습니다.</span>
                        </div>
                        <button type="button" class="addAddressBtn addrInsertBtn btn btn-blue btn-rounded">우편번호 찾기</button>
                        <div class="personal-information-row input-label-wrap">
                           <input type="text" class="origin-input-css disabled addaddr" name="addr">
                           <label for="name-input" class="input-label disabled"><span id="addrSpan">도로명 주소</span></label>
                        </div>
                        <div class="personal-information-row input-label-wrap">
                           <input id="address_detail" class="origin-input-css" type="text" value="" name="detail">
                           <label for="address_detail" class="input-label"><span>상세 주소</span></label>
                           <span style="display: none;" class="msg-style">상세주소를 입력해 주세요.</span>
                        </div>
                        <div class="personal-information-row input-label-wrap">
                           <input type="text" class="addpost origin-input-css disabled" name="post">
                           <label for="name-input" class="input-label disabled"><span id="postSpan">우편번호</span></label>
                        </div>
                        <div class="personal-information-btn">
                           <button type="button" id="addrInsertReset" class="btn btn-light btn-rounded">취소</button>
                           <button type="button" id="addrInsertSave" class="btn btn-dark btn-rounded">저장</button>
                        </div>
                        
<script>
//취소 눌렀을 때 
$('#addrInsertReset').click(e=>{
	$('#addAddrBtn-updatebox').empty();
	$('.addAddrBtn').text('새 배송 주소 추가');
})


$(function(){
	addInsertFlag1 = false;
	addInsertFlag2 = false;
	addInsertFlag3 = false;
	
})

//이름 클릭 시 (체크 : not-null )
$('#name-input').blur(e=>{
   if($(e.target).val() == ''){
	   addInsertFlag1 = false;
        $(e.target).css({'color':'red','border-bottom':'2px solid'});
        $(e.target).next().css({'font-size': '1rem','font-weight': '600','transform':'none', 'color':'#969393'});
        $(e.target).next().next().css('display','block');
   } else {
	   addInsertFlag1 = true;
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

//휴대폰 클릭 시 (체크 : not-null )
$('#phone-input').blur(e=>{
   if($(e.target).val() == ''){
	   addInsertFlag2 = false;
        $(e.target).css({'color':'red','border-bottom':'2px solid'});
        $(e.target).next().css({'font-size': '1rem','font-weight': '600','transform':'none', 'color':'#969393'});
        $(e.target).next().next().css('display','block');
   } else {
      $(e.target).css({'color':'#484848','border-bottom':'1px solid'});
      $(e.target).next().next().css('display','none');
      $(e.target).next().css({'transform': 'translateY(-110%)','font-size': '0.775rem','font-weight': '100'});
      
      var v=$(e.target).val().length;
      var val=$(e.target).val();
      var reg2= /^[0-9]*$/g;
      var reg=/^[01]{1}[1]{1}[0]{1}-[0-9]{4}-[0-9]{4}/g;
       
      if(v==11&&reg2.test(val)){
		  addInsertFlag2 = true;
          val=val.substr(0,3)+"-"+val.substr(3,4)+"-"+val.substr(7,4);
          $(e.target).val(val);
          $('#phone-type-ck').css('display','none');
      } else if(reg.test(val)){
    	  addInsertFlag2 = true;
         $('#phone-type-ck').css('display','none');
      } else {
    	  addInsertFlag2 = false;
         $('#phone-type-ck').css('display','block');
      }
   }
}).click(e=>{
     $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
     $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'translateY(-110%)', 'color':'#212529'});
}).focus(e=>{
     $(e.target).css({'color': '#0058a3', 'border-bottom': '2px solid'});
     $(e.target).next().css({'font-size': '0.775rem','font-weight': '100','transform':'translateY(-110%)', 'color':'#212529'});
   
})

//상세주소 클릭 시 (체크 : not-null )
$('#address_detail').blur(e=>{
   if($(e.target).val() == ''){
	   addInsertFlag3 = false;
        $(e.target).css({'color':'red','border-bottom':'2px solid'});
        $(e.target).next().css({'font-size': '1rem','font-weight': '600','transform':'none', 'color':'#969393'});
        $(e.target).next().next().css('display','block');
   } else {
	   addInsertFlag3 = true;
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

//주소추가하기
$('#addrInsertSave').click(function(e){
    console.log(addInsertFlag1 + "/" + addInsertFlag2 + "/" + addInsertFlag3);
    if(addInsertFlag1 == false || addInsertFlag2 == false || addInsertFlag3 == false){
       return;
    }
    
    console.log($('#addrInsert-submit-form').serialize());
    
    $.ajax({
       type: 'post',
       url: "${path}/member/insertAddr.do",
       data: $('#addrInsert-submit-form').serialize(),            
       success: data=>{
          console.log(data);
          $('.addAddrBtn').text('새 배송 주소 추가');
          $('#addAddrBtn-updatebox').css('display','none');
          
          $.parseHTML(data);
		  $('#addr-list-row').html(data);
          
          alert('주소가 저장되었습니다.');
       }
    })
 })

/* 주소 api */
$(".addrInsertBtn").click(e=>{
   //클릭한 주소찾기 버튼의 인덱스
   var addAddressBtnIindex = $('.addrInsertBtn').index(e.target);
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
			$('#addrSpan').text('');            
			$('#postSpan').text('');            
            $('.addpost').val(data.zonecode);
            $('.addaddr').val(addr);
            // 커서를 상세주소 필드로 이동한다.
            $("#address_detail").focus();
            console.log(data.zonecode+" : "+addr+" : "+extraAddr);
        }
    }).open();
})

</script>