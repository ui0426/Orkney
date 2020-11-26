<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


<jsp:include page="/WEB-INF/views/common/header.jsp">      
   <jsp:param name="title" value="결제화면" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/cart/payment.css">


<section>  
    <div class="section-container">       
        
        <div class="section1">
            <div class="title-container">주문/결제</div>
            <div class="etc-title">주문상품</div>        
            
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
            <div class="etc-title">
                  <span>배송지</span>   
                  <button class="btn2">회원정보와 동일하게 채우기</button>
            </div>
            <div class="line1"></div>
            <div class="field">
                <span class="first-div">받는분</span>
                <div><input type="text" class="input1"></div>
            </div>

            <div class="field">
                <span class="first-div">우편번호</span>
                <div><input type="text" class="input2"> </div>
                <div class="btn-container"><button class="btn1">우편번호</button></div>
            </div>

            <div class="field">
                <span class="first-div">주소</span>
                <div><input type="text" class="input3"></div>
            </div>
            
            <div class="field">                   
                <div class="etc-div"><input type="text" class="input3"></div>                            
            </div>
            

            <div class="field">
                <div class="first-div">휴대전화</div>
                <div><input type="text" class="input1"></div>
            </div>

            <div class="field">
                <div class="first-div">배송메모</div>
                <div><input type="text" class="input3"></div>
            </div>            
        </div>
        
        <div class="section1">            
            <div class="etc-title">
                <span>주문자</span>  
                <button class="btn2">회원정보와 동일하게 채우기</button>           
            </div>
            <div class="line1"></div>
            <div class="field">
                <span class="first-div">이름</span>
                <div><input type="text" class="input1"> </div>
            </div>

            <div class="field">
                <span class="first-div">이메일</span>
                <div><input type="text" class="input1"></div>
            </div>

            <div class="field">
                <span class="first-div">휴대전화</span>
                <div><input type="text" class="input1"></div>
            </div>

            <div class="field">
                <div class="checkdiv  marb">  
                    <div class="checkicon" stlye="width:172px;">
                        <span><i class="far fa-check-circle fa-2x ixy i1"></i></span>
                        <span><i class="fas fa-check-circle fa-2x ixy i2"></i></span>
                        <input type="checkbox" class="ck" id="ch">
                    </div>
                    <span class="spanwid">sms 수신 동의 (배송 정보를 SMS로 보내드립니다.)</span>
                </div>                                 
            </div>

        </div>

        <div class="section1">
            <div class="etc-title">
                <span>쿠폰 (0장)</span> 
                <button class="btn3">쿠폰열기</button> 
            </div>
            <div class="line1"></div>
        </div>

        <div class="section1">
            <div class="etc-title">포인트</div>
            <div class="line1" ></div>   
            <div class="etc-field">                     
                <div class="pre-point"><input type="text" class="input4">P</div>
            </div>  

            <div>
                <div style="padding-top: 14px;">사용 가능한 포인트</div>
                <div class="usable-point">0P</div>
                <div class="checkdiv  marb">  
                    <div class="checkicon" stlye="width:172px;">
                        <span><i class="far fa-check-circle fa-2x ixy i1"></i></span>
                        <span><i class="fas fa-check-circle fa-2x ixy i2"></i></span>
                        <input type="checkbox" class="ck" id="ch">
                    </div>
                    <span class="spanwid">전액사용</span>
                </div>                
            </div>            
        </div>

        <div class="section1">
            <div class="etc-title">예상 적립 포인트</div>
            <div class="line1"></div>   
            <div class="field">     
                <div class="pre-point">1,490P</div>
                <div style="padding-top: 5px;   font-weight: bold;">적립예정</div> 
            </div>
            <!-- <div>VIP 등급은 4,470P 적립<a href="">더알아보기</a></div> -->
        </div>

        <div class="section1">
            <div class="etc-title">최종 결제 금액</div>
            <div class="line1"></div> 
            <div class="last-field">
                <div>총 상품 금액</div>
                <div>149,000</div>
            </div>
            <div class="last-field">
                <div>배송비</div>
                <div>0</div>
            </div>
            <div class="last-field">
                <div>쿠폰 사용</div>                
                <div>0</div>
            </div>
            <div class="last-field">
                <div>포인트 사용</div>                
                <div>0</div>
            </div>
            <div class="total-price">149,000원</div>
        </div>

        <div class="section1">
            <div class="etc-title">결제 수단</div>
            <div class="line1"></div> 
            <div class="field">
                <div class="last-field"></div>
                <button id="credit-card" >
                    <img src="${path}/resources/img/credit-card.png" alt="">
                    <div class="card-title">카드</div>
                </button>
                <button id="coin" >                
                    <img src="${path}/resources/img/money.png" alt="">
                    <div class="coin-title">무통장입금</div>
                </button>
            </div>                                         
        </div>
        
        <div class="section1">
        
        <div class="field">
            <div class="checkdiv  marb">  
                <div class="checkicon" stlye="width:172px;">
                    <span><i class="far fa-check-circle fa-2x ixy i1"></i></span>
                    <span><i class="fas fa-check-circle fa-2x ixy i2"></i></span>
                    <input type="checkbox" class="ck" id="ch">
                </div>
                <span class="spanwid">결제 진행 필수사항 동의</span>
            </div>
        </div>

            <div class="contract">
                <div>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</div>                
                <div><button id="extendBtn1">보기</button></div>
            </div>
            
            <div class="line1"></div> 
            <div id="contract1" style="display:none;">
                <div class="contract1">
                    <div>개인정보 제 3자 제공</div>                
                    <div><button id="extendBtn2">열기</button></div>                
                </div>
                <div class="content1">
                                    개인정보 수집 및 이용 동의                
                                    1. 수집항목 : [필수] 이름, 연락처, 이메일주소, 인원정보
                                    2. 수집 및 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리 등 민원 처리, 분쟁조정 해결을 위한 기록보존, 스테이폴리오 멤버십 및 프로모션, 이벤트 안내
                                    3. 보관기간 : 회원탈퇴 등 개인정보 이용목적 달성 시까지 보관. 단, 상법 및 ‘전자상거래 등에서의 소비자 보호에 관한 법률’ 등 관련 법령에 의하여 일정 기간 보관이 필요한 경우에는 해당 기간 동안 보관함
                                    4. 동의 거부권 등에 대한 고지 : 정보주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.                                                                                                    
                </div>
            </div>
            

            <div id="contract2" style="display:none;">
                <div class="contract1">
                    <div>개인정보 수집 및 이용</div>                
                    <div><button id="extendBtn3">열기</button></div>                
                </div>                
                            <div class="content2">
                                개인정보 수집 및 이용 동의                
                                1. 수집항목 : [필수] 이름, 연락처, 이메일주소, 인원정보
                                2. 수집 및 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리 등 민원 처리, 분쟁조정 해결을 위한 기록보존, 스테이폴리오 멤버십 및 프로모션, 이벤트 안내
                                3. 보관기간 : 회원탈퇴 등 개인정보 이용목적 달성 시까지 보관. 단, 상법 및 ‘전자상거래 등에서의 소비자 보호에 관한 법률’ 등 관련 법령에 의하여 일정 기간 보관이 필요한 경우에는 해당 기간 동안 보관함
                                4. 동의 거부권 등에 대한 고지 : 정보주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.                                                                                                    
                            </div>
            </div>

            <div id="contract3" style="display:none;">
                <div class="contract1">
                    <div>결제대행 서비스 이용약관</div>                
                    <div><button id="extendBtn4">열기</button></div>                
                </div>                
                            <div class="content3">
                                개인정보 수집 및 이용 동의
                
                                1. 수집항목 : [필수] 이름, 연락처, 이메일주소, 인원정보
                                2. 수집 및 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리 등 민원 처리, 분쟁조정 해결을 위한 기록보존, 스테이폴리오 멤버십 및 프로모션, 이벤트 안내
                                3. 보관기간 : 회원탈퇴 등 개인정보 이용목적 달성 시까지 보관. 단, 상법 및 ‘전자상거래 등에서의 소비자 보호에 관한 법률’ 등 관련 법령에 의하여 일정 기간 보관이 필요한 경우에는 해당 기간 동안 보관함
                                4. 동의 거부권 등에 대한 고지 : 정보주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.            
                            </div> 
            </div>
            <span class="pay-btn"><button type="button" class="btn btn-dark event-bu"  onclick="location.href='${path }/cart/complete.do'"><span class="event-sp">결제하기</span></button></span> 
        </div>


    </div>
 <script>
     // 약관동의 자세히보기
    $("#extendBtn1").click(function() {
        $("#contract1").slideToggle(500);
        $("#contract2").slideToggle(500);
        $("#contract3").slideToggle(500);
    })
    
    $("#extendBtn2").click(function() {
        $(".content1").slideToggle(500);
    })
    $("#extendBtn3").click(function() {
        $(".content2").slideToggle(500);
    })
    $("#extendBtn4").click(function() {
        $(".content3").slideToggle(500);
    })


    $(".checkdiv").click(e=>{//체크 박스 선택 체크 확인
        var ch=$(e.target).find("[type=checkbox]");
        var i1=$(e.target).find(".i1");
        var i2=$(e.target).find(".i2");
        if($(ch).prop("checked")==false){
            $(i1).css("color","white");
            $(i2).css("color","#0058a3");
            $(ch).prop("checked",true);
        }else if($(ch).prop("checked")==true){
            $(i1).css("color","#0058a3");
            $(i2).css("color","white");
            $(ch).prop("checked",false);
        }
    });


</script>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>