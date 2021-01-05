<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>


      <!--Header-->
      <div class="do-modal-header">
        <p class="do-modal-title">위시리스트</p>
        <button type="button" class="do-modal-close">
          <span aria-hidden="true" class="white-text">&times;</span>
        </button>
      </div>
      <!--Body-->
      <div class="do-modal-body">상품이 위시리스트에 추가되었습니다.</div>
      <!--Footer-->
       <div class="do-modal-footer" onclick="location.href='${path}/wishlist/wishlist.do?addwNo=${wNo}'">
        <a type="button" class="do-modal-btn">위시리스트로 가기</a>        
      </div>
      
      <script>
      
     $(function(){
   		$('.do-modal-footer').mouseenter(e=>{
   			$('.do-modal-btn').css('text-decoration','underline');
   		})
   		$('.do-modal-footer').mouseleave(e=>{
   			$('.do-modal-btn').css('text-decoration','none');
   		})	
   		$('.do-modal-close').click(e=>{
			$('.wl-do-modal').removeClass('wl-do-modal-show');
		}).mouseenter(e=>{
			$('.do-modal-close').addClass('do-modal-close-background');
		}).mouseleave(e=>{
			$('.do-modal-close').removeClass('do-modal-close-background');
		})
     });
     
     </script>