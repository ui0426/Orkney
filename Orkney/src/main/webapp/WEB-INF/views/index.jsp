<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


<jsp:include page="/WEB-INF/views/common/header.jsp">		
	<jsp:param name="title" value="메인화면" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/common/main/section.css">
	
    <section class="mainsection">
        <div class="event row no-gutters" style="height: auto;">
                        
            <div class="banner col-md-8 col-12">   
                 <img src="https://www.ikea.com/images/c3/fc/c3fc70293c8ccb9a58d9286ae75e263c.jpg?f=s" style="width: 100%; height: 100%;" alt="">
            </div>
            
            <div class="explain col-md-4 col-12">
                <div class="explain_detail">
                    <h2 class="event-h2">2020 소프트 토이 그리기 대회가 돌아왔습니다!</h2>
                    <p class="event-p">아이들이 그린 그림이 SAGOSKATT 사고스카트 소프트 토이 인형 컬렉션으로 제작되어 전 세계 IKEA 매장에서 판매됩니다. 어린이가 그린 그림이 실제 인형이 되는 순간! 지금 소프트 토이 그리기 대회에 참가해보세요.</p>                              
                    <button type="button" class="btn btn-dark event-bu" id="testBtn"><span class="event-sp">자세히보기</span></button>
                </div>
               
            </div>
        </div>


        <div class="newTitle">신제품을 만나보세요</div>
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

        <div class="populartitle">인기상품</div>
        <div class="popularProduct">

            <div class="buttonLine" >
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">전체보기</span></button>
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">책장/선반유닛</span></button>
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">서랍</span></button>
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">의자</span></button>
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">바테이블/의자</span></button>
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">카페가구</span></button>
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">이동식선반</span></button>
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">옷장</span></button>
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">수납장/장식장</span></button>
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">거실장/찬장/콘솔테그이블</span></button>
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">TV/멀티미디어가구</span></button>
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">침대</span></button>
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">소파/암체어</span></button>
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">조명</span></button>
              <button type="button" class="btn btn-dark event-bu1"><span class="event-sp">식탁/책상</span></button>
            </div>

            <div class="pp-img">
              <div class="pp-img-mg-id"> 
                <div class="pp-img-ib"><img class="pp-img-wdhe" src="https://www.ikea.com/ext/ingkadam/m/7173bf07da74cf16/original/PH163611-crop002.jpg?f=s" ></div>
                <div class="pp-img-ib"><img class="pp-img-wdhe" src="https://www.ikea.com/ext/ingkadam/m/2848344cd956b629/original/PH161564-crop001.jpg?f=s" ></div>
              </div> 
              
              <div class="pp-img-mg-id"> 
                <div class="pp-img-ib"><img class="pp-img-wdhe-2" src="https://www.ikea.com/ext/ingkadam/m/30865ba8b37d59a/original/PH155879-crop001.jpg?f=s" ></div>
                <div class="pp-img-ib"><img class="pp-img-wdhe" src="https://www.ikea.com/ext/ingkadam/m/ba5a6ce26bbc2f7/original/PH157401-crop001.jpg?f=s" ></div>                
              </div> 
              
              <div class="pp-img-mg-id">
                <div class="pp-img-ib "><img class="pp-img-wdhe" src="https://www.ikea.com/ext/ingkadam/m/2a67a911ee5f199d/original/PH164379-crop002.jpg?f=s" ></div>
                <div class="pp-img-ib"><img class="pp-img-wdhe" src="https://www.ikea.com/ext/ingkadam/m/5d079226f18e0968/original/PH164008-crop001.jpg?f=s" ></div>
              </div>  
            </div>

            <div class="add">
              <button type="button" class="btn btn-dark event-bu2"><span class="event-sp">더보기</span></button>
            </div>
            
        </div>

    </section>
           
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
  <!-- <script src="../package/swiper-bundle.min.js"></script> -->








<jsp:include page="/WEB-INF/views/common/footer.jsp"/>			