<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">		
	<jsp:param name="title" value="배송조회 " />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/order/orderForm.css"/>

<section class="order-container">
	<div id="order-container-content">
		<div class="order-container-inner">
			<h1 class="orderform-title">주문 정보 확인</h1>
			<div class="order-form-main">
				<form id="oView" action="${path }/order/orderView.do">
					<h2 class="order_information-title">주문정보</h2>
				  	<div class="form-group">
				  		<label class="order_information" for="orderNo">
					    	<input type="text" name="oNo" class="form-control order-infor-input order-form-number" id="orderNo">
					    	<span id="inputNo" class="order-input-center">주문번호(iSell)번호</span>
				    	</label>
				    	<div id="ordernum" class="form-text text-muted order-form-error-msg">
				    		<svg viewBox="0 0 24 24" width="16px" height="16px"><g fill="none" fill-rule="evenodd"><path fill="#E00751" d="M22 12c0 5.523-4.477 10-10 10S2 17.523 2 12 6.477 2 12 2s10 4.477 10 10z"></path><path fill="#FFF" fill-rule="nonzero" d="M13.414 12l4.233 4.234-1.414 1.414L12 13.415l-4.243 4.243-1.414-1.415 4.242-4.242L6.35 7.766l1.415-1.414L12 10.587l4.242-4.243 1.415 1.414-4.243 4.243z"></path></g></svg>
				    		9~10자리의 주문 번호(iSell 번호)를 입력해주세요.
				    	</div>
				  	</div>
				  	<div id="orderNo_help">
				  		<p>
					        <a class="order-form-help" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
				            	<svg viewBox="0 0 40 40" width="18px" height="18px" class="exclamationmark"><g fill="none" fill-rule="evenodd"><path fill="#0058A3" d="M36.667 20c0 9.205-7.462 16.667-16.667 16.667-9.205 0-16.667-7.462-16.667-16.667 0-9.205 7.462-16.667 16.667-16.667 9.205 0 16.667 7.462 16.667 16.667z"></path><path fill="#FFF" d="M18.333 16.667h3.334V30h-3.334V16.667zm1.667-1.5a2.167 2.167 0 1 1 0-4.334 2.167 2.167 0 0 1 0 4.334z"></path></g></svg>
				            	주문 번호(iSell 번호)는 어디에서 찾을 수 있나요?
					        </a>
					    </p>
					    <div class="collapse" id="collapseExample">
					        <div class="card card-body">
					         	주문 번호(iSell 번호)는 주문 확인서 상단에 있습니다.
						        <div class="order-help-content">
						        	<img class="Helper_Image" src="${path }/resources/img/order.PNG" width="100%" height="100%">
						        </div>
					        </div>
					    </div>
				  	</div>
				  	<div class="form-group">
				  		<label class="order_information">
					    	<input type="text" name="mId" class="form-control order-infor-input order-form-phone" id="orderpe">
					   		<span id="inputphone" class="order-input-center">이메일</span>
				   		</label>
				   		<div id="orderphone" class="form-text text-muted order-form-error-msg">
				   			<svg viewBox="0 0 24 24" width="16px" height="16px"><g fill="none" fill-rule="evenodd"><path fill="#E00751" d="M22 12c0 5.523-4.477 10-10 10S2 17.523 2 12 6.477 2 12 2s10 4.477 10 10z"></path><path fill="#FFF" fill-rule="nonzero" d="M13.414 12l4.233 4.234-1.414 1.414L12 13.415l-4.243 4.243-1.414-1.415 4.242-4.242L6.35 7.766l1.415-1.414L12 10.587l4.242-4.243 1.415 1.414-4.243 4.243z"></path></g></svg>
				   			잘못 입력하셨습니다. 다시 시도해주세요.
				   		</div>
				  	</div>
				  	<button type="button" class="btn order-btn-color" id="order-submit">확인</button>
				</form>
				
				 <!-- Button trigger modal -->
				<button id="modalBtn" type="button" class="btn btn-primary" data-toggle="modal" data-target="#basicExampleModal" style="display:none;">
				    Launch demo modal
				 </button>
				<!-- Modal -->
				<div class="modal fade" id="basicExampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
				    aria-hidden="true">
				    <div class="modal-dialog" role="document">
				      <div class="modal-content">
				        <div class="modal-header">
				          <h5 class="modal-title orderform-modal-title" id="exampleModalLabel">죄송합니다. 주문 내역을 찾을 수 없습니다.</h5>
				          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				            <span aria-hidden="true">&times;</span>
				          </button>
				        </div>
				        <div id="modal-msg" class="modal-body orderform-modal-content">
				         	
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-indigo" data-dismiss="modal">Close</button>
				        </div>
				      </div>
				    </div>
				 </div>
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
		var no = $("#orderNo").val().trim();
		if(no.length==0){
			$("#inputNo").removeClass("order-input-top");
			$("#inputNo").addClass("order-input-center");
			
		}
	});
	
	$(".order-form-phone").focus(function(){
		$("#inputphone").removeClass("order-input-center");
		$("#inputphone").addClass("order-input-top");
	});
	$(".order-form-phone").blur(function(){
		var ep = $("#orderpe").val().trim();
		if(ep.length==0){			
			$("#inputphone").removeClass("order-input-top");
			$("#inputphone").addClass("order-input-center");
		}
	});
	
	
	
	let noresult = false;
	let peresult = false;
	
	
	//엔터키 눌렀을때
	$(".order-form-phone").keydown(function(key) {

		if (key.keyCode == 13) {

			$("#order-submit").trigger("click");

		}

		});

	
	$("#order-submit").click(function(){
		
		let no=$("#orderNo").val();
		
		var regex =/[0-9]/g;
		
		if(regex.test(no)){
			if(no.length>=9 && no.length<=10){
				$("#ordernum").css("display","none");
				console.log("성공");
				noresult = true;	
			}else{
				$("#ordernum").css("display","block");
				console.log("실패");
				noresult = false;
			}
		}else{
			$("#ordernum").css("display","block");
			console.log("진짜실패");
			noresult = false;
		}
		
		var pe=$("#orderpe").val();
		
		if(pe.length==0){
			$("#orderphone").css("display","block");
			peresult = false;
		}else{
			$("#orderphone").css("display","none");
			peresult = true;
		}

		if(noresult==true && peresult==true){
			console.log("주문번호, 이메일 공란 없이 잘 작성해서 ajax실행");
			$.ajax({
				url:"${path}/order/orderFormCheck.do",
				data:{oNo:no,mId:pe},
				success:data=>{
					console.log(data);
					if(data == "true"){
						$("#oView").submit();
					}else{
						//모달 띄우기
						//$("#basicExampleModal").addClass("show").css("display","block").removeAttr("aria-hidden").attr("aria-modal","true");
						//$("#modal-hidden").addClass("modal-backdrop fade show");
						$("#modal-msg").html(data);
						$("#modalBtn").trigger("click");//그냥 부트스트랩에서 데려온 모달 버튼 자동클릭되게...
					}
				}
			})
		}else{
			return false;
		}
	});
	
	
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>