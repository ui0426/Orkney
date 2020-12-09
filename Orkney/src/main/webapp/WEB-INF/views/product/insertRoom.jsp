<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="메인화면" />
</jsp:include>
<section>
	 <div>
			<form action="${path}/product/insertRoom.do">
				<fieldset>
					<legend>insert</legend>
					<select name="tjf">
						<option value="침실">침실</option>
						<option value="거실">거실</option>
						<option value="주방">주방</option>
						<option value="비지니스">비지니스</option>
					</select>
					<input type="text" placeholder="" name="">
					<input type="file" placeholder="" name="upFile">
				</fieldset>
			</form>
		</div> 
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />