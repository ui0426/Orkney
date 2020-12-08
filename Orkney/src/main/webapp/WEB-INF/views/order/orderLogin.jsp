<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">		
	<jsp:param name="title" value="주문관리 로그인" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/order/orderForm.css"/>

<section class="order-container">
	<div id="order-container-content">
		<div class="order-container-inner">
			<h1 class="orderform-title">주문 내역</h1>
			<div class="order-form-main">
				<%-- <form action="${path }/order/orderLogin.do" method="post"> --%>
					<h2 class="order_information-title">로그인</h2>
						<div class="o-login-error-msg"></div>
				  	<div class="form-group">
				  		<label class="order_information" for="orderNo">
					    	<input type="text" name="id" class="form-control order-infor-input order-form-number" id="memail">
					    	<span id="inputNo" class="order-input-center">아이디(이메일 주소)</span>
				    	</label>
				  	</div>
				  	
				  	<div class="form-group">
				  		<label class="order_information">
					    	<input type="password" name="password" class="form-control order-infor-input order-form-phone" id="mpassword">
					   		<span id="inputphone" class="order-input-center">비밀번호</span>
				   		</label>
				  	</div>
				  	<p>
				  		<a href="${path}/member/memberLogin.do">비밀번호가 기억나지 않으세요?</a>
				  	</p>	
				  	<button disabled="disabled" type="button" class="btn order-btn-color" id="order-submit">확인</button>
				<!-- </form> -->
			</div>
		</div>
	</div>
</section>

<script>

	$(".order-form-number").focus(function(){
		$("#inputNo").removeClass("order-input-center");
		$("#inputNo").addClass("order-input-top");
	});
	$(".order-form-number").blur(function(){
		var e = $("#memail").val().trim();
		if(e.length==0){
			$("#inputNo").removeClass("order-input-top");
			$("#inputNo").addClass("order-input-center");
			
		}
	});
	
	$(".order-form-phone").focus(function(){
		$("#inputphone").removeClass("order-input-center");
		$("#inputphone").addClass("order-input-top");
	});
	$(".order-form-phone").blur(function(){
		var p = $("#mpassword").val().trim();
		if(p.length==0){			
			$("#inputphone").removeClass("order-input-top");
			$("#inputphone").addClass("order-input-center");
		}
	});
	
	
	
	$("#memail").on("input",function(){
        if($("#memail").val().length>0 && $("#mpassword").val().length>0 ){
            $("#order-submit").removeAttr("disabled");
        }else{
            $("#order-submit").attr("disabled","disabled");
        }
     });
     $("#mpassword").on("input",function(){
        if($("#memail").val().length>0 && $("#mpassword").val().length>0 ){
            $("#order-submit").removeAttr("disabled");
        }else{
            $("#order-submit").attr("disabled","disabled");
        }
     });
     
   //엔터키 눌렀을때
 	$("#mpassword").keydown(function(key) {

 		if (key.keyCode == 13) {

 			$("#order-submit").trigger("click");

 		}

 		});

	
	$(function(){
		$("#order-submit").click(e=>{
			console.log("클릭");
			let mId = $("#memail").val();
			let mPw = $("#mpassword").val();
			$.ajax({
				url:"${path}/order/orderLogin.do",
				data:{id:mId,pw:mPw},
				success:data => {
					console.log("12345678");
					console.log(data);
					if(data == "true"){
						console.log("123");
						location.href="${path}/order/orderList.do";
					}else{
						console.log("456");
						$(".o-login-error-msg").html("사용하신 인증정보가 올바르지 않습니다. 확인 후 다시 시도해주세요.");
					}
				}
			})
		})
	})
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>