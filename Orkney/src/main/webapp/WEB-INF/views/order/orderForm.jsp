<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">		
	<jsp:param name="title" value="주문 내역" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/order/ordermain.css"/>
<link rel="stylesheet" href="${path}/resources/css/order/orderForm.css"/>

<section class="order-container">
	<div id="order-container-content">
		<div class="order-container-inner">
			<h1 class="orderform-title">비회원 주문 내역test</h1>
			<div class="order-form-main">
				<form>
					<h2 class="order_information-title">주문정보</h2>
				  	<div class="form-group">
				  		<label class="order_information">
					    	<input type="text" class="form-control order-infor-input order-form-number" id="exampleInputEmail1" aria-describedby="emailHelp">
					    	<span id="inputNo" class="order-input-center">주문번호(iSell)번호</span>
				    	</label>
				    	<small id="emailHelp" class="form-text text-muted">9~10자리의 주문 번호(iSell 번호)를 입력해주세요.</small>
				  	</div>
				  	<div id="orderNo_help">
				  		<p>
					        <a class="order-form-help" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
					            주문 번호(iSell 번호)는 어디에서 찾을 수 있나요?
					        </a>
					    </p>
					    <div class="collapse" id="collapseExample">
					        <div class="card card-body">
					         	주문 번호(iSell 번호)는 주문 확인서 상단에 있습니다.
						        <div class="rrrr">
						        	<img class="Helper_Image" src="img/order.PNG" width="100%" height="100%">
						        </div>
					        </div>
					      </div>
				  	</div>
				  	<div class="form-group">
				  		<label class="order_information">
					    	<input type="text" class="form-control order-infor-input order-form-phone" id="exampleInputPassword1">
					   		<span id="inputphone" class="order-input-center">전화번호 또는 이메일</span>
				   		</label>
				   		<small id="emailHelp" class="form-text text-muted">잘못 입력하셨습니다. 다시 시도해주세요.</small>
				  	</div>
				  	<button type="submit" class="btn order-btn-color">확인</button>
				</form>
			</div>
		</div>
	</div>
</section>

<script>
	$(".order-form-number").focus(function(){
		$("#inputNo").removeClass("order-input-center");
		$("#inputNo").addClass("order-input-top");
	});
	$(".order-form-number").blur(function(){
		$("#inputNo").removeClass("order-input-top");
		$("#inputNo").addClass("order-input-center");
	});
	
	$(".order-form-phone").focus(function(){
		$("#inputphone").removeClass("order-input-center");
		$("#inputphone").addClass("order-input-top");
	});
	$(".order-form-phone").blur(function(){
		$("#inputphone").removeClass("order-input-top");
		$("#inputphone").addClass("order-input-center");
	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>