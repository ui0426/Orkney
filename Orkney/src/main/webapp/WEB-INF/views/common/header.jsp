<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="fc" uri="http://java.sun.com/jsp/jstl/functions" %>
    <c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Orkney</title>
    <link rel="stylesheet" href="${path}/resources/css/common/header/default.css">
    <link rel="stylesheet" href="${path}/resources/css/common/header/header.css">
    <link rel="stylesheet" href="${path}/resources/css/common/header/header-aside.css">
    <link rel="stylesheet" href="${path}/resources/css/common/header/test.css">
    
    
    <script src="js/jquery-3.5.1.min.js"></script>

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        
    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	
	 <!-- 웹소켓 이용위해 -->
    <script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

      <!-- MDB icon -->
  <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Google Fonts Roboto -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
  <!-- Material Design Bootstrap -->
  <link rel="stylesheet" href="${path}/resources/css/mdb.min.css">
  <!-- Your custom styles (optional) -->
  <link rel="stylesheet" href="${path }/resources/css/style.css">

  
<script type="text/javascript" src="${path }/resources/js/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="${path }/resources/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="${path }/resources/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="${path }/resources/js/mdb.min.js"></script>
<!-- Your custom scripts (optional) -->

</head>



<body>
    <header>
        
    
        <div class="header-container">
            <div class="header-hambuger" >
                <div class="btn-aside">
                    <svg aria-hidden="true" focusable="false" class="svg-icon  hnf-svg-icon" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M20 8H4V6H20V8ZM20 13H4V11H20V13ZM20 18H4V16H20V18Z"></path>
                    </svg>
                </div>
            </div>
            <div class="header-logo">
                <a href=""><img src="https://www.ikea.com/kr/ko/static/ikea-logo.f88b07ceb5a8c356b7a0fdcc9a563d63.svg" alt=""></a>
            </div>
            <div class="header-menu">
                <span><a href="${path }/product/products.do">모든제품</a> </span>
                <span><a href="${path}/product/rooms.do">디지털 쇼룸</a></span>
            </div>
            <div class="header-search">
                <input type="text">
            </div>
            <ul class="header-icons">
                <li class="header-icon delivery">
                    <a href="${path }/order/order.do"><span><svg aria-hidden="true" focusable="false" class="svg-icon  hnf-svg-icon" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M13.999 6H0.99707V4H15.999V7.00001L19.0236 7L23.0029 12.6848V18H20.3462C19.9244 19.3056 18.699 20.25 17.2529 20.25C15.8069 20.25 14.5815 19.3056 14.1597 18H10.2553C9.83349 19.3056 8.60804 20.25 7.16203 20.25C5.71601 20.25 4.49056 19.3056 4.06878 18H0.999016V13H2.99902V16H4.06877C4.49054 14.6944 5.716 13.75 7.16203 13.75C8.60805 13.75 9.83351 14.6944 10.2553 16H13.999V6ZM15.999 14.0007C16.3849 13.8392 16.8085 13.75 17.2529 13.75C18.699 13.75 19.9244 14.6944 20.3462 16H21.0029V13.3152L17.9823 9L15.999 9.00001V14.0007ZM16.0029 17C16.0029 16.3096 16.5626 15.75 17.2529 15.75C17.9433 15.75 18.5029 16.3096 18.5029 17C18.5029 17.6903 17.9433 18.25 17.2529 18.25C16.5626 18.25 16.0029 17.6903 16.0029 17ZM7.16203 15.75C6.47167 15.75 5.91203 16.3096 5.91203 17C5.91203 17.6903 6.47167 18.25 7.16203 18.25C7.85238 18.25 8.41203 17.6903 8.41203 17C8.41203 16.3096 7.85238 15.75 7.16203 15.75Z"></path>
                        <path d="M7.99707 9H0.99707V7H7.99707V9Z"></path>
                        <path d="M7.99707 12H0.99707V10H7.99707V12Z"></path>
                    </svg></span></a>
                </li>
                <c:if test="${empty login}">
                <li class="header-icon">
                    <a href="${path}/member/memberLogin.do" id="loginIcon"><span><svg aria-hidden="true" focusable="false" class="svg-icon  hnf-svg-icon" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M10.6724 6.46784C10.9458 6.18665 11.3528 5.99715 12.0217 5.99715C12.4188 5.99715 12.7267 6.08092 12.9746 6.21956C13.2156 6.35439 13.4125 6.5507 13.568 6.83892L13.5713 6.84481C13.7107 7.09904 13.8083 7.4634 13.8083 7.98518C13.8083 8.77085 13.6037 9.23031 13.3287 9.51296L13.3239 9.51801C13.048 9.80558 12.6449 9.99441 11.9899 9.99441C11.6042 9.99441 11.2937 9.91245 11.0339 9.77025C10.7951 9.63594 10.5997 9.44097 10.4451 9.15559C10.2997 8.88054 10.2032 8.50366 10.2032 7.98518C10.2032 7.19499 10.4067 6.74102 10.6724 6.46784ZM12.0217 3.99609C10.9383 3.99609 9.96765 4.32234 9.23788 5.07267C8.50032 5.831 8.20215 6.85365 8.20215 7.98518C8.20215 8.75078 8.34522 9.46819 8.6794 10.0972L8.68251 10.103C9.0074 10.705 9.46753 11.187 10.0602 11.5184L10.0664 11.5219C10.6538 11.8449 11.3032 11.9955 11.9899 11.9955C13.0717 11.9955 14.0383 11.6622 14.7654 10.9059C15.506 10.1432 15.8094 9.11998 15.8094 7.98518C15.8094 7.22231 15.6673 6.50678 15.3274 5.88561C15.0027 5.28499 14.543 4.80406 13.9514 4.47313C13.3656 4.14547 12.7126 3.99609 12.0217 3.99609ZM6.46911 16.8582C6.76743 16.2779 7.19186 15.8309 7.75908 15.501C8.31735 15.1819 9.04246 14.9961 9.97999 14.9961H14.02C14.9575 14.9961 15.6826 15.1819 16.2409 15.501C16.8081 15.8309 17.2326 16.2779 17.5309 16.8582C17.834 17.4478 18 18.1518 18 18.9961V19.9961H20V18.9961C20 17.8839 19.7795 16.8577 19.3096 15.9438C18.8353 15.0213 18.1407 14.2913 17.2425 13.7698L17.2425 13.7698L17.2374 13.7669C16.3095 13.2354 15.2217 12.9961 14.02 12.9961H9.97999C8.77826 12.9961 7.69052 13.2354 6.76257 13.7669L6.76256 13.7669L6.75753 13.7698C5.85928 14.2913 5.16466 15.0213 4.6904 15.9438C4.22053 16.8577 4 17.8839 4 18.9961V19.9961H6V18.9961C6 18.1518 6.16598 17.4478 6.46911 16.8582Z"></path>
                    </svg></span></a></li>
                    </c:if>
                <c:if test="${not empty login}">
                <li class="header-icon">
                    <a href="${path}/member/mypage.do"><span><svg aria-hidden="true" focusable="false" class="svg-icon  hnf-svg-icon" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M10.6724 6.46784C10.9458 6.18665 11.3528 5.99715 12.0217 5.99715C12.4188 5.99715 12.7267 6.08092 12.9746 6.21956C13.2156 6.35439 13.4125 6.5507 13.568 6.83892L13.5713 6.84481C13.7107 7.09904 13.8083 7.4634 13.8083 7.98518C13.8083 8.77085 13.6037 9.23031 13.3287 9.51296L13.3239 9.51801C13.048 9.80558 12.6449 9.99441 11.9899 9.99441C11.6042 9.99441 11.2937 9.91245 11.0339 9.77025C10.7951 9.63594 10.5997 9.44097 10.4451 9.15559C10.2997 8.88054 10.2032 8.50366 10.2032 7.98518C10.2032 7.19499 10.4067 6.74102 10.6724 6.46784ZM12.0217 3.99609C10.9383 3.99609 9.96765 4.32234 9.23788 5.07267C8.50032 5.831 8.20215 6.85365 8.20215 7.98518C8.20215 8.75078 8.34522 9.46819 8.6794 10.0972L8.68251 10.103C9.0074 10.705 9.46753 11.187 10.0602 11.5184L10.0664 11.5219C10.6538 11.8449 11.3032 11.9955 11.9899 11.9955C13.0717 11.9955 14.0383 11.6622 14.7654 10.9059C15.506 10.1432 15.8094 9.11998 15.8094 7.98518C15.8094 7.22231 15.6673 6.50678 15.3274 5.88561C15.0027 5.28499 14.543 4.80406 13.9514 4.47313C13.3656 4.14547 12.7126 3.99609 12.0217 3.99609ZM6.46911 16.8582C6.76743 16.2779 7.19186 15.8309 7.75908 15.501C8.31735 15.1819 9.04246 14.9961 9.97999 14.9961H14.02C14.9575 14.9961 15.6826 15.1819 16.2409 15.501C16.8081 15.8309 17.2326 16.2779 17.5309 16.8582C17.834 17.4478 18 18.1518 18 18.9961V19.9961H20V18.9961C20 17.8839 19.7795 16.8577 19.3096 15.9438C18.8353 15.0213 18.1407 14.2913 17.2425 13.7698L17.2425 13.7698L17.2374 13.7669C16.3095 13.2354 15.2217 12.9961 14.02 12.9961H9.97999C8.77826 12.9961 7.69052 13.2354 6.76257 13.7669L6.76256 13.7669L6.75753 13.7698C5.85928 14.2913 5.16466 15.0213 4.6904 15.9438C4.22053 16.8577 4 17.8839 4 18.9961V19.9961H6V18.9961C6 18.1518 6.16598 17.4478 6.46911 16.8582Z"></path>
                    </svg></span></a>
                </li>
                    </c:if>
                <li class="header-icon"><a href=""><svg aria-hidden="true" focusable="false" class="svg-icon  hnf-svg-icon" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M12.336 5.52055C14.2336 3.62376 17.3096 3.62401 19.2069 5.52129C20.2067 6.52115 20.6796 7.85005 20.6259 9.15761C20.6151 12.2138 18.4184 14.8654 16.4892 16.6366C15.4926 17.5517 14.5004 18.2923 13.7593 18.8036C13.3879 19.0598 13.0771 19.2601 12.8574 19.3973C12.7475 19.466 12.6601 19.519 12.5992 19.5555C12.5687 19.5737 12.5448 19.5879 12.5279 19.5978L12.5079 19.6094L12.502 19.6129L12.5001 19.614C12.5001 19.614 12.4989 19.6147 11.9999 18.748C11.501 19.6147 11.5005 19.6144 11.5005 19.6144L11.4979 19.6129L11.4919 19.6094L11.472 19.5978C11.4551 19.5879 11.4312 19.5737 11.4007 19.5555C11.3397 19.519 11.2524 19.466 11.1425 19.3973C10.9227 19.2601 10.612 19.0598 10.2405 18.8036C9.49947 18.2923 8.50726 17.5517 7.51063 16.6366C5.58146 14.8654 3.38477 12.2139 3.37399 9.15765C3.32024 7.85008 3.79314 6.52117 4.79301 5.52129C6.69054 3.62376 9.76704 3.62376 11.6646 5.52129L11.9993 5.856L12.3353 5.52129L12.336 5.52055ZM11.9999 18.748L11.5005 19.6144L11.9999 19.9019L12.4989 19.6147L11.9999 18.748ZM11.9999 17.573C12.1727 17.462 12.384 17.3226 12.6236 17.1573C13.3125 16.6821 14.2267 15.9988 15.1366 15.1634C17.0157 13.4381 18.6259 11.2919 18.6259 9.13506V9.11213L18.627 9.08922C18.6626 8.31221 18.3844 7.52727 17.7926 6.9355C16.6762 5.81903 14.866 5.81902 13.7495 6.9355L13.7481 6.93689L11.9965 8.68166L10.2504 6.9355C9.13387 5.81903 7.3237 5.81903 6.20722 6.9355C5.61546 7.52727 5.33724 8.31221 5.3729 9.08922L5.37395 9.11213V9.13507C5.37395 11.2919 6.98418 13.4381 8.86325 15.1634C9.77312 15.9988 10.6874 16.6821 11.3762 17.1573C11.6159 17.3226 11.8271 17.462 11.9999 17.573Z"></path>
                    </svg></a></li>
                <li class="header-icon">
                    <a href="${path}/cart/cart.do">
                    <span><svg aria-hidden="true" focusable="false" class="svg-icon  hnf-svg-icon hnf-svg-bag-default" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg" >
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M10.9994 4H10.4373L10.1451 4.48017L6.78803 9.99716H3.00001H1.71924L2.02987 11.2397L3.65114 17.7248C3.98501 19.0603 5.18497 19.9972 6.56157 19.9972L17.4385 19.9972C18.8151 19.9972 20.015 19.0603 20.3489 17.7248L21.9702 11.2397L22.2808 9.99716H21H17.2113L13.8539 4.48014L13.5618 4H12.9997H12.0004H10.9994ZM14.8701 9.99716L12.4376 6H12.0004H11.5615L9.12921 9.99716H14.8701ZM5.59142 17.2397L4.28079 11.9972H19.7192L18.4086 17.2397C18.2973 17.6849 17.8973 17.9972 17.4385 17.9972L6.56157 17.9972C6.1027 17.9972 5.70272 17.6849 5.59142 17.2397Z"></path>
                    </svg></span></a></li>
                    
                <li class="header-icon hambuger btn-aside">            
                    <span><svg aria-hidden="true" focusable="false" class="svg-icon  hnf-svg-icon" viewBox="0 0 24 24" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M20 8H4V6H20V8ZM20 13H4V11H20V13ZM20 18H4V16H20V18Z"></path>
                 </svg></span></li>
            </ul>
            
        </div>
        
        
        <!-- aside -->
        <div onclick="history.back();" class="page_cover"></div>
        <div id="menu">
        	<aside id="hnf-menu">
	        	<!-- aside top -->
	          	<div class="hnf-menu_top">
	          		<!-- aside 닫기버튼(X) -->
		            <div class="hnf-menu_close close" onclick="history.back();">
		                <span>
		                    <svg width="1em" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="times" class="svg-inline--fa fa-times fa-w-11" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 352 512"><path fill="currentColor" d="M242.72 256l100.07-100.07c12.28-12.28 12.28-32.19 0-44.48l-22.24-22.24c-12.28-12.28-32.19-12.28-44.48 0L176 189.28 75.93 89.21c-12.28-12.28-32.19-12.28-44.48 0L9.21 111.45c-12.28 12.28-12.28 32.19 0 44.48L109.28 256 9.21 356.07c-12.28 12.28-12.28 32.19 0 44.48l22.24 22.24c12.28 12.28 32.2 12.28 44.48 0L176 322.72l100.07 100.07c12.28 12.28 32.2 12.28 44.48 0l22.24-22.24c12.28-12.28 12.28-32.19 0-44.48L242.72 256z"></path></svg>
		                </span>
		            </div>
		            <div id="hnf-menu_logo" class="hnf-menu_logo">
		                <a href="${path }/">
		                    <img src="https://www.ikea.com/kr/ko/static/ikea-logo.f88b07ceb5a8c356b7a0fdcc9a563d63.svg"></svg>
		                </a>
		            </div>
		            <div id="hnf-menu_search" class="header-search hnf-menu_search hnf-menu-nav-hidden">
		                <!-- <input type="text"> -->
		                <button></button>
		            </div>
		            <div id="hnf-menu_back" class="hnf-menu_back hnf-menu-nav-hidden aside-back-btn" >
		            	<svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="arrow-left" class="svg-inline--fa fa-arrow-left fa-w-14" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M257.5 445.1l-22.2 22.2c-9.4 9.4-24.6 9.4-33.9 0L7 273c-9.4-9.4-9.4-24.6 0-33.9L201.4 44.7c9.4-9.4 24.6-9.4 33.9 0l22.2 22.2c9.5 9.5 9.3 25-.4 34.3L136.6 216H424c13.3 0 24 10.7 24 24v32c0 13.3-10.7 24-24 24H136.6l120.5 114.8c9.8 9.3 10 24.8.4 34.3z"></path></svg>
		            </div>
	        	</div>
	        
	        	<!-- aside content -->
	        	<div id="hnf-menu_container" class="hnf-menu_container hnf-menu-level1">
		            <nav class="hnf-menu_nav">
		                <ul class="hnf-menu_nav_main">
		                    <li>
		                        <div class="hnf-link hnf-link-color aside-btn-product">모든 상품</div>
		                    </li>
		                    <li>
		                        <div class="hnf-link hnf-link-color aside-btn-showroom">디지털쇼룸</div>
		                    </li>
		                    <li>
		                        <div class="hnf-small-link hnf-link-color aside-btn-event">이달의 혜택</div>
		                    </li>
		                    <li>
		                        <a class="hnf-small-link hnf-link-color" href="#">신제품</a>
		                    </li>
		                </ul>
		                <ul class="hnf-small-link hnf-menu_nav_aux">
		                    <li><a class="hnf-small-ex hnf-link-color" href="#">고객지원</a></li>
		                    <li><a class="hnf-small-ex hnf-link-color" href="${path }/order/order.do">배송조회</a></li>
		                    <li><a class="hnf-small-ex hnf-link-color" href="#">내 프로필</a></li>
		                 <c:if test="${not empty login }">
		                    <li><a class="hnf-small-ex hnf-link-color" href="${path }/member/memberLogout.do">로그아웃</a></li>
		                    </c:if>
		                    <c:if test="${empty login }">
		                    <li><a class="hnf-small-ex hnf-link-color" href="${path}/member/memberLogin.do">로그인</a></li>
		                	</c:if>
		                </ul>
		            </nav>
	        	</div>
	        	
	        	<!-- 모든상품을 클릭했을 때 나오는 div -->
	        	<div id="hnf-menu_container-level2" class="hnf-menu_container hnf-menu-container-product hnf-menu-nav-hidden">
	        		<nav class="hnf-menu_nav">
		        		<span class="hnf-menu-container-product-head">모든 상품</span>
						<ul class="hnf-menu-container-product-main">
							<li>
								<a>
									책장/선반유닛
								</a>
							</li>
							<li>
								<a>
									서랍
								</a>
							</li>
							<li>
								<a>
									의자
								</a>
							</li>
							<li>
								<a>
									바테이블/의자
								</a>
							</li>
							<li>
								<a>
									카페가구
								</a>
							</li>
							<li>
								<a>
									이동식 선반
								</a>
							</li>
							<li>
								<a>
									옷장
								</a>
							</li>
							<li>
								<a>
									수납장/장식장
								</a>
							</li>
							<li>
								<a>
									거실장/천장/콘솔테이블
								</a>
							</li>
							<li>
								<a>
									TV/멀티미디어가구
								</a>
							</li>
							<li>
								<a>
									침대
								</a>
							</li>
							<li>
								<a>
									소파/암체어
								</a>
							</li>
							<li>
								<a>
									조명
								</a>
							</li>
							<li>
								<a>
									식탁/책상
								</a>
							</li>
						</ul>
					</nav>		
	        	</div>
	        	
	        	<!-- 디지털쇼룸 클릭했을때 -->
	        	<div id="hnf-menu_container-level2-2" class="hnf-menu_container hnf-menu-nav-hidden">
	        		<nav class="hnf-menu_nav">
		        		<span class="hnf-menu-container-product-head">디지털 쇼룸</span>
		        		<ul class="hnf-menu-2-showroom">
		        			<li>
		        				<a>
		        					<span>
		        						<img  alt="침실" src="https://www.ikea.com/images/bj-and-ouml-rksn-and-auml-s-bj-and-ouml-rksn-and-auml-s-772a90648be3b0ef7d6d47a7f7b7a5f2.jpg?f=xxxs" >
		        					</span>
		        					<span>침실</span>
		        				</a>
		        			</li>
		        			<li>
		        				<a>
		        					<span>
		        						<img alt="거실" src="https://www.ikea.com/images/stocksund-besta-tv-55b0bb08ee1014c9fe23a98bc9381d2d.jpg?f=xxxs" >
		        					</span>
		        					<span>거실</span>
		        				</a>
		        			</li>
		        			<li id="imgSize">
		        				<a id="imgSize">
		        					<span id="imgSize">
		        						<img id="imgSize" alt="주방" src="https://www.ikea.com/images/-cb470d9a37de90b10df90823f72c2b68.jpg?f=xxxs" >
		        					</span>
		        					<span>주방</span>
		        				</a>
		        			</li>
		        			<li>
		        				<a>
		        					<span>
		        						<img alt="현관" src="https://www.ikea.com/images/ikea-hemnes-pinnig-665c8a366698cec21d5a1aa930f071fe.jpg?f=xxxs" >
		        					</span>
		        					<span>현관</span>
		        				</a>
		        			</li>
		        		</ul>
		        	</nav>
	        	</div> 
	        	
	        	<!-- 이달의 혜택 클릭했을 때 -->
	        	<div id="hnf-menu_container-level2-3" class="hnf-menu_container hnf-menu-container-product hnf-menu-nav-hidden">
	        		<nav class="hnf-menu_nav">
		        		<span class="hnf-menu-container-product-head">이달의 혜택</span>
						<ul class="hnf-menu-container-product-main">
							<li>
								<a>
									ORKNEY Family 특별가
								</a>
							</li>
							<li>
								<a>
									마지막 찬스 최대 50% OFF
								</a>
							</li>
						</ul>
						</nav>
					</div>
        	</aside>
        <div class="hnf-menu_alternate">
    
        </div>
        </div>

       
    </header>
    <c:if test="${not empty login}">
 <jsp:include page="/WEB-INF/views/common/chat.jsp"/>
	</c:if>
        <script>
            $(".btn-aside").click(function() {
	            $("#menu,.page_cover,html").addClass("open");
	            $("#menu").removeClass("aside-close");
	            window.location.hash = "#open";
	            $("#hnf-menu").removeClass("hnf-menu-level2");
            	$("#hnf-menu_back").addClass("hnf-menu-nav-hidden");
            	$("#hnf-menu_search").addClass("hnf-menu-nav-hidden");
            	
            	$("#hnf-menu_container").removeClass("hnf-menu-nav-hidden1");
            	$("#hnf-menu_container-level2").addClass("hnf-menu-nav-hidden");
            	$("#hnf-menu_container-level2-2").addClass("hnf-menu-nav-hidden");
            	$("#hnf-menu_container-level2-3").addClass("hnf-menu-nav-hidden");
            });
    
            window.onhashchange = function() {
	            if (location.hash != "#open") {
	                $("#menu,.page_cover,html").removeClass("open");
	            }
            };
            
            
            //모든 상품 클릭했을 때
            $(".aside-btn-product").click(function(){
            	$("#hnf-menu").addClass("hnf-menu-level2");
            	$("#hnf-menu_back").removeClass("hnf-menu-nav-hidden");
            	$("#hnf-menu_search").removeClass("hnf-menu-nav-hidden");
            	
            	$("#hnf-menu_container").addClass("hnf-menu-nav-hidden1");
            	$("#hnf-menu_container-level2").removeClass("hnf-menu-nav-hidden");
            });
            
            /* function goback(){
            	window.history.go(-1);
            }; */
            
            //aside 뒤로가기, 닫기, 바깥부분 클릭했을 때 aside기본으로 돌려놓기
            $(".aside-back-btn").click(function(){
            	$("#hnf-menu").removeClass("hnf-menu-level2");
            	$("#hnf-menu_back").addClass("hnf-menu-nav-hidden");
            	$("#hnf-menu_search").addClass("hnf-menu-nav-hidden");
            	
            	$("#hnf-menu_container").removeClass("hnf-menu-nav-hidden1");
            	$("#hnf-menu_container-level2").addClass("hnf-menu-nav-hidden");
            	$("#hnf-menu_container-level2-2").addClass("hnf-menu-nav-hidden");
            	$("#hnf-menu_container-level2-3").addClass("hnf-menu-nav-hidden");
            });
            
            //쇼룸 클릭했을 때
            $(".aside-btn-showroom").click(function(){
            	$("#hnf-menu").addClass("hnf-menu-level2");
            	$("#hnf-menu_back").removeClass("hnf-menu-nav-hidden");
            	$("#hnf-menu_search").removeClass("hnf-menu-nav-hidden");
            	
            	$("#hnf-menu_container").addClass("hnf-menu-nav-hidden1");
            	$("#hnf-menu_container-level2-2").removeClass("hnf-menu-nav-hidden");
            });
            
            //이달의혜택 클릭했을 때
            $(".aside-btn-event").click(function(){
            	$("#hnf-menu").addClass("hnf-menu-level2");
            	$("#hnf-menu_back").removeClass("hnf-menu-nav-hidden");
            	$("#hnf-menu_search").removeClass("hnf-menu-nav-hidden");
            	
            	$("#hnf-menu_container").addClass("hnf-menu-nav-hidden1");
            	$("#hnf-menu_container-level2-3").removeClass("hnf-menu-nav-hidden");
            	
            });
           
     
            
            
        </script>
  






