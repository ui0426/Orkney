<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	
	
	
	
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
          <tr>            
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no} '"><c:out value="${o.order_no}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.member_id}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.member_name}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.cancel_reason}"/></td>
			<td><input type="button" value="거절"/><input type="button" value="승인"/> </td>            
          </tr>
          </c:forEach>
          </c:if>
          
          <c:if test="${!empty orderDetail}">
	        <c:forEach items="${orderDetail}" var="od">
	          <input type="hidden" class="sort" value="${od.sort }"/>
	          <input type="hidden" class="product_name" value="${od.product_name }"/>
	          <input type="hidden" class="product_color" value="${od.product_color }"/>
	          <input type="hidden" class="refund_qty" value="${od.refund_qty }"/>
	          <input type="hidden" class="refund_content" value="${od.refund_content }"/>
	          <input type="hidden" class="refund_pic" value="${od.refund_pic }"/>
	          <tr>            
                <td class="odlistmodal"><c:out value="${od.order_no}"/></td>
	            <td class="odlistmodal"><c:out value="${od.member_id}"/></td>
	            <td class="odlistmodal"><c:out value="${od.member_name}"/></td>
	            <td class="odlistmodal"><c:out value="${od.refund_reason}"/></td>
				<td><input type="button" value="거절"/><input type="button" value="승인"/> </td>            
	          </tr>
	          </c:forEach>
          </c:if>
          <tbody>
      </table>
      
      <script>
      	$(".odlistmodal").click(e=>{
      		console.log("클릭 버튼은 안되라 제발..");
      		var sort = $(e.target).parent().siblings(".sort").val();
      		var pName = $(e.target).parent().siblings(".product_name").val();
      		var pColor = $(e.target).parent().siblings(".product_color").val();
      		var rQty = $(e.target).parent().siblings(".refund_qty").val();
      		var rContent = $(e.target).parent().siblings(".refund_content").val();
      		var rPic = $(e.target).parent().siblings(".refund_pic").val();
      		
      		var src = "${path }/resources/upload/order-refund/"+rPic;
      		console.log(sort+pName+pColor+rQty+rContent+rPic+src);
   			$("#odListModalLabel").html(sort+" 내역");
   			$("#modalpName").html("상품명 : "+pName);
   			$("#modalpColor").html("상품컬러 : "+pColor);
   			$("#modalrQty").html("반환 수량 : "+rQty);
   			$("#modalrContent").html("내용 : "+rContent);
   			$("#modalrPic").attr("src", src);

      		$("#odModal").modal();
      		
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
		      <div class="modal-body">
		        <div>
		        	<h3 id="modalpName"></h3>
		        	<h3 id="modalpColor"></h3>
		        </div>
		        <div>
		        	<h3 id="modalrQty"></h3>
		        	<h3 id="modalrContent"></h3>
		        	<img id="modalrPic" src=""/>
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>