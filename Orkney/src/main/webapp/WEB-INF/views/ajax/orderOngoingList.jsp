<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	
	
	
	  <table class="table table-hover table-dark">
        <thead>
          <tr>
            <th scope="col">주문번호</th>
            <th scope="col">상품정보</th>
            <th scope="col">수량</th>
            <th scope="col">회원ID</th>
            <th scope="col">주문자</th>
            <th scope="col">상태</th>
            <th scope="col">처리완료</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="od">
          <tr class="clickPointer">
            <td><c:out value="${od.order_no}"/></td>
            <td><c:out value="${od.product_name}"/>/<c:out value="${od.product_color }"/></td>
            <td><c:out value="${od.refund_qty}"/></td>
            <td><c:out value="${od.member_id}"/></td>
            <td><c:out value="${od.member_name}"/></td>
            <td><c:out value="${od.sort}"/></td>
            <td>
				<input type="button" value="완료" onclick="finish('${od.sort}',${od.order_detail_no})"/>
			</td>
          </tr>
          </c:forEach>
      </table>


<script>
	function finish(sort, no){		
		$.ajax({
			url:"${path}/admin/orderRefundEnd.do",
			data:{sort:sort, no:no},
			success:data=>{
				if(data==true){
					alert("처리 완료 되었습니다.");
					location.reload();
				}else{
					alert("실패");
				}
			}
		})
	}
</script>
      
      