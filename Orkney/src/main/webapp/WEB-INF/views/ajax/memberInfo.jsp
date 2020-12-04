<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<link rel="stylesheet" href="${path}/resources/css/cart/payment.css">


<div class="section1">
            <div class="etc-title">
                  <span>배송지</span>                                       
                  <button class="btn2" onclick="location.href='${path}/member/selectInfo.do'">회원정보입력</button>
                  <button type="button" class="btn2" data-toggle="modal" data-target="#fullHeightModalRight">배송지조회 </button>
            </div>           

            <div class="line1"></div>
            <div class="field">
                <span class="first-div">받는분</span>
                <div><input type="text" class="input1 none-line"></div>
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
            
            <div class="field"><div class="etc-div"><input type="text" class="input3  none-line"></div></div>            
            <div class="field">
                <div class="first-div">휴대전화</div>
                <div><input type="text" class="input1 none-line"></div>
            </div>

            <div class="field">
                <div class="first-div">배송메모</div>                	
                <div class="input-vertical">
                	<input type="text" class="input3 none-line" id="message-input">
                	<div class="messages" id="messages" style="display: none;">
                		<div class="preset" id="preset1">배송 전에 미리 연락 바랍니다.</div>
                		<div class="preset" id="preset2">부재시 경비실에 맡겨주세요.</div>
                		<div class="preset" id="preset3">부재시 전화 주시거나 문자 남겨 주세요.</div>
                	</div>
                </div>
            </div>
            
            <script>       
            $("#message-input").click(e=>{
                $(".messages").show();            
            });    
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
            
             <div class="field">
                <div class="checkdiv  marb">  
                    <div class="checkicon" stlye="width:172px;">
                        <span><i class="far fa-check-circle fa-2x ixy i1"></i></span>
                        <span><i class="fas fa-check-circle fa-2x ixy i2"></i></span>
                        <input type="checkbox" class="ck" id="ch">
                    </div>
                    <span class="spanwid marb">sms 수신 동의 (배송 정보를 SMS로 보내드립니다.)</span>
                </div>                                 
            </div>           
        </div> 