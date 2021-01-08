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
    <div class="modal-box wl-modal-box" id="wl_selectModal" style="display: none;">
    </div>
    <!-- 다른 리스트로 제품이동 모달창 -->
    <div class="modal-box wl-moveModal-box" id="wl-moveModal">
    </div>
    
	<div class="wi-box">
		<h1 class="wl-selector" id="wl-name" onclick="fn_wlSelector(this)"><p class="wl-name">${ wish.wishlist_name }<span></span></p></h1> <!--눌렀을 때 모달창-->
           <c:if test="${ wish.wishlist_detail.isEmpty() }">
	           <div id="no-box">
		       	<img src="${path }/resources/img/svg/no_wishlist.svg">
		       	<div class="no-text"><p>시간이 더 필요하신가요.?</p><p>저장한 후 나중에 구매해보세요.</p></div>
		       <button type="button"  onclick="location.href='${path}'" class="search-btn">제품검색</button>
		       </div>
	       </c:if>
	       
        <div class="product-list"> <!--제품 쫘롸락 나오는 박스-->           
	       <c:if test="${ !wish.wishlist_detail.isEmpty() }">
	       <div id="test_box">
	       <c:forEach items="${ wish.wishlist_detail }" var="wide">
	       <input class="only_wNo" type="hidden" value="${ wish.wishlist_no }"/>
	       <input class="only_pNo" type="hidden" value="${ wide.product.productNo }"/>
	       <input class="only_pQty" type="hidden" value="${ wide.product_qty }"/>
	       <input class="only_pPrice" type="hidden" value="${ wide.product.sale_per }"/>
           <div class="product-box"> <!-- 제품설명 박스 -->
               <div class="product-img"><figure style="background: url(${ path }/resources/images/product/${ wide.product.product_image.product_pic });"></figure></div>
               <div class="product-description">
               		<h2 onclick="location.href='${path}/product/productDetail.do?productno=${wide.product.productNo }'"><c:out value="${ wide.product.productName}"/></h2>
               		<ul>
               			<li><c:out value="${ wide.big_category_content }"/></li>
               			<li><c:out value="${ wide.product.productColor }"/></li>
               		</ul>
               </div>
               <div class="product-price"><span>&#8361;</span><span><fmt:formatNumber value="${ wide.product.sale_per * wide.product_qty}" pattern="###,###"/></span><c:if test="${ wide.product_qty > 1 }" ><div class="pricePerQty">&#8361; <fmt:formatNumber value="${ wide.product.sale_per}" pattern="###,###"/> / 개</div></c:if></div>
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
		                <div class="addCart" onclick="fn_addCart(this)" data-toggle="modal" data-target="#modalAbandonedCart" ><button class="wl-oneAddcart-btn wl-btn">장바구니에 추가</button></div>
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
           
	       <div class="wl-price"> 
				<span>총 주문금액</span>
				<span>&#8361; <fmt:formatNumber value="${ allPrice }" pattern="###,###"/></span>
	       </div>
        <div class="wl-addcart"><button class="wl-allAddcart-btn" data-toggle="modal" data-target="#modalPush">모두 장바구니에 추가</button></div>
           </c:if>
           
           <!--Modal: modalPush-->
<div class="modal fade" id="modalPush" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content text-center">
      <!--Header-->
      <div class="modal-header d-flex justify-content-center">
        <p class="heading">Be always up to date</p>
      </div>
      <!--Body-->
      <div class="modal-body">
        <i class="fas fa-bell fa-4x animated rotateIn mb-4"></i>
        <p>모두 장바구니에 추가 되었습니다.</p>
      </div>
       <div class="modal-footer justify-content-center">
        <a type="button" class="btn btn-info" onclick="location.href='${path}/cart/cart.do'" >장바구니로 가기</a>        
      </div>      
    </div>
    <!--/.Content-->
  </div>
</div>
<!--Modal: modalPush-->
       </div>
    </div>

<!-- Modal: modalAbandonedCart-->
<div class="modal fade right" id="modalAbandonedCart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" data-backdrop="false">
  <div class="modal-dialog modal-side modal-top-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content">
      <!--Header-->
      <div class="modal-header">
        <p class="heading">장바구니</p>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times;</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="row">
          <div class="col-3">                       
            <img class="img_main" src="">
          </div>
          <div class="col-9">
            <p>상품을 더 구매하시겠습니까??</p>
            <div style="display:flex;">
            	<div class="productName"><c:out value="${p.PRODUCT_NAME}"/></div>
            	<div>상품이</div>
            </div>
            <p>장바구니에 추가되었습니다.</p>
          </div>
        </div>
      </div>
      <!--Footer-->
      <div class="modal-footer justify-content-center">
        <a type="button" class="btn btn-info" onclick="location.href='${path}/cart/cart.do'" >장바구니로 가기</a>        
      </div>
    </div>
    <!--/.Content-->
  </div>
</div>
<!-- Modal: modalAbandonedCart-->



</section>


<script>

	//장바구니 추가
	function fn_addCart(e){
		let t = $(e);
		let i = $('.addCart').index(t);
		let pNo = $('.only_pNo').eq(i).val();
		let pQty = $('.count-box').eq(i).children('input').val();
		
		$.ajax({
			data: {productNo : pNo, cartQTY: pQty },
			url: '${path}/cart/cartInsert.do',
			success: data=>{
				console.log(data);
				
			}
		})		
	}
	
	//모두 장바구니에 추가
	$(".wl-allAddcart-btn").click(e=>{
		console.log("나오긴하니?");
		 <c:forEach items="${ wish.wishlist_detail }" var="wide"  varStatus="s"> 			  
			$.ajax({
				data:{productNo:"${wide.product.productNo}",  cartQTY:"${wide.product_qty}" },
				url:"${path}/cart/cartInsert.do",
				success:data=>{							
				}
			})
		 </c:forEach> 
	})	


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
// 		$('.wl-moveModal-box').css('display','flex');	
		$('#wl-moveModal').fadeIn();
		$('header').css('z-index','1');
		
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
// 		$('#wl_selectModal').empty();
// 		$('#wl_selectModal').css('display','flex');
		$('#wl_selectModal').fadeIn();
		$('header').css('z-index','1');
		
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