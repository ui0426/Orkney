<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	
	
	
	  <table class="table table-hover table-dark">
        <thead>
          <tr>
            <th scope="col"><input type="checkbox" name="xxx" value="yyy" id="checkAll" onclick="cAll();"></th>
            <th scope="col">주문일시</th>
            <th scope="col">주문번호</th>
            <th scope="col">결제금액</th>
            <th scope="col">주문자</th>
            <th scope="col">수령자</th>
            <th scope="col">진행상태</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${order}" var="o">
          <tr>
            <td scope="row"><input type="checkbox" name="oNo" value="${o.order_no}"></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no} '"><c:out value="${o.order_date}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.order_no}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.total_price}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.member_name}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.order_name}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.order_state}"/></td>
          </tr>
          </c:forEach>
      </table>
      
       <div id="pageBar">
      	${pageBar }
      </div>
      
<script>
function cAll() {
    if ($("#checkAll").is(':checked')) {
        $("input[type=checkbox]").prop("checked", true);
    } else {
        $("input[type=checkbox]").prop("checked", false);
    }
}


</script>
      
      