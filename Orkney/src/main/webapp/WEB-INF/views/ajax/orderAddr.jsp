<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>



	<table class="table">
    <thead class="black white-text">
      <tr>
        <th scope="col">회원 번호</th>
        <th scope="col">주소 번호</th>
        <th scope="col">주소</th>
        <th scope="col">주소 타입</th>
        <th scope="col">이름</th>
        <th scope="col">전화번호</th>
      </tr>
    </thead>
    <tbody>
    	<c:forEach items="${addr }" var="a">
		 <tr class="addr">
      <td>${a.MEMBER_NO }</td>
      <td>${a.ADDRESS_NO }</td>
      <td>${a.ADDRESS }</td>
      <td>${a.ADDRESS_TYPE }</td>
      <td>${a.ADDRESS_NAME }</td>
      <td>${a.ADDRESS_PHONE }</td> 
      </tr>    
    </c:forEach>
    </tbody>
  </table>
  
  <table class="table">
    <thead class="black white-text">
      <tr>
        <th scope="col">회원 번호</th>
        <th scope="col">주문번호</th>
        <th scope="col">주문이름</th>
        <th scope="col">주문날짜</th>
        <th scope="col">전화번호</th>
        <th scope="col">주소</th>
        <th scope="col">양</th>
        <th scope="col">주문 가격</th>
        <th scope="col">주문 상태</th>
        <th scope="col">메모</th>
        <th scope="col">결제 방법</th>
        <th scope="col">취소 이유</th>
      </tr>
    </thead>
    <tbody>
    	 <c:forEach items="${order }" var="o">
    	<tr>
    		<td>${o.MEMBER_NO }</td>
    		<td>${o.ORDER_NO }</td>
    		<td>${o.ORDER_NAME }</td>
    		<td>${o.ORDER_DATE }</td>
    		<td>${o.ORDER_PHONE }</td>
    		<td>${o.ORDER_ADDRESS }</td>
    		<td>${o.ORDER_QTY }</td>
    		<td><fmt:formatNumber value="${o.TOTAL_PRICE }" type="currency"/>원</td>
    		<td>${o.ORDER_STATE }</td>
    		<td>${o.ORDER_MEMO }</td>
    		<td>${o.PAYMENT_METHOD }</td>
    		<td>${o.CANCEL_REASON }</td>
    	</tr>
    </c:forEach>
    </tbody>
  </table>



