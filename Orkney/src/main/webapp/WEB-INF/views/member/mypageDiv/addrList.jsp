<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>                
                  
                  <div class="panel-row-title flex-row-between">
                     <span>배송 주소(<c:out value="${ fn:length(addrList)}"/>)</span>
                  </div>
                  <!-- 등록된 배송지 없을경우 -->
                  <c:if test="${ addrList.size() == 0 }">
                     <div>저장된 주소가 없습니다. 편리한 쇼핑을 위해 주소를 입력해주세요.</div>
                  </c:if>
                  <!-- 등록된 배송지가 있을 경우 -->
                  <c:if test="${ addrList.size() != 0 }">
                  <c:forEach var="addr" items="${ addrList }" varStatus="status">
                  <div class="divForAddAdddrUpdate">
                  	 <input type="hidden" value="${ addr.address_no }"/>
                     <a class="panel-row-update addAddr-aTag" onclick="fn_addAddrUpdate(this);">수정</a>
                     <div class="addr-disappear">
                        <div class="flex-row-between">
                           <div class="font-weight"><c:out value="${ addr.address_name }"/></div>
                        </div>
                        <div><c:out value="${ addr.address_addr }"/></div>
                        <div><c:out value="${ addr.address_detail }"/></div>
                        <div><c:out value="${ addr.address_post }"/></div>
                        <br>
                        <span class="font-weight">휴대폰 : </span><span><c:out value="${ addr.address_phone }"/></span>
                     </div>
                     
                     <div class="update-box addr-update-box" style="display: none;">
                     </div>
                  </div>
                  </c:forEach>
                  </c:if>