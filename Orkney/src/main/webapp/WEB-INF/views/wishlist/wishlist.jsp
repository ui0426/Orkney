<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${ path }/resources/css/wishlist/wishlist.css">

<section>
	<!-- 위시리스트 모달창 -->
	<div class="modal-box wl-modal-box" id="wl_selectModal">
		
    </div>
    
    <!-- 다른 리스트로 제품이동 모달창 -->
    <div class="modal-box wl-moveModal-box" id="wl-moveModal">
    </div>
    
	<div class="wi-box">
		<h1 class="wl-selector" id="wl-name" onclick="fn_wlSelector(this)">${ wish.wishlist_name }<span></span></h1> <!--눌렀을 때 모달창-->
           <c:if test="${ wish.wishlist_detail.isEmpty() }">
           <div id="test_box">
	       <div>위시리스트 없쩡</div>
	       </div>
	       </c:if>
	       
        <div class="product-list"> <!--제품 쫘롸락 나오는 박스-->
           
	       <c:if test="${ !wish.wishlist_detail.isEmpty() }">
	       <div id="test_box">
	       <c:forEach items="${ wish.wishlist_detail }" var="wide">
	       <input class="only_wNo" type="hidden" value="${ wish.wishlist_no }"/>
	       <input class="only_pNo" type="hidden" value="${ wide.product.productNo }"/>
	       <input class="only_pQty" type="hidden" value="${ wide.product_qty }"/>
	       <input class="only_pPrice" type="hidden" value="${ wide.product.productPrice }"/>
           <div class="product-box"> <!-- 제품설명 박스 -->
               <div class="product-img"><figure style="background: url(${ path }/resources/images/product/${ wide.product.product_image.product_pic });"></figure></div>
               <div class="product-description">
               		<h2><c:out value="${ wide.product.productName}"/></h2>
               		<ul>
               			<li><c:out value="${ wide.small_category_content }"/></li>
               			<li><c:out value="${ wide.product.productColor }"/></li>
               		</ul>
               </div>
               <div class="product-price"><span>&#8361;</span><span><fmt:formatNumber value="${ wide.product.productPrice * wide.product_qty}" pattern="###,###"/></span><c:if test="${ wide.product_qty > 1 }" ><div class="pricePerQty">&#8361; <fmt:formatNumber value="${ wide.product.productPrice}" pattern="###,###"/> / 개</div></c:if></div>
	           <div class="product-control"> <!-- 리스트컨트롤 박스 -->
	           	   <c:if test="${wlList.size() > 1 }">
	               <div class="product-movelist" onclick="fn_moveList(this)">다른 리스트로 이동</div> <!-- 눌렀을 때 모달창 -->
	               </c:if>
		           <div class="product-controlDetail"> <!-- 삭제, 수량, 장바구니 추가 -->
		                <div class="delete js_deleteImg" onclick="fn_deleteImg(this)"><button><svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="trash-alt" class="svg-inline--fa fa-trash-alt fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M268 416h24a12 12 0 0 0 12-12V188a12 12 0 0 0-12-12h-24a12 12 0 0 0-12 12v216a12 12 0 0 0 12 12zM432 80h-82.41l-34-56.7A48 48 0 0 0 274.41 0H173.59a48 48 0 0 0-41.16 23.3L98.41 80H16A16 16 0 0 0 0 96v16a16 16 0 0 0 16 16h16v336a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V128h16a16 16 0 0 0 16-16V96a16 16 0 0 0-16-16zM171.84 50.91A6 6 0 0 1 177 48h94a6 6 0 0 1 5.15 2.91L293.61 80H154.39zM368 464H80V128h288zm-212-48h24a12 12 0 0 0 12-12V188a12 12 0 0 0-12-12h-24a12 12 0 0 0-12 12v216a12 12 0 0 0 12 12z"></path></svg></button></div>
		                <div class="count-box">
		                	<input type="text" value="${wide.product_qty }">
		                	<button onclick="fn_countUpBtn(this)" type="button" class="countBtn btn_up" style="border-bottom: 1px solid #666; padding: 0px 4px;"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="caret-up" class="svg-inline--fa fa-caret-up fa-w-10" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path fill="currentColor" d="M288.662 352H31.338c-17.818 0-26.741-21.543-14.142-34.142l128.662-128.662c7.81-7.81 20.474-7.81 28.284 0l128.662 128.662c12.6 12.599 3.676 34.142-14.142 34.142z"></path></svg></button>
		                	<button onclick="fn_countDownBtn(this)" type="button" class="countBtn btn_down"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="caret-down" class="svg-inline--fa fa-caret-down fa-w-10" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><path fill="currentColor" d="M31.3 192h257.3c17.8 0 26.7 21.5 14.1 34.1L174.1 354.8c-7.8 7.8-20.5 7.8-28.3 0L17.2 226.1C4.6 213.5 13.5 192 31.3 192z"></path></svg></button>
		                </div>
		                <div class="addCart"><button class="wl-oneAddcart-btn">장바구니에 추가</button></div>
		                <div class="deleteBtn-box" style="display: none;">
		                	<div class="deleteBtn-text"><p>이 제품을 삭제하시겠어요?</p></div>
		                	<div class="deleteBtn-reset" onclick="fn_deleteBtnReset(this)"><button>취소</button></div>
		                	<div class="deleteBtn-delete" onclick="fn_deleteBtnDelete(this)"><input type="hidden" value="${ wish.wishlist_no }"><input type="hidden" value="${ wide.product.productNo }"><button>삭제</button></div>
		                </div>
		           </div> 
	           </div>
           </div>
           </c:forEach>
           </div>
           </c:if>
	       <div class="wl-price"> 
				<span>총 주문금액</span>
				<span>&#8361; <fmt:formatNumber value="${ allPrice }" pattern="###,###"/></span>
	       </div>
        <div class="wl-addcart"><button class="wl-allAddcart-btn">모두 장바구니에 추가</button></div>
       </div>
    </div>
	
	
