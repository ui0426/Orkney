<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>


<secssion>

<button id="send-mail-btn">메일발송</button>

</secssion>

<script>
	$('#send-mail-btn').click(e=>{
		alert('dd');
		$.ajax({
			type: 'post',
			url: '${path}/hy/sendMail.do',
			success: data=>{
				console.log(data);
				alert('메일보내기 성공!');
			}
		});
	});
</script>