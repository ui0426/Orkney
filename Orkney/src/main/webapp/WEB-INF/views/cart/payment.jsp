<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>


<jsp:include page="/WEB-INF/views/common/header.jsp">      
   <jsp:param name="title" value="결제화면" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/cart/payment.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<section>  
    <div class="section-container">       
        
        <div class="section1">
            <div class="title-container">주문/결제</div>
            <div style="display: flex;justify-content: space-between;">
            	<div class="etc-title">주문상품</div>
            	<div class="mod-product"><button class="btn2" onclick="location.href='${path }/cart/cart.do'">주문상품 수정</button> </div>        
            
            </div>
            <div class="line1"></div>           
            
            <fmt:formatNumber value="${p.totalPrice}"/>&nbsp;
            
            <c:forEach items="${cart }" var="p">
            <div class="product-container">
	            <div class="order-container">
	                <div class="product-pic"><img src="${path}/resources/images/product/<c:out value="${p.product_pic}"/>"></div>               
	                <div class="product-detail">
	                    <div><c:out value="${p.productName}"/></div>
	                    <div><c:out value="${p.product_width}"/>*<c:out value="${p.product_height}"/>*<c:out value="${p.product_depth}"/></div>	                  		                    
	                    <div><c:out value="${p.cartQTY}"/>개</div>
	                </div>
	                 <div style="margin: 2.5em 7.5em; font-size: 18px;"><fmt:formatNumber value="${p.cartQTY * p.productPrice}"/>&nbsp;원</div>	                     	                    
	            </div>	            
            </div>  
            <div class="line3"></div>
             </c:forEach>  
                      
        </div>
        
        <div class="section1">            
            <div class="etc-title"><span>주문자</span></div>
            <div class="line1"></div>
            <div class="field">
                <span class="first-div">이름</span>
                <div class="padding-input"><input type="text" class="input1 input1-extra" id="membername" placeholder="<c:out value="${member.member_name}"/>" readonly> </div>
            </div>

            <div class="field">
                <span class="first-div">이메일</span>
                <div class="padding-input"><input type="text" class="input1 input1-extra" id="memberemail" placeholder="<c:out value="${member.member_id}"/>" readonly></div>
            </div>

            <div class="field">
                <span class="first-div">휴대전화</span>
                <div class="padding-input"><input type="text" class="input1 input1-extra" id="memberphone" placeholder="<c:out value="${member.phone}"/>" readonly></div>
            </div>            
            <!-- 기본주소 -->
            <c:forTokens items="${ login.address }" delims="/" var="add" varStatus="addStatus">
                     <c:if test="${ addStatus.first }">
                        <c:set var="orizip" value="${ add }"/>
                     </c:if>
                     <c:if test="${ !addStatus.first && !addStatus.last }">
                        <c:set var="post" value="${ add }"/>
                     </c:if>
                     <c:if test="${ addStatus.last }">
                        <c:set var="addrDetail" value="${ add }"/>
                     </c:if>
            </c:forTokens>            
            <div class="field">
            	<span class="first-div">주소</span>
            	<div>
	            	<input type="text" class="input1-extra" id="orizip" placeholder="<c:out value="${ orizip }"/>" readonly>
	            	<input type="text" class="input1-extra" id="post" placeholder="<c:out value="${ post }"/>" readonly>    
	            	<input type="text" class="input1-extra" id="addrDetail" placeholder="<c:out value="${ addrDetail }"/>" readonly>    
            	</div>   
            </div>                                                
        </div>
                      
        <div class="section1">
            <div class="etc-title">
                  <span>배송지</span>                                       
                  <button class="btn2" id="input-member">회원정보입력</button>
                  <button type="button" class="btn2" data-toggle="modal" data-target="#fullHeightModalRight">배송지조회 </button>
            </div>           
            <div class="line1"></div>      
            <div class="field">
                <span class="first-div">받는분</span>
                <div><input type="text" class="input1 none-line" id="copyname" name="reName"></div>
            </div>
            <div class="field">
                <span class="first-div">우편번호</span>
                <div><input type="text" class="input2 none-line" id="zip" disabled> </div>
                <div class="btn-container"><button class="btn1" id="adrbtn">우편번호</button></div>
            </div>
            <div class="field">
                <span class="first-div">주소</span>
                <div><input type="text" class="input3 none-line" id="adrinput" disabled></div>
            </div>         
            <div class="field"><div class="etc-div"><input type="text" class="input3  none-line" id="adrdetail"></div></div>                        
            <div class="field">
                <div class="first-div">휴대전화</div>
                <div><input type="text" class="input1 none-line" id="copyphone"></div>
            </div> 
             <div class="field">
                <div class="first-div">배송메모</div>                	
                <div class="input-vertical">                
                	<input type="text" class="input3 none-line" id="message-input" autocomplete="off">
                	<div class="messages" id="messages" style="display: none;">
                		<div class="preset" id="preset1">배송 전에 미리 연락 바랍니다.</div>
                		<div class="preset" id="preset2">부재시 경비실에 맡겨주세요.</div>
                		<div class="preset" id="preset3">부재시 전화 주시거나 문자 남겨 주세요.</div>
                	</div>                	
                </div>
            </div>                 
        </div>
                               
	<div id="detail"></div>      
	                  
       <div class="section1" style=" display: flex; flex-direction: column;" >
       		<div style="display: flex;">            
	            <div class="etc-title">예상 적립 포인트</div>                      
	            <span class="field span-padding">
	            	<div class="pre-point"> 
	            	<c:out value="${member.predicpoint }"/>	P</div>
	            </span>
	         </div>                    	
            <div>총 주문 금액의 5%가 적립됩니다.<a href="${path}/notice/question.do">더알아보기</a></div>            
            <input type="hidden" id="point" value="${member.predicpoint }">
        </div>
        <div class="section1">
            <div class="etc-title">결제 수단</div>
            <div class="line1"></div> 
            <div class="field">                                
                <div class="payment_panel">
                	<input type="radio" name="options" id="option1" autocomplete="off"  autocompleted style="display: none" value="card" >
                	<label class="pay-label" for="option1">
                		<img alt="" src="${path}/resources/img/credit-card.png">
                		<div class="payment-title">신용카드</div>
                	</label>                	                           	
                	<input type="radio" name="options" id="option2" autocomplete="off" autocompleted style="display: none"  value="bankTransfer">
                	<label class="pay-label" for="option2">
                		<img alt="" src="${path}/resources/img/money.png">
                		<div class="payment-title">무통장</div>
                	</label>                	
                </div>                                 
            </div>                                         
        </div>         
      <div class="section1">        
        <div class="field field-add">
            <div class="checkdiv">  
                <div class="checkicon" stlye="width:172px;">
                    <span><i class="far fa-check-circle fa-2x ixy i1"></i></span>
                    <span><i class="fas fa-check-circle fa-2x ixy i2"></i></span>
                    <input type="checkbox" class="ck" id="ch">
                </div>
                <span class="spanwid">결제 진행 필수사항 동의</span>
            </div>
       </div>
            <div class="contract contract-add">
                <div>개인정보 제 3자 제공 및 결제대행 서비스 표준 이용약관</div>                
                <div><button id="extendBtn1">보기</button></div>
            </div>
            <div class="line1"></div>             
            <div id="contract1" style="display:none;">
                <div class="contract1 contract-add">
                    <div>개인정보 제 3자 제공</div>                
                    <div><button id="extendBtn2">열기</button></div>                
                </div>
                <div class="content1">
                      <table>
                      	<tr>
	                      	<th style="width:10%;">제공 받는자</th>
	                      	<th>제공목적</th>
	                      	<th style="width:36%;">항목</th>  
	                      	<th style="width:15%;">보유 및 이용 기간</th>                      	
                      	</tr>
						<tr>
	                      	<td>Orkney</td>
	                      	<td>상품 및 경품(서비스) 배송(전송), 제품 설치, 반품, 환불, 고객상담 등 정보통신서비스제공계약 및 전자상거래(통신판매)계약의 이행을 위해 필요한 업무의 처리</td>
	                      	<td>
