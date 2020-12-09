
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
.between {
	justify-content: space-between;
}

.fontbor {
	font-weight: 900;
}
</style>

<section id="content">





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
						<strong>제품설명</strong>
					</p>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="white-text">×</span>
					</button>
				</div>

				<!--Accordion wrapper-->
				<div class="accordion md-accordion" id="accordionEx" role="tablist"
					aria-multiselectable="true">

					<!-- Accordion card -->
					<div class="">

						<!-- Card header -->
						<div class="card-header" role="tab" id="headingOne1">

							<a style="width: 100%;" data-toggle="collapse"
								data-parent="#accordionEx" href="#collapseOne1"
								aria-expanded="true" aria-controls="collapseOne1">

								<div class="row justify-content-between">
									<h5 class="mb-0 dark-grey-text col">제품 설명</h5>
									<i class="fas fa-angle-down rotate-icon dark-grey-text col-1"></i>
								</div>
							</a>

						</div>

						<!-- Card body -->
						<div id="collapseOne1" class="collapse show" role="tabpanel"
							aria-labelledby="headingOne1" data-parent="#accordionEx">
							<div class="card-body">양면 등쿠션은 부드럽고 편안하며 양면의 디자인이 다릅니다.
								등쿠션은 앉는 자세에 맞춰서 위치를 조정할 수 있습니다.</div>
						</div>
					</div>
					<!-- Accordion card -->

					<!-- Accordion card -->
					<div class="">

						<!-- Card header -->
						<div class="card-header" role="tab" id="headingTwo2">

							<a style="width: 100%;" class="collapsed" data-toggle="collapse"
								data-parent="#accordionEx" href="#collapseTwo2"
								aria-expanded="false" aria-controls="collapseTwo2">
								<div class="row justify-content-between">
									<h5 class="mb-0 dark-grey-text col">소재 & 관리</h5>
									<i class="fas fa-angle-down rotate-icon dark-grey-text col-1"></i>
								</div>
							</a>

						</div>

						<!-- Card body -->
						<div id="collapseTwo2" class="collapse" role="tabpanel"
							aria-labelledby="headingTwo2" data-parent="#accordionEx">
							<div class="card-body">
								<div>
									<div class="">
										<div class="">
											<span class="">보조 패브릭:</span><span class="">폴리프로필렌
												100%</span>
										</div>
										<div class="">
											<span class="">고정 시트:</span><span class="">폴리우레탄 폼
												30kg/cu.m., 폴리에스테르충전재</span>
										</div>
										<div class="">
											<span class="">루즈 쿠션:</span><span class="">폴리우레탄폼 50%/
												폴리에스테르섬유 50%</span>
										</div>
										<div class="">
											<span class="">다리:</span><span class="">스틸, 파우더코팅</span>
										</div>
										<div class="">
											<span class="">패브릭:</span><span class="">폴리에스테르 100 %</span>
										</div>
									</div>
									<div class="range-revamp-product-details__container">
										<span class="range-revamp-product-details__label">세탁하지
											마세요.</span><span class="range-revamp-product-details__label">패브릭
											전용세제를 사용하세요.</span><span class="range-revamp-product-details__label">표백하지
											마세요.</span><span class="range-revamp-product-details__label">건조기에
											넣지 마세요.</span><span class="range-revamp-product-details__label">다림질하지
											마세요.</span><span class="range-revamp-product-details__label">드라이클리닝하지
											마세요.</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- Accordion card -->

					<!-- Accordion card -->
					<div class="">

						<!-- Card header -->
						<div class="card-header" role="tab" id="headingThree3">

							<a style="width: 100%;" class="collapsed" data-toggle="collapse"
								data-parent="#accordionEx" href="#collapseThree3"
								aria-expanded="false" aria-controls="collapseThree3">

								<div class="row justify-content-between">
									<h5 class="mb-0 dark-grey-text col">공지사항</h5>
									<i class="fas fa-angle-down rotate-icon dark-grey-text col-1"></i>

								</div>
							</a>

						</div>

						<!-- Card body -->
						<div id="collapseThree3" class="collapse" role="tabpanel"
							aria-labelledby="headingThree3" data-parent="#accordionEx">
							<div class="card-body">

								<div id="SEC_product-details-kr-compliance" class=""
									aria-labelledby="product-details-kr-compliance" role="region">
									<div>
										<div class="">
											<span class="">색상</span> <span class="">제품명 또는 이미지 참조</span>
										</div>
										<div class="">
											<span class="">구성품</span> <span class="">제품정보 또는 구성품 탭
												참조</span>
										</div>
										<div class="">
											<span class="">크기</span> <span class="">제품정보 탭 참조</span>
										</div>
										<div class="">
											<span class="">중량</span> <span class="">제품정보 탭 참조</span>
										</div>
										<div class="">
											<span class="">재질</span> <span class="">재질 및 환경 탭 참조</span>
										</div>
										<div class="">
											<span class="">제조사</span> <span class="">ORKNEY of
												Sweden AB</span>
										</div>
										<div class="">
											<span class="">제조국</span> <span class="">중국</span>
										</div>
										<div class="">
											<span class="">수입자</span> <span class="">오크니 코리아 유한회사</span>
										</div>
										<div class="">
											<span class="">배송&amp;설치비용</span> <span class="">오크니
												서비스 페이지 참조</span>
										</div>
										<div class="">
											<span class="">품질보증</span> <span class="">IKEA 품질 보증
												기준을 따릅니다. 홈페이지에서 IKEA 품질 보증을 확인 하세요.</span>
										</div>
										<div class="">
											<span class="">교환 환불 책임자와 전화 번호</span> <span class="">이케아코리아
												유한회사/ 1670-4532</span>
										</div>
										<div class="">
											<span class="">동일모델의 출시년월</span> <span class="">8/1/2019</span>
										</div>
										<div class="">
											<span class="">취급시&nbsp;주의&nbsp;사항(세탁방법&nbsp;및&nbsp;사용&nbsp;연령)</span>
											<span class="">제품정보 탭 참조</span>
										</div>
										<div class="">
											<span class="">제조년월</span> <span class="">제조일자: 포장면 참조
												(예:1246=2012년 46번째 주 생산제품)</span>
										</div>
									</div>
								</div>




							</div>
						</div>
					</div>
					<!-- Accordion card -->

				</div>
				<!--/.Accordion wrapper-->



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
	<div class="modal fade right" id="modalPoll-2" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-full-height modal-right modal-notify modal-info"
			role="document">
			<div class="modal-content">
				<!--Header-->
				<div class="modal-header"
					style="background-color: rgb(190, 190, 190);">
					<p class="heading lead">
						<strong>제품크기</strong>
					</p>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="white-text">×</span>
					</button>
				</div>



				<div class="" style="margin: 50px">
					<div class="">

						<dl class="">
							<div class="row">
								<dt class="">폭:&nbsp;</dt>
								<dd class="">70 cm</dd>
							</div>
							<div class="row">
								<dt class="">깊이:&nbsp;</dt>
								<dd class="">73 cm</dd>
							</div>
							<div class="row">
								<dt class="">높이:&nbsp;</dt>
								<dd class="">75 cm</dd>
							</div>
							<div class="row">
								<dt class="">시트 폭:&nbsp;</dt>
								<dd class="">57 cm</dd>
							</div>
							<div class="row">
								<dt class="">시트 깊이:&nbsp;</dt>
								<dd class="">46 cm</dd>
							</div>
							<div class="row">
								<dt class="">시트 높이:&nbsp;</dt>
								<dd class="">43 cm</dd>
							</div>
						</dl>
						<div class="">
							<div class="">
								<div class="">
									<img loading="lazy" class="" alt="EKERÖ 에케뢰 암체어, 시프테보 베이지"
										srcset="
  https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=g 1600w,
  https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=sg 1400w,
  https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=xxxl 1100w,
  https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=xxl 900w,
  https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=xl 750w,
  https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=l 700w,
  https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=m 600w,
  https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=s 500w,
  https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=xs 400w,
  https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=xxs 300w,
  https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=xxxs 160w,
  https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=u 80w,
  https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=xu 40w,
  https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=xxu 39w
