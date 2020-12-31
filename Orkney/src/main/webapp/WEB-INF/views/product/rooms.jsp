<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="메인화면" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/product/rooms.css">
<link rel="stylesheet"
	href="${path }/resources/css/product/products.css">
<jsp:useBean id="now" class="java.util.Date" />




<section class="rm-container ">
	<div class="rm-container-inner">
		<div class="rm-top">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">홈</a></li>
					<li class="breadcrumb-item"><a href="#open"
						onclick="roomsNav();">디지털쇼룸</a></li>
					<li class="breadcrumb-item active" aria-current="page">${param.type}</li>
				</ol>
			</nav>
		</div>
		<div>

			<div class="rm-hd">

				<h1 class="rm-h1">${param.type}</h1>
				<c:forEach items="${roomsTitle}" var="q" varStatus="w">
					<c:if test="${w.index== 0 }">
						<span class="rm-sp">${q.ROOM_H2 }</span>
						<span class="rm-sps">${q.ROOM_CONTEXT }</span>
					</c:if>
				</c:forEach>
			</div>


		</div>

		<div class="wrapper">
			<c:forEach items="${rooms}" var="r" varStatus="l" end="4">
				<input type="text" class="rm-none" value="${l.index}">
				<input type="text" class="rm-none2" value="${r.ROOM_NO}">
				<div class="rm-ig-box one">
					<img class="rm-ig"
						src="${path}/resources/images/rooms/${r.ROOM_PIC}">
					<c:forEach items="${roomsProduct}" var="p">
						<c:if test="${r.ROOM_NO == p.ROOM_NO}">
							<div class="rm-bt"
								style="top:${p.ROOMS_TOP>'0.4'?p.ROOMS_TOP:'0.4'}%; left:${p.ROOMS_LEFT<'94'?p.ROOMS_LEFT:'94'}%;">
								<a class="rm-a"></a>
								<div class="rm-pd-a"
									style="transform: translateX(-42%) translateY(-87%) translateY(-1.5rem);">
									<a class="rm-a-a"
										href="${path}/product/productDetail.do?productno=${p.PRODUCT_NO}">
										<div class="rm-pd-box">
											<div class="rm-pd-box-box">
												<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"
													var="today" />
												<fmt:parseNumber var="start_d"
													value="${p.PRODUCT_ENROLL_DATE.time /(1000*60*60*24)}"
													integerOnly="true" />
												<fmt:parseNumber var="end_d"
													value="${now.time /(1000*60*60*24)}" integerOnly="true" />
												<c:if test="${(end_d-start_d)<7}">
													<span class="rm-pb-et-new">NEW</span>
												</c:if>

												<c:if test="${p.SALE_PER!=p.PRODUCT_PRICE}">
													<span class="rm-pb-et-p">더 낮은 새로운 가격</span>
												</c:if>
												<div class="rm-bt-pb">
													<div class="rm-bt-name">${p.PRODUCT_NAME}</div>
													<div class="rm-bt-context">
														<span class="rm-bt-sp">${p.PRODUCT_INFO}</span>
													</div>
												</div>
											</div>
											<img class="rm-bt-ig"
												src="${path}/resources/images/rooms/KakaoTalk_20201120_194609.png">
										</div>
										<div>
											<div class="rm-bt-price">
												<fmt:setLocale value="ko_KR" />
												<fmt:formatNumber type="currency"
													value="${p.SALE_PER!=p.PRODUCT_PRICE? p.PRODUCT_PRICE:''}" />
											</div>
										</div>
										<div>
											<div class="rm-bt-et-price">
												<fmt:setLocale value="ko_KR" />
												<fmt:formatNumber type="currency"
													value="${p.SALE_PER!=p.PRODUCT_PRICE? p.SALE_PER:p.PRODUCT_PRICE}" />

											</div>
										</div>
									</a>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>

		<div class="rm-md-container">
			<div class="rm-md-container-inner">
				<div class="rm-md-info">
					<c:forEach items="${roomsTitle}" var="y" varStatus="u">
						<c:if test="${u.index==1}">
							<h2 class="rm-md-hnzkp">${y.ROOM_H2 }</h2>
							<p class="rm-md-description">${y.ROOM_CONTEXT }</p>
						</c:if>
					</c:forEach>
				</div>

			</div>

			<c:choose>
				<c:when test="${param.type=='침실'}">
					<a class="rm-md-secondary"
						href="${path}/product/products.do?category=all&sale="> <span
						class="rm-md-small"> <span class="rm-md-label">모든침대/매트리스
								보러가기 </span> <c:set var="loop_flag" value="true" />
					</span>
					</a>
				</c:when>
				<c:when test="${param.type=='거실'}">
					<a class="rm-md-secondary"
						href="${path}/product/products.do?category=all&sale="> <span
						class="rm-md-small"> <span class="rm-md-label">모든 거실
								상품 보러가기 </span> <c:set var="loop_flag" value="true" />
					</span>
					</a>
				</c:when>
				<c:when test="${param.type=='주방'}">
					<a class="rm-md-secondary"
						href="${path}/product/products.do?category=all&sale="> <span
						class="rm-md-small"> <span class="rm-md-label">모든 주방
								상품 보러가기</span> <c:set var="loop_flag" value="true" />
					</span>
					</a>
				</c:when>
				<c:when test="${param.type=='비지니스'}">
					<a class="rm-md-secondary"
						href="${path}/product/products.do?category=all&sale="> <span
						class="rm-md-small"> <span class="rm-md-label">모든
								비지니스 상품 보러가기 </span> <c:set var="loop_flag" value="true" />
					</span>
					</a>
				</c:when>
			</c:choose>
			</span> </a>
		</div>
		<div class="newProduct">
			<div class="swiper-container">
				<div class="swiper-wrapper abc">
					<c:forEach items="${roomsProduct}" var="p">
						<div class="swiper-slide tjfwlsgh">
							<div class="col">
								<!-- Card -->
								<div class="card">
									<!--Card image-->
									<div class="view overlay zoom">
										<img class="card-img-top"
											src="${path}/resources/images/product/${p.PRODUCT_PIC}"
											alt="Card image cap"> <a class="a-link"
											href="${path}/product/productDetail.do?productno=${p.PRODUCT_NO}">
											<div class="mask rgba-white-slight"></div>
										</a>
									</div>
									<!--Card content-->
									<div class="card-body">
										<fmt:parseNumber var="start_d"
											value="${p.PRODUCT_ENROLL_DATE.time /(1000*60*60*24)}"
											integerOnly="true" />
										<fmt:parseNumber var="end_d"
											value="${now.time /(1000*60*60*24)}" integerOnly="true" />
										<span class="rm-pb-et-new">${(end_d-start_d)<7?"NEW":""}</span>
										<span class="rm-pb-et-p">${p.SALE_PER!=p.PRODUCT_PRICE?"더 낮은 새로운 가격":""}</span>

										<!--Title-->

										<h4 class="card-title event-product-name"
											style="margin-top: 0px !important;">${ p.PRODUCT_NAME}</h4>
										<!--Text-->
										<p class="card-text marginZero each "
											style="margin-top: 0px !important; margin-bottom: 0px !important;">${p.BIG_CATEGORY_CONTENT}</p>
										<p class="card-text marginZero event-price">
											<fmt:setLocale value="ko_KR" />
											<fmt:formatNumber type="currency"
												value="${p.SALE_PER!=p.PRODUCT_PRICE? p.PRODUCT_PRICE:''}" />
										</p>
										<p class="card-text marginZero product-price">
											<fmt:setLocale value="ko_KR" />
											<fmt:formatNumber type="currency" value="${p.SALE_PER}" />
										</p>




										<div class="">
											<!-- 								별점  -->
											<ul class="rating mb-2 row" style="margin: 2px" id="starnum">

												<fmt:formatNumber var="grade" value="${p.ROOM_GRADE}"
													maxFractionDigits="1" pattern="##.###" />
												<fmt:formatNumber var="grade0" value="0" />
												<fmt:formatNumber var="grade1" value="1.5" />
												<fmt:formatNumber var="grade2" value="2.5" />
												<fmt:formatNumber var="grade3" value="3.5" />
												<fmt:formatNumber var="grade4" value="4.5" />
												<c:choose>
													<c:when test="${p.REVIEW_COUNT==null}">
														<li><i id="starGray1" class="fas fa-star grey-text"></i></li>
														<li><i id="starGray2" class="fas fa-star grey-text"></i></li>
														<li><i id="starGray3" class="fas fa-star grey-text"></i></li>
														<li><i id="starGray4" class="fas fa-star grey-text"></i></li>
														<li><i id="starGray5" class="fas fa-star grey-text"></i></li>
													</c:when>
													<c:when test="${grade>grade0 && grade< grade1}">
														<li><i id="starGray1" class="fas fa-star blue-text"></i></li>
														<li><i id="starGray2" class="fas fa-star grey-text"></i></li>
														<li><i id="starGray3" class="fas fa-star grey-text"></i></li>
														<li><i id="starGray4" class="fas fa-star grey-text"></i></li>
														<li><i id="starGray5" class="fas fa-star grey-text"></i></li>
													</c:when>
													<c:when test="${grade>=grade1 && grade< grade2}">
														<li><i id="starGray1" class="fas fa-star blue-text"></i></li>
														<li><i id="starGray2" class="fas fa-star blue-text"></i></li>
														<li><i id="starGray3" class="fas fa-star grey-text"></i></li>
														<li><i id="starGray4" class="fas fa-star grey-text"></i></li>
														<li><i id="starGray5" class="fas fa-star grey-text"></i></li>
													</c:when>
													<c:when test="${grade>=grade2 && grade< grade3}">
														<li><i id="starGray1" class="fas fa-star blue-text"></i></li>
														<li><i id="starGray2" class="fas fa-star blue-text"></i></li>
														<li><i id="starGray3" class="fas fa-star blue-text"></i></li>
														<li><i id="starGray4" class="fas fa-star grey-text"></i></li>
														<li><i id="starGray5" class="fas fa-star grey-text"></i></li>
													</c:when>
													<c:when test="${grade>=grade3 && grade< grade4}">
														<li><i id="starGray1" class="fas fa-star blue-text"></i></li>
														<li><i id="starGray2" class="fas fa-star blue-text"></i></li>
														<li><i id="starGray3" class="fas fa-star blue-text"></i></li>
														<li><i id="starGray4" class="fas fa-star blue-text"></i></li>
														<li><i id="starGray5" class="fas fa-star grey-text"></i></li>
													</c:when>
													<c:when test="${ grade>=grade4}">
														<li><i id="starGray1" class="fas fa-star blue-text"></i></li>
														<li><i id="starGray2" class="fas fa-star blue-text"></i></li>
														<li><i id="starGray3" class="fas fa-star blue-text"></i></li>
														<li><i id="starGray4" class="fas fa-star blue-text"></i></li>
														<li><i id="starGray5" class="fas fa-star blue-text"></i></li>
													</c:when>
												</c:choose>
												<c:if test="${p.REVIEW_COUNT!=null}">
													<p class="" id="average2">${grade}</p>
													<p class="" id="buynum2">(${p.REVIEW_COUNT})</p>
												</c:if>
											</ul>

											<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->

											<!-- Card footer -->
										</div>
										<div>
											<hr>
											<div class="row">
												<button type="button" class="btn  btn-md color-Gray1 "
													id="readMore"
													style="border: 1px solid darkgray !important;">Read
													more</button>
												<div class="row heartCart_icon" style="margin: auto;">
													<a class="material-tooltip-main "  onclick="fnbn('${p.PRODUCT_PRICE}','${p.PRODUCT_NO}');" data-placement="top" title="Add to Cart" id="btnck" data-toggle="modal" data-target="#modalAbandonedCart">
														<i class="fas fa-shopping-cart grey-text ml-3"></i>
													</a> 
													<a class="material-tooltip-main heart_icon" onclick="fn_addWishModal('${p.PRODUCT_PRICE}','${p.PRODUCT_NO}');" data-placement="top" title="Add to Wishlist" id="btnWish" data-toggle="modal" data-target="#modalAddWish"> 
														<i class="fas fa-heart grey-text ml-3"></i>
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
          </div>
          <div class="col-9">
            <p>장바구니에 추가되었습니다.</p>
            <p>상품을 더 구매하시겠습니까??</p>          
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
</div>
<!-- Modal: modalAbandonedCart-->

