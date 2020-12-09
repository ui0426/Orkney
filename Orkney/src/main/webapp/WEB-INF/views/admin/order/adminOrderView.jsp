<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<style>
.order-container{
	padding: 0 2rem 0 2rem;
}
.order-title{
	margin-bottom: 2.5rem;
}
.order-title-text{
	font-weight: bold;
    font-size: 1.5rem;
}
.order-btn-title{
	color: #111;
    font-size: 1.125rem;
    line-height: 1.44444;
    font-weight: 700;
}
</style>
<section class="order-container">
 	<div class="order-container-inner">
		<div class="order-content order">
			<div class="order-title">
				<h1 class="order-title-text">주문 상세</h1>
			</div>
		</div>
		<div>
			<div>
				<h2 class="order-btn-title">기본 정보</h2>
			</div>
			<div></div>
		</div>
		<div>
			<div>
				<h2 class="order-btn-title">주문자 정보</h2>
			</div>
			<div></div>
		</div>
		<div>
			<div>
				<h2 class="order-btn-title">수령자 정보</h2>
			</div>
			<div></div>
		</div>
		<div>
			<div>
				<h2 class="order-btn-title">주문 내역</h2>
			</div>
			<div></div>
		</div>
		<div>
			<div>
				<h2 class="order-btn-title">결제 내역</h2>
			</div>
			<div></div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/adminFooter.jsp"/>