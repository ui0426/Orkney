<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import = "java.util.Enumeration" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">      
   <jsp:param name="title" value="메인화면" />
</jsp:include>

<link rel="stylesheet" href="${path}/resources/css/cart/complete.css"/>

 <section>
        <div class="section-container">
            <div class="section2">
                <div class="order-detail">
                    
                    <div class="check-back">
                            <img src="${path}/resources/img/check.png" alt="">                            
                    </div>                    
                    <div class="title-container">주문해주셔서 감사합니다!</div>                                
                    <div class="order-no">
                        <div>주문번호 : </div> 
                        <div class="check" style="margin-left: 6px;">${orders.order_no} </div> 
                    </div>                    
                    <button type="button" class="adrBtn marb" id="adrbtn" onclick="location.href='${path }/order/orderView.do?oNo=${orders.order_no}'">배송조회하기</button>
                    <div>주문 확인서가 다음으로 전송되었습니다.</div>
                    <div class="check" style="margin-top: 6px;">${orders.member_id}</div>                               
                </div>
            </div>

            <div class="section1">                
                    <div class="etc-title">주문 정보</div>
                    <div class="line1"></div>
<c:forEach items="${cart }" var="p">
            <div class="product-container">
	            <div class="order-container">
	                <div class="product-pic"><img src="${path}/resources/images/product/<c:out value="${p.product_pic}"/>"></div>               
	                <div class="product-detail">
	                    <div><c:out value="${p.productName}"/></div>
	                    <div><c:out value="${p.product_width}"/>*<c:out value="${p.product_height}"/>*<c:out value="${p.product_depth}"/></div>	                  		                    
	                    <div><c:out value="${p.cartQTY}"/>개</div>
	                    <div><fmt:formatNumber value="${p.cartQTY * p.productPrice}"/>&nbsp;원</div>	                     	                    
	                </div>
	            </div>	            
            </div>  
            <div class="line3"></div>
</c:forEach>  
                                                        
            </div>


            <div class="section1">
           	  <div style="margin:5% 0;">
                <div class="etc-title">나의 세부 정보</div>
                <div class="line1"></div>
           		
	           		<div class="field-inline">
		                <div class="field ">
		                    <div><img src="${path}/resources/img/user.png" alt=""></div> 
		                    <span>${orders.order_name}</span>                    
		                </div>
		                <div class="field">
		                    <div><img src="${path}/resources/img/mail.png" alt=""></div> 
		                    <span>${orders.member_id}</span>                    
		                </div>                              
	                </div>
	            
	            
	                <div class="field-inline">
	                
		                <div class="field">
		                    <div><img src="${path}/resources/img/phone-call.png" alt=""></div> 
		                    <span>${orders.order_phone}</span>
		                </div>
		                <div class="field">
		                    <div><img src="${path}/resources/img/address.png" alt=""></div> 
		                    <span>${orders.order_address}</span>
		                </div>
		             </div>	    
		         </div>     
            </div>

 <div class="section1" style="margin: 30% 0 0 0;">
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
                            <div><input type="text" class="non-input" id="totalFee" value="<fmt:formatNumber value="${map.totalFee}"/>" readonly> &nbsp;원</div>                           	
                        </div>
                    </div>
             </div>  

            <div class="section1" style="margin: 13% 0;">
                <div class="etc-title">배송 정보/배송질문</div>
                <div class="line1"></div>
                <div class="etc-contant">택배 배송 (택배는 아래 선택한 배송 날짜로부터 3-5일 소요되며, 제품 특성에 따라 2박스 이상으로 분리배송 될 수 있습니다.)</div>               
                
                <div class="field-inline">
                    <div class="field">
                        <div><img src="${path}/resources/img/location.png"></div> 
                        <span>배송지 : 14950 대한민국</span>                    
                    </div>
                 </div>   
                 <c:set var="now" value="<%=new java.util.Date() %>"/>
                 <div class="field-inline">
                    <div class="field">
                        <div><img src="${path}/resources/img/calendar.png" alt=""></div>                                                
                        <span><fmt:formatDate value="${now }" pattern="yyyy-MM-dd hh시mm분"/></span>
                    </div>                    
                  </div>
                                    
                 <div class="etc-contant">배송기사님이 배송전 알아야 하는 정보 : <span style="font-style: italic;">${orders.order_memo}</span> </div>
                                
            </div>

            <div class="section1">            
                    <div class="etc-title">고객센터 운영시간</div>
                
                    <div class="line1"></div>
            <div class="service-conatainer">
                    <div class="field-inline">
  		                  <div class="field">
                            <div><img src="${path}/resources/img/phone-call.png"></div> 
                            <span>고객센터 : 1111-2222</span>
                        </div>                        
                    </div> 
                    <div class="field-inline">
                    	 <div class="field">
                    	 	<div><img src="${path}/resources/img/time.png"></div>
                    	 	<span>오전 10시 - 오후 10시</span>                    	 
                    	 </div>	
                   	</div>                                             
                    
                    
                    <div class="info-title">
                    		<div><img src="${path}/resources/img/operator.png"></div>
                    		<span>서비스 이용시 유의사항</span>
                    </div>                   
                    <div class="service-detail">예정된 배송시간에 부재일 경우 배송비가 추가로 부과 될 수 있습니다.</div>             
                    <div class="line2">
                        <div class="service-detail">
                            엘레베이터가 없는 4층 이상으로 배송할 경우, 구매 후 24시간 이내에 고객지원센터(1111-2222)/채팅서비스를
                            를 통해 사다리차 서비스를 주문해주세요
                        </div>
                    </div>
                    <div class="service-detail">
                        서비스 변경 및 취소는 서비스 예정일자 전일 오후 2시까지 가능합니다. 
                        변경 및 취소가 필요하실 경우, 고객지원센터(1111-2222)/채팅서비스를 이용해주세요
                    </div>

            </div>   
                <div class="del-container">
                    <img src="${path}/resources/img/deliverypic.jpg" class="del-img">
                </div>
                
            </div>
            
        </div>
    </section>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>