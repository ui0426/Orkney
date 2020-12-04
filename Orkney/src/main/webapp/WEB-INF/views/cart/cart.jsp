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
	                   <div><button class="remove_basket" value="${cN}">장바구니 비우기</button></div>	   	                                                     
					</div>
            <div class="line1"></div>                            
		 	
		 	<div id="re"></div>	
			<script>				
				$(function(){
					$.ajax({
						url:"${path}/cart/deleteProduct.do",
						success:data =>{					
							$("#re").html(data);
						}
					})
				})	
			
			/* 장바구니제거 */
			$(".remove_basket").click(e=>{
				let cNo=$(e.target).val();				
				 $.ajax({
					 url:"${path}/cart/deleteBasket.do",
					 data:{cartNo:cNo},
					 success:data=>{
						console.log("cNo:"+cNo);	
						$("#re").html(data);
					 }
				 });
			 }); 
			</script>
								 		               
		</div>
		
		
        <div class="section2">                                                        
                <div class="service-container">                              
                    <div>전체 서비스 비용</div>
                    <div>이 금액에는 배송비가 포함되어 있지 않으며, 배송지에 따라 구매가 불가할 수 있습니다</div>
                </div>                                       
        </div>
        <div class="line2"></div> 

        <div class="total-container">
            <div class="total-title">총 주문금액</div>
            <div class="total-price">
            	<c:set var="total" value="0"/>
            	<c:forEach var="list" items="${cart}">
            		<c:set var="total" value="${total + list.product_price}"/>
            	</c:forEach> <fmt:formatNumber value="${total}"/> 원
            </div>
        </div>
    
        <div class="section3">
        	
  
            <span class="pay-btn"><button type="button" class="btn-dark event-bu" onclick="location.href='${path }/cart/payment.do'"><span class="event-sp">결제하기</span></button></span>                                  
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
      
    
    
    
    
    
    <!-- Full Height Modal Right -->
<div class="modal fade right" id="fullHeightModalRight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">

  <div class="modal-dialog modal-full-height modal-right" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title w-100" id="myModalLabel">Modal title</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer justify-content-center">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!-- Full Height Modal Right -->
</section>

<!-- <script>
$(document).ready(function() {
$('.mdb-select').materialSelect();
});
</script> -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	