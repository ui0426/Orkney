<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
			<c:forEach items="${ wish.wishlist_detail }" var="p">
			<input class="only_wl_no" type="text" value="${ p.wishlist_no }">
			<div class="product-box"> <!--제품설명 박스-->
               <div class="product-img"><figure style="background: url(${ path }/resources/img/mdb-favicon.ico);"></figure></div>
               <div class="product-description">
               		<h2>상품이름</h2>
               		<ul>
               			<li>설명1</li>
               			<li>설명2</li>
               		</ul>
               </div>
               <div class="product-price"> &#8361; 1,000,000</div>
	           <div class="product-control"> <!--리스트컨트롤 박스-->
	               <div class="product-movelist" onclick="fn_test2()">다른 리스트로 이동</div> <!--눌렀을 때 모달창-->
		           <div class="product-controlDetail"> <!--삭제, 수량, 장바구니 추가-->
		                <div class="delete"><button><svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="trash-alt" class="svg-inline--fa fa-trash-alt fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M268 416h24a12 12 0 0 0 12-12V188a12 12 0 0 0-12-12h-24a12 12 0 0 0-12 12v216a12 12 0 0 0 12 12zM432 80h-82.41l-34-56.7A48 48 0 0 0 274.41 0H173.59a48 48 0 0 0-41.16 23.3L98.41 80H16A16 16 0 0 0 0 96v16a16 16 0 0 0 16 16h16v336a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V128h16a16 16 0 0 0 16-16V96a16 16 0 0 0-16-16zM171.84 50.91A6 6 0 0 1 177 48h94a6 6 0 0 1 5.15 2.91L293.61 80H154.39zM368 464H80V128h288zm-212-48h24a12 12 0 0 0 12-12V188a12 12 0 0 0-12-12h-24a12 12 0 0 0-12 12v216a12 12 0 0 0 12 12z"></path></svg></button></div>
		                <div class="count-box">
		                	<input type="text">
		                	<button type="button" class="countBtn btn_up" style="border-bottom: 1px solid #666; padding: 0px 4px;"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="caret-up" class="svg-inline--fa fa-caret-up fa-w-10" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path fill="currentColor" d="M288.662 352H31.338c-17.818 0-26.741-21.543-14.142-34.142l128.662-128.662c7.81-7.81 20.474-7.81 28.284 0l128.662 128.662c12.6 12.599 3.676 34.142-14.142 34.142z"></path></svg></button>
		                	<button type="button" class="countBtn btn_down"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="caret-down" class="svg-inline--fa fa-caret-down fa-w-10" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path fill="currentColor" d="M31.3 192h257.3c17.8 0 26.7 21.5 14.1 34.1L174.1 354.8c-7.8 7.8-20.5 7.8-28.3 0L17.2 226.1C4.6 213.5 13.5 192 31.3 192z"></path></svg></button>
		                </div>
		                <div class="addCart"><button class="wl-oneAddcart-btn">장바구니에 추가</button></div> <!-- 에이젝스처리 -->
		           </div> 
	           </div>
           </div>
           </c:forEach>
           
           <script>
           function fn_test2(){
        	   let a = $('.only_wl_no').val();
        	   $.ajax({
        		   url: "${ path }/test2.do",
        		   success: function(data){
        			   console.log(data);
        		   }
        	   })
           }
           </script>
