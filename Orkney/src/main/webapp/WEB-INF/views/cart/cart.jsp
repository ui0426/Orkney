<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


<jsp:include page="/WEB-INF/views/common/header.jsp">      
   <jsp:param name="title" value="장바구니" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/cart/cart.css">
 
<section>
    <div class="section-container">    
        <div class="section1">        
                    <div class="title">
                   		<div>장바구니</div>                                  		
	                   	 	<div><button class="remove_basket" id="${cN}">장바구니 비우기</button></div>	
	                   	 	<input type="hidden" value="${sumprice }" id="sumprice">	                   	 	   	                     	 	                   			                   					   	                                                     
					</div>
            <div class="line1"></div>                            		 			 	
		 	<div id="re"></div>														 		               
		</div>		
 
        <div class="section3">        				
            <span class="pay-btn"><button type="button" id="cartBtn" class="btn-dark event-bu"><span class="event-sp">결제하기</span></button></span>                                              
            <div class="etc-line">                
                <div>
                   <div><img src="${path}/resources/img/refund.png"> </div>
                   <span  class="etc-detail">반품 정책 365일 이내에 제품 환불 가능</span>
                </div>
                <div>
                    <div><img src="${path}/resources/img/lock.png"> </div>
                   <span  class="etc-detail">안전한 쇼핑SSD 데이터 암호화로 안전한 쇼핑</span>                    
                </div>                
            </div>            
        </div>
        <div class="line1"></div>            
</div>
</section>


<script>
		//1. ajax처리 onload
		  $(function(){
					let sumPrice = $("#sumprice").val();	
					let cNo= $(".remove_basket").attr("id");
					console.log(cNo);
					$.ajax({
						url:"${path}/cart/deleteProduct.do",
						data:{sumPrice:sumPrice,cN:cNo},
						success:data =>{					
							$("#re").html(data);
						}
					})
				})	
			
			//2. 장바구니 전체제거시
			$(".remove_basket").click(e=>{
				let sumPrice = $("#sumprice").val();	
				let cNo=$(e.target).attr("id");				
				 $.ajax({
					 url:"${path}/cart/deleteBasket.do",
					 data:{cartNo:cNo,sumPrice:sumPrice},
					 success:data=>{
						console.log("cNo:"+cNo);	
						$("#re").html(data);
					 }
				 });
			 }); 
			//3.장바구니 비어있는 경우 
			$("#cartBtn").click(e=>{
			let cN = $(".basketNo").attr("id");			
			if(!cN){
				alert("장바구니가 비어있습니다.");
				return false;
			}
			location.href=("${path }/cart/payment.do");
		})
</script>
	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>   