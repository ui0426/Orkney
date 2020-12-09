
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<link rel="stylesheet" href="${path}/resources/css/cart/payment.css">


            <div class="section1">
                <div class="etc-title">결제 세부 정보</div>
                <div class="line1"></div>
                <div class="total-title">
                        <div class="pay-title">
                            <div >총 상품 금액</div>
                            <div><input type="text" value="<c:out value="${map.sumprice}"/>"></div>                    
                        </div>
                        <div class="pay-title">
                            <div>배송비 비용</div>
                            <div><input type="text" value="${map.shipFee}"></div>
                        </div>                        
	                    
	                    <div class="pay-title">
	                            <div>포인트 사용</div>
	                            <div><input type="text" value="${map.point}"></div>
	                    </div>
	                       
                        <div class="pay-title">
                            <div>부가세(10%)</div>
                            <div><input type="text" value="${map.addTax}"></div>
                        </div>
                </div>                
                    <div class="line2">
                        <div class="pay-title pay-font">
                            <div>총 주문금액</div>
                            <div><input type="text" value="${map.totalFee}"></div>
                        </div>
                    </div>
             </div>   
            
            
            
            
            
            
            
                 