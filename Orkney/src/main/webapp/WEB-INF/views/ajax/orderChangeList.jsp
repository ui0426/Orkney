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
            <th scope="col">회원ID</th>
            <th scope="col">주문자</th>
            <th scope="col">상품</th>
            <th scope="col">수량</th>
            <th scope="col">사유</th>
            <th scope="col">거절/승인</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${change}" var="c">
          <tr>            
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no} '"><c:out value="${c.order_no}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${c.member_id}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${c.member_name}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${c.product_name}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${c.refund_qty}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${c.sort}"/></td>
			<td><input type="button" value="거절"/><input type="button" value="승인"/> </td>            
          </tr>
          </c:forEach>
          <tbody>
      </table>
      
      
      <script>