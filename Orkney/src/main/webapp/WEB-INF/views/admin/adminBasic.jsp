<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>

    <jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
    <style>
    	#testBody{text-align: center;min-height: 643px;}
    </style>
    <div id="testBody">개발중</div>
    <jsp:include page="/WEB-INF/views/common/adminFooter.jsp"/>