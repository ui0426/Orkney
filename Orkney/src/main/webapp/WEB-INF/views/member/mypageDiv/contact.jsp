<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
						
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
                           <button type="button" id="contact-reset">취소</button>
                           <button type="button" id="contact-submit">저장</button>
                        </div>
                        
<script>
//취소 눌렀을 때 
$('#contact-reset').click(e=>{
	$(e.target).parent().parent().prevAll().css('display','flex');
	$('#contact-box').empty();
	$('#contact').text('수정');
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
          $('#contact').text('수정');
          $('#contact-box').prevAll().css('display','flex');
          $('#contact-box').empty().css('display','block');
          $('#updatePhone').text(data["phone"]);
          alert('연락처가 저장되었습니다.');
       }
    })
 })
</script>