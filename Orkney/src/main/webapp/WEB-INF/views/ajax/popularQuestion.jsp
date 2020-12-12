<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@taglib prefix="fc" uri="http://java.sun.com/jsp/jstl/functions" %>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    
    <c:forEach items="${list }" var="l">
 				<li class="li faq-li">
 				<div class="questionWrap">
 					<div class="question qdiv">
 						<div class="tag">
 						카테고리 : <span>${l.CATEGORY }</span>
 						</div>
 						<span class="fontSize ptitle">${l.FAQ_TITLE }</span>
 					</div>
 					<div class="answer answerb">
 						<p class="txt">${l.FAQ_CONTENT }
                     </p>
			<div class="support">
				<span class="txt stxt">찾으시는 질문이 없나요? IKEA 고객지원센터로 문의해 주세요</span><br>
				<span class="txt stxt">(운영시간: 10:00 am ~ 10:00 pm, 설날과 추석 당일은 휴무)</span>
			</div>
 					</div>
 				</div>
 				</li>
 				</c:forEach>
 				
 				<script>
 				$(".qdiv").click(e=>{
 			 		
 			 		let q=$(e.target).next();
 			 		if($(q).hasClass("answer")){
 			 			if($(q).css("display")=='none'){
 			 			
 			 			}
 			 			$(q).slideToggle(1000);
 			 		}
 			 	})
 				</script>