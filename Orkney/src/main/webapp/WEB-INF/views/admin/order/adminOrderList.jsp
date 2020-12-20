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
				<div id="order-confirm" onclick="changeList('주문확인')" class="clickPointer">
					 <span>주문확인</span>  
					 <input type="text" class="input-form clickPointer" value="${count.get("주문확인")}" readonly>
					 <span>건</span> 
				</div>
				<div id="cancel-confirm" onclick="changeList('취소신청')" class="clickPointer">
					<span>취소신청</span>
					<input type="text" class="input-form clickPointer" value="${count.get("취소신청")}" readonly>
					<span>건</span>
				</div>
				<div id="exchange-confirm" onclick="changeList('교환신청')" class="clickPointer">
					 <span>교환신청</span>  
					 <input type="text" class="input-form clickPointer" value="${count.get("교환신청")}" readonly>
					 <span>건</span>
				</div>
				<div id="refund-confirm" onclick="changeList('반품신청')" class="clickPointer">
					 <span>반품신청</span> 
					<input type="text"  class="input-form clickPointer" value="${count.get("반품신청")}" readonly>
					 <span>건</span>
				</div>	 
			</div>
			
			<div><h5 id="topList-title"></h5></div>
			<div>
				<div id="change" class="topList"></div>
			</div>
			<script>
			
				function changeList(state){
					console.log(state);
					if(state =='주문확인' || state =='취소신청'){
						url = "${path}/admin/selectOrderChangeList.do";
					}
					if(state =='교환신청' || state == '반품신청'){
						url = "${path}/admin/selectOrderDetailChangeList.do";
					}
					console.log(url);
					$.ajax({
						url:url,
						data: {state:state},
						success:data=>{
							console.log("성공");
							$("#topList-title").html(state);
							$("#change").html(data);
							$("#change").css("display","block");
						}
					})
				}

			</script>
			
		<div class="search-container">			
				<select class="browser-default custom-select" style="width: 21%;" id="sel">
				  <option value="all" >전체보기</option>
				  <option value="ono" >주문번호</option>
				  <option value="member_name">주문자</option>
				  <option value="order_name">수령자</option>
				  <option value="status">진행상태</option>
				</select>
				<input type="text" class="form-control" value="${map.keyword}" placeholder="검색어 입력"/>				
				<span style="padding: 5px;">
					<input type="button" class="searchBtn">
				</span> 			
		</div>
				
		</div>
		<div><h5 class="mainList-title">주문검색</h5></div>
		<div>			
			<div id="list"></div>			
			<script>
				$(function(){
					let keyword=$(".form-control").val();
					$.ajax({
						url:"${path}/admin/orderListData.do",						
						success:data=>{
							$("#list").html(data);
						}
					})					
				})
				$(".searchBtn").click(function(){					
					let keyword=$(".form-control").val();
					let search_option = $(sel).val();
				   
					$.ajax({
						url:"${path}/admin/orderListData.do",	
						data:{keyword:keyword,search_option:search_option},
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
		
		<div class="change-state-container">
		<div class="change-status">
			<div class="change-state-title" style="padding: 6px 28px;">주문 상태 일괄 처리</div>
			<span>
				<select id="state" class="browser-default custom-select">
				  <option selected>주문 상태 선택</option>
				  <option>제품준비중</option>
				  <option>배송터미널도착</option>
				  <option>배송중</option>
				  <option>배송완료</option>
				</select>
			</span>
			<span>
				<button id="state-change" class="btn btn-primary btn-sm">적용</button>
			</span>	
		</div>
		</div>
<script>
$("#state-change").click(e=>{
	// name이 같은 체크박스의 값들을 배열에 담는다.
	var state = $("#state").val();
    var oNos = [];
	if(state == '주문 상태 선택'){
		alert("주문 상태를 선택해주세요.");
		return false;
	}
    $("input[name='oNo']:checked").each(function(i) {
    	console.log($(this));
        oNos.push($(this).val());
    });

	console.log(oNos);
	console.log(state);
	$.ajax({
		type:"GET",
		url:"${path}/admin/updateOrderListState.do",
		data:{"state":state,"oNos":oNos},
		success:data => {
			if(data =="실패"){			
				alert("배송상태 변경 실패!");
			}else{
				alert("배송상태 변경 완료");
				$("#list").html(data);							
			}
		}
	})
})
</script>
		
		
		
		
		
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp"/>