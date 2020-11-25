
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
	href="${path }/resources/css/product/products.css">


<section id="content">


	<div class="modal fade bottom" id="frameModalBottomSuccess"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" data-backdrop="false">
		<div
			class=" modal-frame modal-bottom modal-notify modal-success modal-dialog bottomSiz"
			role="document">
			<!--Content-->
			<div class="modal-content">
				<!--Body-->
				<div class="modal-body container">
					<div class="row px-4 jagan">
						<div>
							<a type="button"
								class="btn btn-outline-success waves-effect color-Gray1 btnBol"
								data-dismiss="modal">전체 삭제</a> <img
								src="https://www.ikea.com/kr/ko/images/products/kleppstad-wardrobe-with-sliding-doors-white__0823547_PE775917_S5.JPG?f=xs"
								alt="KLEPPSTAD 클렙스타드" title="KLEPPSTAD 클렙스타드"
								class="plp-comparison-bar__image"> <img
								src="https://www.ikea.com/kr/ko/images/products/kleppstad-wardrobe-with-sliding-doors-white__0823547_PE775917_S5.JPG?f=xs"
								alt="KLEPPSTAD 클렙스타드" title="KLEPPSTAD 클렙스타드"
								class="plp-comparison-bar__image"> <img
								src="https://www.ikea.com/kr/ko/images/products/kleppstad-wardrobe-with-sliding-doors-white__0823547_PE775917_S5.JPG?f=xs"
								alt="KLEPPSTAD 클렙스타드" title="KLEPPSTAD 클렙스타드"
								class="plp-comparison-bar__image">
						</div>
						<div class="row">
							<p style="margin-top: auto;">#개</p>
							<a type="button"
								class="btn btn-success waves-effect waves-light btnBol text-white"
								style="background-color: gray !important;" href="${path}/product/productsCompare.do"> 제품비교 <i
								class="far fa-gem ml-1 text-white"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!--/.Content-->
		</div>
	</div>



	<!-- Modal: modalPoll -->
	<div class="modal fade right" id="modalPoll-1" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-full-height modal-right modal-notify modal-info"
			role="document">
			<div class="modal-content">
				<!--Header-->
				<div class="modal-header"
					style="background-color: rgb(190, 190, 190);">
					<p class="heading lead">
						<strong>FILTER</strong>
					</p>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="white-text">×</span>
					</button>
				</div>

				<!--Body-->
				<div class="modal-body">
					<div class="text-center">
						<i class="fas fa-check fa-4x mb-3 animated rotateIn color-Gray1"></i>
						<i class="fas fa-check fa-2x animated rotateIn color-Gray2"></i> <i
							class="fas fa-check animated rotateIn color-Gray3"></i>
						<H5>
							<strong>CHECK</strong>
						</H5>


					</div>
					<!--           ====================슬라이드 토글================ -->

					<div class="">
						<div class="row">
							<div class="btn-group col-12 row">
								<button type="button" id="sort" class="btn  col-12 buttonColor"
									data-toggle="dropdown" aria-expanded="false">
									<div class="row filterBtn">
										<p class="fontborder">정렬</p>
										<span class="caret dropdown-toggle "></span>
									</div>
								</button>

								<div id="sortMenu" style="display: none;" class="col-12">
									<div class="form-check mb-4">
										<input class="form-check-input " name="group1" type="radio"
											id="bestP" value="option1" checked> <label
											class="form-check-label fontborder " for="bestP">인기제품</label>
									</div>

									<div class="form-check mb-4">
										<input class="form-check-input" name="group1" type="radio"
											id="lowP" value="option2"> <label
											class="form-check-label fontborder" for="lowP">낮은가격</label>
									</div>

									<div class="form-check mb-4">
										<input class="form-check-input" name="group1" type="radio"
											id="highP" value="option3"> <label
											class="form-check-label fontborder" for="highP">높은가격</label>
									</div>
									<div class="form-check mb-4">
										<input class="form-check-input" name="group1" type="radio"
											id="newP" value="option4"> <label
											class="form-check-label fontborder" for="newP">최신</label>
									</div>
									<div class="form-check mb-4">
										<input class="form-check-input" name="group1" type="radio"
											id="nameP" value="option5"> <label
											class="form-check-label fontborder" for="nameP">이름</label>
									</div>
								</div>

							</div>
						</div>
						<div class="row">
							<div class="btn-group col-12 row">
								<button type="button" id="size" class="btn col-12"
									data-toggle="dropdown" aria-expanded="false">
									<div class="row filterBtn">
										<p class="fontborder">사이즈</p>
										<span class="caret dropdown-toggle "></span>
									</div>
								</button>

								<div id="sizeMenu" style="display: none;"col-12"">

									<div class="form-check mb-4">
										<input class="form-check-input " name="group2" type="radio"
											id="60x120" value="option1"> <label
											class="form-check-label fontborder " for="60x120">60x120
											cm</label>
									</div>

									<div class="form-check mb-4">
										<input class="form-check-input" name="group2" type="radio"
											id="70x160" value="option2"> <label
											class="form-check-label fontborder" for="70x160">70x160
											cm</label>
									</div>

									<div class="form-check mb-4">
										<input class="form-check-input" name="group2" type="radio"
											id="80x200" value="option3"> <label
											class="form-check-label fontborder" for="80x200">80x200
											cm</label>
									</div>
									<div class="form-check mb-4">
										<input class="form-check-input" name="group2" type="radio"
											id="90x200" value="option4"> <label
											class="form-check-label fontborder" for="90x200">90x200
											cm</label>
									</div>
									<div class="form-check mb-4">
										<input class="form-check-input" name="group2" type="radio"
											id="120x200" value="option5"> <label
											class="form-check-label fontborder" for="120x200">120x200
											cm</label>
									</div>
									<div class="form-check mb-4">
										<input class="form-check-input" name="group2" type="radio"
											id="140x200" value="option5"> <label
											class="form-check-label fontborder" for="140x200">140x200
											cm</label>
									</div>
									<div class="form-check mb-4">
										<input class="form-check-input" name="group2" type="radio"
											id="150" value="option5"> <label
											class="form-check-label fontborder" for="150">150 cm</label>
									</div>
									<div class="form-check mb-4">
										<input class="form-check-input" name="group2" type="radio"
											id="150x200" value="option5"> <label
											class="form-check-label fontborder" for="150x200">150x200
											cm</label>
									</div>
									<div class="form-check mb-4">
										<input class="form-check-input" name="group2" type="radio"
											id="180x200" value="option5"> <label
											class="form-check-label fontborder" for="180x200">180x200
											cm</label>
									</div>
									<div class="form-check mb-4">
										<input class="form-check-input" name="group2" type="radio"
											id="207x99x182" value="option5"> <label
											class="form-check-label fontborder" for="207x99x182">207x99x182
											cm</label>
									</div>
								</div>

							</div>
						</div>
						<div class="row">
							<div class="btn-group col-12 row">
								<button type="button" id="category" class="btn col-12"
									data-toggle="dropdown" aria-expanded="false">
									<div class="row filterBtn">
										<p class="fontborder">카테고리</p>
										<span class="caret dropdown-toggle "></span>
									</div>
								</button>

								<div id="categoryMenu" style="display: none;"col-12"">카테고리</div>

							</div>
						</div>
						<div class="row">
							<div class="btn-group col-12 row">
								<button type="button" id="price" class="btn col-12"
									data-toggle="dropdown" aria-expanded="false">
									<div class="row filterBtn">
										<p class="fontborder">가격</p>
										<span class="caret dropdown-toggle "></span>
									</div>
								</button>
								<div id="priceMenu" style="display: none;"col-12"">
									<div class="form-check mb-4">
										<input class="form-check-input " name="group3" type="radio"
											id="Price1" value="option1"> <label
											class="form-check-label fontborder " for="Price1">₩0
											- 39,999</label>
									</div>

									<div class="form-check mb-4">
										<input class="form-check-input" name="group3" type="radio"
											id="Price2" value="option2"> <label
											class="form-check-label fontborder" for="Price2">₩40,000
											- 49,999</label>
									</div>

									<div class="form-check mb-4">
										<input class="form-check-input" name="group3" type="radio"
											id="Price3" value="option3"> <label
											class="form-check-label fontborder" for="Price3">₩50,000
											- 59,999</label>
									</div>
									<div class="form-check mb-4">
										<input class="form-check-input" name="group3" type="radio"
											id="Price4" value="option4"> <label
											class="form-check-label fontborder" for="Price4">₩60,000
											- 69,999</label>
									</div>
									<div class="form-check mb-4">
										<input class="form-check-input" name="group3" type="radio"
											id="Price5" value="option5"> <label
											class="form-check-label fontborder" for="Price5">₩70,000+</label>
									</div>
								</div>

							</div>
						</div>
						<div class="row">
							<div class="btn-group col-12 row">
								<button type="button" id="color" class="btn col-12"
									data-toggle="dropdown" aria-expanded="false">
									<div class="row filterBtn">
										<p class="fontborder">색상</p>
										<span class="caret dropdown-toggle "></span>
									</div>
								</button>
								<div id="colorMenu" style="display: none;"col-12"">
									<div class="btn-group row" data-toggle="buttons">

										<label class="btn btn-success col-12 leftMargin"
											style="background-color: white !important;"> <span
											style="color: black;">화이트</spqn> <input type="radio"
												name="options" id="option2" autocomplete="off"> <span
												class="glyphicon glyphicon-ok"></span></label> <label
											class="btn btn-primary col-12 leftMargin"
											style="background-color: black !important;"> <span
											style="color: white;">블랙</spqn>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" name="options" id="option2"
												autocomplete="off"> <span
												class="glyphicon glyphicon-ok"></span></label> <label
											class="btn btn-info col-12 leftMargin"
											style="background-color: beige !important;"> <span
											style="color: black;">베이지</spqn> <input type="radio"
												name="options" id="option2" autocomplete="off"> <span
												class="glyphicon glyphicon-ok"></span></label> <label
											class="btn btn-default col-12 leftMargin"
											style="background-color: brown !important;"> <span
											style="color: white;">브라운</spqn> <input type="radio"
												name="options" id="option2" autocomplete="off"> <span
												class="glyphicon glyphicon-ok"></span></label> <label
											class="btn btn-warning col-12 leftMargin"
											style="background-color: gray !important;"> <span
											style="color: white;">그레이</spqn> <input type="radio"
												name="options" id="option2" autocomplete="off"> <span
												class="glyphicon glyphicon-ok"></span></label> <label
											class="btn btn-danger col-12 leftMargin"
											style="background-color: blue !important;"> <span
											style="color: white;">블루</spqn>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="radio" name="options" id="option2"
												autocomplete="off"> <span
												class="glyphicon glyphicon-ok"></span></label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--           ====================슬라이드 토글 end================ -->
				</div>

				<!--Footer-->
				<div class="modal-footer justify-content-center">

					<a type="button"
						class="btn btn-outline-primary waves-effect color-Gray1 fontSiz2"
						style="border: 1px solid darkgray !important;"
						data-dismiss="modal">All Cancel</a>
				</div>
			</div>
		</div>
	</div>