<!-- Modal: modalAbandonedCart-->
<div class="modal fade right" id="modalAddWish" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" data-backdrop="false">
  <div class="modal-dialog modal-side modal-top-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content" id="insertWish">
    </div>
    <!--/.Content-->
  </div>
</div>
<!-- Modal: modalAbandonedCart-->			
				<div class="swiper-slide cltjf" style="width: 268px;">
					<div class="col">
						<!-- Card -->
						<div class="card">
							<!--Card image-->
							<div class="view overlay zoom">
								<img class="card-img-top" src="" alt="Card image cap"> <a
									class="a-link" href="">
									<div class="mask rgba-white-slight"></div>
								</a>
							</div>
							<!--Card content-->
							<div class="card-body">

								<span class="rm-pb-et-new">NEW</span> <span class="rm-pb-et-p">더
									낮은 새로운 가격</span>
								<!--Title-->
								<h4 class="card-title event-product-name"></h4>
								<!--Text-->
								<p class="card-text marginZero ht-one text-pro"></p>

								<p class="card-text marginZero event-price ht-three">
									<fmt:setLocale value="ko_KR" />
									<fmt:formatNumber type="currency " value="" />
								</p>
								<p class="card-text marginZero product-price ht-four">
									<fmt:setLocale value="ko_KR" />
									<fmt:formatNumber type="currency" value="" />
								</p>


								<div class="">
									<!-- 								별점  -->
									<ul class="rating mb-2 row" style="margin: 2px" id="starnum">
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

										<p class="" id="average2"></p>
										<p class="" id="buynum2"></p>
									</ul>

									<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->

									<!-- Card footer -->
								</div>
								<div>
									<hr>
									<div class="row">
										<button type="button" class="btn  btn-md color-Gray1 "
											id="readMore" style="border: 1px solid darkgray !important;">Read
											more</button>
										<div class="row heartCart_icon" style="margin: auto;">
											<a class="material-tooltip-main " data-placement="top"
												title="Add to Cart" id="btnck" data-toggle="modal"
												data-target="#modalAbandonedCart"> <i
												class="fas fa-shopping-cart grey-text ml-3"></i>
											</a> <a class="material-tooltip-main heart_icon"
												data-placement="top" title="Add to Wishlist" id="btnWish"
												data-toggle="modal" data-target="#modalAddWish"> <i
												class="fas fa-heart grey-text ml-3"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
							<!-- Card -->
						</div>
					</div>
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
          </div>
          <div class="col-9">
            <p>장바구니에 추가되었습니다.</p>
            <p>상품을 더 구매하시겠습니까??</p>          
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
</div>
<!-- Modal: modalAbandonedCart-->

