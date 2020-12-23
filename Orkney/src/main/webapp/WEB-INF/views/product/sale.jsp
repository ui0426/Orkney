<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="메인화면" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/product/sale.css">
<link rel="stylesheet" href="${path}/resources/css/product/rooms.css">
<link rel="stylesheet" href="${path }/resources/css/product/products.css">
<jsp:useBean id="now" class="java.util.Date" />
<section class="ev-container ">
	<div class="ev-container-inner">
		<div class="ev-top">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">홈</a></li>
					<li class="breadcrumb-item active" aria-current="page">더 낮은 새로운 가격, 품질은 그대로 가격은 아래로</li>
				</ol>
			</nav>
		</div>
		<div>



			<h1 class="ev-h1">더 낮은 새로운 가격, 품질은 그대로 가격은 아래로</h1>

			<div class="ev-hd">
				<div class="ev-pim">
					<span class="ev-sps">IKEA는 품질을 그대로 유지하는 것이 가격을 낮추는 유일한 방법이라고
						생각해요. 그래서 디자인, 제작, 플랫팩 포장 과정 전반에 걸쳐 가장 좋은 방법을 찾기 위해 많은 시간을 투자하고
						있죠. 투자한 시간만큼 모두가 비용을 절약할 수 있게 됩니다. IKEA는 생산 비용을, 고객 여러분은 구매 비용을
						말이죠. 작은 빨간라벨은 단순히 좋은 가격만 나타내는 것이 아니에요. 더 낮은 가격에 더 좋은 것을 제공하기 위한
						IKEA의 노력에도 끝이란 없습니다.</span> <a class="ev-md-secondary-2nd" href="${path}/product/products.do?category=all&sale=sale">
						<span class="ev-md-small"> <span class="ev-md-label">더
								낮은 새로운 가격의 제품 보기 </span>
					</span>
					</a>
				</div>
				<div class="ev-img-sp">
				 <c:forEach items="${sale}" var="p" varStatus="a"> 
				 	<c:if test="${a.index==0}">
					<img class="event-img"
						src="${path}/resources/images/product/${p.PRODUCT_PIC}">
						
					
					<ul>
						<li>
							<a> 
								
										
											
								 <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />  
								<fmt:formatDate value="${p.PRODUCT_ENROLL_DATE }" pattern="yyyy-MM-dd" var="write_dt"/>
								<span class="rm-pb-et-new bottom-mig" style="display: inline;">${today <= write_dt?"NEW":""}</span>
								<span class="ev-pb-et-p bottom-mig">더 낮은 새로운 가격</span> 
								<span class="ev-bt-name bottom-mig">${p.PRODUCT_NAME}</span> 
								<span class="rm-bt-sp bottom-mig"> ${p.BIG_CATEGORY_CONTENT} </span>
								<span class="rm-bt-et-price bottom-mig"><fmt:setLocale value="ko_KR" />
								<fmt:formatNumber type="currency" value="${p.SALE_PER}" /></span> 
								<span class="ev-bt-price" style="font-size:1rem;"><fmt:setLocale value="ko_KR" /> 
								<fmt:formatNumber type="currency" value="${p.PRODUCT_PRICE}" /></span>
							</a>
						</li>
					</ul>
					</c:if>
					</c:forEach>
				</div>
			</div>
			<hr>
			<div>
				<div class="ev-md-container">
					<div class="ev-md-container-inner">
						<div class="ev-md-info">

							<h2 class="ev-md-hnzkp">할인 판매가 아니에요</h2>
							<p class="ev-md-description">더 좋은 생활을 위한 더 낮은 가격, 우리가 나아가야 할
								방향입니다.</p>

						</div>

					</div>
					<a class="ev-md-secondary" href="${path}/product/products.do?category=all&sale=sale" style="color:black;"> <span
						class="ev-md-small-ww"> <span class="ev-md-label-ww">더 많은
								제품 확인하기 </span>
					</span>
					</a>

				</div>
				<div class="newProduct">
					<div class="swiper-container">
						<div class="swiper-wrapper abc">
							 <c:forEach items="${sale}" var="p"> 
							<div class="swiper-slide tjfwlsgh">
								<div class="col">
									<!-- Card -->
									<div class="card">
										<!--Card image-->
										<div class="view overlay zoom">
											<img class="card-img-top"
												src="${path}/resources/images/product/${p.PRODUCT_PIC}"
												alt="Card image cap"> <a
												href="${path}/product/productDetail.do?productno=${p.PRODUCT_NO}">
												<div class="mask rgba-white-slight"></div>
											</a>
										</div>
										<!--Card content-->
										<div class="card-body">
										
										<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" /> 
										<fmt:formatDate value="${p.PRODUCT_ENROLL_DATE }" pattern="yyyy-MM-dd" var="write_dt"/>
											<span class="rm-pb-et-new">${today <= write_dt?"NEW":""}</span>
											<span class="ev-pb-et-p-rm">더 낮은 새로운 가격</span>
											
											<!--Title-->
											<h4 class="card-title event-product-name">
												${p.PRODUCT_NAME} 
											</h4>
											<!--Text-->
											<p class="card-text marginZero each ">
												 ${p.BIG_CATEGORY_CONTENT} 
											</p>
											
											 <p class="card-text marginZero event-price"><fmt:setLocale value="ko_KR" />
												<fmt:formatNumber type="currency" value="${p.PRODUCT_PRICE}" /></p>
											<p class="card-text marginZero product-price"><fmt:setLocale value="ko_KR" />
												<fmt:formatNumber type="currency" value="${p.SALE_PER}" /></p>
												
											
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

								</div>
							</div>

						</c:forEach> 
							<!-- Add Pagination -->
							<div class="swiper-scrollbar"></div>
							
						</div>
						<!-- Add Arrows -->
							<img src="${path}/resources/images/rooms/pngegg2222.png"
								class="swiper-button-next"> <img
								src="${path}/resources/images/rooms/pngegg.png"
								class="swiper-button-prev">
					</div>
				</div>
				<hr>
				<div class="ev-md-container">
					<div class="ev-md-container-inner">
						<div class="ev-md-info">
							<h2 class="ev-md-hnzkp">낮은 가격의 비밀이 궁금하신가요?</h2>
							<p class="ev-md-description">IKEA는 더 스마트한 디자인과 플랫팩, 대량 생산을 통해
								합리적인 가격의 제품을 제공하고 있어요. 단, 우수한 품질은 절대로 포기하지 않습니다.</p>
						</div>
					</div>
				</div>
				<div class="ev-side">
					
						<div class="ev-item">
							<div><img class="event-inner" src="${path}/resources/images/product/sale/-c094a8807d9ecc6939d9409e7c46fdf0.jpg"></div>
							<div>
								<h2 class="ev-h2-st ev-h2">사랑받을수록 더욱 낮아지는 가격</h2>
								<p class="ev-h2-st"><strong class="ev-st">대량생산</strong></p>
								<p class="ev-h2-st ev-p">많은 사람들이 좋아하는 제품일수록 많이 만들게 돼요. 많이 만들수록 생산 비용은 줄어들고, 최종 가격도 낮아지죠. 가격이 낮아지면 더 많은 사람들이 좋아하게 되고, 더욱 낮은 가격을 위한 선순환을 만들 수 있어요.</p>
							</div>
						</div>
					
					
						<div class="ev-item">
							<div><img class="event-inner" src="${path}/resources/images/product/sale/-7537b07cf23ce81402ad24f46a7e7804.jpg"></div>
							<div>
								<h2 class="ev-h2-st ev-h2">세심한 디테일, 더 낮아지는 가격</h2>
								<p class="ev-h2-st"><strong class="ev-st">스마트한 디자인</strong></p>
								<p class="ev-h2-st ev-p">원리는 간단해요. 구멍의 너비부터 나사의 크기까지, 이러한 디테일을 똑같이 디자인할수록 생산 및 조립 과정에서 투자하는 시간과 비용이 줄어들게 됩니다. 스마트한 디자인은 모든 일을 간단하게 만들어주고, 이게 바로 가격을 낮추는 방법입니다.</p>
							</div>
						</div>
					
						<div class="ev-item">
							<div><img class="event-inner" src="${path}/resources/images/product/sale/-0e352169c0af51bbd944f504129f2266.jpg"></div>
							<div>
								<h2 class="ev-h2-st ev-h2">납작할수록 더 좋아요</h2>
								<p class="ev-h2-st"><strong class="ev-st">플랫팩 포장</strong></p>
								<p class="ev-h2-st ev-p">IKEA에서 플랫팩 포장을 사용하는 이유는 무엇일까요? 공간을 절약해주고, 공간은 비용과 관련이 있기 때문이에요. 플랫팩 포장을 통해 한 트럭에 두 배 더 많은 제품을 실을 수 있어 트럭의 사용을 줄이고 비용을 절약할 수 있게 됩니다. 환경 보호에도 도움이 되니 더할 나위 없이 좋겠죠?</p>
							</div>
						</div>
				</div>
				<hr class="hr-line">
			</div>
		</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
	var swiper = new Swiper('.swiper-container', {
		slidesPerView : 1,
		spaceBetween : 5,
		slidesPerGroup : 1,
		loop : false,
		simulateTouch : false,
		allowTouchMove : false,
		loopFillGroupWithBlank : false,
		scrollbar : {
			el : '.swiper-scrollbar',
			hide : true,
		},

		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		},

		//반응형
		breakpointsInverse : true,
		breakpoints : {

			320 : {
				slidesPerView : 1,
				spaceBetween : 5

			},

			480 : {
				slidesPerView : 1,
				spaceBetween : 5
			},

			640 : {
				slidesPerView : 2,
				spaceBetween : 10
			},

			800 : {
				slidesPerView : 3,
				spaceBetween : 10
			},
			1200 : {
				slidesPerView : 4,
				spaceBetween : 10
			}

		}

	});
</script>
					


