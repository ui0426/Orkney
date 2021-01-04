<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>

<link rel="stylesheet" href="${path}/resources/css/admin/order.css">
<section class="order-container">
 	<div class="order-container-inner">
		<div class="order-content order">
			<div class="order-title">
				<h1 class="order-title-text">
					"<c:out value="${pName }"/>" 입·출고 내역 조회
				</h1>
				<p>현재 남은 재고 : <c:out value="${stock }"/></p>
			</div>
			<div id="" class="">
				
				<table class="table table-hover">
				  <thead>
				    <tr>
				      <th scope="col"></th>
				      <th scope="col">번호</th>
				      <th scope="col">수량</th>
				      <th scope="col">입출고날짜</th>
				      <th scope="col">구분</th>
				    </tr>
				  </thead>
				  <tbody>
				  <c:forEach items="${list }" var="s">
				    <tr>
				      <th scope="row"></th>
				      <td><c:out value="${s.SHIPPED_NO }"/></td>
				      <td><c:out value="${s.SHIPPED_QTY }"/></td>
				      <td><fmt:formatDate value="${s.SHIPPED_DATE}" pattern="YYYY-MM-dd HH:mm"/></td>
				      <td><c:out value="${s.SHIPPED_TYPE }"/></td>
				    </tr>
				   </c:forEach>
				  </tbody>
				</table>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/adminFooter.jsp"/>