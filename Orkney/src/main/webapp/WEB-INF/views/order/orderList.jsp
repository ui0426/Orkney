<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">		
	<jsp:param name="title" value="내주문내역" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/order/orderForm.css"/>
<link rel="stylesheet" href="${path }/resources/css/order/orderList.css"/>



<section class="order-container">
	<div id="order-container-content">
		<div class="orderList-container">
			<h1 class="orderform-title">내 주문 내역</h1>
			<div class="order-form-main">
				<div class="orderList-container">
					<div class="orderList_mobile">
						<div class="btn-group orderList-tab" role="group" aria-label="Basic example">
						  <button id="tab1" type="button" class="btn-light orderList-btn btn-clicked" aria-selected="true" aria-controls="panel1">처리중 주문</button>
						  <button id="tab2" type="button" class="btn-light orderList-btn">지난 주문 내역</button>
						</div>
						<div id="panel-container">
							<c:forEach items="${list }" var="o">
							<c:if test="${not fn:contains(o.ORDER_STATE,'완료')}">
								<div class="panel1 panels">
									<div class="ol-container">
										<div>주문 번호(iSell 번호)</div>
										<div><c:out value="${o.ORDER_NO }"/></div>
									</div>
									<div class="ol-container">
										<div>주문 날짜</div>
										<div><c:out value="${o.ORDER_DATE }"/></div>
									</div>
									<div class="ol-container">
										<div>현황</div>
										<div>진행 중</div>
									</div>
									<div class="ol-container">
										<a href="${path }/order/orderView.do?oNo=${o.ORDER_NO}">주문 내역 보기</a>
									</div>
								</div>
							</c:if>
							</c:forEach>
							<c:forEach items="${list }" var="o">
							<c:if test="${fn:contains(o.ORDER_STATE,'완료')}">
								<div class="panel2 panels">
									<div class="ol-container">
										<div>주문 번호(iSell 번호)</div>
										<div><c:out value="${o.ORDER_NO }"/></div>
									</div>
									<div class="ol-container">
										<div>주문 날짜</div>
										<div><c:out value="${o.ORDER_DATE }"/></div>
									</div>
									<div class="ol-container">
										<div>현황</div>
										<div><c:out value="${o.ORDER_STATE }"/></div>
									</div>
									<div class="ol-container">
										<a href="${path }/order/orderView.do?oNo=${o.ORDER_NO}">주문 내역 보기</a>
									</div>
								</div>
							</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="orderList_desktop">
						<div class="desktop_content">
							<table class="orderList_Table">
								<caption class="orderList_Caption">처리중 주문</caption>
								<thead>
									<tr>
										<th>주문 번호(iSell 번호)</th>
										<th>주문 날짜</th>
										<th>현황</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="o">
										<c:if test="${not fn:contains(o.ORDER_STATE,'완료')}">
											<tr>
												<td class="list-item"><c:out value="${o.ORDER_NO }"/></td>
												<td class="list-item"><c:out value="${o.ORDER_DATE }"/></td>
												<td class="list-item">진행 중</td>
												<td class="list-item"><a href="${path }/order/orderView.do?oNo=${o.ORDER_NO}">주문 내역 보기</a>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="desktop_content">
							<table class="orderList_Table">
								<caption class="orderList_Caption">지난 주문 내역</caption>
								<thead>
									<tr>
										<th>주문 번호(iSell 번호)</th>
										<th>주문 날짜</th>
										<th>현황</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list }" var="o">
										<c:if test="${fn:contains(o.ORDER_STATE, '완료') }">
											<tr>
												<td class="list-item"><c:out value="${o.ORDER_NO }"/></td>
												<td class="list-item"><c:out value="${o.ORDER_DATE }"/></td>
												<td class="list-item"><c:out value="${o.ORDER_STATE }"/></td>
												<td class="list-item"><a href="${path }/order/orderView.do?oNo=${o.ORDER_NO}">주문 내역 보기</a>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<script>
	$("#tab1").click(e=>{
		$("#tab1").addClass("btn-clicked");
		$("#tab2").removeClass("btn-clicked");
		$('.panel1').css("display","block");
		$('.panel2').css("display","none");
	});
	$("#tab2").click(e=>{
		$("#tab2").addClass("btn-clicked");
		$("#tab1").removeClass("btn-clicked");
		$('.panel1').css("display","none");
		$('.panel2').css("display","block");
	});
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>