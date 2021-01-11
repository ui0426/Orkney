
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<link rel="stylesheet" href="${path}/resources/css/cart/cart.css">
   
      

	<c:if test="${cart.size() ==0}">
	<div class="empty">
		<img src="${path}/resources/img/emptycart.png"/>
	</div>
	</c:if>
	
	<c:if test="${cart.size() !=0}">	
    <c:forEach items="${cart}" var="p">                           
            <div class="product-container" id="pc">
                        <input type="hidden" value="${p.productNo }"  name="productNo" class="basket_check">
                        <input type="hidden" value="${p.totalPrice }" name="totalPrice">                                                                                                                                                                                                                 
                    <div class="product-detail">
                    	<div class="product-pic">
                    		<img src="${path}/resources/images/product/<c:out value="${p.product_pic}"/>">
                    	</div> 
                        <div><c:out value="${p.productName}"/></div>
                        <div><c:out value="${p.product_color}"/></div>
                        <div><c:out value="${p.small_category_content}"/></div>                                
                        <div><c:out value="${p.product_width}"/>*<c:out value="${p.product_height}"/>*<c:out value="${p.product_depth}"/></div>                        
                        <div class="price"> 
                        	<div>${p.sale_per!=p.productPrice?"Event":""}</div>
                        	<fmt:formatNumber value="${p.totalPrice}"/>&nbsp;원 
                        </div>
                                                            
                    <div class="btn-container">                                                
                        <div>                        	   
                            <select class="mdb-select md-form amount" id="se">
                            	
                            	<c:forEach begin="1" end="10" var="i">
                            		<c:if test="${p.cartQTY == i}">                            		                                  
                                  		<option value="${p.cartQTY}" selected>${i}</option>
                                  	</c:if>
                                  	<c:if test="${p.cartQTY != i}">                                            	                        	
                                     	<option value="${i}"/>${i}</option>
                                    </c:if>	                                     	                                                                 	                                  		                                                                                            
								</c:forEach>
															
                             </select>
                             <input type="hidden" value="${p.cartNo }" id="${p.productNo}" class="${p.totalPrice}">
                             <input type="hidden" value="${p.productPrice}">                       
                        </div>                        
                       
                        <button class="remove_list remove" id="${p.productNo}" value="${p.cartNo}">삭제</button>
                        <button class="wish_btn" data-toggle="modal" data-target="#fullHeightModalRight" data-name="${p.productNo }">위시리스트 저장</button>                                                                                                                         
                    </div>  
                	</div>                 	 
						<div class="line1"></div>
						                	                         
             </div>            	
             	</c:forEach>	
	</c:if>		 
	
	<!-- Full Height Modal Right -->
<div class="modal fade right" id="fullHeightModalRight" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 10000000;"
  aria-hidden="true">

  <div class="modal-dialog modal-full-height modal-right" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title w-100" id="myModalLabel">위시리스트</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       
      <c:if test="${wish.size()==0 }">
      	<p>위시리스트가 없습니다. </p>
      </c:if>
      <c:if test="${wish.size()!=0 }">
      	<c:forEach items="${wish}" var="w">      	
      	<div style="display:flex; justify-content:space-between; padding: 10px;">
      		<div>${w.wishlist_name}</div>
      		<div> <button style="outline:none;" class="wishadd" id="${w.wishlist_no}">추가</button></div>
      		<input type="hidden" id="prod">      		     		
      	</div>
      	<div class="line1"></div>
      	</c:forEach>
      	</c:if>
      </div>
      <div class="modal-footer justify-content-center">
        <button type="button"  class="btn btn-secondary1" data-dismiss="modal">Close</button>        
      </div>
    </div>
  </div>

</div>
<!-- Full Height Modal Right -->
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
            	<fmt:formatNumber value="${total+sumprice}"/>원            	           
            </div>
        </div>
		<input type="hidden" class="basketNo" id="${cN}" value="${cN}">       
		
	<script>
	//1. 위시리스트 모달에 값 전달
	$("#fullHeightModalRight").on("show.bs.modal",function(e){
		let productNo= $(e.relatedTarget).data("name");	
		$("#prod").val(productNo);
	})
	
	//2. 위시리스트에 추가  
	$(".wishadd").click(e=>{
		let wishNo= $(e.target).attr("id");
		let productNo= $("#prod").val();
		console.log(wishNo);
		$.ajax({
			url:"${path}/wishlist/insertWish.do",
			data:{IwNo:wishNo,pNo:productNo},
			success:data=>{
				alert("위시리스트에 추가되었습니다.");
				location.href="${path}/wishlist/wishlist.do";
			}
		})
	})
	
	//3. 상품내용제거 
	 $(".remove").click(e =>{
			let pNo=$(e.target).attr("id");			
			let cNo=$(e.target).val();									
			$.ajax({
				url:"${path}/cart/deleteProduct.do",
				data:{productNo:pNo, cartNo:cNo},
				success:data=>{																			
					$("#re").html(data);
				}
			});
		});  	
	
	//4. 수량변경시
	$(".amount").change(e=>{		
		let qty=$(e.target).val();
		let cNo=$(e.target).next().val();
		let pNo=$(e.target).next().attr("id");
		let tp=$(e.target).next().attr("class");
		let pr=$(e.target).next().next().val();										
	
		$.ajax({
			url:"${path}/cart/updateQty.do",
			data:{qty:qty, cartNo:cNo, productNo:pNo, totalPrice :tp, productPrice:pr},
			success:data=>{				
				$("#re").html(data);
			}
		})
	})

			
	
	</script>

      

      