</section>

<script>

	//수량 업 버튼 클릭 시
	function fn_countUpBtn(e){
		let t = $(e);
		let i = $('.btn_up').index(t);
		let wNo = $('.only_wNo').eq(i).val();
		let pNo = $('.only_pNo').eq(i).val();
		console.log(i);
		console.log(pNo + "/" + wNo);
		
		return new Promise((resolve, reject)=>{
			
			$.ajax({
				type: 'post',
				data: {pNo : pNo, wNo: wNo},
				url: '${path}/wishlist/countUp.do',
				success: data=>{
					console.log(data);
					resolve(data);
					
				}
			})
			
		}).then(arg => {
			if(arg > 0){//카운트 업이 된다면~~
				$.ajax({
					type: 'post',
					data: {wNo : wNo},
					url: '${ path }/wishlist/productlist.do',
					success: data=>{
						console.log(data);
						$('.wi-box').html(data);
					}
				})
			}
		})		
	}

	//수량 다운 버튼 클릭 시
	function fn_countDownBtn(e){
		let t = $(e);
		let i = $('.btn_down').index(t);
		let wNo = $('.only_wNo').eq(i).val();
		let pNo = $('.only_pNo').eq(i).val();
		let pQty = $('.count-box').eq(i).children('input').val();
		console.log(i);
		console.log(pNo + "/" + wNo);

		return new Promise((resolve, reject)=>{
			console.log(pQty == 1);
			if(pQty == 1) return;
			$.ajax({
				type: 'post',
				data: {pNo : pNo, wNo: wNo},
				url: '${path}/wishlist/countDown.do',
				success: data=>{
					console.log(data);
					resolve(data);
					
				}
			})
			
		}).then(arg => {
			if(arg > 0){//카운트 다운이 된다면~~
				$.ajax({
					type: 'post',
					data: {wNo : wNo},
					url: '${ path }/wishlist/productlist.do',
					success: data=>{
						console.log(data);
						$('.wi-box').html(data);
					}
				})
			}
		})		
	}
