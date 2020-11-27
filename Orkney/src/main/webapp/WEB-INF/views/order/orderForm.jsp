<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">		
	<jsp:param name="title" value="배송조회 " />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/order/orderForm.css"/>

<section class="order-container">
	<div id="order-container-content">
		<div class="order-container-inner">
			<h1 class="orderform-title">주문 정보 확인</h1>
			<div class="order-form-main">
				<form action="${path }/order/orderView2.do">
					<h2 class="order_information-title">주문정보</h2>
				  	<div class="form-group">
				  		<label class="order_information" for="orderNo">
					    	<input type="text" name="orderNo" class="form-control order-infor-input order-form-number" id="orderNo">
					    	<span id="inputNo" class="order-input-center">주문번호(iSell)번호</span>
				    	</label>
				    	<div id="ordernum" class="form-text text-muted order-form-error-msg">
				    		<svg viewBox="0 0 24 24" width="16px" height="16px"><g fill="none" fill-rule="evenodd"><path fill="#E00751" d="M22 12c0 5.523-4.477 10-10 10S2 17.523 2 12 6.477 2 12 2s10 4.477 10 10z"></path><path fill="#FFF" fill-rule="nonzero" d="M13.414 12l4.233 4.234-1.414 1.414L12 13.415l-4.243 4.243-1.414-1.415 4.242-4.242L6.35 7.766l1.415-1.414L12 10.587l4.242-4.243 1.415 1.414-4.243 4.243z"></path></g></svg>
				    		9~10자리의 주문 번호(iSell 번호)를 입력해주세요.
				    	</div>
				  	</div>
				  	<div id="orderNo_help">
				  		<p>
					        <a class="order-form-help" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
				            	<svg viewBox="0 0 40 40" width="18px" height="18px" class="exclamationmark"><g fill="none" fill-rule="evenodd"><path fill="#0058A3" d="M36.667 20c0 9.205-7.462 16.667-16.667 16.667-9.205 0-16.667-7.462-16.667-16.667 0-9.205 7.462-16.667 16.667-16.667 9.205 0 16.667 7.462 16.667 16.667z"></path><path fill="#FFF" d="M18.333 16.667h3.334V30h-3.334V16.667zm1.667-1.5a2.167 2.167 0 1 1 0-4.334 2.167 2.167 0 0 1 0 4.334z"></path></g></svg>
				            	주문 번호(iSell 번호)는 어디에서 찾을 수 있나요?
					        </a>
					    </p>
					    <div class="collapse" id="collapseExample">
					        <div class="card card-body">
					         	주문 번호(iSell 번호)는 주문 확인서 상단에 있습니다.
						        <div class="order-help-content">
						        	<img class="Helper_Image" src="${path }/resources/img/order.PNG" width="100%" height="100%">
						        </div>
					        </div>
					    </div>
				  	</div>
				  	<div class="form-group">
				  		<label class="order_information">
					    	<input type="text" name="phone_email" class="form-control order-infor-input order-form-phone" id="orderpe">
					   		<span id="inputphone" class="order-input-center">전화번호 또는 이메일</span>
				   		</label>
				   		<div id="orderphone" class="form-text text-muted order-form-error-msg">
				   			<svg viewBox="0 0 24 24" width="16px" height="16px"><g fill="none" fill-rule="evenodd"><path fill="#E00751" d="M22 12c0 5.523-4.477 10-10 10S2 17.523 2 12 6.477 2 12 2s10 4.477 10 10z"></path><path fill="#FFF" fill-rule="nonzero" d="M13.414 12l4.233 4.234-1.414 1.414L12 13.415l-4.243 4.243-1.414-1.415 4.242-4.242L6.35 7.766l1.415-1.414L12 10.587l4.242-4.243 1.415 1.414-4.243 4.243z"></path></g></svg>
				   			잘못 입력하셨습니다. 다시 시도해주세요.
				   		</div>
				  	</div>
				  	<button type="submit" class="btn order-btn-color" id="order-submit">확인</button>
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
		var no = $("#orderNo").val().trim();
		if(no.length==0){
			$("#inputNo").removeClass("order-input-top");
			$("#inputNo").addClass("order-input-center");
			
		}
	});
	
	$(".order-form-phone").focus(function(){
		$("#inputphone").removeClass("order-input-center");
		$("#inputphone").addClass("order-input-top");
	});
	$(".order-form-phone").blur(function(){
		var ep = $("#orderpe").val().trim();
		if(ep.length==0){			
			$("#inputphone").removeClass("order-input-top");
			$("#inputphone").addClass("order-input-center");
		}
	});
	
	
	
	let noresult = false;
	let peresult = false;
	
	$("#order-submit").click(function(){
		
		var no=$("#orderNo").val();
		
		var regex =/[0-9]/g;
		
		if(regex.test(no)){
			if(no.length>=9 && no.length<=10){
				$("#ordernum").css("display","none");
				console.log("성공");
				noresult = true;	
			}else{
				$("#ordernum").css("display","block");
				console.log("실패");
				noresult = false;
			}
		}else{
			$("#ordernum").css("display","block");
			console.log("진짜실패");
			noresult = false;
		}
		
		var pe=$("#orderpe").val();
		
		if(pe.length==0){
			$("#orderphone").css("display","block");
			peresult = false;
		}else{
			$("#orderphone").css("display","none");
			peresult = true;
		}

		if(noresult==true && peresult==true){
			return true;
		}else{
			return false;
		}
	});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>