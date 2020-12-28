<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

					<button type="button" class="addAddressBtn btn btn-blue btn-rounded">우편번호 찾기</button>
                     <div class="personal-information-row">
                        <span class="title">도로명 주소</span>
                        <input id="address_addr" class="disabled addr" type="text" name="address_addr" value="${ addr.address_addr }" readonly>
                     </div>
                     <div class="personal-information-row input-label-wrap">
                        <input id="address_detail" type="text" name="address_detail" value="${ addr.address_detail }">
                        <label for="update-addrDetail-input" class="input-label-2"><span>상세 주소</span></label>
                        <span style="display: none;" class="msg-style">상세주소를 입력해 주세요.</span>
                     </div>
                     <div class="personal-information-row">
                        <span class="title">우편번호</span>
                        <input id="address_post" class="disabled post" type="text" name="address_post" value="${ addr.address_post }" readonly>
                     </div>
                     <div class="personal-information-btn">
                        <button type="button" id="address-reset" class="btn btn-light btn-rounded">취소</button>
                        <button type="button" class="submitBtn btn btn-dark btn-rounded" id="address-submit" >저장</button>
                     </div>

<script>
//취소 눌렀을 때 
$('#address-reset').click(e=>{
	$(e.target).parent().parent().prevAll().css('display','flex');
	$('#address-box').empty();
	$('#address').text('수정');
})

/* 주소 api */
$(".addAddressBtn").click(e=>{
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
            $('.post').eq(addAddressBtnIindex).val(data.zonecode);
            $('.addr').eq(addAddressBtnIindex).val(addr);
            // 커서를 상세주소 필드로 이동한다.
            $("#detailadr").focus();
            console.log(data.zonecode+" : "+addr+" : "+extraAddr);
        }
    }).open();
})


//기본주소 수정창 열어서 상세주소 클릭 시 (not null)
$('#address_detail').blur(e=>{
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

//기본주소 수정
$('#address-submit').click(function(e){
	let v = $('#address_detail').val();
	console.log(v);
    if(v == ""){
       return;
    }
    let addr = $('#address_addr').val();
    let detail = $('#address_detail').val();
    let post = $('#address_post').val();
    
    console.log($('#address-submit-form').serialize());
    
    $.ajax({
       type: 'post',
       url: "${path}/member/updateMemberAddress.do",
       data: $('#address-submit-form').serialize(),            
       success: data=>{
          console.log(data);
          $('#address').text('수정');
          $('#address-box').prevAll().css('display','flex');
          $('#address-box').empty().css('display','block');
          $('#addr').text(addr);
          $('#detail').text(detail);
          $('#post').text(post);
          
          alert('주소가 저장되었습니다.');
       }
    })
 })
</script>