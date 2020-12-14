<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>


<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-x.y.z.js"></script>
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
	                <div class="product-pic"><img src="${path}/resources/images/rooms/<c:out value="${p.product_pic}"/>"></div>               
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
            	<div class="padding-input"><input type="text" class="input1 input1-extra" id="post" placeholder="<c:out value="${ post }"/>" readonly></div>    
            	<div class="padding-input"><input type="text" class="input1 input1-extra" id="addrDetail" placeholder="<c:out value="${ addrDetail }"/>" readonly></div>    
            	<div class="padding-input"><input type="text" class="input1 input1-extra" id="orizip" placeholder="<c:out value="${ orizip }"/>" readonly></div>    
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
    <!--    <div class="field">
                <span class="first-div">이메일</span>
                <div><input type="text" class="input1 none-line" id="copyemail" ></div>
            </div>      --> 							
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
 
       <!-- 회원정보입력 -->
       <script>
        $("#input-member").click(e=>{
        	let name=$("#membername").attr("placeholder");
        	let email=$("#memberemail").attr("placeholder");
        	let phone=$("#memberphone").attr("placeholder");
        	
        	/* 주소 */
        	let post=$("#post").attr("placeholder");
        	let addrDetail=$("#addrDetail").attr("placeholder");
        	let zip=$("#orizip").attr("placeholder");
        	
        		
        	$("#copyname").attr({"value":name});        	        	
        	$("#copyphone").attr({"value":phone});   
        	
        	$("#zip").attr({"value":zip});
        	$("#adrinput").attr({"value":post});
        	$("#adrdetail").attr({"value":addrDetail});
        	
        });
        </script>
        
        <!-- 배송메모 -->          
        <script>       
            $("#message-input").click(e=>{
                $(".messages").show();            
            });   
      /*       $("#message-input").blur(e=>{
                $(".messages").css("display","none");            
            });   */                         
            $("#preset1").click(e=>{
                $("#message-input").attr({
                	"value":"배송 전에 미리 연락 바랍니다."
                });                                
            		$("#messages").hide();            
            });
            $("#preset2").click(e=>{
                $("#message-input").attr({
                	"value":"부재시 경비실에 맡겨주세요."
                });            
                    $("#messages").hide();            
            });
            $("#preset3").click(e=>{
                $("#message-input").attr({
                	"value":"부재시 전화 주시거나 문자 남겨 주세요."
                });    
                    $("#messages").hide();    
            });
            </script>            
                     
        </div>
                       
                 
        
<div id="detail"></div>
<script>
$(function(){	
	$.ajax({		
		url:"${path}/cart/updatePayment.do",				
		success:data =>{					
			$("#detail").html(data);
		}
	})
})

        	
</script>           
        
                
       <div class="section1" style=" display: flex; flex-direction: column;" >
       		<div style="display: flex;">            
	            <div class="etc-title">예상 적립 포인트</div>                      
	            <span class="field span-padding">
	            	<div class="pre-point"> 
	            	<c:out value="${member.predicpoint }"/>	P</div>
	            </span>
	         </div>                    	
            <div>총 주문 금액의 5%가 적립됩니다.<a href="">더알아보기</a></div>
            
            <input type="hidden" id="point" value="${member.predicpoint }">
        </div>

        <div class="section1">
            <div class="etc-title">결제 수단</div>
            <div class="line1"></div> 
            <div class="field">                                
                <div class="payment_panel">
                	<input type="radio" name="options" id="option1" autocomplete="off" checked autocompleted style="display: none" value="card" >
                	<label class="pay-label" for="option1">
                		<img alt="" src="${path}/resources/img/credit-card.png">
                		<div class="payment-title">신용카드</div>
                	</label>                	                           	
                	<input type="radio" name="options" id="option2" autocomplete="off" checked autocompleted style="display: none"  value="bankTransfer">
                	<label class="pay-label" for="option2">
                		<img alt="" src="${path}/resources/img/money.png" alt="">
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
                                    개인정보 수집 및 이용 동의                
                                    1. 수집항목 : [필수] 이름, 연락처, 이메일주소, 인원정보
                                    2. 수집 및 이용목적 : 사업자회원과 예약이용자의 원활한 거래 진행, 고객상담, 불만처리 등 민원 처리, 분쟁조정 해결을 위한 기록보존, 스테이폴리오 멤버십 및 프로모션, 이벤트 안내
                                    3. 보관기간 : 회원탈퇴 등 개인정보 이용목적 달성 시까지 보관. 단, 상법 및 ‘전자상거래 등에서의 소비자 보호에 관한 법률’ 등 관련 법령에 의하여 일정 기간 보관이 필요한 경우에는 해당 기간 동안 보관함
                                    4. 동의 거부권 등에 대한 고지 : 정보주체는 개인정보의 수집 및 이용 동의를 거부할 권리가 있으나, 이 경우 상품 및 서비스 예약이 제한될 수 있습니다.                                                                                                    
                </div>
            </div>
            

            <div id="contract2" style="display:none;">
                <div class="contract1 contract-add">
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
                <div class="contract1 contract-add">
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
        </div>
            <button type="button" class="btn btn-dark event-bu" id="paybtn"><span class="event-sp">결제하기</span></button> 
    </div>


        