"
										sizes="(max-width: 400px) 300px, (max-width: 600px) 500px, 400px"
										src="https://www.ikea.com/kr/ko/images/products/ekeroe-armchair-skiftebo-beige__0629853_PE694518_S5.JPG?f=xs">
								</div>
							</div>
						</div>
					</div>
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

	<div class="modal fade right" id="modalPoll-3" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div
			class="modal-dialog modal-full-height modal-right modal-notify modal-info"
			role="document">
			<div class="modal-content">
				<!--Header-->
				<div class="modal-header"
					style="background-color: rgb(190, 190, 190);">
					<p class="heading lead">
						<strong>상품평</strong>
					</p>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="white-text">×</span>
					</button>
				</div>

				<!--Body-->
				<div class="container my-5">


					<!--Section: Block Content-->
					<section class="dark-grey-text mb-5">

						<!-- Section heading -->
						<h3 class="font-weight-bold text-center mb-5">Product Reviews</h3>

						<div class="media mb-3">
							<img
								class="card-img-100 rounded-circle z-depth-1-half d-flex mr-3"
								src="https://mdbootstrap.com/img/Photos/Avatars/img (8).jpg"
								alt="Generic placeholder image">
							<div class="media-body">
								<a>
									<h5 class="user-name font-weight-bold">John Doe</h5>
								</a>
								<!-- Rating -->

								<ul class="rating mb-2 row" style="margin: 10px">
									<li><i class="fas fa-star blue-text"></i></li>
									<li><i class="fas fa-star blue-text"></i></li>
									<li><i class="fas fa-star blue-text"></i></li>
									<li><i class="fas fa-star blue-text"></i></li>
									<li><i class="fas fa-star blue-text"></i></li>
								</ul>

								<div class="card-data">
									<ul class="list-unstyled mb-1">
										<li class="comment-date font-small grey-text"><i
											class="far fa-clock"></i> 05/10/2015</li>
									</ul>
								</div>
								<p class="dark-grey-text article">Ut enim ad minim veniam,
									quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
									commodo consequat. Duis aute irure dolor in reprehenderit in
									voluptate velit esse cillum dolore eu fugiat nulla pariatur.
									Excepteur sint occaecat cupidatat non proident.</p>
							</div>
						</div>

						<div class="media mb-3">
							<img
								class=" card-img-100 rounded-circle z-depth-1-half d-flex mr-3"
								src="https://mdbootstrap.com/img/Photos/Avatars/img (28).jpg"
								alt="Generic placeholder image">
							<div class="media-body">
								<a>
									<h5 class="user-name font-weight-bold">Martha Smith</h5>
								</a>
								<!-- Rating -->
								<ul class="rating mb-2 row" style="margin: 10px">
									<li><i class="fas fa-star blue-text"></i></li>
									<li><i class="fas fa-star blue-text"></i></li>
									<li><i class="fas fa-star blue-text"></i></li>
									<li><i class="fas fa-star blue-text"></i></li>
									<li><i class="fas fa-star grey-text"></i></li>
								</ul>
								<div class="card-data">
									<ul class="list-unstyled mb-1">
										<li class="comment-date font-small grey-text"><i
											class="far fa-clock"></i> 05/10/2015</li>
									</ul>
								</div>
								<p class="dark-grey-text article">Ut enim ad minim veniam,
									quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
									commodo consequat. Duis aute irure dolor in reprehenderit in
									voluptate velit esse cillum dolore eu fugiat nulla pariatur.
									Excepteur sint occaecat cupidatat non proident.</p>
							</div>
						</div>

						<div class="media">
							<img
								class=" card-img-100 rounded-circle z-depth-1-half d-flex mr-3"
								src="https://mdbootstrap.com/img/Photos/Avatars/img (30).jpg"
								alt="Generic placeholder image">
							<div class="media-body">
								<a>
									<h5 class="user-name font-weight-bold">Lily Brown</h5>
								</a>
								<!-- Rating -->
								<ul class="rating mb-2 row" style="margin: 10px">
									<li><i class="fas fa-star blue-text"></i></li>
									<li><i class="fas fa-star blue-text"></i></li>
									<li><i class="fas fa-star blue-text"></i></li>
									<li><i class="fas fa-star blue-text"></i></li>
									<li><i class="fas fa-star blue-text"></i></li>
								</ul>
								<div class="card-data">
									<ul class="list-unstyled mb-1">
										<li class="comment-date font-small grey-text"><i
											class="far fa-clock"></i> 05/10/2015</li>
									</ul>
								</div>
								<p class="dark-grey-text article">Ut enim ad minim veniam,
									quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
									commodo consequat. Duis aute irure dolor in reprehenderit in
									voluptate velit esse cillum dolore eu fugiat nulla pariatur.
									Excepteur sint occaecat cupidatat non proident.</p>
							</div>
						</div>

					</section>
					<!--Section: Block Content-->


				</div>
				<!--Body-->


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
	<!-- Modal: modalPoll -->


	<div class="container  ">
		<!--Section: Content-->
		<section class="text-center">

			<!-- Section heading -->
			<h3 class="font-weight-bold mb-5">제품 상세페이지</h3>
			<hr>

			<div class="row between">

				<div class="col-lg-6">

					<!--Carousel Wrapper-->
					<div id="carousel-thumb"
						class="carousel slide carousel-fade carousel-thumbnails"
						data-ride="carousel">

						<!--Slides-->
						<div class="carousel-inner text-center text-md-left"
							role="listbox">
							<div class="carousel-item active">
								<img
									src="https://www.ikea.com/kr/ko/images/products/nordkisa-open-wardrobe-with-sliding-door-bamboo__0756079_PE748762_S5.JPG?f=s"
									alt="First slide" class="img-fluid">
							</div>
							<div class="carousel-item">
								<img
									src="https://www.ikea.com/kr/ko/images/products/nordkisa-open-wardrobe-with-sliding-door-bamboo__0756078_PE748761_S5.JPG?f=s"
									alt="Second slide" class="img-fluid">
							</div>
							<div class="carousel-item">
								<img
									src="https://www.ikea.com/kr/ko/images/products/nordkisa-open-wardrobe-with-sliding-door-bamboo__0756109_PE748737_S5.JPG?f=s"
									alt="Third slide" class="img-fluid">
							</div>
							<div class="carousel-item">
								<img
									src="https://www.ikea.com/kr/ko/images/products/nordkisa-open-wardrobe-with-sliding-door-bamboo__0756087_PE748768_S5.JPG?f=s"
									alt="Third slide" class="img-fluid">
							</div>
							<div class="carousel-item">
								<img
									src="https://www.ikea.com/kr/ko/images/products/nordkisa-open-wardrobe-with-sliding-door-bamboo__0813675_PH165835_S5.JPG?f=s"
									alt="Third slide" class="img-fluid">
							</div>
							<div class="carousel-item">
								<img
									src="https://www.ikea.com/kr/ko/images/products/nordkisa-open-wardrobe-with-sliding-door-bamboo__0813674_PH165924_S5.JPG?f=s"
									alt="Third slide" class="img-fluid">
							</div>
							<div class="carousel-item">
								<img
									src="https://www.ikea.com/kr/ko/images/products/nordkisa-open-wardrobe-with-sliding-door-bamboo__0813676_PH165931_S5.JPG?f=s"
									alt="Third slide" class="img-fluid">
							</div>
						</div>
						<!--/.Slides-->

						<!--Thumbnails-->
						<a class="carousel-control-prev" href="#carousel-thumb"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carousel-thumb"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="sr-only">Next</span>
						</a>
						<!--/.Thumbnails-->

					</div>
					<!--/.Carousel Wrapper-->

				</div>

				<div class="col-lg-5 text-center text-md-left">

					<h2
						class="h2-responsive text-center text-md-left product-name font-weight-bold dark-grey-text mb-1 ml-xl-0 ml-4">
						<strong>NORDKISA 노르드키사</strong>
					</h2>
					<span class="badge badge-danger product mb-4 ml-xl-0 ml-4">bestseller</span>
					<h3
						class="h3-responsive text-center text-md-left mb-5 ml-xl-0 ml-4">
						<span class="red-text font-weight-bold"> <strong>$49</strong>
						</span> <span class="grey-text"> <small> <s>$89</s>
						</small>
						</span>
					</h3>

					<hr>


					<!-- Add to Cart -->
					<section class="color">
						<div class="mt-5">
							<p class="grey-text fontbor">색상 선택</p>
							<div class="row text-center text-md-left">


								<div class=" ">
									<button
										class=" "
										type="button">

								
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M15.5996 11.9999L9.81456 17.7857L8.40026 16.3716L12.7714 11.9999L8.40026 7.62823L9.81457 6.21411L15.5996 11.9999Z"></path></svg>
									</button>
									<div class="">
										<a
											href="https://www.ikea.com/kr/ko/p/hansola-chair-bamboo-kimstad-black-70474458/"
											class="    ">
											<div class=" ">
												<img loading="lazy"
													class=""
													alt="HANSOLA 한솔라 의자, 대나무/킴스타드 블랙"
													srcset="
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=g 1600w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=sg 1400w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=xxxl 1100w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=xxl 900w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=xl 750w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=l 700w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=m 600w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=s 500w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=xs 400w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=xxs 300w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=xxxs 160w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=u 80w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=xu 40w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=xxu 39w
"
													sizes="40px"
													src="https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-kimstad-black__0812256_PE771982_S5.JPG?f=xu">
											</div></a><a
											class="    "><div
												class=" ">
												<img loading="lazy"
													class=""
													alt="HANSOLA 한솔라 의자, 대나무/힐라레드 앤트러싸이트"
													srcset="
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=g 1600w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=sg 1400w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=xxxl 1100w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=xxl 900w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=xl 750w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=l 700w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=m 600w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=s 500w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=xs 400w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=xxs 300w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=xxxs 160w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=u 80w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=xu 40w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=xxu 39w
"
													sizes="40px"
													src="https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-hillared-anthracite__0812255_PE771981_S5.JPG?f=xu">
											</div></a><a
											href="https://www.ikea.com/kr/ko/p/hansola-chair-bamboo-brown-hillared-anthracite-00476470/"
											class="    "><div
												class=>
												<img loading="lazy"
													class=""
													alt="HANSOLA 한솔라 의자, 대나무 브라운/힐라레드 앤트러싸이트"
													srcset="
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=g 1600w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=sg 1400w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=xxxl 1100w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=xxl 900w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=xl 750w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=l 700w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=m 600w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=s 500w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=xs 400w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=xxs 300w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=xxxs 160w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=u 80w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=xu 40w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=xxu 39w
"
													sizes="40px"
													src="https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-brown-hillared-anthracite__0812244_PE771978_S5.JPG?f=xu">
											</div></a><a
											href="https://www.ikea.com/kr/ko/p/hansola-chair-bamboo-black-kimstad-black-50474459/"
											class="    "><div
												class=>
												<img loading="lazy"
													class=""
													alt="HANSOLA 한솔라 의자, 대나무 블랙/킴스타드 블랙"
													srcset="
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=g 1600w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=sg 1400w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=xxxl 1100w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=xxl 900w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=xl 750w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=l 700w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=m 600w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=s 500w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=xs 400w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=xxs 300w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=xxxs 160w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=u 80w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=xu 40w,
  https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=xxu 39w
