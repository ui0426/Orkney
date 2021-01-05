<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

						
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
                           <button type="button" id="personal-reset" class="btn btn-light btn-rounded">취소</button>
                           <button type="button" id="personal-submit" class="btn btn-dark btn-rounded">저장</button>
                        </div>
                        
<script>
//취소 눌렀을 때 
$('#personal-reset').click(e=>{
	$(e.target).parent().parent().prevAll().css('display','flex');
	$('#personal-box').empty();
	$('#personal').text('수정');
})

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
     	 console.log('${login}');
         $('#personal').text('수정');
         $('#personal-box').prevAll().css('display','flex');
         $('#personal-box').empty().css('display','block');
         $('#updateName').text(data["name"]);
         $('#title-name').text(data["name"]);
         $('#updateBirth').text(data['birth']);
         alert('개인정보가 저장되었습니다.');
      }
   })
})
</script>