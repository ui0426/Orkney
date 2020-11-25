<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="">
<style>
	input:focus { outline:none; }
    button:focus { outline:none; }
	.wi-box{
	    display: flex;
	    flex-direction: column;
	    max-width: 60rem;
	    padding: 3em;
	    margin: auto;
	        font-size: 0.875rem;
	}
	.wl-selector{
		text-align: center;
		    font-weight: 900;
    font-size: 1.25rem;
        margin-bottom: 2em;
    padding-bottom: 1em;
    border-bottom: 1px solid #ccc;
    position: relative;
	}
	.wl-selector:hover{
		cursor: pointer;
		text-decoration: underline;
	}
	.wl-selector span{
	    position: absolute;
	    top: 12px;
	    right: 227px;
	    width: 0.5em;
	    height: 0.5em;
	    margin-top: -9px;
	    border-right: 1px solid #333;
	    border-bottom: 1px solid #333;
	    -ms-transform: rotate(45deg);
	    -webkit-transform: rotate(45deg);
	    -moz-transform: rotate(45deg);
	    transform: rotate(45deg);
	}
	.product-box{
		display: grid;
	    grid-template-columns: 160px auto;
	    margin: 2em 0;
	}
	.product-img figure{
		width: 130px;
		height: 130px;
	    background-repeat: no-repeat !important;
    	background-size: contain !important;
    	background-position: center !important;
	}
	.product-description h2{
		font-size: 1rem;
	    font-weight: 600;

	}
	.product-price{
    	grid-column: 2/3;	
    	font-weight: 700;
	    font-size: 1.06rem;
	    line-height: 1.2;
	}
	.product-control{
    	grid-column: 1/3;	
	}
	.product-movelist{
		text-align: end;
	    color: #437baf;
        height: 40px;
	    margin: 1em 0;
	    line-height: 40px;

	}
	.product-movelist:hover{
		text-decoration: underline;
		cursor: pointer;
	}
	.product-controlDetail{
	    display: flex;
	        justify-content: space-between;
	        height: 40px;
	}
	.product-controlDetail .addCart{
		flex: 1 1 auto;
	    text-align: center;
    	line-height: 40px;
		
	}
	.product-controlDetail svg{
		width: 1rem;
	}
	.delete{
	    border: 1px solid #666;
    /* height: 40px; */
	    display: flex;
	    width: 48px;
	    justify-content: center;
	    border-radius: 0.2rem;
	}
	.count-box{
	    display: grid;
    	grid-template-columns: auto auto;
    	border-radius: 0.2rem;
    	border: 1px solid #666;
    	    margin: 0 0.5rem;
	}
	.count-box input{
		grid-row: 1/3;
	    width: 62px;
	    /* height: 30px; */
	    /* border-right: 1px solid #dfdfdf; */
	    font-size: 12px;
	    text-align: center;
	    line-height: normal;
	    border: none;
	    border-right: 1px solid #666;
	}
	.countBtn{
	padding: 0px 4px;
	    height: 17px;
	        line-height: 10px;
	}
	.countBtn svg{
		width: 0.5rem;
	}
	.wl-price{
	    border-top: 1px #666 dashed;
	    border-bottom: 1px #666 dashed;
	    padding: 1em 0;
	    display: flex;
   		justify-content: space-between;
	}
	.wl-price span:nth-child(1){
		font-weight: 700;
   		font-size: 1rem;
	}
	.wl-addcart{
		text-align: center;
	    bottom-top: 2rem;
	    margin-top: 2rem;
	}
	
	/* 모달창 */
	.modal-box {
	    position: fixed;
	    top: 0;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    background: hsla(0,0%,100%,.75);
	    display: none;
	    justify-content: center;
	    align-items: baseline;
	    /* margin-top: 3em; */
	    padding-top: 12em;
	    z-index: 1;
	}
    .modal-content{
        overflow: auto;
        max-height: 90vh;
        width: 50vw;
        padding: 1.5rem 1rem;
        box-sizing: border-box;
        border: none;
        border-radius: 2px;
        box-shadow: 0 0 7px 2px #ccc;
        background: #fff;
        outline: 0;
        font-size: 0.875rem;
    }
    .modal-title-box{
        display: flex;
    	justify-content: space-between;
    	margin-bottom: 1em;
    }
    .modal-title{
	    font-size: 1.2rem;
	    font-weight: 600;
	    margin: 0;
	    line-height: 26px;
    }
    .modal-closeBtn{
        width: 1.5em;
	    paddin-bottom: 2px;
	    height: 1.5em;
	    line-height: 1.5em;
    }
    .modal-list li{
   	    color: #407ab1;
	    padding: 2em 0;
	    border-bottom: 1px solid #ccc;
    }
	.modal-list li:hover{
		text-decoration: underline;
		cursor: pointer;
	}
	.list-count{
		background: #f9d616;
	    font-size: .5rem;
	    font-weight: 700;
	    line-height: 1;
	    margin-left: 5px;
	    padding: .25rem;
	    border-radius: .5rem;
	    text-align: center;
	    min-width: 1rem;
	    text-decoration: none;
	    display: inline-block;
	}
	.modal-list-add{
	    display: flex;
	    align-items: center;
	    height: 20px;
	    margin-top: 1em;
	}
	.modal-list-add button{
	    width: 1.5em;
	    height: 1.5em;
	    line-height: 0.5em;
	}
	.modal-list-add span{
		font-size: 0.775rem;
	}
	@media (min-width: 750px){
		.product-box{
			display: grid;
		    grid-template-columns: 160px auto 47%;
	    }
	    .product-price {
    		grid-column: auto;
    		justify-self: end;
    	}
    	.product-control {
    		grid-column: 3/4;;
		}
		.wl-selector {
		    font-size: 1.5rem;
		}
		.product-description h2 {
		    font-size: 1.2rem;
		    font-weight: 600;
		}
		.product-price {
		    font-size: 1.2rem;
		}
		.wl-price span {
		    font-weight: 700 !important;
		    font-size: 1rem !important;
		}
	
</style>

<section>
	<!-- 위시리스트 모달창 -->
	<div class="modal-box wl-modal-box">
        <div class="modal-content">
            <div class="modal-title-box">
				<h2 class="modal-title">나의 리스트</h2>
				<button class="modal-closeBtn"><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" class="svg-inline--fa fa-times fa-w-11" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512"><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg></button>
            </div>
            <ul class="modal-list">
                <li><span>위시리스트 1</span><sup class="list-count">3</sup><button><svg aria-hidden="true" focusable="false" data-prefix="far" data-icon="trash-alt" class="svg-inline--fa fa-trash-alt fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M268 416h24a12 12 0 0 0 12-12V188a12 12 0 0 0-12-12h-24a12 12 0 0 0-12 12v216a12 12 0 0 0 12 12zM432 80h-82.41l-34-56.7A48 48 0 0 0 274.41 0H173.59a48 48 0 0 0-41.16 23.3L98.41 80H16A16 16 0 0 0 0 96v16a16 16 0 0 0 16 16h16v336a48 48 0 0 0 48 48h288a48 48 0 0 0 48-48V128h16a16 16 0 0 0 16-16V96a16 16 0 0 0-16-16zM171.84 50.91A6 6 0 0 1 177 48h94a6 6 0 0 1 5.15 2.91L293.61 80H154.39zM368 464H80V128h288zm-212-48h24a12 12 0 0 0 12-12V188a12 12 0 0 0-12-12h-24a12 12 0 0 0-12 12v216a12 12 0 0 0 12 12z"></path></svg></button></li>
                <li>위시리스트 2</li>
            </ul>
            <div class="modal-list-add">
                <button><svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="plus" class="svg-inline--fa fa-plus fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M416 208H272V64c0-17.67-14.33-32-32-32h-32c-17.67 0-32 14.33-32 32v144H32c-17.67 0-32 14.33-32 32v32c0 17.67 14.33 32 32 32h144v144c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V304h144c17.67 0 32-14.33 32-32v-32c0-17.67-14.33-32-32-32z"></path></svg></button>
                <span>새로운 리스트 만들기</span>
            </div>
        </div>
    </div>
    <!-- 위시리스트모달창 끝 -->
    <!-- 다른 리스트로 제품이동 모달창 -->
    <div class="modal-box wl-moveModal-box">
    	<div class="modal-content">
    		<div class="modal-title-box">
    			<h2 class="modal-title">다른 리스트로 이동</h2>
    		</div>
    		<ul class="modal-list">
    			<li>위시리스트 2</li>
    			<li>위시리스트 3</li>
    		</ul>
    	</div>
    </div>
   <!--  다른리스트로 제품이동 모달창 끝 -->
    
	<div class="wi-box">
        <h1 class="wl-selector">위시리스트 1<span></span></h1> <!--눌렀을 때 모달창-->
        <div class="product-list"> <!--제품 쫘롸락 나오는 박스-->
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
	               <div class="product-movelist">다른 리스트로 이동</div> <!--눌렀을 때 모달창-->
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
           <div class="product-list"> <!--제품 쫘롸락 나오는 박스-->
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
	               <div class="product-movelist">다른 리스트로 이동</div> <!--눌렀을 때 모달창-->
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
        </div>
        <div class="wl-price"> 
        	<span>총 주문금액</span>
        	<span>&#8361; 총 가격</span>
        </div>
        <div class="wl-addcart"><button class="wl-allAddcart-btn">모두 장바구니에 추가</button></div>
    </div>
	
	
</section>

<script>
	/* 모달바탕 클릭시 창 꺼짐 */
	$(function(){
		/* 위시리스트 클릭 시 모달창 나옴 */
		$('.wl-selector').click(function(){
			$('.wl-modal-box').css('display','flex');		
		});	
		$('.wl-modal-box').click(function(e){
			if($(e.target).is($('.wl-modal-box'))){
				$('.wl-modal-box').css('display','none');	
			}
		});
// 		$('.modal-box').children().click(function(e){
// 			$('.modal-box').css('display','flex');	
// 		});
		
// 		위시리스트 이동 클릭 시 모달창 나옴
		$('.product-movelist').click(function(){
			$('.wl-moveModal-box').css('display','flex');		
		});	
		$('.wl-moveModal-box').click(function(e){
			if($(e.target).is($('.wl-moveModal-box'))){
				$('.wl-moveModal-box').css('display','none');	
			}
		});
		
	});
</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>