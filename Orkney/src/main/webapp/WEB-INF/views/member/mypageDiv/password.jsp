<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
						
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
                           <button type="button" id="password-reset">취소</button>
                           <button type="button" id="password-submit">저장</button>
                        </div>

<script>
//취소 눌렀을 때 
$('#password-reset').click(e=>{
	$(e.target).parent().parent().prevAll().css('display','flex');
	$('#password-box').empty();
	$('#password').text('수정');
})


//수정창 열어서 현재 비밀번호 클릭 시 (체크 : not-null )
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

// //수정창 열어서  새 비밀번호 클릭 시 (체크 : not-null, 형식 )
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
         if(data == -2){
       	  alert('현재 패스워드가 맞지 않습니다.')
         } else {
       	$('#password').text('수정');
       	  $('#password-box').prevAll().css('display','flex');
          $('#password-box').empty().css('display','block');
          
          if(data > 0){
           alert('패스워드가 변경되었습니다.');
          } else{
        	  alert('패스워드 변경에 실패하였습니다.');
          }
         }
      }
   })
})
</script>