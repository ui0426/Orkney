<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>

<style>
	.title{
		padding: 2em;
		text-align: center;
	}
</style>
<section>

<div>
	<div>
		<div class="title">
			<h2>리뷰관리</h2>
		</div>
	</div>
	<div>
		<div>
			<div id="reviewList"></div>
		</div>
	</div>
</div>

</section>

<script>
$(function(){
	$.ajax({
		url:"${path}/admin/reviewList",
		success:data => {
			$("#reviewList").html(data);
		}
	})
})
function fn_paging(cPage){
	$.ajax({
		url:"${path}/admin/reviewList",
		data:{cPage:cPage},
		success:data => {
			$("#reviewList").html(data);
		}
	})
}
</script>

<jsp:include page="/WEB-INF/views/common/adminFooter.jsp"/>