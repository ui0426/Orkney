<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<link rel="stylesheet" href="${path}/resources/css/cart/cart.css">
   
      
    <c:forEach items="${cart}" var="p">                           
            <div class="product-container" id="pc">                                    
                <div class="product-pic"><img src="${path}/resources/images/rooms/<c:out value="${p.product_pic}"/>"></div>                
                <div class="price"> <fmt:formatNumber value="${p.product_price}"/>원 </div>                                                                                                            
                    <div class="product-detail">                                        
                        <div><c:out value="${p.product_name}"/></div>
                        <div><c:out value="${p.big_category}"/></div>                                
                        <div><c:out value="${p.product_width}"/>*<c:out value="${p.product_height}"/>*<c:out value="${p.product_depth}"/></div>                    
                    <div class="btn-container">                                                
                        <div>
                            <select class="mdb-select md-form">
                                <option value="" disabled selected>1</option>
                                <option value="1">2</option>
                                <option value="2">3</option>
                                <option value="3">4</option>
                              </select>
                        </div>
                        <div><button class="remove_list remove" id="${p.product_no}" value="${p.cart_no}">삭제</button></div>
                        <div><button class="wish_btn" data-toggle="modal" data-target="#fullHeightModalRight">위시리스트 저장</button></div>
                    </div>  
                	</div><div class="line1"></div>                              
                </div>
	</c:forEach>	
	<script>
	/* 상품내용제거 */
	 $(".remove").click(e =>{
			let pNo=$(e.target).attr("id");			
			let cNo=$(e.target).val();			
			$.ajax({
				url:"${path}/cart/deleteProduct.do",
				data:{productNo:pNo, cartNo:cNo},
				success:data=>{										
					console.log("pNo:"+pNo);					
					$("#re").html(data);
				}
			});
		});  	
	 
	 
	 
	</script>