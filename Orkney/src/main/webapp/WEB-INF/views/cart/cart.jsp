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
                   <div><button class="remove_basket">장바구니 비우기</button></div>
                </div>               
            <div class="line1"></div>  
            
            <div class="product-container">
                <div class="product-pic"><img src="https://www.ikea.com/kr/ko/images/products/groenlid-chaise-longue-section-ljungen-light-red__0852499_PE780117_S3.JPG" alt=""></div>                
                <div class="price">₩ 9,900</div>                                                                    
                    <div class="product-detail">
                        <div>상품명</div>
                        <div>상품정보</div>                                
                        <div>75*25 cm</div>
                    
                    
                    <div class="btn-container">
                        <div>
                            <select class="mdb-select md-form">
                                <option value="" disabled selected>1</option>
                                <option value="1">2</option>
                                <option value="2">3</option>
                                <option value="3">4</option>
                              </select>
                        </div>
                        <div><button class="remove_list">삭제</button></div>
                        <div><button class="wish_btn">위시리스트 저장</button></div>
                    </div>  
                </div>
	            	<div class="line1"></div>                              
                </div>
                
                <div class="product-container">
                <div class="product-pic"><img src="https://www.ikea.com/kr/ko/images/products/groenlid-chaise-longue-section-ljungen-light-red__0852499_PE780117_S3.JPG" alt=""></div>                
                <div class="price">₩ 9,900</div>                                                                    
                    <div class="product-detail">
                        <div>상품명</div>
                        <div>상품정보</div>                                
                        <div>75*25 cm</div>
                    
                    
                    <div class="btn-container">
                        <div>
                            <select class="mdb-select md-form">
                                <option value="" disabled selected>1</option>
                                <option value="1">2</option>
                                <option value="2">3</option>
                                <option value="3">4</option>
                              </select>
                        </div>
                        <div><button class="remove_list">삭제</button></div>
                        <div><button class="wish_btn">위시리스트 저장</button></div>
                    </div>  
                </div>
	            	<div class="line1"></div>                              
                </div>    
            </div>

    
        <div class="section2">                                                        
                <div class="service-container">                              
                    <div>전체 서비스 비용</div>
                    <div>이 금액에는 배송비가 포함되어 있지 않으며 ...</div>
                </div>                                       
        </div>

        <div class="line2"></div> 

        <div class="total-container">
            <div class="total-title">총 주문금액</div>
            <div class="total-price">₩ 9,900</div>
        </div>
    
        <div class="section3">
        	
  
            <span class="pay-btn"><button type="button" class="btn btn-dark event-bu" onclick="location.href='${path }/cart/payment.do'"><span class="event-sp">결제하기</span></button></span>                                  
            <div class="etc-line">    
                <div>반품 정책 365일 이내에 제품 환불 가능</div>
                <div>안전한 쇼핑SSD 데이터 암호화로 안전한 쇼핑</div>
            </div>            
        </div>
        <div class="line1"></div>    
    </div>
    
</section>

<script>
$(document).ready(function() {
$('.mdb-select').materialSelect();
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	