<!-- 헤더 필터 버튼 -->

	<div class="container">
		<div name="filter" class="row headerFilter"
			style="background-color: white;">
			<hr>
			<button type="button"
				class="btn round col-2 filterSiz col-md-1 btnH35"
				data-toggle="modal" data-target="#modalPoll-1">
				<span class="fontborder fontColorGray">정렬</span>
			</button>
			<button type="button"
				class="btn round col-2 filterSiz col-md-1 btnH35"
				data-toggle="modal" data-target="#frameModalBottomSuccess">
				<span class="fontborder fontColorGray">비교</span>
			</button>
			<button type="button"
				class="btn round col-2 filterSiz col-md-1 btnH35"
				data-toggle="modal" data-target="#modalPoll-1">
				<span class="fontborder fontColorGray">사이즈</span>
			</button>
			<button type="button"
				class="btn round col-2 filterSiz col-md-1 btnH35"
				data-toggle="modal" data-target="#modalPoll-1">
				<span class="fontborder fontColorGray">카테고리</span>
			</button>
			<button type="button"
				class="btn round col-2 filterSiz col-md-1 btnH35"
				data-toggle="modal" data-target="#modalPoll-1">
				<span class="fontborder fontColorGray">가격</span>
			</button>
			<button type="button"
				class="btn round col-2 filterSiz col-md-1 btnH35"
				data-toggle="modal" data-target="#modalPoll-1">
				<span class="fontborder fontColorGray">색상</span>
			</button>
			<hr>
		</div>
