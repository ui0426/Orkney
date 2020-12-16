<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

		<c:forEach items="${months }" var="m">
			<div class="point-date-box"><div class="line"></div><div class="point-date">${m }</div><div class="line"></div></div>
			<c:forEach items="${list }" var="point">
				<c:if test="${ m eq fn:substring(point.point_date,0,7) }">
				
				<div class="point-list">
					<c:if test="${point.point_type == '차감' }">
					<div class="point-type point-minus">${point.point_type }</div>
					</c:if>
					<c:if test="${point.point_type == '적립' }">
					<div class="point-type point-plus">${point.point_type }</div>
					</c:if>
					<div>
						<div class="point-fulldate">${point.point_date }</div>
						<div class="point-content">${point.point_content }</div>
					</div>
					<c:if test="${point.point_type == '차감' }">
					<div class="point point-minus">
						<span>-</span>
						${point.point_point }p
					</div>
					</c:if>
					<c:if test="${point.point_type == '적립' }">
					<div class="point point-plus">
						<span>+</span>
						${point.point_point }p
					</div>
					</c:if>
				</div>
				</c:if>
			</c:forEach>
		</c:forEach>
		
<script>
$(function(){
	$('.point-date-box').prev('.point-list').css('border-bottom', 'none');
})
</script>