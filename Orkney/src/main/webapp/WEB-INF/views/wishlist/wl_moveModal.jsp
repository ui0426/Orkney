<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
	
        <div class="modal-content">
    		<div class="modal-title-box">
    			<h2 class="modal-title">다른 리스트로 이동</h2>
    			<button class="modal-closeBtn" onclick="fn_modalCloseBtn()"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" class="svg-inline--fa fa-times fa-w-11" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512"><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg></button>
    		</div>
    		<ul class="modal-list">
    			<c:forEach items="${wlList}" var="wish">
    			<c:if test="${wish.wishlist_no ne wNo}">
    			<li class="moveModal-li" onclick="fn_moveWishlist(this)"><input type="hidden" value="${ wish.wishlist_no }"/><input type="hidden" value="${ pNo }"/><input type="hidden" value="${ pQty }"/><c:out value="${wish.wishlist_name}" /></li>
    			</c:if>
    			</c:forEach>
    		</ul>
    	</div>

<script>
function fn_moveWishlist(e){
	let CwNo = '${wNo}';
	let MwNo = $(e).children().eq(0).val();
	let pNo = $(e).children().eq(1).val();
	let pQty = $(e).children().eq(2).val();
	
	$.ajax({
		type: 'post',
		data: {wNo:CwNo, MwNo: MwNo, pNo: pNo, pQty:pQty},
		url: '${path}/wishlist/moveWishlist.do',
		success: data=>{
			console.log(data);
			$('.wi-box').empty();
			$('.wi-box').html(data);
			$('#wl-moveModal').css('display','none');
		}
	})
}

function fn_modalCloseBtn(){
	
	$('#wl-moveModal').css('display','none');
}
// function fn_test(e){
// 	let wNo = $(e).children().eq(0).val();
// 	console.log(wNo);
	
// 	$.ajax({
// 		type: 'post',
// 		data: {wNo : wNo},
// 		url: "${ path}/wishlist/productlist.do",
// 		success: data =>{
// 			console.log(data);
// 			$('#test_box').empty();
// 			$('#test_box').html(data);
// 			let wlName = $(e).children().eq(1).text();
// 			$('#wl-name').text(wlName);
			
// 		}
// 	})
// }

</script>