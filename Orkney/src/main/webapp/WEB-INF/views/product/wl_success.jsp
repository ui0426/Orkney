<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>


      <!--Header-->
      <div class="modal-header">
        <p class="heading">위시리스트</p>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true" class="white-text">&times;</span>
        </button>
      </div>
      <!--Body-->
      <div class="modal-body">
        <div class="row">
          <div class="col-3">                       
            <img class="img_main" src="">
          </div>
          <div class="col-9">
<!--             <p>상품을 더 구매하시겠습니까??</p> -->
            <div style="display:flex;">            
<%--             	<div class="productName"><c:out value="${p.PRODUCT_NAME}"/></div> --%>
            	<div>상품이 위시리스트에 추가되었습니다.</div>
            </div>
<!--             <p>위시리스트에 추가되었습니다.</p> -->
          </div>
        </div>
      </div>
      <!--Footer-->
      <div class="modal-footer justify-content-center">
        <a type="button" class="btn btn-info" onclick="location.href='${path}/wishlist/wishlist.do?addwNo=${wNo}'" >위시리스트로 가기</a>        
      </div>