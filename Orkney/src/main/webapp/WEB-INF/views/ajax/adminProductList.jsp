    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	 <table class="table table-hover table-dark">
        <thead>
          <tr style="text-align: center;">
            
            <th scope="col">제품번호 </th>
            <th scope="col">제품이름</th>
            <th scope="col">제품색상</th>
            <th scope="col">가격</th>
            <th scope="col">할인 / %</th>
            <th scope="col">할인된 가격</th>
            <th scope="col">카테고리</th>
            <th scope="col">재고</th>
            <th scope="col">입고</th>
            
            <th scope="col">삭제</th>
  
          </tr>
        </thead>
        <tbody>
        <div id="clean">
        <c:forEach items="${list}" var="o" varStatus="s">
       
          <tr class="clickPointer" id="product${s.index}" style="text-align: center;background-color: #49505a;border: 2px solid #585d64;">
      
            <td ><c:out value="${o.PRODUCT_NO}"/></td>
            <td ><c:out value="${o.PRODUCT_NAME}"/></td>
            <td ><c:out value="${o.PRODUCT_COLOR}"/></td>
            <td ><c:out value="${o.PRODUCT_PRICE}"/></td>
            <td >
            	<input type="number" name=""  min="0" id="per" placeholder="%" style="border-radius: 10px;width: 4rem;">
            	<button type="button" class="btn" style="line-height: 0px; border-radius: 52px;width: 0px;" onclick="per('${o.PRODUCT_NO}','${s.index}','${o.PRODUCT_PRICE}');">%</button>

            </td>
            <td id="salePrice"><c:out value="${o.SALE_PER}"></c:out></td>
            <td ><c:out value="${o.BIG_CATEGORY_CONTENT}"/></td>
            <td id="stock"><c:out value="${o.PRODUCT_STOCK}"/></td>
            <td ><input type="number" name="" id="putIn" placeholder="입고 수량 ( 숫자 )" style="border-radius: 10px;width: 9rem;">
            <button type="button" class="btn" style="line-height: 0px; border-radius: 52px;width: 0px;"onclick="putIn('${o.PRODUCT_NO}','${s.index}');">+</button></td>
            <td id=""> <button type="button" class="btn" style="line-height: 0px; border-radius: 52px;"data-toggle="modal" data-target="#modalConfirmDelete${s.index}" >삭제</button></td>

			<div class="modal fade" id="modalConfirmDelete${s.index}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
			  aria-hidden="true">
			  <div class="modal-dialog modal-sm modal-notify modal-danger" role="document">
			    <!--Content-->
			    <div class="modal-content text-center" style="width: 23rem;">
			      <!--Header-->
			      <div class="modal-header d-flex justify-content-center">
			        <p class="heading">
			        	<c:out value="${o.PRODUCT_NO}"/> /
			        	<c:out value="${o.PRODUCT_NAME}"/>
			        	를 삭제 하시겠습니까?
			        </p>
			      </div>
			      <!--Body-->
			      <div class="modal-body">
			        <i class="fas fa-times fa-4x animated rotateIn"></i>
			      </div>
			      <!--Footer-->
			      <div class="modal-footer flex-center">
			        <a class="btn  btn-outline-danger" data-dismiss="modal" onclick="deleteProduct('${o.PRODUCT_NO}','${s.index}');">Yes</a>
			        <a type="button" class="btn  btn-danger waves-effect" data-dismiss="modal">No</a>
			      </div>
			    </div>
			  </div>
			</div>
            
          </tr>
          </c:forEach>
          </div>
      </table>
      
      <div id="pageBar">
      	${pageBar }
      </div>
      
      
  

<div class="modal fade" id="modalConfirmDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog modal-sm modal-notify modal-danger" role="document">
    <!--Content-->
    <div class="modal-content text-center">
      <!--Header-->
      <div class="modal-header d-flex justify-content-center">
        <p class="heading">제품을 삭제 하시겠습니까?</p>
      </div>

      <!--Body-->
      <div class="modal-body">

        <i class="fas fa-times fa-4x animated rotateIn"></i>

      </div>

      <!--Footer-->
      <div class="modal-footer flex-center">
        <a href="" class="btn  btn-outline-danger">Yes</a>
        <a type="button" class="btn  btn-danger waves-effect" data-dismiss="modal">No</a>
      </div>
    </div>
  </div>
</div>

      