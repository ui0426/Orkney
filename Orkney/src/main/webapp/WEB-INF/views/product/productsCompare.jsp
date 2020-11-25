
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="" />
</jsp:include>
<style>
.carousel-multi-item.v-2 .carousel-inner .carousel-item.active,
	.carousel-multi-item.v-2 .carousel-item-next, .carousel-multi-item.v-2 .carousel-item-prev
	{
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
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

.darkCol {
	background-color: gray;
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
						<a class="btn-floating bg-transparent z-depth-0 m-0"
							href="#carousel-example-multi" data-slide="prev"><i
							class="dark-grey-text fas fa-chevron-left"></i></a> <a
							class="btn-floating bg-transparent z-depth-0 m-0"
							href="#carousel-example-multi" data-slide="next"><i
							class="dark-grey-text fas fa-chevron-right"></i></a>
					</div>
					<!--/.Controls-->

					<div class="carousel-inner" role="listbox">


						<!-- Grid column -->
						<div class="carousel-item active ">
							<!-- Card -->
							<div class="col-3 col-md-3 mb-3 mx-auto ">
								<!-- Pricing card -->
								<div
									class="text-white text-center pricing-card d-flex align-items-center rgba-stylish-strong py-3 px-3 rounded darkCol">
									<!-- Content -->
									<div class="card-body view rounded z-depth-1-half">
										<h5>제품명</h5>
										<!-- Price -->
										<div class="price pt-0">
											<img alt=""
												src="https://www.ikea.com/kr/ko/images/products/micke-desk-white__0921905_PE787996_S5.JPG?f=xxxs">
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
													<strong>가격 : </strong> # 원
												</p>
											</li>

											<li class="col-12">
												<p>
													<strong>폭 : </strong> # cm
												</p>
											</li class="col-12">
											<li class="col-12">
												<p>
													<strong>높이 : </strong> # cm
												</p>
											</li>
											<li class="col-12">
												<p>
													<strong>깊이 : </strong> # cm
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


						<!-- Grid column -->
						<div class="carousel-item ">
							<!-- Card -->
							<div class="col-3 col-md-3 mb-3 mx-auto">
								<!-- Pricing card -->
								<div
									class="text-white text-center pricing-card d-flex align-items-center rgba-stylish-strong py-3 px-3 rounded darkCol">
									<!-- Content -->
									<div class="card-body view rounded z-depth-1-half">
										<h5>제품명</h5>
										<!-- Price -->
										<div class="price pt-0">
											<img alt=""
												src="https://www.ikea.com/kr/ko/images/products/muddus-drop-leaf-table-white__0871689_PE596029_S5.JPG?f=xs">
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
													<strong>가격 : </strong> # 원
												</p>
											</li>

											<li class="col-12">
												<p>
													<strong>폭 : </strong> # cm
												</p>
											</li class="col-12">
											<li class="col-12">
												<p>
													<strong>높이 : </strong> # cm
												</p>
											</li>
											<li class="col-12">
												<p>
													<strong>깊이 : </strong> # cm
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


						<!-- Grid column -->
						<div class="carousel-item ">

							<!-- Card -->
							<div class="col-3 col-md-3 mb-3 mx-auto">

								<!-- Pricing card -->
								<div
									class="text-white text-center pricing-card d-flex align-items-center rgba-stylish-strong py-3 px-3 rounded darkCol">

									<!-- Content -->
									<div class="card-body view rounded z-depth-1-half">
										<h5>제품명</h5>

										<!-- Price -->
										<div class="price pt-0">
											<img alt=""
												src="https://www.ikea.com/kr/ko/images/products/micke-desk-white__0851508_PE565256_S5.JPG?f=xs">
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
													<strong>가격 : </strong> # 원
												</p>
											</li>

											<li class="col-12">
												<p>
													<strong>폭 : </strong> # cm
												</p>
											</li class="col-12">
											<li class="col-12">
												<p>
													<strong>높이 : </strong> # cm
												</p>
											</li>
											<li class="col-12">
												<p>
													<strong>깊이 : </strong> # cm
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


						<!-- Grid column -->
						<div class="carousel-item ">

							<!-- Card -->
							<div class="col-3 col-md-3 mb-3 mx-auto">

								<!-- Pricing card -->
								<div
									class="text-white text-center pricing-card d-flex align-items-center rgba-stylish-strong py-3 px-3 rounded darkCol">

									<!-- Content -->
									<div class="card-body view rounded z-depth-1-half">
										<h5>제품명</h5>

										<!-- Price -->
										<div class="price pt-0">
											<img alt=""
												src="https://www.ikea.com/kr/ko/images/products/malm-desk-with-pull-out-panel-white__0849930_PE660335_S5.JPG?f=xs">
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
													<strong>가격 : </strong> # 원
												</p>
											</li>

											<li class="col-12">
												<p>
													<strong>폭 : </strong> # cm
												</p>
											</li class="col-12">
											<li class="col-12">
												<p>
													<strong>높이 : </strong> # cm
												</p>
											</li>
											<li class="col-12">
												<p>
													<strong>깊이 : </strong> # cm
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


						<!-- Grid column -->
						<div class="carousel-item ">

							<!-- Card -->
							<div class="col-3 col-md-3 mb-3 mx-auto">

								<!-- Pricing card -->
								<div
									class="text-white text-center pricing-card d-flex align-items-center rgba-stylish-strong py-3 px-3 rounded darkCol">

									<!-- Content -->
									<div class="card-body view rounded z-depth-1-half">
										<h5>제품명</h5>

										<!-- Price -->
										<div class="price pt-0">
											<img alt=""
												src="https://www.ikea.com/kr/ko/images/products/alex-desk-white__0403182_PE565241_S5.JPG?f=xs">
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
													<strong>가격 : </strong> # 원
												</p>
											</li>

											<li class="col-12">
												<p>
													<strong>폭 : </strong> # cm
												</p>
											</li class="col-12">
											<li class="col-12">
												<p>
													<strong>높이 : </strong> # cm
												</p>
											</li>
											<li class="col-12">
												<p>
													<strong>깊이 : </strong> # cm
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


						<!-- Grid column -->
						<div class="carousel-item ">

							<!-- Card -->
							<div class="col-3 col-md-3 mb-3 mx-auto">

								<!-- Pricing card -->
								<div
									class="text-white text-center pricing-card d-flex align-items-center rgba-stylish-strong py-3 px-3 rounded darkCol">

									<!-- Content -->
									<div class="card-body view rounded z-depth-1-half">
										<h5>Basic</h5>

										<!-- Price -->
										<div class="price pt-0">
											<img alt=""
												src="https://www.ikea.com/kr/ko/images/products/micke-desk-white__0921905_PE787996_S5.JPG?f=xxxs">
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
													<strong>가격 : </strong> # 원
												</p>
											</li>

											<li class="col-12">
												<p>
													<strong>폭 : </strong> # cm
												</p>
											</li class="col-12">
											<li class="col-12">
												<p>
													<strong>높이 : </strong> # cm
												</p>
											</li>
											<li class="col-12">
												<p>
													<strong>깊이 : </strong> # cm
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


						<!-- Grid column -->
						<div class="carousel-item ">

							<!-- Card -->
							<div class="col-3 col-md-3 mb-3 mx-auto">

								<!-- Pricing card -->
								<div
									class="text-white text-center pricing-card d-flex align-items-center rgba-stylish-strong py-3 px-3 rounded darkCol">

									<!-- Content -->
									<div class="card-body view rounded z-depth-1-half">
										<h5>제품명</h5>

										<!-- Price -->
										<div class="price pt-0">
											<img alt=""
												src="https://www.ikea.com/kr/ko/images/products/micke-desk-white__0921905_PE787996_S5.JPG?f=xxxs">
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
													<strong>가격 : </strong> # 원
												</p>
											</li>

											<li class="col-12">
												<p>
													<strong>폭 : </strong> # cm
												</p>
											</li class="col-12">
											<li class="col-12">
												<p>
													<strong>높이 : </strong> # cm
												</p>
											</li>
											<li class="col-12">
												<p>
													<strong>깊이 : </strong> # cm
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

					</div>

				</div>

			</div>
		</div>

	</section>
	<!--Section: Content-->


</div>



<script>
	$('.carousel.carousel-multi-item.v-2 .carousel-item').each(function() {
		interval: false;

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
