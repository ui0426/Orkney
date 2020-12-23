    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<link rel="stylesheet" href="${path}/resources/css/admin/order.css">
	<section id="content">
	<div class="order-container-inner">
		<div class="order-content order">
			<div class="order-title" style="text-align: center;">
			<hr>
				<h2 class="order-title-text" style="font-weight: bold;margin: auto; ">상품관리</h1>
			<hr>
			</div>
			<div class="table table-hover table-dark row" style="background-color: white; text-align: end;">
				<div class="search-container col-8 row" style="display: flex; flex-flow: row;margin-left: 200px;">			
	
					<input type="text" class="form-control" value="${map.keyword}" id="searchText" placeholder="검색어 입력  (제품번호 / 이름 / 카테고리)"/>				
					<span style="padding: 5px;margin-left: -3rem; height: 2px; margin-top: 1px;" class="">
						<input type="button" class="searchBtn" style="background-color: white">
					</span> 			
				</div>

				<button class="btn" style="background-color: #343a40;border-radius: 52px;height: 41px;margin-top: 44px;" onclick="location.href ='${path }/admin/adminProductInsert.do'">제품추가</button>
		
			</div>
	 
      </div>
      </div>
      <div id="list"></div>	
	</section>
	<script type="text/javascript">
	$(function(){
		let keyword=$(".form-control").val();
		$.ajax({
			url:"${path}/admin/adminProduct.do",						
			success:data=>{
				$("#list").html(data);
			}
		})					
	})

		$("#searchText").keydown(function(key){
			if (key.keyCode == 13) {
			let keyword=$(".form-control").val();

			$.ajax({
				url:"${path}/admin/adminProduct.do",	
				data:{
					'keyword':keyword,
					},
				success:data=>{
					$("#list").html(data);
				}
			})
			}
		})
		$(".searchBtn").click(function(){					
			let keyword=$(".form-control").val();

			$.ajax({
				url:"${path}/admin/adminProduct.do",	
				data:{
					'keyword':keyword,
					},
				success:data=>{
					$("#list").html(data);
				}
			})
		})
		function fn_paging(cPage){
					$.ajax({
						url:"${path}/admin/adminProduct.do",
						data:{
							cPage:cPage
							},
						success:data=>{
							$("#list").html(data);
						}
					})
				}
		
// 		ajax 할인
function per(pNo,index,price) {
	var per = $("#product"+index).find("#per").val();
	per = Math.round(price*(1-(per*0.01)));
	console.log(per);
	$.ajax({
		url : "${path}/admin/productPer.do",
		data:{
			"pNo":pNo,
			"per":per
		},
		success:data=>{
// 			alert(pNo+" 제품에 "+$("#product"+index).find("#per").val()+"% 할인 적용 하였습니다.");
		}
		
	})
	$.ajax({
		url : "${path}/admin/productOne.do",
		data:{
			"pNo":pNo,
		},
		success:data=>{
			
			for (var i = 0; i < data.length; i++) {
				$("#product"+index).find("#salePrice").text(data[i]["SALE_PER"]);
				
			}
		}
	})
}
// 		ajax 입고 
function putIn(pNo,index) {
	var put = $("#product"+index).find("#putIn").val();
	var stock = $("#product"+index).find("#stock").text();
	var putIn =Number(stock) + Number(put);
	console.log("aaaaa"+putIn);
	$.ajax({
		url : "${path}/admin/productPutIn.do",
		data:{
			"pNo":pNo,
			"putIn":putIn
		},
		success:data=>{
// 			alert(pNo+"제품에"+put+" 입고하여 재고 총 : "+putIn+" 입니다.");
		}
		
	})
	$.ajax({
		url : "${path}/admin/productOne.do",
		data:{
			"pNo":pNo,
		},
		success:data=>{
			
			for (var i = 0; i < data.length; i++) {
				
				$("#product"+index).find("#stock").text(data[i]["PRODUCT_STOCK"]);
			}
		}
	})
	
}
function deleteProduct(pNo,index) {
	
	$.ajax({
		url : "${path}/admin/deleteProduct.do",
		data:{
			pNo:pNo,
		},
		error :error=>{
	        alert("주문 완료 되지 않은 상품 입니다.");
	    },
		success:data=>{
			$("#product"+index).remove();
			alert("삭제되었습니다.");
		}
	})
}
		
		
		
// 		$(function() {
// 		<c:forEach items="${list}" var="o" varStatus="s">
// 		var price= ${o.PRODUCT_PRICE};
// 		var per= ${1-(o.SALE_PER*0.01)};
// 		if (price*per>0) {
			
// 		$("#product"+"${s.index}").find("#sale").text(price*per);
// 		}
// 		</c:forEach>
// 		})
	</script>
	<jsp:include page="/WEB-INF/views/common/adminFooter.jsp"/>
