<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="메인화면" />
</jsp:include>
<link rel="stylesheet"
	href="${path}/resources/css/common/main/section.css">

<section class="mainsection">
	<div class="event row no-gutters" style="height: auto;">

		<div class="banner col-md-8 col-12">
			<img
				src="https://www.ikea.com/images/ingatorp-20b2e2ce57f48cf53e4c986ff3ebe595.jpg?f=xxxl 1400w,
  https://www.ikea.com/images/ingatorp-20b2e2ce57f48cf53e4c986ff3ebe595.jpg?f=xxl 950w,
  https://www.ikea.com/images/ingatorp-20b2e2ce57f48cf53e4c986ff3ebe595.jpg?f=xl 800w,
  https://www.ikea.com/images/ingatorp-20b2e2ce57f48cf53e4c986ff3ebe595.jpg?f=l 750w,
  https://www.ikea.com/images/ingatorp-20b2e2ce57f48cf53e4c986ff3ebe595.jpg?f=m 600w,
  https://www.ikea.com/images/ingatorp-20b2e2ce57f48cf53e4c986ff3ebe595.jpg?f=s 500w,
  https://www.ikea.com/images/ingatorp-20b2e2ce57f48cf53e4c986ff3ebe595.jpg?f=xs 400w,
  https://www.ikea.com/images/ingatorp-20b2e2ce57f48cf53e4c986ff3ebe595.jpg?f=xxs 300w,
  https://www.ikea.com/images/ingatorp-20b2e2ce57f48cf53e4c986ff3ebe595.jpg?f=xxxs 240w"
				style="width: 100%; height: 100%;" alt="">
		</div>

		<div class="explain col-md-4 col-12">
			<div class="explain_detail">
				<h2 class="event-h2">적은 비용으로 큰 행복을 누리세요!</h2>
				<p class="event-p">IKEA는 항상 조금씩 더 낮출 수 있는 가격이 좋은 가격이라고 생각해요.
					그렇기에 가격을 낮추기 위한 IKEA의 노력은 끝이 없습니다. 작은 빨간라벨을 눈여겨보세요. 많은 사람들에게 더욱
					합리적인 가격으로 더 좋은 생활을 제공하려는 IKEA의 노력을 의미하니까요.</p>
				<button type="button" class="btn btn-dark event-bu" id="testBtn">
					<a href="${path}/product/sale.do"><span class="event-sp">자세히보기</span></a>
				</button>
			</div>

		</div>
	</div>

	<div class="populartitle">지속가능한 내일을 위한 솔루션</div>
	<div id="home-slider">
		<div class="swiper-container swiper-container-vertical">
			<div class="swiper-wrapper"
				style="transform: translate3d(0px, -1800px, 0px); transition-duration: 0ms;">

				<div class="swiper-slide swiper-slide-one swiper-slide-prev"
					data-swiper-slide-index="0" style="height: 900px;">
					<div class="swiper-image" data-swiper-parallax-y="-20%"
						style="transform: translate3d(0px, -20%, 0px); transition-duration: 0ms;">
						<div class="main">
							<h1 class="class-h1">보다 지속가능한 소재를 선택하는 방법</h1>
							<p class="class-p">IKEA는 2030년까지 제품에 사용하는 모든 소재를 재활용 또는 재생
								가능한 소재로 바꾸는 목표를 세웠어요. 물론, 지금도 보다 지속가능하면서도 경제적이고 품질이 우수한 홈퍼니싱 제품을
								찾기는 그 어느 때보다 더 쉽지만요. 실제로, 이미 IKEA 제품군의 60%는 재생 가능한 소재로 만들어지고
								있습니다.</p>
							<a class="class-a" href="#">View All</a>
						</div>
						<video autoplay="" loop="" class="video-background" muted="">
							<source
								src="${path}/resources/video/01_IKEA_sustainability_AMaterialWorld_10s_16x9_offline_v02_EL-1-.webm"
								type="video/webm">

						</video>
					</div>
				</div>
				<div class="swiper-slide swiper-slide-one swiper-slide-prev"
					data-swiper-slide-index="1" style="height: 900px;">
					<div class="swiper-image" data-swiper-parallax-y="-20%"
						style="transform: translate3d(0px, -20%, 0px); transition-duration: 0ms;">
						<div class="main">
							<h1 class="class-h1">더 건강한 집을 가꾸는 방법</h1>
							<p class="class-p underlined">보다 지속가능한 생활은 환경 보호뿐 아니라 개인적인
								건강과 행복에도 관련이 있어요. 깨끗한 공기, 적당한 신체적 활동과 충분한 수면은 자신의 건강을 돌보려는 사람이
								고려해야 할 중요한 요소이죠.</p>
							<a class="class-a" href="#">View All</a>
						</div>
						<video autoplay="" loop="" class="video-background" muted="">
							<source
								src="${path}/resources/video/13_IKEA_sustainability_OutsideAndIn_9s_16x9_offline_v05_EL-1-.webm"
								type="video/webm">

						</video>
					</div>
				</div>
				<div class="swiper-slide swiper-slide-one swiper-slide-prev"
					data-swiper-slide-index="2" style="height: 900px;">
					<div class="swiper-image" data-swiper-parallax-y="-20%"
						style="transform: translate3d(0px, -20%, 0px); transition-duration: 0ms;">
						<div class="main">
							<h1 class="class-h1">더 오래가는 가구를 선택하는 방법</h1>
							<p class="class-p">2030년까지 IKEA의 모든 제품에는 용도를 바꾸고, 수리하고,
								재사용하고, 재판매하거나 재활용하는 기능이 기본으로 포함될 거예요. 물론 지금도 가구를 얼마간 쓰고 버리는 대신,
								쉽고 기분 좋게 가구의 수명을 연장하는 방법이 있죠.</p>
							<a class="class-a" href="#">View All</a>
						</div>
						<video autoplay="" loop="" class="video-background" muted="">
							<source
								src="${path}/resources/video/09_IKEA_sustainability_LifelongFavorites_9s_16x9_offline_v02_EL-1-.webm"
								type="video/webm">

						</video>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="populartitle">인기상품</div>
	<div class="popularProduct">

		<div class="buttonLine">
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">전체보기</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">침대<!-- 책장/선반유닛 --></span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">서랍</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">의자</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">바테이블/의자</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">카페가구</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">이동식선반</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">옷장</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">수납장/장식장</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">거실장/찬장/콘솔테그이블</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">TV/멀티미디어가구</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">침대</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">소파/암체어</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">조명</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp">식탁/책상</span>
			</button>
		</div>
		<div class="pp-img">
			<div class="pp-img-mg-id oneClass">
				<div class="pp-img-ib tjf ">
					<img class="pp-img-wdhe" src="">
				</div>
			</div>
			<div class="pp-img-mg-id twoClass">
				<div class="pp-img-ib wls ">
					<img class="pp-img-wdhe" src="">
				</div>
			</div>
			<div class="pp-img-mg-id threeClass">
				<div class="pp-img-ib gh ">
					<img class="pp-img-wdhe" src="">
				</div>
			</div>
		</div>

		<div class="add">
			<button type="button" class="btn btn-dark event-bu2">
				<span class="event-sp">더보기</span>
			</button>
		</div>

	</div>

