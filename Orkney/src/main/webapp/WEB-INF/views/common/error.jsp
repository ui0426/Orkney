<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%> 
 <!-- isErrorPage 확인!! -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="error page"/> 
</jsp:include> 

<section id="content">
	<!-- EL표현식으로 Exception 객체에 접근할 수 없음 -->
	<h1><%=exception.getMessage() %></h1>
</section> 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>