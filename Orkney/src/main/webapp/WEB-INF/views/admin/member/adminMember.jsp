<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>

    <jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
	
	<style>
		.title{text-align:center;margin-bottom:3rem;margin-top:3rem;}
		.point{display:flex;justify-content: center;}
		.pointIn{margin-left:3rem;}
	</style>
	
	<div class="title">
			<h2>회원 관리<hr></h2>
	</div>
	<div class="point" style="width:60%;margin-bottom:3rem;">
    <select class="browser-default custom-select pointIn" id="searchType" style="width:30%;">
	  <option value="MEMBER_ID">아이디</option>
	  <option selected value="MEMBER_NAME">이름</option>
</select>
		<input type="text" class="form-control pointIn" id="search" placeholder="검색">
		<i class="fas fa-search fa-2x" style="margin-left:1rem;cursor:pointer;" id="icon"></i>
	</div>
	
	<div id="memberList">
	
	</div>
	
	
	
	<div class="title">
			<h2 id="totalList">주소 / 주문 내역<hr></h2>
	</div>
	<div id="orderList">
		
	</div>
	
	<div class="title">
			<h2 id="pointList">포인트 수정<hr></h2>
	</div>
	
	<div class="form-group point">
	
    <input type="text" class="form-control pointIn" id="mNo" style="width:15%;" readonly>
    <input type="text" class="form-control pointIn" id="reason" placeholder="사유">
    <input type="number" class="form-control pointIn" id="point" style="width:30%;" placeholder="포인트">
    <select class="browser-default custom-select pointIn" id="sType" style="width:30%;">
	  <option value="차감">차감</option>
	  <option selected value="적립">적립</option>
</select>
	<button id="modifyPoint" style="width:10%;">수정</button>
  </div>
  
	<script>
	
		$("#modifyPoint").click(e=>{
			if(confirm("수정하시겠습니까?")){
				if($("#point").val()>0){
				$.ajax({
					url:"${path}/admin/modifyPoint.do",
					data:{no:$("#mNo").val(),reason:$("#reason").val(),point:$("#point").val(),type:$("#sType").val()},
					success:data => {
						if(data==true){
							alert("수정되었습니다.");
							$("#mNo").val('');
							$("#reason").val('');
							$("#point").val('');
						}
						else alert("수정에 실패하였습니다.");
					}
				})
				}
			}
		})
	
	
		$(function(){
			$.ajax({
				url:"${path}/admin/memberListData.do",
				success:data => {
					$("#memberList").html(data);
				}
			})
		})
		
		
		
		
		function fn_paging(cPage){
		$.ajax({
			url:"${path}/admin/memberListData.do",
			data:{cPage:cPage,type:$("#searchType").val(),key:$("#search").val()},
			success:data => {
				$("#memberList").html(data);
			}
		})
		}
		$("#icon").click(e=>{
			fn_paging(0);
		})

		
	</script>

    <jsp:include page="/WEB-INF/views/common/adminFooter.jsp"/>