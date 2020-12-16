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
					 <input type="text" class="input-form" value="${count.get("주문확인")}" readonly>
					 <span>건</span> 
				</div>
				<div>
					<span>취소신청</span>
					<input type="text" class="input-form" value="${count.get("취소신청")}" readonly>
					<span>건</span>
				</div>
				<div>
					 <span>교환신청</span>  
					 <input type="text" class="input-form" value="${count.get("교환신청")}" readonly>
					 <span>건</span>
				</div>
				<div>
					 <span>반품신청</span> 
					<input type="text"  class="input-form" value="${count.get("반품신청")}" readonly>
					 <span>건</span>
				</div>	 
			</div>
			
			<div><h5>교환/반품현황</h5></div>
			<div>
				<div id="change"></div>
			</div>
			<script>
				$(function(){
					$.ajax({
						url:"${path}/admin/orderChangeList.do",
						success:data=>{
							$("#change").html(data);
						}
					})
				})
			</script>
			
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
		<div><h5>주문검색</h5></div>
		<div>			
			<div id="list"></div>			
			<script>
				$(function(){
					$.ajax({
						url:"${path}/admin/orderListData.do",						
						success:data=>{
							$("#list").html(data);
						}
					})					
				})
				
				function fn_paging(cPage){
					$.ajax({
						url:"${path}/admin/orderListData.do",
						data:{cPage:cPage},
						success:data=>{
							$("#list").html(data);
						}
					})
				}
			</script>
			
		</div>
		
		<div class="change-status">
			<div style="padding: 6px 28px;">주문 선택 일괄 처리</div>
			<span>
				<select class="browser-default custom-select">
				  <option selected>Open this select menu</option>
				  <option value="1">제품준비중</option>
				  <option value="2">배송터미널도착</option>
				  <option value="3">배송중</option>
				  <option value="4">배송완료</option>
				</select>
			</span>	
		</div>
		
		
		
		
		
		
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp"/>