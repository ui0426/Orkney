<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

	      <!--Header-->
      <div class="do-modal-header">
        <p class="do-modal-title">위시리스트를 선택해주세요.</p>
        <button type="button" class="do-modal-close">
          <span aria-hidden="true" class="white-text">&times;</span>
        </button>
      </div>
      <!--Body-->
      <div class="do-modal-body">
<!--         <div class="row"> -->
<!--           <div class="col-9"> -->
            <div class="form-check">
            <c:forEach items="${ wlList }" var="wl">
            	<li class="form-li">
				  <input
				    class="form-check-input"
				    type="radio"
				    name="flexRadioDefault"
				    id="${wl.wishlist_no }"
				    value="${wl.wishlist_no }"
				  />
				  <label class="form-check-label" for="${wl.wishlist_no }"><c:out value="${ wl.wishlist_name }"/></label>
			  </li>
			  </c:forEach>
			</div>
<!--           </div> -->
<!--         </div> -->
      </div>
      <!--Footer-->
      <div class="do-modal-footer"  onclick="fn_addWish()">
        <a type="button" class="do-modal-btn" >위시리스트에 담기</a>        
      </div>




			
<script>
function fn_addWish(){
	console.log($(":input:radio[name='flexRadioDefault']:checked").val());
	let pNo = "${pNo}";
	let wNo = $(":input:radio[name='flexRadioDefault']:checked").val();
	$.ajax({
		type: 'post',
		data: { pNo: pNo, IwNo: wNo},
		url: '${path}/wishlist/insertWish.do',
		success: data=>{
			$.parseHTML(data);
			$('.wl-do-modal').empty();
			$('.wl-do-modal').html(data);
			console.log(data);
// 			$('.wi-box').empty();
// 			$('.wi-box').html(data);
// 			$('#wl-moveModal').css('display','none');
		}
	})
}
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
})
	
</script> 
			  