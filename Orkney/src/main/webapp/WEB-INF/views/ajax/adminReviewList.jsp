<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
	tr{
		cursor: pointer;
	}
</style>
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col"></th>
      <th scope="col">작성일</th>
      <th scope="col">상품</th>
      <th scope="col">별점</th>
      <th scope="col">내용</th>
      <th scope="col">작성자</th>
      <th scope="col">구분</th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${rList }" var="r">
    <tr onclick="location.href='${path}/admin/reviewDetail.do?rNo=${r.review_no}'">
      <th scope="row"></th>
      <td><fmt:formatDate value="${r.review_date }" pattern="YYYY-MM-dd"/></td>
      <td><c:out value="${r.product_name }"/></td>
      <td><c:out value="${r.product_grade }"/></td>
      <td><c:out value="${r.review_content }"/></td>
      <td><c:out value="${r.member_name }"/></td>
      <td>
      	<c:choose>
      		<c:when test="${fn:length(r.riList) == 0 }">
      			텍스트형
      		</c:when>
      		<c:otherwise>
      			사진형
      		</c:otherwise>
      	</c:choose>
      </td>
    </tr>
   </c:forEach>
  </tbody>
</table>

<div id="pageBar">${pageBar }</div>