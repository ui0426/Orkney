<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>

<link rel="stylesheet" href="${path}/resources/css/admin/order.css">
<section class="order-container">
 <div class="order-container-inner">
		<div class="order-content order">
			<div class="order-title">
				<h1 class="order-title-text">주문 리스트</h1>
			</div>
			
			<div class="info-title">
				<div>
					 <span>주문확인</span>  
					 <input type="text" class="input-form" value="">
					 <span>건</span> 
				</div>
				<div>
					<span>취소신청</span>
					<input type="text" class="input-form" value="">
					<span>건</span>
				</div>
				<div>
					 <span>교환신청</span>  
					 <input type="text" class="input-form" value="">
					 <span>건</span>
				</div>
				<div>
					 <span>환불신청</span> 
					<input type="text"  class="input-form" value="">
					 <span>건</span>
				</div>	 
			</div>
			
			<div class="search-container">
				<select class="browser-default custom-select" style="width: 21%;">
				  <option selected>Open this select menu</option>
				  <option value="1">주문번호</option>
				  <option value="2">주문자</option>
				  <option value="3">수령자</option>
				</select>
				<input type="text" id="exampleForm2" class="form-control">
				<span style="padding: 5px;"><button class="searchBtn"></button></span> 
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
          <tr>
            <td scope="row"><input type="checkbox" name="xxx" value="yyy"></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no} '"><c:out value="${o.order_date}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.order_no}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.total_price}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.member_name}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.order_name}"/></td>
            <td onclick="location.href='${path}/admin/orderView.do?oNo=${o.order_no}'"><c:out value="${o.order_state}"/></td>
          </tr>
          </c:forEach>
      </table>
			</div>
		</div>
		
		<div class="change-status">
			<div style="padding: 6px 28px;">선택한 주문 상태변경</div>
			<span>
				<select class="browser-default custom-select">
				  <option selected>Open this select menu</option>
				  <option value="1">주문번호</option>
				  <option value="2">주문자</option>
				  <option value="3">수령자</option>
				</select>
			</span>	
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp"/>