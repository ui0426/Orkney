<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>

    <jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
    <style>
    	#testBody{
    	text-align: center;min-height: 643px;
    	color: gold;
    	}
    	$bg: #e6e2df;



.wrapper {
	width: 100%;
	font-family: 'Source Code Pro', monospace;
	margin: 0 auto;
	height: 100%;
	
	}
	h1 {
		outline:0;
		text-transform: uppercase;
		transform: translate(-50%, -50%) skew(10deg) rotate(-10deg);
		font-size: 20vw;
		top: 56%;
		left: 50%;
		margin: 0;
		position: absolute;
		text-rendering: optimizeLegibility;
		font-weight: 900;
		white-space: nowrap;
		text-shadow: 0 -2px 0 #777, 0 -2px 0 #777;
		}
	h1:before {
			content: attr(data-heading);
			position: absolute;
			left: 0;
			top: -4.8%;
			overflow: hidden;
			width: 100%;
			height: 50%;
			color: cornflowerblue;
			transform: translate(1.6vw, 0) skew(-13deg) scale(1, 1.2);
			z-index: 2;
			text-shadow: 2px -1px 6px rgba(0,0,0,0.2);
		}
		
		h1:after {
			content: attr(data-heading);
			position: absolute;
			left: 0;
			top: 0;
			overflow: hidden;
			width: 100%;
			height: 100%;
			z-index: 1;
			color:  #4285f4;
			transform: translate(0vw, 0) skew(13deg) scale(1, 0.8);
			clip-path: polygon(0 50%, 100% 50%, 100% 100%, 0% 100%);
			text-shadow: 2px -1px 6px rgba(0,0,0,0.3);
		}
	

    </style>
   <div id="testBody" class="wrapper">
	<h1 contenteditable data-heading="Orkney">Orkney</h1>
</div>
    <jsp:include page="/WEB-INF/views/common/adminFooter.jsp"/>
    <script type="text/javascript">
    var h1 = document.querySelector("h1");

    h1.addEventListener("input", function() {
      this.setAttribute("data-heading", this.innerText);
    });
	</script>
    
    