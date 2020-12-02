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
<section class="rm-container ">
	<div class="rm-container-inner">
		<div class="rm-top">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">홈</a></li>
					<li class="breadcrumb-item"><a href="#">디지털쇼룸</a></li>
					<li class="breadcrumb-item active" aria-current="page">침실</li>
				</ol>
			</nav>
		</div>
		<div>
		
			<div class="rm-hd">
				<h1 class="rm-h1">침실</h1>
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
			<input type="text" class="rm-none2" value="${r.ROOM_NO}" > 
				<div class="rm-ig-box one">
					<img class="rm-ig" src="${path}/resources/images/rooms/${r.ROOM_PIC}">
					<c:forEach items="${roomsProduct}" var="p" >
						<c:if test="${r.ROOM_NO == p.ROOM_NO}">
							<div class="rm-bt"
								style="top:${p.ROOMS_TOP>'0.4'?p.ROOMS_TOP:'0.4'}%; left:${p.ROOMS_LEFT<'94'?p.ROOMS_LEFT:'94'}%;">
								<a class="rm-a" href="${path}"></a>
								<div class="rm-pd-a"
									style="transform: translateX(-42%) translateY(-87%) translateY(-1.5rem);">
									<a class="rm-a-a" href="${path}">
										<div class="rm-pd-box">
											<div class="rm-pd-box-box">
												<span class="rm-pb-et-new">NEW</span> <span
													class="rm-pb-et-p">더 낮은 새로운 가격</span>
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
												<fmt:formatNumber type="currency" value="999999999" />
											</div>
										</div>
										<div>
											<div class="rm-bt-et-price">
												<fmt:setLocale value="ko_KR" />
												<fmt:formatNumber type="currency" value="${p.PRODUCT_PRICE}" />
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
		<div>
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
				<a class="rm-md-secondary" href="${path}"> 
					<span class="rm-md-small"> 
						<span class="rm-md-label">모든침대/매트리스 보러가기 </span>
					</span>
				</a>
			</div>



			<div class="newProduct">
				<div class="swiper-container">
					<div class="swiper-wrapper abc">
					<c:forEach items="${roomsProduct}" var="p">
						<div class="swiper-slide tjfwlsgh">
							<div class="col" >
								<!-- Card -->
								<div class="card">
									<!--Card image-->
									<div class="view overlay zoom">
										<img class="card-img-top"
											src="${path}/resources/images/product/${p.PRODUCT_PIC}"
											alt="Card image cap"> <a
											href="${path}/product/productDetail.do">
											<div class="mask rgba-white-slight"></div>
										</a>
									</div>
									<!--Card content-->
									<div class="card-body">
										<!--Title-->
										<h4 class="card-title">${p.PRODUCT_NAME}</h4>
										<!--Text-->
										<p class="card-text marginZero each">${p.SMALL_CATEGORY_NO}</p>
										<p class="card-text marginZero"><fmt:setLocale value="ko_KR" />
												<fmt:formatNumber type="currency" value="${p.PRODUCT_PRICE}" /></p>
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
						
					</div>
					<div class="swiper-slide cltjf" style="width: 268px; ">
							<div class="col" >
								<!-- Card -->
								<div class="card">
									<!--Card image-->
									<div class="view overlay zoom">
									 <img class="card-img-top"
											src=""  alt="Card image cap" > 
											<a href="${path}/product/productDetail.do"> 
											<div class="mask rgba-white-slight"></div>
										</a>
									</div>
									<!--Card content-->
									<div class="card-body">
										<!--Title-->
										<h4 class="card-title"></h4>
										<!--Text-->
										<p class="card-text marginZero ht-one"></p>
										<p class="card-text marginZero ht-two"><fmt:setLocale value="ko_KR" />
												<fmt:formatNumber type="currency" value="" /></p>
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
					<!-- Add Pagination -->
					<div class="swiper-scrollbar"></div>
					<!-- Add Arrows -->
					<img src="${path}/resources/images/rooms/pngegg2222.png"
						class="swiper-button-next"> <img
						src="${path}/resources/images/rooms/pngegg.png"
						class="swiper-button-prev">
				</div>
			</div>

		</div>
</section>



		
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>

	
	
 
	
	
	
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
		console.log("oneOneClick");
		$(".rm-ig-box").css("display","none ");
		$(this).attr("style","grid-area:1/1/9/4 !important ; display:block; ");
		console.log(this);
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
				$(".col").css({ "position":"relative","left": "15%" })
				
			}
			if (width > 900) {
				$(".wrapper").css({
					"position" : "relative",
					"left" : "8%"
					
				});
				$(".col").css({ "position":"relative","left": "0%" })
				
			}
		});   
		  
			 let type=$(this).prev().val();
			$.ajax({
								
			    url: '${path}/product/roomsDetail.do', // 클라이언트가 요청을 보낼 서버의 URL 주소
			
			    data: { 'type': type },                // HTTP 요청과 함께 서버로 보낼 데이터
			
			    type: 'post',                             // HTTP 요청 방식(GET, POST)
				
			    success: function(data){
				     	$(".abc").html("");
			    	      for(let i=0;i<data.length;i++){
			    	    	  let cl=$(".cltjf").clone();
			    	    	  $(cl).removeClass("cltjf");
			    	    	  $(cl).css("display","block");
					    	  $(cl).find(".card-img-top").attr("src","${path}/resources/images/product/" +data[i]["PRODUCT_PIC"]  );   
					    	   $(cl).find(".card-title").html(data[i]["PRODUCT_NAME"]);
					    	   $(cl).find(".ht-one").html(data[i]["SMALL_CATEGORY_NO"]);
					    	   $(cl).find(".ht-two").html(data[i]["PRODUCT_PRICE"]);
					    	   $(".abc").append(cl);
			    	    	} 
				      swiperClass(); 
			    } 
		});  
			 oneClickCount++;
				oneChangeEvent();

	};
	
		   
		 function secondOneClick() {
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
				 
					 let type=$(this).prev().val();
					$.ajax({
										
					    url: '${path}/product/backRoomsDetail.do', // 클라이언트가 요청을 보낼 서버의 URL 주소
					    type: 'post',                             // HTTP 요청 방식(GET, POST)
					    success: function(data){
						     	$(".abc").html("");
					    	      for(let i=0;i<data.length;i++){
					    	    	  let cl=$(".cltjf").clone();
					    	    	  $(cl).removeClass("cltjf");
					    	    	  $(cl).css("display","block");
							    	  $(cl).find(".card-img-top").attr("src","${path}/resources/images/product/" +data[i]["PRODUCT_PIC"]  );   
							    	   $(cl).find(".card-title").html(data[i]["PRODUCT_NAME"]);
							    	   $(cl).find(".ht-one").html(data[i]["SMALL_CATEGORY_NO"]);
							    	   $(cl).find(".ht-two").html(data[i]["PRODUCT_PRICE"]);
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
		loopFillGroupWithBlank : false,
		scrollbar : {
			el : '.swiper-scrollbar',
			hide : true,
		},

		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		},
		roundLengths : true,

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
				spaceBetween : 15
			} ,
			1200 :{
				slidesPerView : 4,
				spaceBetween : 15
			}
		}

	});
	
	 }; 
</script>
		       
		         
		         
		         
		     
			    	   
			    	   
			    	 
			     
			        
				    		
				    	
		    	       
		       
		    	  
		 







