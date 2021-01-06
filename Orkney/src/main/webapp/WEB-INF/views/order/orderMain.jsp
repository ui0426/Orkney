<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">		
	<jsp:param name="title" value="배송조회 및 관리" />
</jsp:include>

<link rel="stylesheet" href="${path}/resources/css/order/ordermain.css"/>

<section class="order-container">
 <div class="order-container-inner">
	<div class="order">
		<nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item"><a href="${path}">홈</a></li>
		    <li class="breadcrumb-item active" aria-current="page">배송조회 및 관리</li>
		  </ol>
		</nav>
	</div>
	<div class="order-content order">
		<div class="order-title">
			<h1 class="order-title-text">배송조회 및 관리</h1>
		</div>
		<div class="order-title">
			<p class="order-intro">
				주문한 제품이 지금 어디에 있는지 알고 싶으신가요? 아니면 주문 내용에 변경하고 싶은 부분이 있나요? 
				걱정하지 마세요. ORKENY의 추적 및 관리 서비스가 도와드릴 수 있어요.
			</p>
		</div>
	</div>
	<div class="row order">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 order order-btn">
			<div class="order-btn-intro">
        		<h2 class="order-btn-title">배송조회</h2>
        		<p class="order-btn-content order-intro">
        			구입한 제품이 지금 어디에 있는지 정확히 알고 싶으신가요? 주문을 추적하면 걱정을 덜 수 있을 거예요.
        		</p>
        	</div>
        	<div class="order-btn-buttons">
        		<a type="button" href="${path }/order/orderForm.do" class="order-btn-button">
        			<span class="order-btn-inner">
        				<span class="order-btn-label">배송조회</span>
        			</span>
        		</a>
        	</div>
        </div>
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 order order-btn">
            <div class="order-btn-intro">
        		<h2 class="order-btn-title">주문관리</h2>
        		<p class="order-btn-content order-intro">
        			트럭 배송 시간을 변경해야 하거나, 주문 취소 또는 조립 서비스가 필요하다면 여기에서 도와드릴게요.
        		</p>
        	</div>
        	<div class="order-btn-buttons">
        		<!-- controller에서 로그인 안한 상태와 로그인 한 상태로 나눠져야함 -->
        		<a type="button" href="${path }/order/orderList.do" class="order-btn-button">
        			<span class="order-btn-inner">
        				<span class="order-btn-label">주문관리</span>
        			</span>
        		</a>
        	</div>
        </div>
	</div>
	<div class="order-help order order-btn">
		<div class="order order-btn">
			<h2 class="order-btn-title">도움말 더보기</h2>
			<p class="order-intro">
				궁금한 점이 있거나 도움이 필요하다면 고객 센터에 문의하여 필요한 답을 찾아보세요.
			</p>
		</div>
		<div>
			<a type="button" href="" class="order-btn-button">
     			<span class="order-btn-inner  order-btn-last">
     				<span class="order-btn-label">문의하기</span>
     			</span>
     		</a>
		</div>
	</div>
	</div>
</section>
<script>

</script>


<div class="order-share">
	<!-- <button>공유하기</button> -->
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	