"
													sizes="40px"
													src="https://www.ikea.com/kr/ko/images/products/hansola-chair-bamboo-black-kimstad-black__0812254_PE771980_S5.JPG?f=xu">
											</div></a>
									</div>
								</div>
							</div>

							<hr>

							<div class="row mt-3">
								<div class="col-md-12 text-center text-md-left">
								<br>
									<button class="btn btn-primary btn-rounded col-8" style="background-color: #004f93 !important; border-radius: 52px; width ">
										<i class="fas fa-cart-plus mr-2" aria-hidden="true"></i> Add
										to cart
									</button>
									<button class="" style="border: 1px solid gray; border-radius: 52px; width: 40px; height: 40px;">
										<i class="far fa-heart"></i>
									</button>
								</div>
							</div>

							<!--             좋아요 버튼 -->




							<!--             좋아요 버튼 -->

						</div>
					</section>
					<!-- /.Add to Cart -->

				</div>

			</div>

			<hr>
			<!--Accordion wrapper-->
			<div class="accordion md-accordion" id="accordionEx" role="tablist"
				aria-multiselectable="true">

				<!-- Accordion card -->
				<div class="">

					<!-- Card header -->
					<div class="card-header" role="tab" id="headingOne1"
						data-toggle="modal" data-target="#modalPoll-1"
						style="background-color: white;">

						<a data-toggle="collapse" data-parent="#accordionEx" href=""
							aria-expanded="true" aria-controls="collapseOne1"
							style="width: 100%; margin-bottom: 14px ;">
							<div class="row justify-content-between">
								<p class="mb-0 dark-grey-text col-3 fontbor" style="margin-left: -100px;">제품 설명</p>
								<i class="fas fa-angle-right rotate-icon col-1 dark-grey-text"
									style="margin-top: 4px"></i>
							</div>
						</a>

					</div>


				</div>
				<hr>
				<!-- Accordion card -->

				<!-- Accordion card -->
				<div class="">

					<!-- Card header -->
					<div class="card-header" role="tab" id="headingTwo2"
						data-toggle="modal" data-target="#modalPoll-2"
						style="background-color: white;">

						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordionEx" aria-expanded="false"
							aria-controls="collapseTwo2"
							style="width: 100%; margin-bottom: 14px;">
							<div class="row justify-content-between">
								<p class="mb-0 dark-grey-text col-3 fontbor" style="margin-left: -100px;">제품 크기</p>
								<i class="fas fa-angle-right rotate-icon dark-grey-text col-1"
									style="margin-top: 4px"></i>
							</div>
						</a>

					</div>

					<!-- Card body -->

				</div>
				<hr>
				<!-- Accordion card -->

				<!-- Accordion card -->
				<div class="">

					<!-- Card header -->
					<div class="card-header" role="tab" id="headingThree3"
						data-toggle="modal" data-target="#modalPoll-3"
						style="background-color: white;">

						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordionEx" aria-expanded="false"
							aria-controls="collapseThree3"
							style="width: 100%; margin-bottom: 14px;">
							<div class="row justify-content-between">
								<p class="mb-0 dark-grey-text col-3 fontbor" style="margin-left: -112px;">상품평</p>
								<i class="fas fa-angle-right rotate-icon dark-grey-text col-1"
									style="margin-top: 4px"></i>
							</div>
						</a>

					</div>

					<!-- Card body -->

				</div>
				<!-- Accordion card -->

			</div>
			<!--/.Accordion wrapper-->

		</section>
		<!--Section: Content-->


	</div>


	<script>
		$('.carousel').carousel({
			interval : 2000
		})
	</script>



</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
