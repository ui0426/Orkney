
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<link rel="stylesheet" href="${path}/resources/css/cart/payment.css">

        <div class="section1">
            <div class="etc-title">포인트</div>
            <div class="line1" ></div>           
            <div class="able-point">	            
	            <div class="first-div first-div-add">사용 가능한 포인트</div>
	            <div class="usable-point">
	            	<input type="text" id="pointuse" class="non-input" value="<c:out value="${map.point}"/>" readonly>
	            </div>                                        	                 
	            <div class="pre-point" style="padding: 7px 30px 0px 8px;">P</div>	            
	            <div class="for-span"><input type="button" id="allpoint" class="btn2" value="전액 사용"></div>	         
			</div>                            
            <div class="able-point">
            	<div class="first-div first-div-add">사용할 포인트</div>                     
                <div><input type="text" class="input4 none-line" id="usablepoint" value=""></div>
                <div class="pre-point" style="padding: 7px 0 0px 8px;">P</div>   
                <div class="for-span"><input type="button" id="use-btn" class="btn2" value="포인트 사용"></div>         	                         
            </div>                    
        </div>                  
        
            <div class="section1">
                <div class="etc-title">결제 세부 정보</div>
                <div class="line1"></div>
                <div class="total-title">
                        <div class="pay-title">
                            <div >총 상품 금액</div>
                            <div><input type="text" class="non-input" id="sumProduct" value="<fmt:formatNumber value="${map.sumprice}"/>" readonly>&nbsp;</div>                    
                        </div>
                        <div class="pay-title">
                            <div>배송비 비용</div>
                            <div><input type="text" class="non-input" id="shipFee" value="<fmt:formatNumber value="${map.shipFee}"/>"  readonly>&nbsp;</div>
                        </div>                        
	                    
	                    <div class="pay-title">
	                            <div>포인트 사용</div>	                            
	                            <div><input type="text" class="non-input" id="willPoint" value="<fmt:formatNumber value="${total+map.willpoint}"/>"  readonly>&nbsp;</div>
	                    </div>
	                       
                        <div class="pay-title">
                            <div>부가세(10%)</div>
                            <div><input type="text" class="non-input" id="addTax" value="<fmt:formatNumber value="${map.addTax}"/>" readonly>&nbsp;</div>
                        </div>
                </div>                
                    <div class="line2">
                        <div class="pay-title pay-font">
                            <div>총 주문금액</div>
                            <div>
                            <input type="text" class="non-input" id="totalFee" value="<fmt:formatNumber value="${map.totalFee}"/>" readonly>
                            <input type="hidden" id="total" class="${map.addTax}" value="${map.totalFee}" name="${total+map.willpoint}"/>
                        	<input type="hidden" id="fee" class="${map.shipFee}" value="${map.sumprice}">
                            &nbsp;원                            
                            </div>
                        	
                        </div>
                    </div>
             </div>   
             
             
		<script>
		//1. 포인트 전액 사용시
        	$("#allpoint").click(e=>{
        		let up=$("#pointuse").val();        		        		        		
        		$("#usablepoint").attr({
        			"value":up
        		});        		        		
        	});
		
         //2. 포인트 적용시	
   	 	 $("#use-btn").click(e=>{
        		let willpoint = parseInt($("#usablepoint").val());
        		let pointuse = $("#pointuse").val();          		        		  
        		
        		if(parseInt(willpoint)> parseInt(pointuse)){
        			alert("사용가능한 포인트를 입력해주세요");
        		}else{
        			$.ajax({
            			url:"${path}/cart/updatePayment.do",        			
            			data:{willpoint:willpoint},        			
            			success:data=>{
            				$("#detail").html(data);
            			}        			
            		})            			        			
        		}	
   	 	})
        	
        </script>
            
            
            
            
            
            
            
                 