<!-- Modal: modalAbandonedCart-->
<div class="modal fade right" id="modalAddWish" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true" data-backdrop="false">
  <div class="modal-dialog modal-side modal-top-right modal-notify modal-info" role="document">
    <!--Content-->
    <div class="modal-content" id="insertWish">
    </div>
    <!--/.Content-->
  </div>
</div>
<!-- Modal: modalAbandonedCart-->			
				
</section>












<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>


function fn_addWishModal(price,pNo){
	let login = '${sessionScope.login}';
	console.log(price,'금액');
	console.log(pNo,'번호');
	if(login == ''){
		let ck = confirm('로그인이 필요한 서비스 입니다. 로그인 화면으로 이동하시겠습니까?');
		console.log(ck);
		if(ck == true){
			location.href='${path}/member/memberLogin.do';
		}
		return;
	}
	
	$.ajax({
		type: 'post',
		url: '${ path }/wishlist/insertWishModal.do',
		data: {pNo:pNo},
		success: function(data){
			console.log(data);
			if(data == ''){
				
			}
			$('#insertWish').html(data);
		}
		
	})
}

function fnbn(a,b){
	console.log(a,'aaaaaa');
	console.log(b,'bbbbbbb');
    $.ajax({
		url:"${path}/cart/cartInsert.do",
		data:{
			productNo:b,
			productPrice:a
			},
		success:data=>{
			console.log("나와라");					
		}
	})
 } 	 
 
  function roomsNav(){
	  $(".btn-aside").trigger("click");
	  $(".aside-btn-showroom").trigger("click");
	
 
 } 
