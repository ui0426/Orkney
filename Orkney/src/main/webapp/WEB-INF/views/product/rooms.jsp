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

<section class="rm-container">
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
				<span class="rm-sp">모두의 취향을 고려한 침실 아이디어</span> <span class="rm-sps">어떤
					침대 혹은 침실 가구가 좋을지 잘 모르겠다고요? 완벽하게 꾸며진 침실 갤러리를 살펴보고 원하는 스타일의 디자인을
					골라보세요.</span>
			</div>
		</div>
		<div class="wrapper">
			<div class="rm-ig-box one">
				<a href="${path}">
				<img class="rm-ig" src="${path}/resources/images/rooms/01.webp">
				<div class="rm-bt" style="top: 54.4%; left: 25.7%;">
					<a class="rm-a" href="${path}"></a>
					<div class="rm-pd"
						style="transform: translateX(-42%) translateY(-87%) translateY(-1.5rem);">
						<a class="rm-a-a">
							<div class="rm-pd-box">
								<div class="rm-pd-box-box">
									<span class="rm-pb-et-new">NEW</span> <span class="rm-pb-et-p">더
										낮은 새로운 가격</span>
									<div class="rm-bt-pb">
										<div class="rm-bt-name">PLATSA플랏사</div>
										<div class="rm-bt-context">
											<span class="rm-bt-sp">침대프레임+서랍4</span>
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
									<fmt:formatNumber type="currency" value="999999999" />
								</div>
							</div>
						</a>
					</div>
				</div>
				</a>
			</div>
			<div class="two">
				<img class="rm-ig" src="${path}/resources/images/rooms/02.webp">
			</div>
			<div class="three">
				<img class="rm-ig" src="${path}/resources/images/rooms/03.webp">
			</div>
			<div class="four">
				<img class="rm-ig " src="${path}/resources/images/rooms/04.webp">
			</div>
			<div class="five">
				<img class="rm-ig " src="${path}/resources/images/rooms/05.webp">
			</div>
		</div>
		<div>
			<div class="rm-md-container">
				<div class="rm-md-container-inner">
					<div class="rm-md-info">
						<h2 class="rm-md-hnzkp">침대 혹은 침구를 새롭게 연출하고 싶나요?</h2>
						<p class="rm-md-description">좀 더 편안한 잠자리가 필요한가요? 새 직장이나 대학에
							들어간 가족이 있나요? 아니면 가을에 어울리는 새로운 스타일을 찾고 있나요? 어떤 변화를 맞이하든 IKEA에서 필요한
							제품을 찾아보세요.</p>

					</div>

				</div>
				<a class="rm-md-secondary" href="${path}"> <span
					class="rm-md-small"> <span class="rm-md-label">
							모든침대/매트리스 </span>
				</span>
				</a>
			</div>
			
        <div class="newProduct">
          <div class="swiper-container">
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <a href="">
                  <img src="https://www.ikea.com/images/illbatting-f7cce0bb441f6b12500c307902470598.jpg?f=s" alt="">
                </a>
              </div>
              <div class="swiper-slide">
                <a href="">
                  <img src="https://www.ikea.com/images/-1424d1f2385cc2ba7dd5c75d52fc642c.jpg?f=s" alt="">
                </a>
              </div>
              <div class="swiper-slide">
                <a href="">
                  <img src="https://www.ikea.com/images/ikea-lab-0f6715ea7bd98bf047856daeafe11222.jpg?f=s" alt="">
                </a>
              </div>
              <div class="swiper-slide">Slide 4</div>
              <div class="swiper-slide">Slide 5</div>
              <div class="swiper-slide">Slide 6</div>
              <div class="swiper-slide">Slide 7</div>
              <div class="swiper-slide">Slide 8</div>
              <div class="swiper-slide">Slide 9</div>
              <div class="swiper-slide">Slide 10</div>
            </div>
            <!-- Add Pagination -->                        
            <div class="swiper-scrollbar"></div>
            <!-- Add Arrows -->                        
              <img src="${path}/resources/images/rooms/pngegg2222.png" class="swiper-button-next">            
              <img src="${path}/resources/images/rooms/pngegg.png" class="swiper-button-prev">
          </div>
        </div>
		
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>         
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 3,
      spaceBetween: 10,
      slidesPerGroup: 3,
      loop: true,
      loopFillGroupWithBlank: true,                    
      scrollbar: {
        el: '.swiper-scrollbar',
        hide: true,
      },
    
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      roundLengths: true,	
		
      //반응형
		breakpointsInverse: true,
		breakpoints: {
			
			320: {
				slidesPerView: 1,
				spaceBetween: 20
			},
		
			480: {
				slidesPerView: 1,
				spaceBetween: 10
			},
			
			640: {
				slidesPerView: 3,
				spaceBetween: 10
			}
			
		}

    });  
  </script>







