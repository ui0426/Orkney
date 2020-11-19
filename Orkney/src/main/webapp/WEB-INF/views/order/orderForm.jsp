<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">		
	<jsp:param name="title" value="주문 내역" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/order/order.css"/>
<style>
	.order-container-inner{
		max-width: 656px;
    	margin: 0 auto;
	}
	.orderform-title{
		text-align: center;
		font-weight: 700;
		font-size: 1.5rem;
		margin: 1rem 0px;
	}
</style>
<section class="order-container">
	<div class="order-container-inner">
		<h1 class="orderform-title">비회원 주문 내역</h1>
		<div class="order-form-content">
			<form>
				<h2>주문정보</h2>
			  	<div class="form-group">
			    	<input type="email" class="form-control input-click" id="exampleInputEmail1" aria-describedby="emailHelp">
			    	<label id="inputName" for="inputSMEx">주문번호(iSell)번호</label>
			    	<small id="emailHelp" class="form-text text-muted">9~10자리의 주문 번호(iSell 번호)를 입력해주세요.</small>
			  	</div>
			  	<div class="form-group">
			    	<input type="password" class="form-control" id="exampleInputPassword1">
			   		<label for="exampleInputPassword1">Password</label>
			  	</div>
			  	<button type="submit" class="btn btn-primary">확인</button>
			</form>
			<div class="md-form form-sm">
			  <input type="text" id="inputSMEx" class="form-control form-control-sm">
			  <label for="inputSMEx">Small input</label>
			</div>
		</div>
	</div>
</section>

<script>
	$(".input-click").click(function(){
		$("#inputName").addClass("small")
	})
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>