<!-- 헤더 필터 버튼 end -->



		<div class="row row-cols-1 row-cols-md-3 row-cols-sm-2 row-cols-lg-4 ">
			<div class="col">
				<!-- Card -->
				<div class="card">
					<!--Card image-->
					<div class="view overlay zoom">
						<img class="card-img-top"  
							src="https://www.ikea.com/kr/ko/images/products/kleppstad-wardrobe-with-3-doors-white__0753597_PE748785_S5.JPG?f=xs"
							alt="Card image cap"> <a href="${path}/product/productDetail.do">
							<div class="mask rgba-white-slight"></div>
						</a>
					</div>
					<!--Card content-->
					<div class="card-body">
						<!--Title-->
						<h4 class="card-title">제품이름</h4>
						<!--Text-->
						<p class="card-text marginZero"># 태그 name</p>
						<p class="card-text marginZero">999,999 원</p>
						<div class="">
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<span class="">(# 댓글수)</span>
							<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->

							<!-- Card footer -->
						</div>
						<div>
							<hr>
							<div class="row">
								<button type="button" class="btn  btn-md color-Gray1 "
									style="border: 1px solid darkgray !important;">Read
									more</button>
								<div class="row" style="margin: auto;">
									<a class="material-tooltip-main" data-toggle="tooltip"
										data-placement="top" title="Add to Cart"> <i
										class="fas fa-shopping-cart grey-text ml-3"></i>
									</a> <a class="material-tooltip-main" data-toggle="tooltip"
										data-placement="top" title="Add to Wishlist"> <i
										class="fas fa-heart grey-text ml-3"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Card -->
				<hr>
			</div>





			<div class="col">
				<!-- Card -->
				<div class="card">
					<!--Card image-->
					<div class="view overlay zoom">
						<img class="card-img-top"
							src="https://www.ikea.com/kr/ko/images/products/kleppstad-wardrobe-with-2-doors-white__0733323_PE748780_S5.JPG?f=xs"
							alt="Card image cap"> <a href="${path}/product/productDetail.do">
							<div class="mask rgba-white-slight"></div>
						</a>
					</div>
					<!--Card content-->
					<div class="card-body">
						<!--Title-->
						<h4 class="card-title">제품이름</h4>
						<!--Text-->
						<p class="card-text marginZero"># 태그 name</p>
						<p class="card-text marginZero">999,999 원</p>
						<div class="">
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<span class="">(# 댓글수)</span>
							<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
						</div>
						<div>
							<hr>
							<div class="row">
								<button type="button" class="btn  btn-md color-Gray1 "
									style="border: 1px solid darkgray !important;">Read
									more</button>
								<div class="row" style="margin: auto;">
									<a class="material-tooltip-main" data-toggle="tooltip"
										data-placement="top" title="Add to Cart"> <i
										class="fas fa-shopping-cart grey-text ml-3"></i>
									</a> <a class="material-tooltip-main" data-toggle="tooltip"
										data-placement="top" title="Add to Wishlist"> <i
										class="fas fa-heart grey-text ml-3"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Card -->
				<hr>
			</div>



			<div class="col">
				<!-- Card -->
				<div class="card">
					<!--Card image-->
					<div class="view overlay zoom">
						<img class="card-img-top"
							src="https://www.ikea.com/kr/ko/images/products/kleppstad-wardrobe-with-sliding-doors-white__0823548_PE775916_S5.JPG?f=xs"
							alt="Card image cap"> <a href="${path}/product/productDetail.do">
							<div class="mask rgba-white-slight"></div>
						</a>
					</div>

					<!--Card content-->
					<div class="card-body">
						<!--Title-->
						<h4 class="card-title">제품이름</h4>
						<!--Text-->
						<p class="card-text marginZero"># 태그 name</p>
						<p class="card-text marginZero">999,999 원</p>
						<div class="">
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<span class="">(# 댓글수)</span>
							<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
						</div>
						<div>
							<hr>
							<div class="row">
								<button type="button" class="btn  btn-md color-Gray1 "
									style="border: 1px solid darkgray !important;">Read
									more</button>
								<div class="row" style="margin: auto;">
									<a class="material-tooltip-main" data-toggle="tooltip"
										data-placement="top" title="Add to Cart"> <i
										class="fas fa-shopping-cart grey-text ml-3"></i>
									</a> <a class="material-tooltip-main" data-toggle="tooltip"
										data-placement="top" title="Add to Wishlist"> <i
										class="fas fa-heart grey-text ml-3"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Card -->
				<hr>
			</div>

			<div class="col">
				<!-- Card -->
				<div class="card">
					<!--Card image-->
					<div class="view overlay zoom">
						<img class="card-img-top"
							src="https://www.ikea.com/kr/ko/images/products/pax-hasvik-wardrobe-combination-white__0829865_PE776776_S5.JPG?f=xs"
							alt="Card image cap"> <a href="${path}/product/productDetail.do">
							<div class="mask rgba-white-slight"></div>
						</a>
					</div>
					<!--Card content-->
					<div class="card-body">
						<!--Title-->
						<h4 class="card-title">제품이름</h4>
						<!--Text-->
						<p class="card-text marginZero"># 태그 name</p>
						<p class="card-text marginZero">999,999 원</p>
						<div class="">
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<svg focusable="false" viewBox="0 0 24 24" class="star"
								aria-hidden="true">
								<path
									d="M12.003 4L14.8623 8.9091L20.4147 10.1115L16.6294 14.3478L17.2017 20L12.003 17.7091L6.80429 20L7.37657 14.3478L3.59131 10.1115L9.14371 8.9091L12.003 4Z"></path></svg>
							<span class="">(# 댓글수)</span>
							<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
						</div>
						<div>
							<hr>
							<div class="row">
								<button type="button" class="btn  btn-md color-Gray1 "
									style="border: 1px solid darkgray !important;">Read
									more</button>
								<div class="row" style="margin: auto;">
									<a class="material-tooltip-main" data-toggle="tooltip"
										data-placement="top" title="Add to Cart"> <i
										class="fas fa-shopping-cart grey-text ml-3"></i>
									</a> <a class="material-tooltip-main" data-toggle="tooltip"
										data-placement="top" title="Add to Wishlist"> <i
										class="fas fa-heart grey-text ml-3"></i>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Card -->
				<hr>
			</div>
		</div>




		<script>
			$(document).ready(function() {

				$('#sort').click(function() {
					$('#sortMenu').slideToggle();
				})
				$('#size').click(function() {
					$('#sizeMenu').slideToggle();
				})
				$('#category').click(function() {
					$('#categoryMenu').slideToggle();
				})
				$('#price').click(function() {
					$('#priceMenu').slideToggle();
				})
				$('#color').click(function() {
					$('#colorMenu').slideToggle();
				})

			})
		</script>

	</div>



</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