</section>


<script>  



 var mySwiper = new Swiper(".swiper-container", {
	    direction: "vertical",  
	  slidesPerView : 1,
		spaceBetween : 0,
		slidesPerGroup : 1,
   pagination: ".swiper-pagination",   
  grabCursor: true, 
	  loopFillGroupWithBlank : false,
	  loop: true,
	  paginationClickable: true,
	  parallax: false,
	  autoplay: {delay : 14000}, 
	    effect: "slide",     
	   mousewheelControl: true 
	});  
 	/* var mySwiper = document.querySelector('.swiper-container').swiper;
 	$(".swiper-container").mouseenter(function(){
 		mySwiper.autoplay.stop();
 		
 	}); */
     
     $( document ).ready(function() {
    	 let type=4;
    	 function resize (){
    	  var width = $(window).width();
 		 if (width>=1000 ) {
 			 type=4;
 		 mainAjax();
 		 }else if(width > 700 && width < 1000 ){
 			 type=3; 
 		 mainAjax(); 
 		
 		 }else if(width<=700){
 			 type=2;
 		 mainAjax(); 
 		 }
    	 };
    	
    	 mainAjax();
    	 
    	 $(".event-bu2").click(e=>{
    	  $(".event-remove").remove(); 
    		 type+=1;
    		mainAjax();
    	 });
    	 let text='';
    	 $(".event-target").click(e=>{
    		 resize();
    		 $(".add").css({"display":"flex","justify-content":"center"});
    		 $(".event-remove").remove();
    		
    		if($(e.target).text()=="전체보기"){
    			text='';
    			console.log(text,'if');
    			
    			mainAjax();	
    		}else{
    		text=$(e.target).text();
    		console.log(text,'else');
    		
    		mainAjax();	
    		}
        	 
    	 });
    	 $(window).resize(function() {
    		 var width = $(window).width();
    		 if (width>=1000 ) {
    			 type=4;
    		 mainAjax();
    		 }else if(width > 700 && width < 1000 ){
    			 type=3; 
    		 mainAjax(); 
    		
    		 }else if(width<=700){
    			 type=2;
    		 mainAjax(); 
    		 }
    		
    	 });	  
    	
    	 function mainAjax(){
    	$.ajax({
    		 url: '${path}/product/allProductList.do', 
			    type: 'post',                             
			    success: function(allData){
 
        	 $.ajax({
        		
    			    url: '${path}/product/productCategory.do', // 클라이언트가 요청을 보낼 서버의 URL 주소
    			    data: { 'text': text,'type':type}, 
    			    type: 'post',                             // HTTP 요청 방식(GET, POST)
    			    success: function(data){
    			    	console.log(data);
    			    	 let width = $(window).width();
    			    	 if (width >= 1000) {
    			    		 $(".event-remove").remove();
    			    		 $(".pp-img-mg-id").css("width","31%");
    			    		 $(".twoClass").css("display","flex");
    	    			    	$(".threeClass").css("display","flex");
    			    		console.log('되라 쫌!');
    			    	for(let i=0;i<data.length;i++){
    			    		for(let t=0;t<data.length;t+=3){ 
    			    			if(i==t){
    			    				let tt=$(".tjf").clone();
    			    				
    			    				$(tt).removeClass("tjf");
    			    				$(tt).addClass("event-remove");
    			    				$(tt).css("display","flex");
    			    			$(tt).children().attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);
    			    			console.log(tt,'tt');
    			    			$(".oneClass").append(tt);
    			    			}
    			    			}
    			    		for(let w=1;w<data.length;w+=3){
    			    			
    			    			
    			    			if(i==w){
    			    				
    			    				let ww=$(".wls").clone();
    			    				$(ww).removeClass("wls");
    			    				 $(ww).addClass("event-remove"); 
    			    				$(ww).css("display","flex");
    			    				if(i==w&&w==1){
    			    					
    			    					$(ww).children().addClass("pp-img-wdhe-2").removeClass("pp-img-wdhe").attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);	
    			    					$(".pp-img-wdhe-2").css({"width": "100%" , "height": "395.47px","display":"block"});
    			    					console.log(ww,'ww2');
    			    					$(".twoClass").append(ww);
    			    				}
    			    			if(i==w&&w>1){	
    			    				
    			    			$(ww).children().addClass("pp-img-wdhe").removeClass("pp-img-wdhe-2").attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);
    			    			console.log(ww,'ww1');
    			    			$(".twoClass").append(ww);
    			    			}
    				    		}
    			    			}
    			    		for(let g=2;g<data.length;g+=3){ 
    			    			if(i==g){
    			    			let gg=$(".gh").clone();
    			    			$(gg).removeClass("gh");
    			    			 $(gg).addClass("event-remove"); 
    			    			$(gg).css("display","flex");
    			    			$(gg).children().attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);
    			    			console.log(gg,'gg');
    			    			$(".threeClass").append(gg);
    			    			}
    			    			}
    			    	
    			    		
    			    		
    			    	} 
    			    	 
    			    	
    			     }else if (width > 700 && width < 1000) {
    			    	 $(".event-remove").remove();
    			    	 $(".pp-img-mg-id").css("width","45%");
    			    	$(".twoClass").css("display","none");
    			    	$(".threeClass").css("display","flex");
    			    	for(let i=0;i<data.length;i++){
    			    		for(let t=0;t<data.length;t+=2){ 
    			    			if(i==t){
    			    				let tt=$(".tjf").clone();
    			    				$(tt).removeClass("tjf");
    			    				$(tt).addClass("event-remove");
    			    				$(tt).css("display","flex");
    			    			$(tt).children().attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);
    			    			console.log(tt,'tt');
    			    			$(".oneClass").append(tt);
    			    			}
    			    			}
    			    		for(let g=1;g<data.length;g+=2){ 
    			    			if(i==g){
    			    			let gg=$(".gh").clone();
    			    			$(gg).removeClass("gh");
    			    			 $(gg).addClass("event-remove"); 
    			    			$(gg).css("display","flex");
    			    			$(gg).children().attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);
    			    			console.log(gg,'gg');
    			    			$(".threeClass").append(gg);
    			    			}
    			    			}
    			    	} 
    			    }else  if (width <= 700)  {
    			    	 $(".event-remove").remove();
    			    	$(".twoClass").css("display","none");
    			    	$(".threeClass").css("display","none");
    			    	$(".pp-img-mg-id").css("width","100%");
    			    	for(let i=0;i<data.length;i++){
    			    				let tt=$(".tjf").clone();
    			    				$(tt).removeClass("tjf");
    			    				$(tt).addClass("event-remove");
    			    				$(tt).css("display","flex");
    			    			$(tt).children().attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);
    			    			console.log(tt,'tt');
    			    			$(".oneClass").append(tt);
    			    			}
    			    	}
    			    	 
    			    if(data.length==allData) {
			    		 console.log(123);
		    			$(".add").css("display","none");
		    		}  
    			    }
    			    	 
    	
     	 });
		}
    	});
    	};
     });
        
 	/*  var swiper = new Swiper('.slider', {
		slidesPerView : 1,
		spaceBetween : 5,
		slidesPerGroup : 1,
		loop : false,
		centeredSlides: true, 
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
				slidesPerView : 2,
				spaceBetween : 5
				
			},

			480 : {
				slidesPerView : 2,
				spaceBetween : 5
			},

			640 : {
				slidesPerView : 24,
				spaceBetween : 10
			} ,
			
			800 : {
				slidesPerView : 5,
				spaceBetween : 15
			}
			
		}

	});  */
  </script>
<!-- <script src="../package/swiper-bundle.min.js"></script> -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