1) 구매자정보(닉네임, 성명, 휴대폰번호, 이메일주소) <br>
2) 수령인정보(성명, 휴대폰번호, 주소)<br>
3) 상품 구매, 취소, 반품, 교환정보<br>
4) 송장정보</td>             
<td>상품 제공 완료 후 3개월 </td>         	
                      	</tr>          
                      </table>      
                </div>
            </div>            
            <div id="contract2" style="display:none;">
                <div class="contract1 contract-add">
                    <div>개인정보 수집 및 이용</div>                
                    <div><button id="extendBtn3">열기</button></div>                
                </div>                
                 <div class="content2">
                 <table>
                   <tr>
	                   	<th style="width:10%;">수집방법 </th>
	                   	<th style="width:36%;">수집항목 </th>
	                   	<th>목적 </th>
	                   	<th style="width:15%;">보유 및 이용 기간 </th>
                   </tr>
                   <tr>
	                   <td>상품구매</td>
	                   <td>1) 구매자 정보(성명, 휴대전화 번호) <br>
							2) 수령인 정보(성명, 휴대전화 번호, 주소)</td>
	                   <td>상품 배송 및 서비스 제공을 위한 사용자 정보 확인</td>
	                   <td rowspan="4">상품 제공 완료 후 3개월 </td>
                   </tr>
                   <tr>
                   		<td>결제 </td>
                   		<td>신용카드 정보 </td>
                   		<td>간편 결제 서비스 제공 </td>
                    </tr>
                    <tr>
	                    <td>취소/환불 </td>
	                    <td>환불 계좌번호,은행명,예금주명 </td>
	                    <td>결제 서비스 환불 </td>
                     </tr>
                     <tr>
                     	<td>이메일 인증 </td>
                     	<td>이메일 </td>
                     	<td>상품 구매 내역 발송 </td>
                     </tr>
                   
                 </table>                                                                                                                                                                    
                 </div>
            </div>
            <div id="contract3" style="display:none;">
                <div class="contract1 contract-add">
                    <div>결제대행 서비스 이용약관</div>                
                    <div><button id="extendBtn4">열기</button></div>                
                </div>                
                            <div class="content3">
