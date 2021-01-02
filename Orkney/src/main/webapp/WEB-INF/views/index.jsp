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

				<p class="event-p">ORKNEY는 항상 조금씩 더 낮출 수 있는 가격이 좋은 가격이라고 생각해요. 그렇기에 가격을 낮추기 위한 ORKNEY의 노력은 끝이 없습니다. 작은 빨간라벨을 눈여겨보세요. 많은 사람들에게 더욱 합리적인 가격으로 더 좋은 생활을 제공하려는 ORKNEY의 노력을 의미하니까요.</p>
				<a href="${path}/product/sale.do">
					<button type="button" class="btn btn-dark event-bu" id="testBtn">
						<span class="event-sp">자세히보기</span>
					</button>
				</a>
			</div>

		</div>
	</div>

	<div class="populartitle">지속가능한 내일을 위한 솔루션</div>
	<div id="home-slider">
		<div class="swiper-container swiper-container-vertical">
			<div class="swiper-wrapper"
				style="transform: translate3d(0px, -1800px, 0px); transition-duration: 0ms;">
				
					<div class="swiper-slide swiper-slide-one swiper-slide-prev"
						data-swiper-slide-index="0" >
						
						<div class="swiper-image" data-swiper-parallax-y="-20%"
							style="transform: translate3d(0px, -20%, 0px); transition-duration: 0ms;">
							<div class="main">
								<h1 class="class-h1">더 나은 천연 소재</h1>
								<p class="class-p">여러 이유 때문에 면은 침실과 욕실에 인기 있는 소재예요. 2015년부터 ORKNEY는 제품에 사용하는 모든 면을 보다 지속가능한 공급처에서 제공받고 있어요. 즉, 농약과 비료를 덜 써서 생산되는 면을 사용하고 있다는 뜻이죠. 훨씬 더 효율적인 농법과 더 나은 수자원 관리법을 개발하기 위해 여러 가지 연구가 계속되고 있어요.</p>
								
								<a class="class-a" href="${path}">모든 더블 침대 보러 가기</a>
							
							</div>
							<a href="${path}/product/products.do?category=침대&sale=">
							<video autoplay="" loop="" class="video-background" muted="">
								<source
									src="${path}/resources/video/03_IKEA_sustainability_KinderCotton_5s_3x4_offline_v03_EL_Grade-1-.webm"
									type="video/webm">
							</a>
							</video>
						</div>
					</div>
				
				<div class="swiper-slide swiper-slide-one swiper-slide-prev"
					data-swiper-slide-index="1" >
					<div class="swiper-image" data-swiper-parallax-y="-20%"
						style="transform: translate3d(0px, -20%, 0px); transition-duration: 0ms;">
						<div class="main">
							<h1 class="class-h1">현명한 목재 활용</h1>
							<p class="class-p underlined">목재는 튼튼하고 오래가면서도 개성 넘치는 가구를 만들 수 있는 훌륭한 소재예요. 사포질로 다듬고, 스테인으로 마감하거나, 페인트 칠을 하면 가구의 수명을 늘릴 수 있죠. 결국, 나무는 완전히 새로운 질감으로 재탄생하게 됩니다.</p>
							<a class="class-a" href="${path}">IVER 이바르 시스템 보러가기</a>
						</div>
						<a href="${path}/product/productDetail.do?productno=p259">
						<video autoplay="" loop="" class="video-background" muted="">
							<source
								src="${path}/resources/video/04_IKEA_sustainability_ForTheSakeOfWood_5s_3x4_offline_v02_EL_Grade-1-.webm"
								type="video/webm">

						</video>
						</a>
					</div>
				</div>
			
				
				<div class="swiper-slide swiper-slide-one swiper-slide-prev"
					data-swiper-slide-index="2" >
					<div class="swiper-image" data-swiper-parallax-y="-20%"
						style="transform: translate3d(0px, -20%, 0px); transition-duration: 0ms;">
						<div class="main">
							<h1 class="class-h1">건강을 유지하기 위한 새로운 변화</h1>
							<p class="class-p">이 제품을 사용하면 특수한 메커니즘 덕분에 일하면서도 끊임없이 몸을 움직일 수 있어요. 이 조절식 스툴을 꾸준히 사용할 경우 근육과 척추가 강화되며 자연스럽게 건강한 자세를 취하게 됩니다. 따라서 꼼짝 못하고 일할 때에도 계속해서 몸을 움직일 수가 있죠.</p>
							<a class="class-a" href="${path}">LIDKULLEN 리드쿨렌  보러 가기</a>
						</div>
						<a href="${path}/product/productDetail.do?productno=p256">
						<video autoplay="" loop="" class="video-background" muted="">
							<source
								src="${path}/resources/video/15_IKEA_sustainability_HealthierEveryDay_8s_3x4_offline_v02_EL_Grade (1).webm"
								type="video/webm">

						</video>
						</a>
					</div>
				</div>
				
				
				<div class="swiper-slide swiper-slide-one swiper-slide-prev"
					data-swiper-slide-index="3" >
					<div class="swiper-image" data-swiper-parallax-y="-20%"
						style="transform: translate3d(0px, -20%, 0px); transition-duration: 0ms;">
						<div class="main">
							<h1 class="class-h1">편안한 내일을 위한 기분 좋게 수면</h1>
							<p class="class-p">라이프스타일이나 환경적 요인 때문에 수면의 시간이나 질이 떨어지는 경우가 많아요. 그래서 스트레스를 관리하고 일과 생활의 균형을 향상시키는 방법을 찾는 것은 매우 중요할 수 있어요. 침실에서 충분한 숙면을 취하려면 빛과 소리, 편안함, 공기의 질, 그리고 온도를 모두 알맞은 수준으로 유지해야 합니다.</p>
							<a class="class-a" href="${path}">모든 싱글 침대 보러 가기</a>
						</div>
						<a href="${path}/product/products.do?category=침대&sale=">
						<video autoplay="" loop="" class="video-background" muted="">
							<source
								src="${path}/resources/video/16_IKEA_sustainability_AchievingBetterSleep_5s_3x4_offline_v03_EL_Grade-1-.webm"
								type="video/webm">

						</video>
						</a>
					</div>
				</div>
				<div class="swiper-slide swiper-slide-one swiper-slide-prev"
					data-swiper-slide-index="3" >
					<div class="swiper-image" data-swiper-parallax-y="-20%"
						style="transform: translate3d(0px, -20%, 0px); transition-duration: 0ms;">
						<div class="main">
							<h1 class="class-h1">미래에 맞춰 조절 가능한 가구</h1>
							<p class="class-p">식구가 늘어나고 라이프스타일도 변하거나 취향이 성숙해질 때, 모듈식 가구는 아주 고마운 제품이에요. 나중에 바꿔야 할 수도 있는 가구에 많은 돈을 미리 쓸 필요 없이 필요에 따라 원하는 모듈만 간단히 더할 수 있으니까요. 모듈식 가구를 사용하면 홈퍼니싱을 새로운 생활 환경에 맞게 합리적인 비용으로 간편하게 조정할 수 있어요.</p>
							<a class="class-a" href="${path}">BUSUNGE 부숭에 침대 보러 가기</a>
						</div>
						<a href="${path}/product/productDetail.do?productno=p257">
						<video autoplay="" loop="" class="video-background" muted="">
							<source
								src="${path}/resources/video/10_IKEA_sustainability_MoreSustainableOneStepAtTheTime_5s_3x4_offline_v02_EL_Grade (1).webm"
								type="video/webm">

						</video>
						</a>
					</div>
				</div>
				<div class="swiper-slide swiper-slide-one swiper-slide-prev"
					data-swiper-slide-index="4" >
					<div class="swiper-image" data-swiper-parallax-y="-20%"
						style="transform: translate3d(0px, -20%, 0px); transition-duration: 0ms;">
						<div class="main">
							<h1 class="class-h1">에너지 절약이 곧 비용 절감</h1>
							<p class="class-p">새로운 조명, 난방 및 가전 제품으로 에너지 소비를 줄이고 돈도 아낄 수 있어요. 현대인의 필수품인 가전 제품을 포기할 수 없다면, 에너지 효율이 뛰어난 AA+ 등급 이상의 최신 모델을 사용하세요. 한걸음 더 나아가 지구를 생각한다면 가정용 태양광 에너지를 이용해보세요. 탄소 배출량을 줄이고 전기 요금도 절약할 수 있을 거예요.</p>
							<a class="class-a" href="${path}">무선 LED 전구 보러 가기</a>
						</div>
						<a href="${path}/product/products.do?category=조명&sale=">
						<video autoplay="" loop="" class="video-background" muted="">
							<source
								src="${path}/resources/video/07_IKEA_sustainability_SimplySustainable_5s_3x4_offline_v05_Grade (1).webm"
								type="video/webm">

						</video>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="populartitle">인기상품</div>
	<div class="popularProduct">

		<div class="buttonLine">
			<button type="button" class="btn btn-dark event-bu1 event-target" value="전체보기">
				<span class="event-sp clickEvent">전체보기</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp clickEvent">책장/선반유닛</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp clickEvent">서랍</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp clickEvent">의자</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp clickEvent">바테이블/의자</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp clickEvent">카페가구</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp clickEvent">이동식선반</span>
			</button>
			<button type="button " class="btn btn-dark event-bu1 event-target">
				<span class="event-sp clickEvent">옷장</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp clickEvent">수납장/장식장</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp clickEvent">거실장/찬장/콘솔테그이블</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp clickEvent">TV/멀티미디어가구</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp clickEvent">침대</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp clickEvent">소파/암체어</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp clickEvent">조명</span>
			</button>
			<button type="button" class="btn btn-dark event-bu1 event-target">
				<span class="event-sp clickEvent">식탁/책상</span>
			</button>
		</div>
		<div class="pp-img">
			<div class="pp-img-mg-id oneClass">
				<div class="pp-img-ib tjf ">
					<a class="pp-img-a">
						<img class="pp-img-wdhe" src="">
					</a>
				</div>
			</div>
			<div class="pp-img-mg-id twoClass">
				<div class="pp-img-ib wls ">
					<a class="pp-img-a">
						<img class="pp-img-wdhe" src="">
					</a>
				</div>
			</div>
			<div class="pp-img-mg-id threeClass">
				<div class="pp-img-ib gh ">
					<a class="pp-img-a">
						<img class="pp-img-wdhe" src="">
					</a>
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
		spaceBetween : 480,
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
    	 let texts='';
    	 $(".event-target").click(e=>{
    		
    		 resize();
    		 $(".add").css({"display":"flex","justify-content":"center"});
    		 $(".event-remove").remove();
    		
    		if($(e.target).text()=="전체보기"){
    			text=''
    			texts=$.trim(text);
    			
    			mainAjax();	
    		}else{
    		text=$(e.target).text();
    		
    		texts=$.trim(text);
    		
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
    			    data: { 'text': texts,'type':type}, 
    			    type: 'post',                             // HTTP 요청 방식(GET, POST)
    			    success: function(data){
    			    	
    			    	 let width = $(window).width();
    			    	 if (width >= 1000) {
    			    		 $(".event-remove").remove();
    			    		 $(".pp-img-mg-id").css("width","31%");
    			    		 $(".twoClass").css("display","flex");
    	    			    	$(".threeClass").css("display","flex");
    			    		
    			    	for(let i=0;i<data.length;i++){
    			    		for(let t=0;t<data.length;t+=3){ 
    			    			if(i==t){
    			    				let tt=$(".tjf").clone();
    			    				
    			    				$(tt).removeClass("tjf");
    			    				$(tt).addClass("event-remove");
    			    				$(tt).css("display","flex");
    			    				$(tt).find(".pp-img-a").attr("href","${path}/product/productDetail.do?productno="+data[i]["PRODUCT_NO"]);
    			    			$(tt).find(".pp-img-wdhe").attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);
    			    			
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
    			    					$(ww).find(".pp-img-a").attr("href","${path}/product/productDetail.do?productno="+data[i]["PRODUCT_NO"]);
    			    					$(ww).find(".pp-img-wdhe").addClass("pp-img-wdhe-2").removeClass("pp-img-wdhe").attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);	
    			    					$(".pp-img-wdhe-2").css({"width": "100%" , "height": "395.47px","display":"block"});
    			    					
    			    					$(".twoClass").append(ww);
    			    				}
    			    			if(i==w&&w>1){	
    			    			$(ww).find(".pp-img-a").attr("href","${path}/product/productDetail.do?productno="+data[i]["PRODUCT_NO"]);
    			    			$(ww).find(".pp-img-wdhe").attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);
    			    			
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
    			    			$(gg).find(".pp-img-a").attr("href","${path}/product/productDetail.do?productno="+data[i]["PRODUCT_NO"]);
    			    			$(gg).find(".pp-img-wdhe").attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);
    			    			
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
    			    				
    			    				$(tt).find(".pp-img-a").attr("href","${path}/product/productDetail.do?productno="+data[i]["PRODUCT_NO"]);
        			    			$(tt).find(".pp-img-wdhe").attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);
    			    			
    			    			$(".oneClass").append(tt);
    			    			}
    			    			}
    			    		for(let g=1;g<data.length;g+=2){ 
    			    			if(i==g){
    			    			let gg=$(".gh").clone();
    			    			$(gg).removeClass("gh");
    			    			 $(gg).addClass("event-remove"); 
    			    			$(gg).css("display","flex");
    			    			$(gg).find(".pp-img-a").attr("href","${path}/product/productDetail.do?productno="+data[i]["PRODUCT_NO"]);
    			    			$(gg).find(".pp-img-wdhe").attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);
    			    			
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
    			    				$(tt).find(".pp-img-a").attr("href","${path}/product/productDetail.do?productno="+data[i]["PRODUCT_NO"]);
        			    			$(tt).find(".pp-img-wdhe").attr("src","${path}/resources/images/product/"+data[i]["PRODUCT_PIC"]);
    			    			
    			    			$(".oneClass").append(tt);
    			    			}
    			    	}
    			    	 console.log(data.length,'datalength');
    			    	 console.log(allData,'allData');
    			    if(data.length==allData) {
			    		
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

