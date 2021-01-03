
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
.embed-responsive-16by9::before {
    padding-top: 0% !important;
}
.h32rem{
height: 32rem;
}
.rm-pb-et-new {
	font-size: 1.2rem;
	line-height: 1.42857;
    color: darkslateblue;
	display: block;
	font-weight: 700;
	margin-bottom: .3125rem;
	 height: 19.5px;
}
.rm-pb-et-p {
	font-size: 1.2rem;
	line-height: 1.42857;
	color: #ed022a;
	display: block;
	font-weight: 700;
	margin-bottom: .3125rem;
	height: 19.5px;
}
.fontSS{
    font-size: 16px;
    font-weight: 400;
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
							<div class="card-body" id="productInfo">양면 등쿠션은 부드럽고 편안하며 양면의 디자인이 다릅니다.
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
											<span class="">배송&amp;설치비용</span> 
											<span class="">오크니 서비스 페이지 참조</span>
										</div>
										<div class="">
											<span class="">품질보증</span> <span class="">ORKNEY 품질 보증
												기준을 따릅니다. 홈페이지에서 ORKNEY 품질 보증을 확인 하세요.</span>
										</div>
										<div class="">
											<span class="">교환 환불 책임자와 전화 번호</span> <span class="">ORKNEY
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
								<dt class="" >폭:&nbsp;</dt>
								<dd class="" id="width">70 cm</dd>
							</div>
							<div class="row">
								<dt class="">깊이:&nbsp;</dt>
								<dd class="" id="depth">73 cm</dd>
							</div>
							<div class="row">
								<dt class="">높이:&nbsp;</dt>
								<dd class="" id="height">75 cm</dd>
							</div>
<!-- 							<div class="row"> -->
<!-- 								<dt class="">시트 폭:&nbsp;</dt> -->
<!-- 								<dd class="">57 cm</dd> -->
<!-- 							</div> -->
<!-- 							<div class="row"> -->
<!-- 								<dt class="">시트 깊이:&nbsp;</dt> -->
<!-- 								<dd class="">46 cm</dd> -->
<!-- 							</div> -->
<!-- 							<div class="row"> -->
<!-- 								<dt class="">시트 높이:&nbsp;</dt> -->
<!-- 								<dd class="">43 cm</dd> -->
<!-- 							</div> -->
						</dl>
						<div class="">
							<div class="">
								<div class="">
									<img loading="lazy" class="" alt="EKERÖ 에케뢰 암체어, 시프테보 베이지"
										srcset="
<%-- 										${path}/resources/images/product/${p.PRODUCT_PIC}, --%>
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
<!-- 		▼▼▼▼▼▼▼상품평▼▼▼▼▼ -->

	<div class="modal fade right" id="modalPoll-3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="overflow: auto;">
		<div class="modal-dialog modal-full-height modal-right modal-notify modal-info" role="document">
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
				<div class="container my-5" >
				<!--Body-->
  				<section class="dark-grey-text mb-5" id="reviewCon" >
						<!-- Section heading -->
						<h3 class="font-weight-bold text-center mb-5">Product Reviews</h3>

						
				</section>
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
						data-ride="carousel" data-interval="false">

						<!--Slides-->
						<div class="carousel-inner text-center text-md-left" id="imgcon"
							role="listbox">
							
							<div class="carousel-item active">
								<img class="img_main"
									src=""
									alt="First slide" class="img-fluid" style="width: 100%;">
							</div>

						</div>
							<div style="display: none;">
							<div class="carousel-item" id="productclone">
								<img id="thirdImg"
									src=""
									alt="Second slide" class="img-fluid" style="width: 100%;">
							</div>
							</div>
						
						<!--/.Slides-->

						<!--Thumbnails-->
						<a class="carousel-control-prev" href="#carousel-thumb"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon " aria-hidden="true" style="background-color: dimgrey;"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next" href="#carousel-thumb"
							role="button" data-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true" style="background-color: dimgrey;"></span> <span
							class="sr-only" >Next</span>
						</a>
						<!--/.Thumbnails-->

					</div>
					<!--/.Carousel Wrapper-->

				</div>

				<div class="col-lg-5 text-center text-md-left">
					<div style="display: flex; justify-content: space-between;">
						<span class="rm-pb-et-p"><p class="rm-pb-et-p">더 낮은 새로운 가격</p></span>	
						<span class="rm-pb-et-new ">NEW</span>			
					</div>
					<hr>
					<h1 class="productName" id="productName"
						class="h2-responsive text-center text-md-left product-name font-weight-bold dark-grey-text mb-1 ml-xl-0 ml-4">
						<c:out value="${p.PRODUCT_NAME}"/>
					</h1>
<!-- 					할인표시 -->
<!-- 					<span class="badge badge-danger product mb-4 ml-xl-0 ml-4">bestseller</span> -->
					<h3
						class="h3-responsive text-center text-md-left mb-5 ml-xl-0 ml-4">
						<span class=" font-weight-bold" id="productPrice"> 
						</span>
						<strong id="won">원</strong>
													<p class="card-text marginZero">
							<div class="marginZero">

								<div class="col row fontR" style="font-size: 21px; font-weight: bold;">								
									<div id="" class="ht-four"></div>
									<div id="won2">원</div>
								</div>
							</div>

							</p>
<!-- 						<span class="red-text font-weight-bold"> -->
<!-- 						<strong>원</strong> -->
<!-- 						</span>  -->
						
<!-- 						@정상가 찍찍@ -->
<!-- 						<span class="grey-text">  -->
<!-- 						<small> <s>$89</s> </small> -->
<!-- 						</span>  -->
						
					</h3>

					<hr>
						<div class="marginZero">
						<p class="grey-text fontbor"> SIZE</p>
							<div id="WIDTH" class="fontSS"></div>
							<div id="HEIGHT" class="fontSS"></div>
							<div id="DEPTH" class="fontSS"></div>
						</div>
					<hr>
					<!-- Add to Cart -->
					<section class="color">
						<div class="mt-5">
							<p class="grey-text fontbor" id="selectColor"></p>
							<p id="colorName" class="fontbor"></p>
							<div class="row text-center text-md-left">
							
								<div class="row" id="colorProductCon">
									
									
									
								<div class="" style="display: none;">
										<biv class="" href="" id="colorProductA" onclick="colorClick();">
											<div class="" style="margin: 1rem;">
												<img loading="" class="" alt="" sizes="40px" src="" id="colorProduct" style="width: 4rem;">
											</div>
										</div>	
									</div>
								</div>
							</div>

							<hr>

							<div class="row mt-3">
								<div class="col-md-12 text-center text-md-left">
								<br>
								
<button id="btnck" class="btn btn-primary btn-rounded col-8 productNo" style="background-color: #004f93 !important; border-radius: 52px;" data-toggle="modal" data-target="#modalAbandonedCart">
			<i class="fas fa-cart-plus mr-2" aria-hidden="true"></i>																				
</button>									
<button data-toggle="modal" data-target="#modalAddWish" onclick="fn_addWishModal();" class="" style="border: 1px solid gray; border-radius: 52px; width: 40px; height: 40px;">
										<i class="far fa-heart"></i>
</button>
								</div>
							</div>
							
<!-- Modal: modalAbandonedCart-->
<div class="modal fade right" id="modalAddWish" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" data-backdrop="false" >
  <div class="modal-dialog modal-side modal-top-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content" id="insertWish">
    </div>
    <!--/.Content-->
  </div>
</div>
<!-- Modal: modalAbandonedCart-->							
<script>
function fn_addWishModal(){
	<c:forEach items="${list}" var="r" varStatus="s" >
	$.ajax({
		type: 'post',
		data: {pNo:"${r.PRODUCT_NO}"},
		url: '${ path }/wishlist/insertWishModal.do',
		success: function(data){
			console.log(data);
			$('#insertWish').html(data);
		}
		
	})
	</c:forEach>
}
//장바구니 insert ajax
$(function(){
	
	<c:forEach items="${list}" var="r" varStatus="s" >				
		$("#btnck").click(e=>{
			$.ajax({
				url:"${path }/cart/cartInsert.do",
				data:{
					productNo:"${r.PRODUCT_NO}",
					productPrice:"${r.PRODUCT_PRICE}"
					},
				success:data=>{}
			})
		})		

	</c:forEach>	
});
</script>
				
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
            	<div class="productName" id="productName"><c:out value="${p.PRODUCT_NAME}"/></div>
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
								<p class="mb-0 dark-grey-text col-3 fontbor" style="margin-left: 100px;">제품 설명</p>
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
								<p class="mb-0 dark-grey-text col-3 fontbor" style="margin-left: 100px;">제품 크기</p>
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
								<p class="mb-0 dark-grey-text col-3 fontbor" style="margin-left: 100px;">상품평</p>
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
	
<!--Modal: modalVM 리뷰 사진확대-->

<div class="modal fade" id="modalVM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">

    <!--Content-->
    <div class="modal-content">

      <!--Body-->
      <div class="modal-body mb-0 p-0">

        <div class="embed-responsive embed-responsive-16by9 z-depth-1-half">
        
        <div class="container my-5">

  <!--Section: Content-->
  <section class="text-center dark-grey-text mb-5">
    <div class="row">
      <div class="col-md-12">

        <!--Carousel Wrapper-->
        <div id="carousel-example-1z" class="carousel slide" data-ride="carousel" data-interval="false">
          <!--Indicators-->
          <ol class="carousel-indicators">
            <li data-target="#carousel-example-1z" data-slide-to="0" class="active" id="imgDat1"></li>
            <li data-target="#carousel-example-1z" data-slide-to="1" id="imgDat2"></li>
            <li data-target="#carousel-example-1z" data-slide-to="2" id="imgDat3"></li>
          </ol>
          <!--/.Indicators-->
          <!--Slides-->
          <div class="carousel-inner" role="listbox" id="reviewImgZoomCon">
            <!--First slide-->

            <!--/First slide-->
            <!--Second slide-->

            <!--/Second slide-->
            <!--Third slide-->
     
            <!--/Third slide-->
          </div>
          <!--/.Slides-->
          <!--Controls-->
          <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev" id="prevId">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next" id="nextId">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
          <!--/.Controls-->
        </div>
        <!--/.Carousel Wrapper-->

      </div>
    </div>

  </section>
              <div style="display: none;">
            <div class="carousel-item active" id="imgMiniNone0">
              <img class="d-block w-100 h32rem" id="reviewImgZoom1" src="https://mdbootstrap.com/img/Photos/Horizontal/Architecture/12-col/img%20(10).jpg"
                alt="First slide">
            </div>
            </div>
              <div style="display: none;">
            <div class="carousel-item" id="imgMiniNone1" >
              <img class="d-block w-100 h32rem" id="reviewImgZoom2" src="https://mdbootstrap.com/img/Photos/Horizontal/Architecture/12-col/img%20(11).jpg"
                alt="Second slide">
            </div>
            </div>
            <div style="display: none;">
            <div class="carousel-item h32rem" id="imgMiniNone2" >
              <img class="d-block w-100" id="reviewImgZoom3" src="https://mdbootstrap.com/img/Photos/Horizontal/Architecture/12-col/img%20(12).jpg"
                alt="Third slide">
            </div>
            </div>
  <!--Section: Content-->


</div>
<!--           <iframe class="embed-responsive-item" src="https://player.vimeo.com/video/115098447" -->
<!--             allowfullscreen></iframe> -->
        </div>

      </div>

      <!--Footer-->
      <div class="modal-footer justify-content-center flex-column flex-md-row">
<!--         <span class="mr-4">Spread the word!</span> -->
        <div>
<!--           <a type="button" class="btn-floating btn-sm btn-fb"> -->
<!--             <i class="fab fa-facebook-f"></i> -->
<!--           </a> -->
<!--           Twitter -->
<!--           <a type="button" class="btn-floating btn-sm btn-tw"> -->
<!--             <i class="fab fa-twitter"></i> -->
<!--           </a> -->
<!--           Google + -->
<!--           <a type="button" class="btn-floating btn-sm btn-gplus"> -->
<!--             <i class="fab fa-google-plus-g"></i> -->
<!--           </a> -->
<!--           Linkedin -->
<!--           <a type="button" class="btn-floating btn-sm btn-ins"> -->
<!--             <i class="fab fa-linkedin-in"></i> -->
<!--           </a> -->
        </div>
        <button type="button" class="btn btn-outline-primary btn-rounded btn-md ml-4"
          data-dismiss="modal">Close</button>

      </div>

    </div>
    <!--/.Content-->

  </div>
</div>

<!--Modal: modalVM-->

<div style="display: none">
<div class="media mb-3" id="reviewClone" >
<!-- 						▼▼▼▼회원 이미지 OR 상품 이미지▼▼▼▼ -->
							<div id="reviewImgCon">
							<a  data-toggle="modal" data-target="#modalVM" id="imgZoom" >
							<img id="productImg"
									class="card-img-100 rounded-circle z-depth-1-half d-flex mr-3"
									src=""
									alt="Generic placeholder image">
							</a>
							</div>
							<div class="media-body">
							
								
<!-- 								▼▼▼▼회원ID▼▼▼▼ -->
									<h5 class="user-name font-weight-bold" id="memberId">John Doe</h5>
								
								<!-- Rating -->
<!-- 							▼▼▼▼평점▼▼▼▼ -->
								<ul class="rating mb-2 row" style="margin: 10px">
<!-- 									<li><i class="fas fa-star blue-text"></i></li> -->
<!-- 									<li><i class="fas fa-star blue-text"></i></li> -->
<!-- 									<li><i class="fas fa-star blue-text"></i></li> -->
<!-- 									<li><i class="fas fa-star blue-text"></i></li> -->
<!-- 										★1점★ -->
<!-- 									<li><i class="fas fa-star blue-text"></i></li> -->
<!-- 										★0점★ -->
									<li><i id="starGray1" class="fas fa-star grey-text"></i></li>
									<li><i id="starGray2" class="fas fa-star grey-text"></i></li>
									<li><i id="starGray3" class="fas fa-star grey-text"></i></li>
									<li><i id="starGray4" class="fas fa-star grey-text"></i></li>
									<li><i id="starGray5" class="fas fa-star grey-text"></i></li>
								</ul>

								<div class="card-data">
									<ul class="list-unstyled mb-1">
<!-- 							▼▼▼▼▼리뷰 작성날짜▼▼▼▼▼ -->
										<i id="reviewDate" class="far fa-clock"></i>
										<li class="comment-date font-small grey-text" id="reviewDate">
										 05/10/2015
										 </li>
									</ul>
								</div>
<!-- 								▼▼▼▼▼리뷰▼▼▼▼▼ -->
								<p class="dark-grey-text article" id="review">Ut enim ad minim veniam,
									quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
									commodo consequat. Duis aute irure dolor in reprehenderit in
									voluptate velit esse cillum dolore eu fugiat nulla pariatur.
									Excepteur sint occaecat cupidatat non proident.</p>
								
								</div>
							</div>
</div>
			

	<script>
		$('.carousel').carousel({
			interval : false
		});

	</script>
<script type="text/javascript">


// ▼리뷰▼
$(function() {
	
<c:forEach items="${review}" var="r" varStatus="s">
if ("${r.REVIEW_NO}"!=null) {
	let reviewClone = $("#reviewClone").clone();
	
	$(reviewClone).find("#memberId").text('${r.MEMBER_ID}');
	

		
	if ("${r.PRODUCT_GRADE}"=='1') {
		$(reviewClone).find("#starGray1").removeClass("grey-text").addClass("blue-text");
		$(reviewClone).find("#starGray2").removeClass("blue-text").addClass("grey-text");
		$(reviewClone).find("#starGray3").removeClass("blue-text").addClass("grey-text");
		$(reviewClone).find("#starGray4").removeClass("blue-text").addClass("grey-text");
		$(reviewClone).find("#starGray5").removeClass("blue-text").addClass("grey-text");
	}else if ("${r.PRODUCT_GRADE}"=='2') {
		$(reviewClone).find("#starGray1").removeClass("grey-text").addClass("blue-text");
		$(reviewClone).find("#starGray2").removeClass("grey-text").addClass("blue-text");
		$(reviewClone).find("#starGray3").removeClass("blue-text").addClass("grey-text");
		$(reviewClone).find("#starGray4").removeClass("blue-text").addClass("grey-text");
		$(reviewClone).find("#starGray5").removeClass("blue-text").addClass("grey-text");
	}else if ("${r.PRODUCT_GRADE}"=='3') {
		$(reviewClone).find("#starGray1").removeClass("grey-text").addClass("blue-text");
		$(reviewClone).find("#starGray2").removeClass("grey-text").addClass("blue-text");
		$(reviewClone).find("#starGray3").removeClass("grey-text").addClass("blue-text");
		$(reviewClone).find("#starGray4").removeClass("blue-text").addClass("grey-text");
		$(reviewClone).find("#starGray5").removeClass("blue-text").addClass("grey-text");
	}else if ("${r.PRODUCT_GRADE}"=='4') {
		$(reviewClone).find("#starGray1").removeClass("grey-text").addClass("blue-text");
		$(reviewClone).find("#starGray2").removeClass("grey-text").addClass("blue-text");
		$(reviewClone).find("#starGray3").removeClass("grey-text").addClass("blue-text");
		$(reviewClone).find("#starGray4").removeClass("grey-text").addClass("blue-text");
		$(reviewClone).find("#starGray5").removeClass("blue-text").addClass("grey-text");
	}else if ("${r.PRODUCT_GRADE}"=='5') {
		$(reviewClone).find("#starGray1").removeClass("grey-text").addClass("blue-text");
		$(reviewClone).find("#starGray2").removeClass("grey-text").addClass("blue-text");
		$(reviewClone).find("#starGray3").removeClass("grey-text").addClass("blue-text");
		$(reviewClone).find("#starGray4").removeClass("grey-text").addClass("blue-text");
		$(reviewClone).find("#starGray5").removeClass("grey-text").addClass("blue-text");
	}
	$(reviewClone).find("#reviewDate").text('${r.REVIEW_DATE}');
	$(reviewClone).find("#review").text('${r.REVIEW_CONTENT}');
// 	만드는중 	a태그 target 변경
	$(reviewClone).find("#imgZoom").attr("data-target","#modalVM"+'${s.index}');

	let imgZoomClone = $("#modalVM").clone().attr("id","modalVM"+'${s.index}');
	// 만드는중	클론생성
	$(imgZoomClone).find("#reviewImgZoomCon").attr("id","reviewImgZoomCon"+'${s.index}');
	$(imgZoomClone).find("#carousel-example-1z").attr("id","carousel-example-1z"+'${s.index}');
	$(imgZoomClone).find("#imgDat1").attr("data-target","#carousel-example-1z"+'${s.index}');
	$(imgZoomClone).find("#imgDat2").attr("data-target","#carousel-example-1z"+'${s.index}');
	$(imgZoomClone).find("#imgDat3").attr("data-target","#carousel-example-1z"+'${s.index}');
	$(imgZoomClone).find("#prevId").attr("href","#carousel-example-1z"+'${s.index}');
	$(imgZoomClone).find("#nextId").attr("href","#carousel-example-1z"+'${s.index}');



	
	
	var no='${r.REVIEW_NO}';
	$.ajax({
		url:"${path}/product/reviewImg.do",
		async : false,
		data: {
			"no":no
		},
		success:data=>{
			for (var i = 0; i < data.length; i++) {
			console.log('${s.index}:'+i+":"+data[i]["REVIEW_NO"]+":"+'${r.REVIEW_NO}'+"데이타:"+data[i]["RENAMEDFILENAME"]);
				if (data[i]["REVIEW_NO"]=='${r.REVIEW_NO}') {
					$(reviewClone).find("#productImg").attr("src","${path}/resources/upload/review/"+data[0]["RENAMEDFILENAME"]);
 					
					if (i==0) {
						$(imgZoomClone).find("#imgDat2").css("display","none");
						$(imgZoomClone).find("#imgDat3").css("display","none");
					}if (i==1) {
						$(imgZoomClone).find("#imgDat2").css("display","block");
						$(imgZoomClone).find("#imgDat3").css("display","none");
					}if (i==2) {
						$(imgZoomClone).find("#imgDat2").css("display","block");
						$(imgZoomClone).find("#imgDat3").css("display","block");
					}
				}
				
			}
			if (data=="") {
				$(reviewClone).find("#reviewImgCon").html("");
				
			}
		}
	

	});

	$("#reviewCon").append(reviewClone);

	
	$("#content").append(imgZoomClone);
	
	let imgMiniNone0 = $("#modalVM"+'${s.index}').find("#imgMiniNone0").clone();
	let imgMiniNone1 = $("#modalVM"+'${s.index}').find("#imgMiniNone1").clone();
	let imgMiniNone2 = $("#modalVM"+'${s.index}').find("#imgMiniNone2").clone();
	$.ajax({
		url:"${path}/product/reviewImg.do",
		async : false,
		data: {
			"no":no
		},
		success:data=>{
			for (var i = 0; i < data.length; i++) {	
				

 					
				if ('${r.REVIEW_NO}'==data[i]["REVIEW_NO"] && i=="0") {
 						console.log("몇번?"+data[0]["RENAMEDFILENAME"]);
 					$(imgMiniNone0).find("#reviewImgZoom1").attr("src","${path}/resources/upload/review/"+data[0]["RENAMEDFILENAME"]);
					$("#reviewImgZoomCon"+'${s.index}').append(imgMiniNone0);
					}
				if ('${r.REVIEW_NO}'==data[i]["REVIEW_NO"] && i=="1") {
 					
 					$(imgMiniNone1).find("#reviewImgZoom2").attr("src","${path}/resources/upload/review/"+data[1]["RENAMEDFILENAME"]);
					$("#reviewImgZoomCon"+'${s.index}').append(imgMiniNone1);
					}
 				if ('${r.REVIEW_NO}'==data[i]["REVIEW_NO"] && i=="2") {
 					
					$(imgMiniNone2).find("#reviewImgZoom3").attr("src","${path}/resources/upload/review/"+data[2]["RENAMEDFILENAME"]);
					$("#reviewImgZoomCon"+'${s.index}').append(imgMiniNone2);
					} 										
				}									
			}
	});
}else {
// 	댓글이 없습니다.
} 
// console.log('${s.index}');
</c:forEach>
});
//@리뷰이미지 컨트롤


//	3자리 마다 , 표시
function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
//색상 클릭 이벤트
function colorClick() {
	<c:forEach items="${list}" var="i" varStatus="s" >

	if ("${i.PRODUCT_COLOR}" != "normal") {
		let color = $("#colorProductA"+"${s.index}").find("#colorProduct").attr("alt");
		$("#colorName").html(color);
	}
	</c:forEach>
}
function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '' + month + '' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
}
// @제품정보 컨트롤
$(function(){

	<c:forEach items="${list}" var="i" varStatus="s" >

	var endDate = new Date("${i.PRODUCT_ENROLL_DATE}");
	endDate=getFormatDate(endDate);
	 var today = new Date();
	 today=getFormatDate(today)
 
 if(today>endDate){
	  $(".rm-pb-et-new").text('');
 }
 if("${i.SALE_PER}"=="${i.PRODUCT_PRICE}"){ //할인이 아닐때
	   $(".rm-pb-et-p").html('');
	   $("#productPrice").html(numberWithCommas("${i.PRODUCT_PRICE}"));
	   $(".ht-four").text(""); 
	   $(".ht-four").css("height","14px"); 
	   $("#won2").css("display","none"); 
 		
 }else if("${i.SALE_PER}"!="${i.PRODUCT_PRICE}"){
	 
	   $("#productPrice").html(numberWithCommas("${i.PRODUCT_PRICE}"));
	   $("#productPrice").css("text-decoration","line-through");
	   $("#productPrice").css("font-size","18px");
	   $("#won").css("text-decoration","line-through");
	   $("#won").css("font-size","18px");
	   $(".ht-four").html(numberWithCommas("${i.SALE_PER}")); 
	   $("#won2").css("display","block"); 
	   $(".fontR").css("color","red"); 
	   
 }
	
	
	$("#productName").text(("${i.PRODUCT_NAME}"));
	$("#WIDTH").text(("폭  "+":"+"${i.PRODUCT_WIDTH}"+"cm"));
	$("#HEIGHT").text(("높이 : "+"${i.PRODUCT_HEIGHT}"+"cm"));
	$("#DEPTH").text(("깊이 : "+"${i.PRODUCT_DEPTH}"+"cm"));
	

		
		
	$("#productNo").text(("${i.PRODUCT_NO}"));	
// 	$(".productName").text(("${i.PRODUCT_NAME}"));

	$("#productPrice").text(numberWithCommas(("${i.PRODUCT_PRICE}")));
	$("#width").text(("${i.PRODUCT_WIDTH}"));
	$("#depth").text(("${i.PRODUCT_DEPTH}"));
	$("#height").text(("${i.PRODUCT_HEIGHT}"));

	
	$("#productInfo").text("${i.PRODUCT_INFO}");
	
	if ("${i.PRODUCT_COLOR}" != "normal") {
		let colorProductA = $("#colorProductA").clone().attr("id","colorProductA"+"${s.index}");
		$(colorProductA).find("#colorProduct").attr("src","${path}/resources/images/product/"+"${i.PRODUCT_PIC}");
		$(colorProductA).find("#colorProduct").attr("alt","${i.PRODUCT_COLOR}");
		$("#colorProductCon").append(colorProductA);
			$("#selectColor").text("COLOR");
			$("#colorName").html("${i.PRODUCT_COLOR}");
			
			
		}

	
	
	/* $(".productNo").attr("onclick","location.href='${path }/cart/cartInsert.do?productNo=${i.PRODUCT_NO}&productPrice=${i.PRODUCT_PRICE}'"); */	
	</c:forEach>
});


// @사진 뽑아오기
$(function(){
						
						
// 	alert(imgarr);
	<c:forEach items="${list}" var="i"  varStatus="s">
// 		alert("${s.index}"+":"+"${i.PRODUCT_PIC}");		
		if ('${s.index}'=='0') {
			$(".img_main").attr("src","${path}/resources/images/product/"+'${i.PRODUCT_PIC}');
		}
		if('${s.index}'!='0') {
			let productclone=$("#productclone").clone();
			$(productclone).find("#thirdImg").attr("src","${path}/resources/images/product/"+'${i.PRODUCT_PIC}');
			$("#imgcon").append(productclone);
	
		}
	</c:forEach>
						
						
							
						
});

</script>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
