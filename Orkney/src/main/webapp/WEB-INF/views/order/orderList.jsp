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
						  <button id="tab1" type="button" class="btn importent_style orderList-btn btn-clicked" aria-selected="true" aria-controls="panel1">처리중 주문</button>
						  <button id="tab2" type="button" class="btn importent_style orderList-btn">지난 주문 내역</button>
						</div>
						<div id="panel-container">
						<div class="panel1">
							<c:if test="${empty list }">
								<p class="AllNullNotice">현재 진행중인 주문이 없습니다.</p>
							</c:if>
							<c:forEach items="${list }" var="o">
								<div class="panels">
									<div class="ol-container">
										<div>주문 번호(iSell 번호)</div>
										<div><c:out value="${o.ORDER_NO }"/></div>
									</div>
									<div class="ol-container">
										<div>주문 날짜</div>
										<div><fmt:formatDate value="${o.ORDER_DATE }" pattern="YYYY-MM-dd"/></div>
									</div>
									<div class="ol-container">
										<div>현황</div>
										<div>진행 중</div>
									</div>
									<div class="ol-container">
										<a href="${path }/order/orderView.do?oNo=${o.ORDER_NO}">주문 내역 보기</a>
									</div>
								</div>
							</c:forEach>
							</div>
							<div class="panel2">
							<c:if test="${empty list }">
								<p class="AllNullNotice">현재 완료된 주문이 없습니다.</p>
							</c:if>
							<c:forEach items="${list2 }" var="o">
								<div class="panels">
									<div class="ol-container">
										<div>주문 번호(iSell 번호)</div>
										<div><c:out value="${o.ORDER_NO }"/></div>
									</div>
									<div class="ol-container">
										<div>주문 날짜</div>
										<div><fmt:formatDate value="${o.ORDER_DATE }" pattern="YYYY-MM-dd"/></div>
									</div>
									<div class="ol-container">
										<div>현황</div>
										<div><c:out value="${o.ORDER_STATE }"/></div>
									</div>
									<div class="ol-container">
										<a href="${path }/order/orderView.do?oNo=${o.ORDER_NO}">주문 내역 보기</a>
									</div>
								</div>
							</c:forEach>
							</div>
							<div class="notice-container">
								<div class="always-notice">
									<svg viewBox="0 0 24 24" width="24px" height="24px" class=""><path fill="currentColor" fill-rule="evenodd" clip-rule="evenodd" d="M10.5 15a4.5 4.5 0 1 1 0-9 4.5 4.5 0 0 1 0 9zm4.968-.307a6.5 6.5 0 1 0-1.514 1.315l3.996 3.996 1.414-1.414-3.896-3.897z"></path></svg>
									<h4 class="question">찾는 주문 내역이 없으신가요?</h4>
									<p class="answer">여기서 주문내역을 확인할 수 있습니다.<a href="${path}/order/orderForm.do">주문 내역 확인</a></p>
								</div>
							</div>
						</div>
					</div>
					<div class="orderList_desktop">
					<c:if test="${empty list and empty list2 }">
						<div>
							<p class="AllNullNotice">현재 진행중이거나 완료된 주문사항이 없습니다. <a>상품 보러가기</a></p>
						</div>
					</c:if>
					<c:if test="${!empty list or !empty list2 }">
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
									<c:if test="${empty list }">
										<tr>
											<td  colspan="4"><p class="AllNullNotice">현재 진행중인 주문이 없습니다.</p></td>
										</tr>
									</c:if>
									<c:forEach items="${list }" var="o">
										<tr>
											<td class="list-item"><c:out value="${o.ORDER_NO }"/></td>
											<td class="list-item"><fmt:formatDate value="${o.ORDER_DATE }" pattern="YYYY-MM-dd"/></td>
											<td class="list-item">진행 중</td>
											<td class="list-item"><a href="${path }/order/orderView.do?oNo=${o.ORDER_NO}">주문 내역 보기</a>
										</tr>
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
									<c:if test="${empty list2 }">
										<tr>
											<td  colspan="4"><p class="AllNullNotice">현재 완료된 주문이 없습니다.</p></td>
										</tr>
									</c:if>
									<c:forEach items="${list2 }" var="o">
										<tr>
											<td class="list-item"><c:out value="${o.ORDER_NO }"/></td>
											<td class="list-item"><fmt:formatDate value="${o.ORDER_DATE }" pattern="YYYY-MM-dd"/></td>
											<td class="list-item"><c:out value="${o.ORDER_STATE }"/></td>
											<td class="list-item"><a href="${path }/order/orderView.do?oNo=${o.ORDER_NO}">주문 내역 보기</a>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						</c:if>
						<div class="notice-container">
							<div class="always-notice">
								<svg viewBox="0 0 24 24" width="24px" height="24px" class=""><path fill="currentColor" fill-rule="evenodd" clip-rule="evenodd" d="M10.5 15a4.5 4.5 0 1 1 0-9 4.5 4.5 0 0 1 0 9zm4.968-.307a6.5 6.5 0 1 0-1.514 1.315l3.996 3.996 1.414-1.414-3.896-3.897z"></path></svg>
								<h4 class="question">찾는 주문 내역이 없으신가요?</h4>
								<p class="answer">여기서 주문내역을 확인할 수 있습니다.<a href="${path}/order/orderForm.do">주문 내역 확인</a></p>
							</div>
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