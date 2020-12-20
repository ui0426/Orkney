
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<link rel="stylesheet"
	href="${path }/resources/css/product/productsCompare.css">
<style>
<c:choose>
	<c:when test="${fn:length(list)==2}">

@media (min-width: 573px) {
	.goright {
    margin-left: 31rem !important;
    z-index: 1;
    top: 18.4rem !important;
}
}
@media (min-width: 765px) {
	.goright {
    margin-left: 42.5rem !important;
    z-index: 1;
    top: 18.4rem !important;
}
}
@media (min-width: 992px) {
	.goright {
    margin-left: 57.5rem !important;
    z-index: 1;
    top: 18.4rem !important;
}
}
@media (min-width: 1200px) {
	.goright {
    margin-left: 68.5rem !important;
    z-index: 1;
    top: 18.4rem !important;
}
}
	
	@media (min-width: 576px) {
	.img_siz{
	    height: 13rem;
	}
	.carousel-multi-item.v-2 .carousel-item-right.active,
		.carousel-multi-item.v-2 .carousel-item-next {
		-webkit-transform: translateX(50%);
		-ms-transform: translateX(50%);
		transform: translateX(50%);
	}
	
	.carousel-multi-item.v-2 .carousel-item-left.active,
		.carousel-multi-item.v-2 .carousel-item-prev {
		-webkit-transform: translateX(-50%);
		-ms-transform: translateX(-50%);
		transform: translateX(-50%);
	}
	
	.carousel-multi-item.v-2 .carousel-item-right, .carousel-multi-item.v-2 .carousel-item-left
		{
		-webkit-transform: translateX(0);
		-ms-transform: translateX(0);
		transform: translateX(0);
	}
	}
	@media(min-width:992px){
	.img_siz{
	    width: 23rem;
    	height: 27rem;
	}
	</c:when>
	
	<c:when test="${fn:length(list)==3}">
	@media (min-width: 576px) { 
	.goright {
    margin-left: 31rem !important;
    z-index: 1;
    top: 18.5rem !important;
	}
	.img_siz{
		
		height: 400px;
	}

	.carousel-multi-item.v-2 .carousel-item-right.active,
		.carousel-multi-item.v-2 .carousel-item-next {
		-webkit-transform: translateX(100%);
		-ms-transform: translateX(100%);
		transform: translateX(100%);
	}
	
	.carousel-multi-item.v-2 .carousel-item-left.active,
		.carousel-multi-item.v-2 .carousel-item-prev {
		-webkit-transform: translateX(-100%);
		-ms-transform: translateX(-100%);
		transform: translateX(-100%);
	}
	
	.carousel-multi-item.v-2 .carousel-item-right, .carousel-multi-item.v-2 .carousel-item-left
		{
		-webkit-transform: translateX(0);
		-ms-transform: translateX(0);
		transform: translateX(0);
	}
}
	@media (min-width: 768px) {
		.img_siz{
		
		height: 200px;
	}
		.goright {
    margin-left: 42.5rem !important;
    z-index: 1;
    top: 18.4rem !important;
}
	.carousel-multi-item.v-2 .carousel-item-right.active, 
 		.carousel-multi-item.v-2 .carousel-item-next { 
 		-webkit-transform: translateX(33.3%); 
 		-ms-transform: translateX(33.3%); 
 		transform: translateX(33.3%); 
 	} 
	
 	.carousel-multi-item.v-2 .carousel-item-left.active, 
 		.carousel-multi-item.v-2 .carousel-item-prev { 
 		-webkit-transform: translateX(-33.3%); 
 		-ms-transform: translateX(-33.3%); 
 		transform: translateX(-33.3%); 
 	} 
	
 	.carousel-multi-item.v-2 .carousel-item-right, .carousel-multi-item.v-2 .carousel-item-left 
 		{ 
 		-webkit-transform: translateX(0); 
 		-ms-transform: translateX(0); 
 		transform: translateX(0); 
	} 
	}

@media (min-width: 992px) {
		.img_siz{
		
		height: 300px;
	}
	.goright {
    margin-left: 57.5rem !important;
    z-index: 1;
    top: 18.4rem !important;
}
}
@media (min-width: 1200px) {
		.img_siz{
		
		height: 350px;
	}
	.goright {
    margin-left: 68.5rem !important;
    z-index: 1;
    top: 18.4rem !important;
}
}
	</c:when>
	
	<c:otherwise>
	
	

@media (min-width: 576px) { 
	.goright {
    margin-left: 31rem !important;
    z-index: 1;
    top: 18.5rem !important;
}
	.img_siz{
		
		height: 200px;
	}

	.carousel-multi-item.v-2 .carousel-item-right.active,
		.carousel-multi-item.v-2 .carousel-item-next {
		-webkit-transform: translateX(50%);
		-ms-transform: translateX(50%);
		transform: translateX(50%);
	}
	
	.carousel-multi-item.v-2 .carousel-item-left.active,
		.carousel-multi-item.v-2 .carousel-item-prev {
		-webkit-transform: translateX(-50%);
		-ms-transform: translateX(-50%);
		transform: translateX(-50%);
	}
	
	.carousel-multi-item.v-2 .carousel-item-right, .carousel-multi-item.v-2 .carousel-item-left
		{
		-webkit-transform: translateX(0);
		-ms-transform: translateX(0);
		transform: translateX(0);
	}
}

@media (min-width:768px) {
	.goright {
    margin-left: 42.5rem !important;
    z-index: 1;
    top: 18.5rem !important;
}
		.img_siz{
		
		height: 190px;
	}

	.carousel-multi-item.v-2 .carousel-item-right.active,
		.carousel-multi-item.v-2 .carousel-item-next {
		-webkit-transform: translateX(33.3%);
		-ms-transform: translateX(33.3%);
		transform: translateX(33.3%);
	}
	
	.carousel-multi-item.v-2 .carousel-item-left.active,
		.carousel-multi-item.v-2 .carousel-item-prev {
		-webkit-transform: translateX(-33.3%);
		-ms-transform: translateX(-33.3%);
		transform: translateX(-33.3%);
	}
	
	.carousel-multi-item.v-2 .carousel-item-right, .carousel-multi-item.v-2 .carousel-item-left
		{
		-webkit-transform: translateX(0);
		-ms-transform: translateX(0);
		transform: translateX(0);
	}
}
@media (min-width: 992px) {
	.goright {
    margin-left: 57.5rem !important;
    z-index: 1;
    top: 18.5rem !important;
}

	.carousel-multi-item.v-2 .carousel-item-right.active,
		.carousel-multi-item.v-2 .carousel-item-next {
		-webkit-transform: translateX(25%);
		-ms-transform: translateX(25%);
		transform: translateX(25%);
	}
	
	.carousel-multi-item.v-2 .carousel-item-left.active,
		.carousel-multi-item.v-2 .carousel-item-prev {
		-webkit-transform: translateX(-25%);
		-ms-transform: translateX(-25%);
		transform: translateX(-25%);
	}
	
	.carousel-multi-item.v-2 .carousel-item-right, .carousel-multi-item.v-2 .carousel-item-left
		{
		-webkit-transform: translateX(0);
		-ms-transform: translateX(0);
		transform: translateX(0);
	}
}
@media (min-width: 1200px) {
	.goright {
    margin-left: 68.8rem !important;
    z-index: 1;
    top: 18.4rem !important;
}
}
</c:otherwise> 
</c:choose>

.darkCol {
	background-color: rgb(180, 179, 179) !important;
}

</style>

<div class="container my-5">


	<!--Section: Content-->
	<section class="text-center  ">
		<h3 class="font-weight-bold pb-4 mb-0 text-center">상품 비교</h3>



		<div class="row">
			<div class="col-12">

				<div id="carousel-example-multi"
					class="carousel slide carousel-multi-item v-2"
					data-interval="false">

					<!--Controls-->
					<div class="controls-top">

					</div>
					<!--/.Controls-->

					<div class="carousel-inner" role="listbox">
						<a class="btn-floating bg-transparent z-depth-0 m-0 goleft dark-grey-text fas fa-chevron-left"
							href="#carousel-example-multi" data-slide="prev">
						</a> 
						<a class="btn-floating bg-transparent z-depth-0 m-0 goright dark-grey-text fas fa-chevron-right"
							href="#carousel-example-multi" data-slide="next">
							
						</a>



						<!-- Grid column -->
						<div class="carousel-item active"></div>
						<!-- Grid column -->

	<!--Section: Content-->
<c:forEach items="${list }" var="p">
						<!-- Grid column -->
						<div class="carousel-item ">
							<!-- Card -->

							
							<c:choose>
							    <c:when test="${fn:length(list)==2}">
								<div class="col-12 col-lg-6 col-sm-6 col-md-6  mx-auto" id="product_List">
							    </c:when>
							    <c:when test="${fn:length(list)==3}">
								<div class="col-12 col-lg-4 col-sm-12 col-md-4  mx-auto" id="product_List">
							    </c:when>
							    <c:otherwise>
								<div class="col-12 col-lg-3 col-sm-6 col-md-4  mx-auto" id="product_List">
							    </c:otherwise> 
							</c:choose>
							
								<!-- Pricing card -->
								<div
									class="text-white text-center pricing-card d-flex align-items-center rgba-stylish-strong py-3 px-3 rounded darkCol">
									<!-- Content -->
									<div class="card-body view rounded z-depth-1-half">
										<h5><c:out value="${p.PRODUCT_NAME}" /></h5>
										<!-- Price -->
										<div class="price pt-0 imgCenter">
											<img alt=""
												src="${path}/resources/images/product/${p.PRODUCT_PIC}" class="img_siz">
										</div>
										<hr>
										<ul class="striped mb-0 row">
											<li class="col-12">
												<p>
													<strong>별점 : </strong> #
												</p>
											</li>
											<li class="col-12">
												<p>
													<strong>가격 : </strong><fmt:formatNumber type="number" maxFractionDigits="3" value='${p.PRODUCT_PRICE}' />  원
												</p>
											</li>

											<li class="col-12">
												<p>
													<strong>폭 : </strong> <c:out value="${p.PRODUCT_WIDTH}"/> cm
												</p>
											</li class="col-12">
											<li class="col-12">
												<p>
													<strong>높이 : </strong> <c:out value="${p.PRODUCT_HEIGHT}"/> cm
												</p>
											</li>
											<li class="col-12">
												<p>
													<strong>깊이 : </strong> <c:out value="${p.PRODUCT_DEPTH}"/> cm
												</p>
											</li>
										</ul>
										<a class="btn btn-outline-white">Buy now</a>
									</div>
									<!-- Content -->
								</div>
								<!-- Pricing card -->
							</div>
							<!-- Card -->
						</div>
						<!-- Grid column -->
</c:forEach>


					


						


						

					</div>

				</div>

			</div>
		</div>

	</section>
	<!--Section: Content-->


</div>



<script>

// product_List
// $(function () {

// });

	$('.carousel, .carousel-multi-item, .v-2, .carousel-item').each(function() {
      
		var next = $(this).next();
		if (!next.length) {
			next = $(this).siblings(':first');
		}
		next.children(':first-child').clone().appendTo($(this));

		for (var i = 0; i < 4; i++) {
			next = next.next();
			if (!next.length) {
				next = $(this).siblings(':first');
			}
			next.children(':first-child').clone().appendTo($(this));
		}
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
