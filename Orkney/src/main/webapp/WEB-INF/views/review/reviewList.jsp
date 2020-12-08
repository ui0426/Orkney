<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">		
	<jsp:param name="title" value="리뷰 상세 " />
</jsp:include>

<style>
h1, h3{margin : 0;}
.review-container-content{
	margin: 1.5rem 1rem 3rem 1rem;
}
.review-container-inner{
	max-width: 900px;
	    margin: 0 auto;
}
.reviewform-title{
	text-align: center;
	font-weight: 700;
	font-size: 1.5rem;
	margin: 1rem 0px;
}
.review-small-container{
	margin: 0 .7em 0 1em;
}
.orderList_mobile{
	width: -webkit-fill-available;
}
.orderList-tab{
	width: 100%;
}
.orderList-btn{
	padding: 1em 0 1em 0px;
	font-weight: 500;
	margin-bottom: .375rem;
	border:0;
	border-radius: .125rem;
	box-shadow: 0 2px 5px 0 rgba(0,0,0,0.16), 0 2px 10px 0 rgba(0,0,0,0.12);
	transition: color 0.15s ease-in-out,background-color 0.15s ease-in-out,border-color 0.15s ease-in-out,box-shadow 0.15s ease-in-out,-webkit-box-shadow 0.15s ease-in-out;
	font-size: .81rem;
	width: -webkit-fill-available;
}
.orderList-btn:focus{
	outline: none;
}
.btn-clicked{
	box-shadow: 0 5px 4px 0 rgba(0,0,0,0.16), 0 4px 10px 0 rgba(0,0,0,0.12);
   	z-index: 1;
   	font-weight: 600;
}
.panels{
	border-bottom: 2px solid #ccc;
   	padding: 1em 0;
}
.panel2{
	display: none;
}
.reviewView{
	display:block;
}
.reviewNone{
	display:none;
}
.img-size{
	width: 80px;
	height: 80px;
}
@media(min-width: 769px){

}
</style>

<section class="review-container">
	<div class="review-container-content">
		<div class="review-container-inner">
			<div class="reviewTitle">
				<h1 class="reviewform-title">리뷰</h1>				
			</div>
			<div class="part-line"><hr class="line-c"></div>
			<div class="review-small-container">
				<div class="orderList_mobile">
						<div class="btn-group orderList-tab" role="group" aria-label="Basic example">
						  <button id="tab1" type="button" class="btn-light orderList-btn btn-clicked" aria-selected="true" aria-controls="panel1">작성 가능 리뷰</button>
						  <button id="tab2" type="button" class="btn-light orderList-btn">내가 쓴 리뷰</button>
						</div>
						<div id="panel-container">
								<div class="panel1 panels">
									<div class="media">
									  	<img class="d-flex mr-3 img-size" src="${path }/resources/images/product/pngegg2222.png" alt="상품 이미지">
										<div class="media-body p-info">
									    	<h5 class="mt-0 font-weight-bold p-name">상품이름 </h5> 
									    	상품의작은카테고리/색깔&nbsp;&nbsp;너비*높이*깊이
									  	</div> 
									  	<div>
									  		<button>리뷰 작성하기 ></button>
									  	</div>
									</div>
									
								</div>
									
								<div class="panel2 panels">
									<div>
										<div class="media reviewList">
										  	<img class="d-flex mr-3 img-size" src="${path }/resources/images/product/pngegg2222.png" alt="상품 이미지">
											<div class="media-body p-info">
										    	<h5 class="mt-0 font-weight-bold p-name">상품이름 </h5> 
										    	상품의작은카테고리/색깔&nbsp;&nbsp;너비*높이*깊이
										  	</div>
										</div>
										<div class="reviewNone">
											<div>
												<div>별점</div>
												<div><button>수정</button></div>
											</div>
											<div>
												리뷰내용
											</div>
											<div>
												첨부사진
											</div>
										</div>
									</div>
								</div>
						</div>
					</div>
			</div>
		</div>
	</div>
</section>
<script>
	$("#tab1").click(e=>{
		$("#tab1").addClass("btn-clicked");
		$("#tab2").removeClass("btn-clicked");
		$('.panel1').css("display","block");
		$('.panel2').css("display","none");
	});
	$("#tab2").click(e=>{
		$("#tab2").addClass("btn-clicked");
		$("#tab1").removeClass("btn-clicked");
		$('.panel1').css("display","none");
		$('.panel2').css("display","block");
	});
	
	$(".reviewList").click(function(){
		if($(this).next().hasClass("reviewView") == true){
			$(this).next().removeClass("reviewView").addClass("reviewNone");
		}else{
			$(this).next().removeClass("reviewNone").addClass("reviewView");
		}
	})
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>