// 	function fn_countUpBtn(e){
// 		let t = $(e);
// 		let i = $('.btn_up').index(t);
// 		let wNo = $('.only_wNo').eq(i).val();
// 		let pNo = $('.only_pNo').eq(i).val();
// 		let pQty = $('.count-box').children('input').val();
		
// 		let pPriceStr = $('.only_pPrice').eq(i).val();
// 		let pPrice = parseInt(pPriceStr); //제품 1개당 가격
		
// 		console.log(i);
// 		console.log(pNo + "/" + wNo);
// 		$.ajax({
// 			type: 'post',
// 			data: {pNo : pNo, wNo: wNo},
// 			url: '${path}/wishlist/countUp.do',
// 			success: data=>{
// 				console.log(data);
// 				if(data > 0){
// 					let c = parseInt(pQty)
// 					let pStr = $('.product-price').eq(i).children().eq(1).text();
// 					let p = parseInt(pStr); //제품 가격 * 갯수
// 					console.log(typeof(pPrice) + pPrice);
// 					console.log(typeof(p) + p);
// 					let p2 = pPrice + p;
// 					console.log(p2);
					
// 					let regexp = /\B(?=(\d{3})+(?!\d))/g; 
// 					p = p2.toString().replace( regexp, ',' );

// 					$('.count-box').children('input').val(c + 1);
// 					$('.product-price').eq(i).children().eq(2).text(p);
					
// 				} else { 
// 					alert('수량올리기 실패~~');
// 				}
// 			}
// 		})
// 	}

	//휴지통 이모티콘 클릭 시 아래에 메세지 div 보이게 하기
	function fn_deleteImg(e){
		let t = $(e);
		let i = $('.js_deleteImg').index(t);
		$('.product-controlDetail').eq(i).children().css('display','none');
		$('.product-movelist').eq(i).css('display','none');
		$('.deleteBtn-box').eq(i).css('display','flex');
	}
	
	function fn_deleteBtnReset(e){
		let t = $(e);	
		let i = $('.deleteBtn-reset').index(t);
		$('.product-controlDetail').eq(i).children().css('display','grid');
		$('.product-movelist').eq(i).css('display','grid');
		$('.deleteBtn-box').eq(i).css('display','none');
	}
	
	function fn_deleteBtnDelete(e){
		let wNo = $(e).children().eq(0).val();
		let pNo = $(e).children().eq(1).val();
		let data = {wNo:wNo, pNo:pNo};			
		$.ajax({
			type: 'post',
			data: data,
			url: "${path}/wishlist/deleteWishProduct.do",
			success: data=>{
				console.log(data);
				$('.wi-box').empty();
				$('.wi-box').html(data);
			}	
		
		})
	}
	
	


	//다른 위시리스트 이동 클릭 시 모달창 나옴
	function fn_moveList(e){
		$('.wl-moveModal-box').css('display','flex');	
		
		let t = $(e);
		console.log(t);
		let i = $('.product-movelist').index(t);
		console.log(i);
		let wNo = $('.only_wNo').eq(i).val();
		let pNo = $('.only_pNo').eq(i).val();
		let pQty = $('.only_pQty').eq(i).val();
		console.log(wNo + pNo + pQty);
		
		$.ajax({
			type: 'post',
			url: '${ path }/wishlist/moveModal.do',
			data: {wNo: wNo, pNo:pNo, pQty:pQty},
			success: function(data){
				console.log(data);
				$('#wl-moveModal').html(data);
			}
			
		})
	}
	
	//위시리스트 이름 클릭 시 모달
	function fn_wlSelector(e){
		$('#wl_selectModal').empty();
		$('#wl_selectModal').css('display','flex');
		
		$.ajax({
			type: 'post',
			url: '${ path }/wishlist/wishlistList.do',
			success: function(data){
				console.log(data);
				$('#wl_selectModal').html(data);
			}
			
		})
	}
	
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>