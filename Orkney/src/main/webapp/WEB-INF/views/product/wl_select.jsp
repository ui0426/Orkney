<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

	      <!--Header-->
      <div class="modal-header">
        <p class="heading">위시리스트</p>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times;</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="row">
          <div class="col-9">
            <p>어느 위시리스트에 추가하시겠습니까?</p>
            <div class="form-check">
            <c:forEach items="${ wlList }" var="wl">
			  <input
			    class="form-check-input"
			    type="radio"
			    name="flexRadioDefault"
			    id="${wl.wishlist_no }"
			    value="${wl.wishlist_no }"
			  />
			  <label class="form-check-label" for="${wl.wishlist_no }"><c:out value="${ wl.wishlist_name }"/></label>
			  <br>
			  </c:forEach>
			</div>
          </div>
        </div>
      </div>
      <!--Footer-->
      <div class="modal-footer justify-content-center">
        <a type="button" class="btn btn-info" onclick="fn_addWish()" >위시리스트에 담기</a>        
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
			$('#insertWish').empty();
			$('#insertWish').html(data);
			console.log(data);
// 			$('.wi-box').empty();
// 			$('.wi-box').html(data);
// 			$('#wl-moveModal').css('display','none');
		}
	})
}

	
</script> 
			  