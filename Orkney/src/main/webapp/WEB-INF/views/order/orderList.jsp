<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">		
	<jsp:param name="title" value="" />
</jsp:include>
<link rel="stylesheet" href="${path}/resources/css/order/orderForm.css"/>
<style>
	*{
	    font-family: sans-serif;
	}
	.orderList_mobile{
		width: -webkit-fill-available;
	}
	
	.orderList-panel{
		width: 100%;
	}
	.orderList-btn{
		padding: 1em 0 1em 0px;
		font-weight: 500;
	}
	.orderList_desktop{
		display: none;
	}
	caption{
		caption-side: top;
	}
	.desktop_content{
		padding: 0 1rem 2rem 1rem;
	}
	.orderList_Table{
		width: -webkit-fill-available;
	}
	.orderList_Table th{
	    padding: 1rem 0 1rem 15px;
	    color: #666;
	    font-weight: 600;
	    font-size: 0.7rem;
	}
	@media (min-width: 600px){
		.orderList_mobile {
		    display: none;
		}
		.orderList_desktop{
			display: block;
		}
	}
</style>
<section class="order-container">
	<div id="order-container-content">
		<div class="order-container-inner">
			<h1 class="orderform-title">내 주문 내역</h1>
			<div class="order-form-main">
				<div class="orderList-container">
					<div class="orderList_mobile">
						<div class="btn-group orderList-panel" role="group" aria-label="Basic example">
						  <button id="panel1" type="button" class="btn btn-light orderList-btn">처리중 주문</button>
						  <button id="panel2" type="button" class="btn btn-light orderList-btn">지난 주문 내역</button>
						</div>
						<div>
							<table>
								<tr>
									<td>처리중 주문</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="orderList_desktop">
						<div class="desktop_content">
							<table class="orderList_Table">
								<caption>처리중 주문</caption>
								<thead>
									<tr>
										<th>주문 번호(iSell 번호)</th>
										<th>주문 날짜</th>
										<th>현황</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>172398866</td>
										<td>2020-11-21 13:32</td>
										<td>진행 중</td>
										<td><a href="">주문 내역 보기</a>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="desktop_content">
							<table class="orderList_Table">
								<caption>지난 주문 내역</caption>
								<thead>
									<tr>
										<th>주문 번호(iSell 번호)</th>
										<th>주문 날짜</th>
										<th>현황</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>172398866</td>
										<td>2020-11-21 13:32</td>
										<td>취소</td>
										<td><a href="">주문 내역 보기</a>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>