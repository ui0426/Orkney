<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
.modal-content-yn{
	padding: 1em 2em;
}
.modal-text-yn{
    font-size: .9em;
    font-weight: 500;
}
.modal-text-ynyn{
    font-size: 1.1em;
    font-weight: 900;
}
.modal_refund_info{
    font-size: .5em;
    margin-top: 3em;
}
</style>	
	
	
	
	  <table class="table table-hover table-dark" style="margin:0;">
        <thead>
          <tr>
            <th scope="col">주문번호</th>
            <th scope="col">회원ID</th>
            <th scope="col">주문자</th>
            <th scope="col">사유</th>
            <th scope="col">거절/승인</th>
          </tr>
        </thead>
   	     <tbody>
        <c:if test="${!empty order}">
        <c:forEach items="${order}" var="o">
          <tr class="clickPointer">
          	<input type="hidden" class="order_no" value="${o.order_no }"/>
          	<input type="hidden" class="member_id" value="${o.member_id}"/>
            <input type="hidden" class="member_name" value="${o.member_name}"/>
            <input type="hidden" class="point_no" value="${o.point_no }"/>
            <input type="hidden" class="member_no" value="${o.member_no }"/>            
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no} '"><c:out value="${o.order_no}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.member_id}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.member_name}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.cancel_reason}"/></td>
			<td>
				<c:if test="${o.order_state eq '주문확인' }">
					<input type="button" value="확인" onclick="allow('제품준비중','${o.order_no}',this);"/>
				</c:if>
				<c:if test="${o.order_state ne '주문확인' }">
					<input type="button" value="승인" onclick="allow('취소완료','${o.order_no}',this);"/>
				</c:if>
			</td>            
          </tr>
          </c:forEach>
          </c:if>
          
          <c:if test="${!empty orderDetail}">
	        <c:forEach items="${orderDetail}" var="od">        
	          
	          <tr class="clickPointer">   
		          <input type="hidden" class="order_no" value="${od.order_no }"/>
		          <input type="hidden" class="sort" value="${od.sort }"/>
		          <input type="hidden" class="product_name" value="${od.product_name }"/>
		          <input type="hidden" class="product_color" value="${od.product_color }"/>
		          <input type="hidden" class="product_price" value="${od.product_price }"/>
		          <input type="hidden" class="refund_qty" value="${od.refund_qty }"/>
		          <input type="hidden" class="refund_reason" value="${od.refund_reason }"/>
		          <input type="hidden" class="refund_content" value="${od.refund_content }"/>
		          <input type="hidden" class="refund_pic" value="${od.refund_pic }"/>
		          <input type="hidden" class="refund_point" value="${od.point_point }"/>
		          <input type="hidden" class="member_id" value="${od.member_id}"/>
		          <input type="hidden" class="member_name" value="${od.member_name}"/>
		          <input type="hidden" class="point_no" value="0"/>
	                   
                  <td class="odlistmodal"><c:out value="${od.order_no}"/></td>
	              <td class="odlistmodal"><c:out value="${od.member_id}"/></td>
	              <td class="odlistmodal"><c:out value="${od.member_name}"/></td>
	              <td class="odlistmodal"><c:out value="${od.refund_reason}"/></td>
				<td>
					<input type="button" value="거절" onclick="allow('',${od.order_detail_no},this);"/><input type="button" value="승인" onclick="allow('${od.sort}',${od.order_detail_no},this);"/>
				</td>            
	          </tr>
	          </c:forEach>
          </c:if>
	          </tbody>
          
      </table>
      
      <script>
      	function allow(state,no,me){
      		if(state == '교환신청') state = '교환처리중';
      		if(state == '반품신청') state = '반품처리중';
      		var email = $(me).parent().siblings(".member_id").val();
      		var name = $(me).parent().siblings(".member_name").val();
      		var oNo = $(me).parent().siblings(".order_no").val();
      		var pNo = $(me).parent().siblings(".point_no").val();
      		var mNo = $(me).parent().siblings(".member_no").val();
      		
      		
      		return new Promise((resolve, reject)=>{
      			
	      		$.ajax({
	      			url:"${path}/admin/allowStateAndSort.do",
	      			data:{state:state, no:no, pNo:pNo, mNo:mNo},
	      			success: data =>{
	      				location.href='${path}/admin/orderList.do';
	      				resolve(data);
	      			}
	      		}).then(arg => {
	      			if(arg == true){
	      				alert("확인 완료 되었습니다.");
	      				if(state == '교환처리중') state = '교환 승인';
	      				if(state == '반품처리중') state = '반품 승인';
	      				if(state == '취소완료') state = '취소';
	      				if(state == '제품준비중') state = '제품준비가 시작';
	      				if(state == '') state ='승인 거부';
	      				$.ajax({
	      					url:"${path}/orderAllow.do",
	      					data:{no:oNo, email:email, name:name, state:state},
	      					success: succ =>{
	      					}
	      				});
      				}else{
      					alert("처리 실패!");
      				};
	      		});
      		});
      	};
      
      
      	$(".odlistmodal").click(e=>{
      		var oNo = $(e.target).siblings(".order_no").val();
      		var sort = $(e.target).siblings(".sort").val();
      		var pName = $(e.target).siblings(".product_name").val();
      		var pColor = $(e.target).siblings(".product_color").val();
      		
      		//환불금액 관련
      		var pPrice = $(e.target).siblings(".product_price").val();
      		var tax = pPrice * 0.01;
      		
      		var rPoint = $(e.target).siblings(".refund_point").val();
      		
      		var rReason = $(e.target).siblings(".refund_reason").val();
      		var delivery = 0;
      		if(rReason == '단순변심' ){
      			delivery = 5000;
      		}
      		
      		var rQty = $(e.target).siblings(".refund_qty").val();
      		var rReason = $(e.target).siblings(".refund_reason").val();
      		var rContent = $(e.target).siblings(".refund_content").val();
      		var rPic = $(e.target).siblings(".refund_pic").val();
      		
      		var src = "${path }/resources/upload/order-refund/"+rPic;
      		
      		
      		
      		$.ajax({
      			url: "${path}/admin/selectRefundList.do",
      			data: {oNo:oNo, rPoint:rPoint},
      			success: point => {
      				var rAmount = (pPrice*rQty)+tax-point-delivery;
		   			$("#odListModalLabel").html(sort+" 내역");
		   			$("#modalpName").html("상품명 : "+pName);
		   			$("#modalpColor").html("상품컬러 : "+pColor);
		   			$("#modalrQty").html("반환 수량 : "+rQty);
		   			$("#modalrReason").html("사유 : "+rReason);
		   			$("#modalrContent").html("내용 : "+rContent);
		   			$("#modalrPic").attr("src", src);
		   			if(rContent == ''){
		   				$("#modalrContent").css("display","none");
		   			}
		   			if(src == '/orkney/resources/upload/order-refund/'){
		   				$("#modalrPic").css("display","none");
		   			}
		   			if(sort == '반품신청'){   				
			   			$("#modalrAmountInfo").html("환불금액 = (상품가격x반품수량)+부가세(10%)-사용포인트(모든 상품 반품처리 시 사용포인트 반환)-반품택배비");
			   			$("#modalrAmount").html(rAmount+" = ("+pPrice+"x"+rQty+")+"+tax+"-"+point+"-"+delivery);
		   			}
		
		      		$("#odModal").modal();
      			}
      		})
      		
      	})
      </script>
      
      <!-- 모달 -->
      <!-- Modal -->
		<div class="modal fade" id="odModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="odListModalLabel"></h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body modal-content-yn">
		        <div>
		        	<h3 id="modalpName" class="modal-text-yn"></h3>
		        	<h3 id="modalpColor" class="modal-text-yn"></h3>
		        </div>
		        <div>
		        	<h3 id="modalrQty" class="modal-text-ynyn"></h3>
		        	<h3 id="modalrReason" class="modal-text-ynyn"></h3>
		        	<h3 id="modalrContent" class="modal-text-ynyn"></h3>
		        	<img id="modalrPic" src=""/>
		        	<p id="modalrAmountInfo" class="modal_refund_info"></p>
		        	<h3 id="modalrAmount"class="modal-text-ynyn"></h3>
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>