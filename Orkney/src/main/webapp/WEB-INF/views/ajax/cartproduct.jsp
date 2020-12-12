
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<link rel="stylesheet" href="${path}/resources/css/cart/cart.css">
   
      

	<c:if test="${cart.size() ==0}">
		장바구니가 비어있습니다.
	</c:if>
	
	<c:if test="${cart.size() !=0}">	
    <c:forEach items="${cart}" var="p">                           
            <div class="product-container" id="pc">                                                                                     
                <div class="product-pic"><img src="${path}/resources/images/rooms/<c:out value="${p.product_pic}"/>"></div>                

                <div class="price"> <fmt:formatNumber value="${p.totalPrice}"/>&nbsp;원 </div>                
                <input type="hidden" value="${p.totalPrice }" name="totalPrice ">                                                                                                            
                <input type="hidden" value="${p.productNo }"  name="productNo">                                       
                    <div class="product-detail"> 
                        <div><c:out value="${p.productName}"/></div>
                        <div><c:out value="${p.big_category}"/></div>                                
                        <div><c:out value="${p.product_width}"/>*<c:out value="${p.product_height}"/>*<c:out value="${p.product_depth}"/></div>                    
                    <div class="btn-container">                                                
                        <div>                        	   
                            <select class="mdb-select md-form amount" id="se">
                            	<c:forEach begin="1" end="10" var="i">
                            		<c:if test="${p.cartQTY == i}">                            		                                  
                                  		<option value="${p.cartQTY}" selected>${i}</option>
                                  	</c:if>                                            	                        	
                                     <option value="${i}"/>${i}</option>                                                                 	                                  		                                                                                            
								</c:forEach>							
                             </select>
                             <input type="hidden" value="${p.cartNo }" id="${p.productNo}" class="${p.totalPrice}">
                             <input type="hidden" value="${p.productPrice}">                       
                        </div>                        
                       
                        <div><button class="remove_list remove" id="${p.productNo}" value="${p.cartNo}">삭제</button></div>
                        <div><button class="wish_btn" data-toggle="modal" data-target="#fullHeightModalRight">위시리스트 저장</button></div>
                    </div>  

                	</div><div class="line1"></div>               
             </div>             
	</c:forEach>	
	</c:if>

        <div class="section2">                                                        
                <div class="service-container">                              
                    <div>전체 서비스 비용</div>
                    <div>이 금액에는 배송비가 포함되어 있지 않으며, 배송지에 따라 구매가 불가할 수 있습니다</div>
                </div>                                       
        </div>
        <div class="line2"></div> 
		
        <div class="total-container">
            <div class="total-title">총 주문금액</div>
            <div class="total-price">                      
            	<fmt:formatNumber value="${total+sumprice}"/> 원           
            </div>
        </div>

		
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
	
	$(".amount").change(e=>{
		console.log("수량변경");
		let qty=$(e.target).val();
		let cNo=$(e.target).next().val();
		let pNo=$(e.target).next().attr("id");
		let tp=$(e.target).next().attr("class");
		let pr=$(e.target).next().next().val();
		
		console.log("수량변경:"+qty);		
		console.log("상품번호:"+pNo);
		console.log("카트번호:"+cNo);
		console.log("상품가격:"+pr);
		console.log("총가격:"+tp);
						
		
	
		$.ajax({
			url:"${path}/cart/updateQty.do",
			data:{qty:qty, cartNo:cNo, productNo:pNo, totalPrice :tp, productPrice:pr},
			success:data=>{
				console.log("qty:"+qty);
				$("#re").html(data);
			}
		})
	})

				
	
	
	</script>