000 전자지급결제대행서비스

제1조 (목적)
이 약관은 000 주식회사(이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스 및 결제대금예치서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.

제2조 (용어의 정의)
이 약관에서 정하는 용어의 정의는 다음과 같습니다.

'전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
'전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
'결제대금예치서비스'라 함은 이용자가 재화의 구입 또는 용역의 이용에 있어서 그 대가(이하 '결제대금'이라 한다)의 전부 또는 일부를 재화 또는 용역(이하 '재화 등'이라 합니다)을 공급받기 전에 미리 지급하는 경우, 회사가 이용자의 물품수령 또는 서비스 이용 확인 시점까지 결제대금을 예치하는 서비스를 말합니다.
'이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.
'접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
'거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.
'오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.
제3조 (약관의 명시 및 변경)
회사는 이용자가 전자금융거래 서비스를 이용하기 전에 이 약관을 게시하고 이용자가 이 약관의 중요한 내용을 확인할 수 있도록 합니다.
회사는 이용자의 요청이 있는 경우 전자문서의 전송방식에 의하여 본 약관의 사본을 이용자에게 교부합니다.
회사가 약관을 변경하는 때에는 그 시행일 1월 전에 변경되는 약관을 회사가 제공하는 전자금융거래 서비스 이용 초기화면 및 회사의 홈페이지에 게시함으로써 이용자에게 공지합니다.
회사는 제3항의 공지를 할 경우 "이용자가 변경에 따라 변경에 동의하지 아니한 경우 공지 받은 날로부터 30일 이내에 계약을 해지할 수 있으며, 해지의사표시를 하지 아니한 경우 동의한 것으로 본다."라는 내용을 통지합니다.
제4조 (전자지급결제대행서비스의 종류)
회사가 제공하는 전자지급결제대행서비스는 지급결제수단에 따라 다음과 같이 구별됩니다.

신용카드결제대행서비스: 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 신용카드인 경우로서, 회사가 전자결제시스템을 통하여 신용카드 지불정보를 송, 수신하고 결제대금의 정산을 대행하거나 매개하는 서비스를 말합니다.
계좌이체대행서비스: 이용자가 결제대금을 회사의 전자결제시스템을 통하여 금융기관에 등록한 자신의 계좌에서 출금하여 원하는 계좌로 이체할 수 있는 실시간 송금 서비스를 말합니다.
가상계좌서비스: 이용자가 결제대금을 현금으로 결제하고자 경우 회사의 전자결제시스템을 통하여 자동으로 이용자만의 고유한 일회용 계좌의 발급을 통하여 결제대금의 지급이 이루어지는 서비스를 말합니다.
출금이체서비스 : 이용자가 결제대금의 지급을 위하여 제공한 지급결제수단이 계좌간편결제인 경우로서, 정보를 매번 입력할 필요 없이 관련 정보의 한번 등록만으로 상품 결제가 가능한 서비스를 말합니다. 단, 출금이체 신청 시 회사가 정하는 이용자의 본인확인 절차가 반드시 필요하며, 회사의 인증 및 승낙이 있어야 서비스를 이용할 수 있습니다.
기타: 회사가 제공하는 서비스로서 지급결제수단의 종류에 따라 '휴대폰 결제대행서비스', '상품권결제대행서비스', 등이 있습니다.
제5조 (결제대금예치서비스의 내용)
이용자(이용자의 동의가 있는 경우에는 재화 등을 공급받을 자를 포함합니다. 이하 본 조에서 같습니다)는 재화 등을 공급받은 사실을 재화 등을 공급받은 날부터 3영업일 이내에 회사에 통보하여야 합니다.
회사는 이용자로부터 재화 등을 공급받은 사실을 통보 받은 후 회사와 통신판매업자간 사이에서 정한 기일 내에 통신판매업자에게 결제대금을 지급합니다.
회사는 이용자가 재화 등을 공급받은 날부터 3영업일이 지나도록 정당한 사유의 제시 없이 그 공급받은 사실을 회사에 통보하지 아니하는 경우에는 이용자의 동의 없이 통신판매업자에게 결제대금을 지급할 수 있습니다.
회사는 통신판매업자에게 결제대금을 지급하기 전에 이용자에게 결제대금을 환급 받을 사유가 발생한 경우에는 그 결제대금을 소비자에게 환급합니다.
회사는 이용자와의 결제대금예치서비스 이용과 관련된 구체적인 권리, 의무를 정하기 위하여 본 약관과는 별도로 결제대금예치서비스이용약관을 제정할 수 있습니다.
제6조 (이용시간)
회사는 이용자에게 연중무휴 1일 24시간 전자금융거래 서비스를 제공함을 원칙으로 합니다. 단, 금융기관 기타 결제수단 발행업자의 사정에 따라 달리 정할 수 있습니다. 출금이체서비스는 은행사의 사정에 따라 “00:30~ 23:30” 까지 전자금융거래 서비스를 제공함을 원칙으로 합니다.
회사는 정보통신설비의 보수, 점검 기타 기술상의 필요나 금융기관 기타 결제수단 발행업자의 사정에 의하여 서비스 중단이 불가피한 경우, 서비스 중단 3일 전까지 게시 가능한 전자적 수단을 통하여 서비스 중단 사실을 게시한 후 서비스를 일시 중단할 수 있습니다. 다만, 시스템 장애복구, 긴급한 프로그램 보수, 외부요인 등 불가피한 경우에는 사전 게시 없이 서비스를 중단할 수 있습니다.
제7조 (접근매체의 선정과 사용 및 관리)
회사는 전자금융거래 서비스 제공 시 접근매체를 선정하여 이용자의 신원, 권한 및 거래지시의 내용 등을 확인할 수 있습니다.
이용자는 접근매체를 제3자에게 대여하거나 사용을 위임하거나 양도 또는 담보 목적으로 제공할 수 없습니다.
이용자는 자신의 접근매체를 제3자에게 누설 또는 노출하거나 방치하여서는 안되며, 접근매체의 도용이나 위조 또는 변조를 방지하기 위하여 충분한 주의를 기울여야 합니다.
회사는 이용자로부터 접근매체의 분실이나 도난 등의 통지를 받은 때에는 그 때부터 제3자가 그 접근매체를 사용함으로 인하여 이용자에게 발생한 손해를 배상할 책임이 있습니다.
제8조 (거래내용의 확인)
회사는 이용자와 미리 약정한 전자적 방법을 통하여 이용자의 거래내용(이용자의 '오류정정 요구사실 및 처리결과에 관한 사항'을 포함합니다)을 확인할 수 있도록 하며, 이용자의 요청이 있는 경우에는 요청을 받은 날로부터 2주 이내에 모사전송 등의 방법으로 거래내용에 관한 서면을 교부합니다.
회사가 이용자에게 제공하는 거래내용 중 거래계좌의 명칭 또는 번호, 거래의 종류 및 금액, 거래상대방을 나타내는 정보, 거래일자, 전자적 장치의 종류 및 전자적 장치를 식별할 수 있는 정보와 해당 전자금융거래와 관련한 전자적 장치의 접속기록은 5년간, 건당 거래금액이 1만원 이하인 소액 전자금융거래에 관한 기록, 전자지급수단 이용 시 거래승인에 관한 기록, 이용자의 오류정정 요구사실 및 처리결과에 관한 사항은 1년간의 기간을 대상으로 하되, 회사가 전자지급결제대행 서비스 제공의 대가로 수취한 수수료에 관한 사항은 제공하는 거래내용에서 제외됩니다.
이용자가 제1항에서 정한 서면교부를 요청하고자 할 경우 다음의 주소 및 전화번호로 요청할 수 있습니다.
주소: 00시 00구 
이메일 주소: 0000@naver.com
전화번호: 0000-0000 
FAX: 00-000-000
제9조 (오류의 정정 등)
이용자는 전자금융거래 서비스를 이용함에 있어 오류가 있음을 안 때에는 회사에 대하여 그 정정을 요구할 수 있습니다.
회사는 전항의 규정에 따른 오류의 정정요구를 받은 때에는 이를 즉시 조사하여 처리한 후 정정요구를 받은 날부터 2주 이내에 그 결과를 이용자에게 알려 드립니다.
제10조 (회사의 책임)
회사는 접근매체의 위조나 변조로 발생한 사고로 인하여 이용자에게 발생한 손해에 대하여 배상책임이 있습니다. 다만 이용자가 제7조 제2항에 위반하거나 제3자가 권한 없이 이용자의 접근매체를 이용하여 전자금융거래를 할 수 있음을 알았거나 알 수 있었음에도 불구하고 이용자가 자신의 접근매체를 누설 또는 노출하거나 방치한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
회사는 계약체결 또는 거래지시의 전자적 전송이나 처리과정에서 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다. 다만 본 조 제1항 단서에 해당하거나 법인('중소기업기본법' 제2조 제2항에 의한 소기업을 제외합니다)인 이용자에게 손해가 발생한 경우로서 회사가 사고를 방지하기 위하여 보안절차를 수립하고 이를 철저히 준수하는 등 합리적으로 요구되는 충분한 주의의무를 다한 경우 그 책임의 전부 또는 일부를 이용자가 부담하게 할 수 있습니다.
회사는 전자금융거래를 위한 전자적 장치 또는 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 제2조제1항제1호에 따른 정보통신망에 침입하여 거짓이나 그 밖의 부정한 방법으로 획득한 접근매체의 이용으로 발생한 사고로 인하여 이용자에게 그 손해가 발생한 경우에는 그 손해를 배상할 책임이 있습니다.
제11조 (전자지급거래계약의 효력)
회사는 이용자의 거래지시가 전자지급거래에 관한 경우 그 지급절차를 대행하며, 전자지급거래에 관한 거래지시의 내용을 전송하여 지급이 이루어지도록 합니다.
회사는 이용자의 전자지급거래에 관한 거래지시에 따라 지급거래가 이루어지지 않은 경우 수령한 자금을 이용자에게 반환하여야 합니다.
제12조 (거래지시의 철회)
이용자는 전자지급거래에 관한 거래지시의 경우 지급의 효력이 발생하기 전까지 거래지시를 철회할 수 있습니다.
전항의 지급의 효력이 발생 시점이란 (i) 전자자금이체의 경우에는 거래 지시된 금액의 정보에 대하여 수취인의 계좌가 개설되어 있는 금융기관의 계좌 원장에 입금기록이 끝난 때 (ii) 그 밖의 전자지급수단으로 지급하는 경우에는 거래 지시된 금액의 정보가 수취인의 계좌가 개설되어 있는 금융기관의 전자적 장치에 입력이 끝난 때를 말합니다.
이용자는 지급의 효력이 발생한 경우에는 전자상거래 등에서의 소비자보호에 관한 법률 등 관련 법령상 청약의 철회의 방법 또는 본 약관 제5조에서 정한 바에 따라 결제대금을 반환 받을 수 있습니다.
제13조 (전자지급결제대행 서비스 이용 기록의 생성 및 보존)
회사는 이용자가 전자금융거래의 내용을 추적, 검색하거나 그 내용에 오류가 발생한 경우에 이를 확인하거나 정정할 수 있는 기록을 생성하여 보존합니다.
전항의 규정에 따라 회사가 보존하여야 하는 기록의 종류 및 보존방법은 제8조 제2항에서 정한 바에 따릅니다.
제14조 (전자금융거래정보의 제공금지)
회사는 전자금융거래 서비스를 제공함에 있어서 취득한 이용자의 인적 사항, 이용자의 계좌, 접근매체 및 전자금융거래의 내용과 실적에 관한 정보 또는 자료를 이용자의 동의를 얻지 아니하고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 아니합니다.

제15조 (분쟁처리 및 분쟁조정)
이용자는 다음의 분쟁처리 책임자 및 담당자에 대하여 전자금융거래 서비스 이용과 관련한 의견 및 불만의 제기, 손해배상의 청구 등의 분쟁처리를 요구할 수 있습니다.
담당자: 배진호
연락처(전화번호, 전자우편주소): 00-0000-0000 / 0000@naver.com
이용자가 회사에 대하여 분쟁처리를 신청한 경우에는 회사는 15일 이내에 이에 대한 조사 또는 처리 결과를 이용자에게 안내합니다.
이용자는 '금융위원회의 설치 등에 관한 법률' 제51조의 규정에 따른 금융감독원의 금융분쟁조정위원회나 '소비자기본법' 제33조 제1항의 규정에 따른 소비자보호원에 회사의 전자금융거래 서비스의 이용과 관련한 분쟁조정을 신청할 수 있습니다.
제16조 (회사의 안정성 확보 의무)
회사는 전자금융거래의 안전성과 신뢰성을 확보할 수 있도록 전자금융거래의 종류별로 전자적 전송이나 처리를 위한 인력, 시설, 전자적 장치 등의 정보기술부문 및 전자금융업무에 관하여 금융위원회가 정하는 기준을 준수합니다.

제17조 (약관 외 준칙 및 관할)
이 약관에서 정하지 아니한 사항에 대하여는 전자금융거래법, 전자상거래 등에서의 소비자 보호에 관한 법률, 통신판매에 관한 법률, 여신전문금융업법 등 소비자보호 관련 법령에서 정한 바에 따릅니다.
회사와 이용자간에 발생한 분쟁에 관한 관할은 민사소송법에서 정한 바에 따릅니다.            
                            </div> 
            </div>
        </div>
        <span class="pay-btn"> <button type="button" class="btn btn-dark event-bu" id="paybtn"><span class="event-sp">결제하기</span></button></span> 
    </div>
        
<div class="request_pay"></div>          
    
<!-- Full Height Modal Right -->
<div class="modal fade right" id="fullHeightModalRight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">

  <!-- Add class .modal-full-height and then add class .modal-right (or other classes from list above) to set a position to the modal -->
  <div class="modal-dialog modal-full-height modal-right" role="document">


    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title w-100" id="myModalLabel">배송지 조회</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">        
        <c:if test="${ addrList.size() == 0 }">
                     <div>저장된 주소가 없습니다. 편리한 쇼핑을 위해 주소를 입력해주세요.</div>
        </c:if>      
      	<c:if test="${ addrList.size() != 0 }">
      	    <c:forEach var="addr" items="${ addrList }" varStatus="status">	      		
		      	<div class="addrDiv">		      			 
		      			 <div>
			      			 <input type="text" class="addName" value="<c:out value="${ addr.address_name}"/>" readonly> 
			      			 <input type="button" class="chbt" id="${ addr.address_phone }" value="선택">      		 
			      			 <input type="hidden" value="${ addr.address_addr }" class="${ addr.address_detail }" id="${ addr.address_post }">
		      			 </div>		      			 
		      			 <div class="add-container">
			      			 <div><c:out value="${ addr.address_addr }"/> </div>
			      		     <div><c:out value="${ addr.address_detail }"/></div>
			      		     <div><c:out value="${ addr.address_post }"/></div> 			      		      
		      					<div><c:out value="${ addr.address_phone }"/></div>
		      			</div>		      			
		      	</div>		      				      			 		      		      			      				      				
      			 <div class="line1"></div>      			 	      			      				
      		 </c:forEach>
        </c:if>            
      </div>      
      <div class="modal-footer justify-content-center">
        <button type="button" class="btn btn-secondary1" data-dismiss="modal">Close</button>        
      </div>
    </div>
  </div>
</div>
<!-- Full Height Modal Right -->  
</section>


<script>
//1. 회원정보 입력
$("#input-member").click(e=>{
	let name=$("#membername").attr("placeholder");
	let email=$("#memberemail").attr("placeholder");
	let phone=$("#memberphone").attr("placeholder");
		
	let post=$("#post").attr("placeholder");
	let addrDetail=$("#addrDetail").attr("placeholder");
	let zip=$("#orizip").attr("placeholder");
			
	$("#copyname").attr({"value":name});        	        	
	$("#copyphone").attr({"value":phone});   
	
	$("#zip").attr({"value":zip});
	$("#adrinput").attr({"value":post});
	$("#adrdetail").attr({"value":addrDetail});
	
});
//2. 배송메모
$("#message-input").click(e=>{
    $(".messages").show();   
    $("#preset1").click(e=>{
        $("#message-input").attr({
        	"value":"배송 전에 미리 연락 바랍니다."
        });                                
    		  $(".messages").hide();              
    });    
    $("#preset2").click(e=>{
        $("#message-input").attr({
        	"value":"부재시 경비실에 맡겨주세요."
        });            
              $(".messages").hide();              
    });
    $("#preset3").click(e=>{
        $("#message-input").attr({
        	"value":"부재시 전화 주시거나 문자 남겨 주세요."
        });    
             $(".messages").hide();      
    });
    console.log("나와라");
});



  
             


//3. 포인트 사용시 결제금액 변경
$(function(){	
	$.ajax({		
		url:"${path}/cart/updatePayment.do",				
		success:data =>{					
			$("#detail").html(data);
		}
	})
})


//4. 정규표현식
$("#paybtn").click(e=>{
if($(".ck").is(":checked")==false){
	alert("약관에 동의해 주세요");
	return false;
} 	

	let regName = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	let regPhone=/^[01]{1}[1]{1}[0]{1}-[0-9]{4}-[0-9]{4}/g;
		
	let phone = $("#copyphone").val(); //받는사람  핸드폰
	let name = $("#copyname").val();   //받는사람 이름	
	
	if(phone.length==0){
		alert("휴대전화 번호를 입력해주세요");
		return false;
	}else if(phone.length>0 && !regPhone.test(phone)){
		alert("휴대전화 번호가 올바르지 않습니다.");
		return false;
	}	
	
	if (!regName.test(name)) {
        alert("이름을 입력해주세요");
        return false;
    }
    if($("#zip").val().length==0||$("#adrinput").val().length==0){
        alert("주소를 입력해주세요");
        return false;
     }

//5. 결제 API
    let email=$("#memberemail").attr("placeholder");
	let payment=$("input[name=options]:checked").val(); //결제방법    										
	let address = $("#zip").val()+"/" + $("#adrinput").val()+"/"+$("#adrdetail").val();  
	let message = $("#message-input").val();		
	let totalFee = parseInt( $("#total").val()); //총금액	
	let sumProduct = parseInt( $("#fee").val());				 //상품총
	let shipFee = parseInt( $("#fee").attr("class"));			//배송비	
	let willPoint = parseInt($("#total").attr("name"));		//사용할 point
	let predicPoint = parseInt($("#point").val());		//적립 point	
	let addTax = parseInt( $("#total").attr("class"));				//부가세		
	let totalPoint = parseInt($("#pointuse").val());			
	
	
	if(payment==null){
		alert("결제수단을 선택하세요");
		return false;
	}
	if(payment=="card"){		
		IMP.init('imp27633438');
		IMP.request_pay({
		    pg : 'html5_inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    //amount : totalFee, //판매 가격
		    amount : 100,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        let paymentMethod="카드결제";
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;	
		        
		        $.ajax({
		        	url:"${path}/cart/complete.do",
		        	data:{rePhone:phone,reName:name,totalFee:totalFee,reAddress:address,message:message,kopQty:${kopQty},paymentMethod:paymentMethod,willPoint:willPoint,predicPoint:predicPoint
		        		,addTax:addTax,totalPoint:totalPoint,sumProduct:sumProduct,shipFee:shipFee,email:email},		        	 
		        	type:"post",
		        	datatype:"json",
		        	success:data=>{ 		        		
		        		location.replace("${path}/cart/completeMail.do");		        		
		        	}
		        })		       		        
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});		
	}else if(payment=="bankTransfer"){}

});

//6. Modal 저장된 주소 가져오기
$(".chbt").click(e=>{
	let adnm = $(e.target).prev().val(); //이름
	let adad = $(e.target).next().val(); //주소
	let addt = $(e.target).next().attr("class");//주소 detail
	let adpo = $(e.target).next().attr("id"); //주소번호
	let adtl = $(e.target).attr("id"); //전화번호

	
	$("#copyname").attr({"value":adnm});        	            	
	$("#copyphone").attr({"value":adtl}); 
	
	$("#adrinput").attr({"value":adad});
	$("#zip").attr({"value":adpo});
	$("#adrdetail").attr({"value":addt});        		            	            	
})


//7. 주소검색 API 
$("#adrbtn").click(e=>{
	new daum.Postcode({
		oncomplete: function(data) {
			var addr =''; //주소변수
			var extraAddr =''; //참고변수
			var test=data.postcode;
			console.log(test);
			console.log(data.zonecode);
			
		//사용자가 선택한 주소 타입 도로명
		if(data.userSelectedType ==='R'){
				addr =  data.roadAddress;    			
		}else{
			addr = data.jibunAddress;
		}
		
		//사용자가 선택한 주소가 도로명 일때
		if(data.userSelectedType === 'R'){
			//법정동명
			if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				extraAddr +=data.bname;
			}
			//건물명, 공동주택
			if(data.buildingName !== '' && data.apartment ==='Y'){
				extraAddr += (extraAddr !== '' ? ',' + data.buildingName : data.buildingName);					
			}
			//표시할 참고항목이 있을시
			if(extraAddr !== ''){
				extraAddr = '(' + extraAddr + ')';
			}								
		}else{}
		console.log(data.zonecode+" : "+addr);
        
		$("#zip").val(data.zonecode);
        $("#adrinput").val(addr);
        $("#zip").attr("disabled",false);
        $("#adrinput").attr("disabled",false);
        $("#zip").attr("readonly",true);
        $("#adrinput").attr("readonly",true);
        // 커서를 상세주소 필드로 이동
        $("#detailadr").focus();
        console.log(data.zonecode+" : "+addr+" : "+extraAddr);			    	
	}
	}).open();
})

//8. 약관동의 자세히보기
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

    $(".checkdiv").click(e=>{
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



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>