function numberWithCommas(x) {
	   return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	
	
	  $( document ).ready(function() {
		
		  swiperClass();
		  $(".rm-none").each((i,v)=>{
		         if($(v).val()==1){
		             $(v).next().next().removeClass("one").addClass("two");
		         }else if($(v).val()==2){
		            $(v).next().next().removeClass("one").addClass("three");
		         }else if($(v).val()==3){
		            $(v).next().next().removeClass("one").addClass("four");
		         }else if($(v).val()==4){
		            $(v).next().next().removeClass("one").addClass("five");
		         }
		     })
	
	  
	});   
	 
	
	
	let oneClickCount=1;
	$(".one,.two,.three,.four,.five").click(oneOneClick);
	function oneChangeEvent(){
		console.log(oneClickCount);
		if(oneClickCount%2==1){
			console.log(oneClickCount,"if");
			$(".one,.two,.three,.four,.five").off("click");
			
			$(".one,.two,.three,.four,.five").click(oneOneClick);
		}else{
			console.log(oneClickCount,"else");
			$(".one,.two,.three,.four,.five").off("click");
			
			$(".one,.two,.three,.four,.five").click(secondOneClick);
		}
	}

	function oneOneClick() {
		
		$(window).off("resize");
		console.log("oneOneClick");
		$(".rm-ig-box").css("display","none ");
		$(this).attr("style","grid-area:1/1/9/4 !important ; display:block; ");
		 if ($(window).width() > 900) {
			$(".wrapper").css({
				"position" : "relative",
				"left" : "8%"
			});
		}
		

		if ($(window).width() < 900) {
			$(".wrapper").css({
				"position" : "relative",
				"left" : "0%"
			});
		}
		   $(window).resize(function() {
			var width = $(window).width();
			if (width <= 900) {
				$(".wrapper").css({
					"position" : "relative",
					"left" : "0%"
				
				});
				
				
			}
			if (width > 900) {
				$(".wrapper").css({
					"position" : "relative",
					"left" : "8%"
					
				});
				
				
			}
		});   
		  
			 let type=$(this).prev().val();
			 console.log(type);
			$.ajax({
								
			    url: '${path}/product/roomsDetail.do', // 클라이언트가 요청을 보낼 서버의 URL 주소
			
			    data: { 'type': type },                // HTTP 요청과 함께 서버로 보낼 데이터
			
			    type: 'post',                             // HTTP 요청 방식(GET, POST)
				
			    success: function(data){
			    	console.log('착각했어...',data);
				     	$(".abc").html("");
				     	var today = new Date();
				     	
			    	      for(let i=0;i<data.length;i++){
			    	    	  var endDate = new Date(data[i]["PRODUCT_ENROLL_DATE"]);
			    	    	  endDate.setDate(endDate.getDate() +7);
			    	    	  let cl=$(".cltjf").clone();
			    	    	  $(cl).removeClass("cltjf");
			    	    	  $(cl).css("display","block");
					    	  $(cl).find(".card-img-top").attr("src","${path}/resources/images/product/" +data[i]["PRODUCT_PIC"]  );   
					    	   $(cl).find(".card-title").html(data[i]["PRODUCT_NAME"]);
					    	   $(cl).find(".ht-one").html(data[i]["BIG_CATEGORY_CONTENT"]);
					    	   $(cl).find(".a-link").attr("href","${path}/product/productDetail.do?productno="+data[i]["PRODUCT_NO"]);
					    	   $(cl).find("#btnWish").attr("onclick","fn_addWishModal"+"("+"'"+data[i]["PRODUCT_PRICE"]+"'"+","+"'"+data[i]["PRODUCT_NO"]+"'"+");");
								$(cl).find("#btnck").attr("onclick","fnbn"+"("+"'"+data[i]["PRODUCT_PRICE"]+"'"+","+"'"+data[i]["PRODUCT_NO"]+"'"+");");
					    	   if(today>endDate){
					    	   $(cl).find(".rm-pb-et-new").text('');
					    	 	}
					    	   if(data[i]["SALE_PER"]==data[i]["PRODUCT_PRICE"]){
					    	  $(cl).find(".rm-pb-et-p").text('');
				    		   $(cl).find(".ht-four").html("&#8361;"+ numberWithCommas(data[i]["PRODUCT_PRICE"]));
				    		  
					    	   }else if(data[i]["SALE_PER"]!=data[i]["PRODUCT_PRICE"]){
					    		 
					    		   $(cl).find(".ht-three").html("&#8361;"+ numberWithCommas(data[i]["PRODUCT_PRICE"]));
					    			$(cl).find(".ht-four").html("&#8361;"+ numberWithCommas(data[i]["SALE_PER"])); 
					    		
					    		 
					    		}
					    	   var productNo = data[i]["PRODUCT_NO"];
								  $.ajax({
										url: "${path}/product/average.do",
										async: false,
										data:{
											"productNo":productNo
										},
										success:data2=>{
											console.log(data2,'?????????');
											for (var i = 0; i < data.length; i++) {
												
											
												console.log("데이터2"+data[i]["PRODUCT_NO"]);
												console.log("데이터2"+data2[i]["COUNT(REVIEW_NO)"]);
												if (data2[i]["COUNT(REVIEW_NO)"] !=null) {
													
													 $(cl).find("#average2").text(data2[i]["AVG(PRODUCT_GRADE)"].toFixed(1));
													 $(cl).find("#buynum2").text("("+data2[i]["COUNT(REVIEW_NO)"]+")");
												}
											if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) > 0 && data2[i]["AVG(PRODUCT_GRADE)"] < 1.5) {
												
												$(cl).find("#starGray1").removeClass("grey-text").addClass("blue-text");
												$(cl).find("#starGray2").removeClass("blue-text").addClass("grey-text");
												$(cl).find("#starGray3").removeClass("blue-text").addClass("grey-text");
												$(cl).find("#starGray4").removeClass("blue-text").addClass("grey-text");
												$(cl).find("#starGray5").removeClass("blue-text").addClass("grey-text");
											}else if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) >= 1.5 && data2[i]["AVG(PRODUCT_GRADE)"] < 2.5) {
												$(cl).find("#starGray1").removeClass("grey-text").addClass("blue-text");
												$(cl).find("#starGray2").removeClass("grey-text").addClass("blue-text");
												$(cl).find("#starGray3").removeClass("blue-text").addClass("grey-text");
												$(cl).find("#starGray4").removeClass("blue-text").addClass("grey-text");
												$(cl).find("#starGray5").removeClass("blue-text").addClass("grey-text");
											
											}else if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) >= 2.5 && data2[i]["AVG(PRODUCT_GRADE)"] < 3.5) {
												$(cl).find("#starGray1").removeClass("grey-text").addClass("blue-text");
												$(cl).find("#starGray2").removeClass("grey-text").addClass("blue-text");
												$(cl).find("#starGray3").removeClass("grey-text").addClass("blue-text");
												$(cl).find("#starGray4").removeClass("blue-text").addClass("grey-text");
												$(cl).find("#starGray5").removeClass("blue-text").addClass("grey-text");
											
											}else if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) >= 3.5 && data2[i]["AVG(PRODUCT_GRADE)"] < 4.5) {
													
												$(cl).find("#starGray1").removeClass("grey-text").addClass("blue-text");
												$(cl).find("#starGray2").removeClass("grey-text").addClass("blue-text");
												$(productClone).find("#starGray3").removeClass("grey-text").addClass("blue-text");
												$(cl).find("#starGray4").removeClass("grey-text").addClass("blue-text");
												$(cl).find("#starGray5").removeClass("blue-text").addClass("grey-text");
											
											}else if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) >= 4.5) {
												$(cl).find("#starGray1").removeClass("grey-text").addClass("blue-text");
												$(cl).find("#starGray2").removeClass("grey-text").addClass("blue-text");
												$(cl).find("#starGray3").removeClass("grey-text").addClass("blue-text");
												$(cl).find("#starGray4").removeClass("grey-text").addClass("blue-text");
												$(cl).find("#starGray5").removeClass("grey-text").addClass("blue-text");
											}
										}
										}
										
									});
					    	   $(".abc").append(cl);
			    	    	} 
			    	      
			    	      console.log(data.length,'1');
			    	     /*  if(data.length<4){ 
			    	    	  console.log(data.length,'2');
			    	  		  $(".swiper-wrapper").css({"displye":"flex","justify-content":"center"});  
			    	  		
			    	      }
			    	      if(data.length<=4){ 
			    	     	  $(".swiper-button-next , .swiper-button-prev").attr("style","display:none ;"); 
			    	      }
			    	      if(data.length>=5){
			    	    	  console.log(data.length,'3');
			    	    	  $(".swiper-button-next , .swiper-button-prev").attr("style","display:block;");
			    	    	 
			    	      }   */
			    			
			    	    
				      swiperClass(); 
			    } 
		});  
			 oneClickCount++;
				oneChangeEvent();

	};
	
		   
		 function secondOneClick() {
			 $(".swiper-wrapper").css({"displye":"flex","justify-content":"end"});
			 $(".swiper-button-next , .swiper-button-prev").attr("style","display:block;");
			 $(window).off("resize");
				console.log("secondOneClick");
				if ($(window).width() <= 900) {
					$(".one").css({"display":"block","grid-area":"1/1/2/3"});
					$(".two").css({"display":"block","grid-area":"2/1/5/2"});
					$(".three").css({"display":"block","grid-area":"2/2/6/3"});
					$(".four").css({"display":"block","grid-area":"5/1/9/2"});
					$(".five").css({"display":"block","grid-area":"6/2/9/3"});
					$(".wrapper").css({"position" : "relative","left" : "0%"});
				}
				if ($(window).width() > 900) {
					$(".one").css({"display":"block","grid-area":"1/1/8/3"});
					$(".two").css({"display":"block","grid-area":"1/3/4/4"});
					$(".three").css({"display":"block","grid-area":"1/4/5/5"});
					$(".four").css({"display":"block","grid-area":"4/3/8/4"});
					$(".five").css({"display":"block","grid-area":"5/4/8/5"});
					$(".wrapper").css({"position" : "relative","left" : "0% "});
				}
				

				   $(window).resize(function() {
					var width = $(window).width();
					 if (width <= 900) {
						$(".one").css({"display":"block","grid-area":"1/1/2/3"});
						$(".two").css({"display":"block","grid-area":"2/1/5/2"});
						$(".three").css({"display":"block","grid-area":"2/2/6/3"});
						$(".four").css({"display":"block","grid-area":"5/1/9/2"});
						$(".five").css({"display":"block","grid-area":"6/2/9/3"});
						$(".wrapper").css({"position" : "relative","left" : "0%"});

					} 
					if (width > 900) {

						$(".one").css({"display":"block","grid-area":"1/1/8/3"});
						$(".two").css({"display":"block","grid-area":"1/3/4/4"});
						$(".three").css({"display":"block","grid-area":"1/4/5/5"});
						$(".four").css({"display":"block","grid-area":"4/3/8/4"});
						$(".five").css({"display":"block","grid-area":"5/4/8/5"});
						$(".wrapper").css({"position" : "relative","left" : "0% "});
					}
					
				});  
				    let text=$(".rm-h1").text(); 
				    console.log(text);
					$.ajax({
										
					    url: '${path}/product/backRoomsDetail.do', // 클라이언트가 요청을 보낼 서버의 URL 주소
					     data: { 'type': text },   
					    type: 'post',                             // HTTP 요청 방식(GET, POST)
					    success: function(data){
					    	 console.log(data,'작아지면 왜?');
					    	 var today = new Date();
						     	$(".abc").html("");
					    	      for(let i=0;i<data.length;i++){
					    	    	  var endDate = new Date(data[i]["PRODUCT_ENROLL_DATE"]);
					    	    	  endDate.setDate(endDate.getDate() +7);
					    	    	  let cl=$(".cltjf").clone();
					    	    	  $(cl).removeClass("cltjf");
					    	    	  $(cl).css("display","block");
							    	  $(cl).find(".card-img-top").attr("src","${path}/resources/images/product/" +data[i]["PRODUCT_PIC"]  );   
							    	   $(cl).find(".card-title").html(data[i]["PRODUCT_NAME"]);
							    	   $(cl).find(".ht-one").html(data[i]["BIG_CATEGORY_CONTENT"]);
							    	   $(cl).find(".a-link").attr("href","${path}/product/productDetail.do?productno="+data[i]["PRODUCT_NO"]);
							    	   if(today>endDate){
								    	   $(cl).find(".rm-pb-et-new").text('');
								    	 	}
								    	   if(data[i]["SALE_PER"]==data[i]["PRODUCT_PRICE"]){
								    	  $(cl).find(".rm-pb-et-p").text('');
							    		   $(cl).find(".ht-four").html("&#8361;"+ numberWithCommas(data[i]["PRODUCT_PRICE"]));
							    		  
								    	   }else if(data[i]["SALE_PER"]!=data[i]["PRODUCT_PRICE"]){
								    		 
								    		   $(cl).find(".ht-three").html("&#8361;"+ numberWithCommas(data[i]["PRODUCT_PRICE"]));
								    			$(cl).find(".ht-four").html("&#8361;"+ numberWithCommas(data[i]["SALE_PER"])); 
								    		
								    		 
								    		}
								    	   var productNo = data[i]["PRODUCT_NO"];
											  $.ajax({
													url: "${path}/product/average.do",
													async: false,
													data:{
														"productNo":productNo
													},
													success:data2=>{

														for (var i = 0; i < data.length; i++) {
															
														
															console.log("데이터2"+data[i]["PRODUCT_NO"]);
															if (data2[i]["COUNT(REVIEW_NO)"] !=null) {
																
																 $(cl).find("#average2").text(data2[i]["AVG(PRODUCT_GRADE)"].toFixed(1));
																 $(cl).find("#buynum2").text("("+data2[i]["COUNT(REVIEW_NO)"]+")");
															}
														if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) > 0 && data2[i]["AVG(PRODUCT_GRADE)"] < 1.5) {
															
															$(cl).find("#starGray1").removeClass("grey-text").addClass("blue-text");
															$(cl).find("#starGray2").removeClass("blue-text").addClass("grey-text");
															$(cl).find("#starGray3").removeClass("blue-text").addClass("grey-text");
															$(cl).find("#starGray4").removeClass("blue-text").addClass("grey-text");
															$(cl).find("#starGray5").removeClass("blue-text").addClass("grey-text");
														}else if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) >= 1.5 && data2[i]["AVG(PRODUCT_GRADE)"] < 2.5) {
															$(cl).find("#starGray1").removeClass("grey-text").addClass("blue-text");
															$(cl).find("#starGray2").removeClass("grey-text").addClass("blue-text");
															$(cl).find("#starGray3").removeClass("blue-text").addClass("grey-text");
															$(cl).find("#starGray4").removeClass("blue-text").addClass("grey-text");
															$(cl).find("#starGray5").removeClass("blue-text").addClass("grey-text");
														
														}else if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) >= 2.5 && data2[i]["AVG(PRODUCT_GRADE)"] < 3.5) {
															$(cl).find("#starGray1").removeClass("grey-text").addClass("blue-text");
															$(cl).find("#starGray2").removeClass("grey-text").addClass("blue-text");
															$(cl).find("#starGray3").removeClass("grey-text").addClass("blue-text");
															$(cl).find("#starGray4").removeClass("blue-text").addClass("grey-text");
															$(cl).find("#starGray5").removeClass("blue-text").addClass("grey-text");
														
														}else if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) >= 3.5 && data2[i]["AVG(PRODUCT_GRADE)"] < 4.5) {
																
															$(cl).find("#starGray1").removeClass("grey-text").addClass("blue-text");
															$(cl).find("#starGray2").removeClass("grey-text").addClass("blue-text");
															$(productClone).find("#starGray3").removeClass("grey-text").addClass("blue-text");
															$(cl).find("#starGray4").removeClass("grey-text").addClass("blue-text");
															$(cl).find("#starGray5").removeClass("blue-text").addClass("grey-text");
														
														}else if (parseFloat(data2[i]["AVG(PRODUCT_GRADE)"]) >= 4.5) {
															$(cl).find("#starGray1").removeClass("grey-text").addClass("blue-text");
															$(cl).find("#starGray2").removeClass("grey-text").addClass("blue-text");
															$(cl).find("#starGray3").removeClass("grey-text").addClass("blue-text");
															$(cl).find("#starGray4").removeClass("grey-text").addClass("blue-text");
															$(cl).find("#starGray5").removeClass("grey-text").addClass("blue-text");
														}
													}
													}
													
												});
							    	   $(".abc").append(cl);
					    	    	} 
					    	      swiperClass(); 
					    } 
					    
				});  
					 oneClickCount++;
						oneChangeEvent();
			};
	
		
			
	


	 function swiperClass() { 
		var swiper = new Swiper('.swiper-container', {
		slidesPerView : 1,
		spaceBetween : 5,
		slidesPerGroup : 1,
		loop : false,
		simulateTouch: false,
		 allowTouchMove: false,
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
			} ,
			
			800 : {
				slidesPerView : 3,
				spaceBetween : 10
			} ,
			1200 :{
				slidesPerView : 4,
				spaceBetween : 10
			}
			
		}

	});
	
	 }; 
</script>























