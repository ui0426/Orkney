<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<style>
.order-container{
	padding: 0 2rem 0 2rem;
}
.order-title{
	margin-bottom: 2.5rem;
}
.order-title-text{
	font-weight: bold;
    font-size: 1.5rem;
}
.order-btn-title{
	color: #111;
    font-size: 1.125rem;
    line-height: 1.44444;
    font-weight: 700;
}
</style>
<section class="order-container">
 <div class="order-container-inner">
		<div class="order-content order">
			<div class="order-title">
				<h1 class="order-title-text">주문 리스트</h1>
			</div>
		</div>
		<div><h2>주문검색</h2></div>
		<div>
			<div>
				<h2 class="order-btn-title">주문 리스트</h2>
			</div>
			<div>
				<table class="table table-hover table-dark">
        <thead>
          <tr>
            <th scope="col">체크박스</th>
            <th scope="col">주문일시</th>
            <th scope="col">주문번호</th>
            <th scope="col">결제금액</th>
            <th scope="col">주문자</th>
            <th scope="col">수령자</th>
            <th scope="col">진행상태</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${order }" var="o">
          <tr onclick="location.href='${path}/admin/orderView.do'">
            <td scope="row"><input type="checkbox" name="xxx" value="yyy"></td>
            <td><c:out value="${o.order_date}"/></td>
            <td><c:out value="${o.order_no}"/></td>
            <td><c:out value="${o.total_price}"/></td>
            <td><c:out value="${o.member_name}"/></td>
            <td><c:out value="${o.order_name}"/></td>
            <td><c:out value="${o.order_state}"/></td>
          </tr>
          </c:forEach>
      </table>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp"/>