<div class="request_pay"></div>
        
        
<script>
$("#paybtn").click(e=>{

/* if($(".ck").is(":checked")==false){
	alert("약관에 동의해 주세요");
	return false;
} 
	
	
	let regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	let regName = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	let regPhone =/^\d{2,3}-\d{3,4}-\d{4}$/;
	
	let email = document.getElementById("copyemail");
	let phone = document.getElementById("copyphone");
	let name = document.getElementById("copyname");
	
	if (!regEmail.test(email.value)) {
        alert("이메일을 입력해주세요");
        return false;
    }
	if (!regPhone.test(phone.value)) {
        alert("핸드폰번호를 입력해주세요");
        return false;
    }
	if (!regName.test(name.value)) {
        alert("이름을 입력해주세요");
        return false;
    } */
	
    
	//let email = $("#copyemail").val(); //받는사람 이메일
    
	let payment=$("input[name=options]:checked").val(); //결제방법    			
	let phone = $("#copyphone").val(); //받는사람  핸드폰
	let name = $("#copyname").val();   //받는사람 이름							
	let address = $("#zip").val()+"/" + $("#adrinput").val()+"/"+$("#adrdetail").val();  
	let message = $("#message-input").val();		
	let totalFee = parseInt( $("#total").val()); //총금액	
	let sumProduct = parseInt( $("#fee").val());				 //상품총
	let shipFee = parseInt( $("#fee").attr("class"));			//배송비	
	let willPoint = parseInt($("#total").attr("name"));		//사용할 point
	let predicPoint = parseInt($("#point").val());		//적립 point	
	let addTax = parseInt( $("#total").attr("class"));				//부가세		
	let totalPoint = parseInt($("#pointuse").val());			
	
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
		        		,addTax:addTax,totalPoint:totalPoint,sumProduct:sumProduct,shipFee:shipFee},		        	 
		        	type:"post",
		        	datatype:"json",
		        	success:data=>{ 		        		
		        		location.replace("${path}/cart/completeEnd.do");		        		
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

</script> 
    
    
    
    
    
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
		      	<div class="addrDiv" style="border: 1px solid;">		      			 
		      			 <div>
			      			 <input type="text" value="<c:out value="${ addr.address_name }"/>" readonly> 
			      			 <input type="button" class="chbt" id="${ addr.address_phone }" value="선택">      		 
			      			 <input type="hidden" value="${ addr.address_addr }" class="${ addr.address_detail }" id="${ addr.address_post }">
		      			 </div>
		      			 
		      			 <div>
			      			 <div><c:out value="${ addr.address_addr }"/> </div>
			      		     <div><c:out value="${ addr.address_detail }"/></div>
			      		     <div><c:out value="${ addr.address_post }"/></div> 			      		      
		      			</div>
		      			
		      			<div><c:out value="${ addr.address_phone }"/></div>
		      	</div>		      				      			 		      		      			      				      				
      			 <div class="line1"></div>
      			 	      			      				
      		 </c:forEach>
        </c:if>
        
        <script>
        	$(".chbt").click(e=>{
        		let adnm = $(e.target).prev().val(); //이름
        		let adad = $(e.target).next().val(); //주소번호
        		let addt = $(e.target).next().attr("class");//주소 detail
        		let adpo = $(e.target).next().attr("id"); //주소
        		let adtl = $(e.target).attr("id"); //전화번호
        		console.log(adnm);
        		console.log(adad);
        		console.log(addt);
        		console.log(adpo);
        		console.log(adtl);
        		
            	$("#copyname").attr({"value":adnm});        	            	
            	$("#copyphone").attr({"value":adtl}); 
        		
            	$("#zip").attr({"value":adad});
            	$("#adrinput").attr({"value":adpo});
            	$("#adrdetail").attr({"value":addt});
        		
            	
            	
        	})
        </script>
        
        
        
      
      </div>
      
      <div class="modal-footer justify-content-center">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
      </div>
    </div>
  </div>
</div>
<!-- Full Height Modal Right -->
    
    
</section>

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
<script>
/* 주소검색api */ 
$("#adrbtn").click(e=>{
	new daum.Postcode({
		oncomplete: function(data) {
			var addr =''; //주소변수
			var extraAddr =''; //참고변수
			var test=data.postcode;
			console.log(test);
			console.log(data.zonecode);
			
		//사용자가 선택한 주소 타입
		//도로명
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
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>