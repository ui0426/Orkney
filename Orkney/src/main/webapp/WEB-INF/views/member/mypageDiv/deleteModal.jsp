<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>




		<div class="delete-close" onclick="history.back();">
			<span>
	            <svg width="1em" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" class="svg-inline--fa fa-times fa-w-11" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512"><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg>
	        </span>
        </div>
        <div class="margin delete-title">정말로 탈퇴하시겠습니까?</div>
        <div class="margin delete-msg1">계정을 없애고 싶으신 경우 계정 삭제를 처리해드릴게요.</div>
        <div class="margin delete-msg1">계정을 없애고 싶으신 경우 계정 삭제를 처리해드릴게요. 계정을 없애시면 Orkney Family 멤버쉽 혜택을 더 이상 누리실 수 없습니다. 계정의 모든 개인정보 및 위시리스트가 모두 삭제됩니다.</div>
        <div class="margin delete-msg1">언제든지 다시 가입하실 수 있어요!</div>
        <div class="margin">
        	<div class="delete-msg2">질문이 있으세요?</div>
        	<div class="delete-msg1">문의하기 <a class="underline">고객지원</a></div>
        </div>
        <div class="margin margin2">
        <div class="delete-msg2">비밀번호</div>
        <div class="delete-msg1">계정을 삭제하시려면 비밀번호를 입력해주세요.</div>
        </div>
        <div class="personal-information-row input-label-wrap" style="height: 4em;">
           <input type="password" id="update-originPw-input" class="origin-input-css" name="originPw">
           <label for="update-originPw-input" class="input-label"><span>현재 비밀번호</span></label>
           <span style="display: none; text-align: initial" class="msg-style">현재 비밀번호를 입력해 주세요.</span>
        </div>
        <button id="deleteMemberBtn">계정삭제</button>
        
        <script>
        let passwordCkFlag = false;
        $('#update-originPw-input').blur(e=>{
        	   if($(e.target).val() == ''){
        		   passwordCkFlag = false;
        	        $(e.target).css({'color':'red','border-bottom':'2px solid'});
        	        $(e.target).next().css({'font-size': '1rem','font-weight': '600','transform':'none', 'color':'#969393'});
        	        $(e.target).next().next().css('display','block');
        	   } else {
        		   passwordCkFlag = true;
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
        	
        	$('#deleteMemberBtn').click(e=>{
        		console.log(passwordCkFlag);
        		let ck = confirm('정말로 탈퇴하실건가요?');
        		if(ck == false){
        				
        		} else {
        			if(passwordCkFlag == false){
        				$('#update-originPw-input').focus().trigger("click").blur().focus();
        				return;
        			} else {
        				let pw = $('#update-originPw-input').val();
        				$.ajax({
        					type: 'post',
        					url: '${path}/member/deleteMember.do',
        					data: {pwck : pw},
        					success: data=>{
        						if(data == -2){
        							alert('비밀번호가 틀렸습니다.')
        						} else {
        							alert('탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.');
        							location.href="/";
        						}
        					},
        					error: (request,status,error)=>{
        						alert('탈퇴에 실패하였습니다. 고객지원에 문의바랍니다.');
        					}
        				})
        			}
        		}
        	})
        </script>