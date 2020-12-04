<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                        <div class="check" style="margin-left: 6px;">172398866 </div> 
                    </div>
                    <button type="button" class="adrBtn marb" id="adrbtn">배송조회하기</button>
                    <div>주문 확인서가 다음으로 전송되었습니다.</div>
                    <div class="check" style="margin-top: 6px;">j131@naver.com</div>                               
                </div>
            </div>

            <div class="section1">                
                    <div class="etc-title">주문 정보</div>
                    <div class="line1"></div>
                 <div class="product-container">    
                    <div class="order-container">
                        <div class="product-pic"><img src="https://www.ikea.com/kr/ko/images/products/groenlid-chaise-longue-section-ljungen-light-red__0852499_PE780117_S3.JPG" alt=""></div>               
                        <div class="product-detail">
                            <div>GRÖNLID 그뢴리드</div>
                            <div>15*12</div>
                            <div>149,000원</div>
                            <div>1개</div>
                        </div>
                    </div>
                     <div class="order-container">
                        <div class="product-pic"><img src="https://www.ikea.com/kr/ko/images/products/groenlid-chaise-longue-section-ljungen-light-red__0852499_PE780117_S3.JPG" alt=""></div>               
                        <div class="product-detail">
                            <div>GRÖNLID 그뢴리드</div>
                            <div>15*12</div>
                            <div>149,000원</div>
                            <div>1개</div>
                        </div>
                    </div>
                  </div>                                    
            </div>


            <div class="section1">
                <div class="etc-title">나의 세부 정보</div>
                <div class="line1"></div>
           		
	           		<div class="field-inline">
		                <div class="field ">
		                    <div><img src="${path}/resources/img/user.png" alt=""></div> 
		                    <span>이윤나</span>                    
		                </div>
		                <div class="field">
		                    <div><img src="${path}/resources/img/mail.png" alt=""></div> 
		                    <span>j131@naver.com</span>                    
		                </div>                              
	                </div>
	            
	            
	                <div class="field-inline">
	                
		                <div class="field">
		                    <div><img src="${path}/resources/img/phone-call.png" alt=""></div> 
		                    <span>010-5252-1515</span>
		                </div>
		                <div class="field">
		                    <div><img src="${path}/resources/img/address.png" alt=""></div> 
		                    <span>경기 평택시 공도읍 924-2 어울림 202-151 대한민국 14950</span>
		                </div>
		             </div>	         
            </div>

            <div class="section1 section-op">
                <div class="etc-title">결제 세부 정보</div>
                <div class="line1"></div>
                <div class="total-title">
                        <div class="pay-title">
                            <div >주문 금액(배송비 제외)</div>
                            <div>7,900</div>                    
                        </div>
                        <div class="pay-title">
                            <div>전체 서비스 비용</div>
                            <div>5,000</div>
                        </div>
                        <div class="pay-title">
                            <div>주문 금액(부가세 제외)</div>
                            <div>11,727</div>
                        </div>
                        <div class="pay-title">
                            <div>부가세(10%)</div>
                            <div>1,173</div>
                        </div>
                </div>                
                    <div class="line2">
                        <div class="pay-title pay-font">
                            <div>총 주문금액</div>
                            <div>12,900</div>
                        </div>
                    </div>
            </div>

            <div class="section1" style="margin: 10% 0;">
                <div class="etc-title">배송 정보/배송질문</div>
                <div class="line1"></div>
                <div class="etc-contant">택배 배송 (택배는 아래 선택한 배송 날짜로부터 3-5일 소요되며, 제품 특성에 따라 2박스 이상으로 분리배송 될 수 있습니다.)</div>
                <!-- <div class="between"> -->
                
                <div class="field-inline">
                    <div class="field">
                        <div><img src="${path}/resources/img/location.png"></div> 
                        <span>배송지 : 14950 대한민국</span>                    
                    </div>
                 </div>   
                 <div class="field-inline">
                    <div class="field">
                        <div><img src="${path}/resources/img/calendar.png" alt=""></div>                                                
                        <span> 2020.11.23 09:00 -21:00</span>
                    </div>                    
                  </div>
                    
                <!-- </div> -->
                <!-- <div class="etc-contant">배송기사님이 배송전 알아야 하는 정보가 있나요? (주차제한, 출입가능 시간제한 등)</div> -->                
            </div>

            <div class="section1 section-op1">            
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