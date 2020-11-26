<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">		
	<jsp:param name="title" value="주문/배송조회" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/order/orderForm.css"/>
<link rel="stylesheet" href="${path }/resources/css/order/orderView.css"/>
<section class="order-container">
	<div id="order-container-content">
		<div class="order-container-inner">
			<div class="orderTitle">
				<div class="back-btn">
					<a>
						
					</a>
				</div>
				<h1 class="orderform-title">주문 내역</h1>
				<p class="orderNumber">주문 번호(iSell 번호): 172398866</p>
			</div>
			<div class="cancel-msg">
				<div class="cancelicon">
					<svg viewBox="0 0 24 24" width="18px" height="18px" class=""><path fill="currentColor" fill-rule="evenodd" clip-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16zm-.95-11.67a.95.95 0 1 1 1.9 0 .95.95 0 0 1-1.9 0zM13 17v-6h-2v6h2z"></path></svg>
				</div>
				<div class="cancel-content">
					<p class="cancel-text">주문이 취소되었습니다.</p>
				</div>
			</div>
			
			<div class="part-line"><hr class="line-c"></div>
			
			<!-- 주문날짜, 주문번호, 최종 결제금액 -->
			<div class="orderDetail">
				<div class="orderDetail-container">
					<div>
						<div class="orderDetail-content">
							<h5 class="od-title">주문 날짜</h5>
							<p class="od-content">2020-11-21 13:32</p>
						</div>
						<div class="orderDetail-content">
							<h5 class="od-title">주문 번호(iSell 번호)</h5>
							<p class="od-content">172398866</p>
						</div>
						<div class="orderDetail-content">
							<h5 class="od-title">최종 결제금액</h5>
							<p class="od-content">₩12,900</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="part-line"><hr class="line-c"></div>
			
			<!-- 제품 -->
			<div class="">
				<div >
					<div>
						<div id="productList" class="productList">
							<div class="productList-tap">
								<h3 class="pl-title">제품</h3>
								<div id="p-plus" class="pl-svg">
									<svg viewBox="0 0 24 24" width="18px" height="18px" class=""><path fill="currentColor" fill-rule="evenodd" clip-rule="evenodd" d="M13 11h5v2h-5v5h-2v-5H6v-2h5V6h2v5z"></path></svg>
								</div>
								<div id="p-minus" class="pl-svg">
									<svg viewBox="0 0 24 24" width="18px" height="18px" class=""><path fill="currentColor" fill-rule="evenodd" clip-rule="evenodd" d="M6 13v-2h12v2H6z"></path></svg>
								</div>
							</div>	
						</div>
						<div class="desktop-productList">
							<h5>제품</h5>
						</div>
						<div id="pro-con" class="product-container">
							<div class="product-img">
								<img src="https://www.ikea.com/kr/ko/images/products/njutning-niuteuning-kkochbyeong-dipyujyeoseutig-jong__0539528_PE652510_S3.JPG">
							</div>
							<div class="product-info">
								<p class="product-text">1x 꽃병+디퓨져스틱 6종</p>
								<p class="product-text">NJUTNING 니우트닝</p>
								<div class="price-container">
									<p class="product-price">₩7,900</p>
									<p class="price-amount">₩7,900</p>
								</div>
								<p class="product-text">라벤더블리스, 라일락</p>
								<p class="product-code">303.618.11</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			
			<!-- 주소 -->
			<div class="orderDetail">
				<div class="orderDetail-container address-container">
					<div class="od-desktop-container">
						<div class="od_desktop">
							<h3 class="od_d_title">주소</h3>
						</div>
						<div class="od_mobile">
							<h5 class="od-title address-m-title">주소</h5>
						</div>
						<div class="od-desktop-content">
							<p class="od-content address-text">이윤나</p>
							<p class="od-content address-text">
								<span class="orderAddress">경기 시흥시 신천동 854-6<br>
								대림 2차 1동 202호</span>
								<span>14950</span>
							</p>
							<p class="od-content address-text">yoonnable@gmail.com</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="part-line"><hr class="line-c"></div>
			
			<!-- 결제방법 -->
			<div class="orderDetail">
				<div class="orderDetail-container">
					<div class="od-desktop-container">
						<div class="od_desktop">
							<h3 class="od_d_title">결제 방법</h3>
						</div>
						<div class="od_mobile">
							<h5 class="od-title">결제 방법</h5>
						</div>
						<div class="od-desktop-content">
							<p class="od-content">신용카드</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="part-line"><hr class="line-c"></div>
			
			<!-- 결제 내역 -->
			<div class="">
				<div>
					<div class="od-desktop-container">
						<div class="od_desktop">
							<h3 class="od_d_title">결제내역</h3>
						</div>
						<div class="od-desktop-content desktop-price">
							<div class="price-container payment-container">
								<h5 class="payment-price">총 주문금액</h5>
								<h5 class="payment-price">₩7,900</h5>
							</div>
							<div class="price-container">
								<p class="payment-deilvery">배송비</p>
								<p class="payment-deilvery">₩5,000</p>
							</div>
							<hr class="payment-partline">
							<div class="price-container">
								<h5 class="payment-price paymentAmount">최종 결제금액</h5>
								<h5 class="payment-price paymentAmount">₩12,900</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</section>

<script type="text/javascript">
	$("#productList").click(e=>{
		if($("#pro-con").hasClass("apple") === true) {
			$(".product-container").css("display","none");
			$("#pro-con").removeClass("apple");
			$("#p-plus").css("display","block");
			$("#p-minus").css("display","none");
		}else{
			$(".product-container").css("display","flex");
			$("#pro-con").addClass("apple");
			$("#p-plus").css("display","none");
			$("#p-minus").css("display","block");
		}
	})
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>