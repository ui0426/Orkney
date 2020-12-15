<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>
	
	<style>
		.memberData{cursor:pointer;}
	</style>

		 <table class="table">
    <thead class="black white-text">
      <tr>
        <th scope="col">회원 번호</th>
        <th scope="col">이메일</th>
        <th scope="col">이름</th>
        <th scope="col">가입일</th>
        <th scope="col">생일</th>
        <th scope="col">핸드폰</th>
        <th scope="col">포인트</th>
        <th scope="col">인증 여부</th>
        <th scope="col">수신 동의</th>
        <th scope="col">회원 등급</th>
        <th scope="col">가입 유형</th>
        <th scope="col">총 주문 금액</th>
        <th scope="col"></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${list }" var="m">
      <tr class="memberData" id="${m.MEMBER_NO }">
        <th scope="row">${m.MEMBER_NO }</th>
        <td class="memberTd" height="5">${m.MEMBER_ID }</td>
        <td class="memberTd" height="5">${m.MEMBER_NAME }</td>
        <td class="memberTd" height="5"><fmt:formatDate value="${m.ENROLL_DATE}" pattern="YYYY-MM-dd"/></td>
        <td class="memberTd" height="5"><fmt:formatDate value="${m.BIRTHDAY}" pattern="YYYY-MM-dd"/></td>
        <td class="memberTd" height="5">${m.PHONE }</td>
        <td class="pointTd" height="5">${m.POINT }</td>
        <td class="memberTd" height="5">${m.EMAIL_AUTH }</td>
        <td class="memberTd" height="5">${m.EMAIL_CH }</td>
        <td class="memberTd" height="5">${m.AUTHORITY }</td>
        <td class="memberTd" height="5">${m.SIGNUP_TYPE }</td>
        <td class="memberTd" height="5"><fmt:formatNumber value="${m.PRICE }" type="currency"/>원</td>
        <td class="memberTd" height="5"><button class="dBtn" value="${m.MEMBER_NO }">삭제</button></td>
      </tr>
      <%-- <c:forEach items="${addr }" var="a">
      <c:if test="${m.MEMBER_NO eq a.MEMBER_NO }">
      <tr class="addr">
      <td>${a.MEMBER_NO }</td>
      <td>${a.ADDRESS_NO }</td>
      <td colspan="5">${a.ADDRESS }</td>
      <td>${a.ADDRESS_TYPE }</td>
      <td>${a.ADDRESS_NAME }</td>
      <td colspan="2">${a.ADDRESS_PHONE }</td> 
      </tr>
      </c:if>
      </c:forEach> --%>
      </c:forEach>
      </tbody>
      </table>
      <div id="pageBar">
      	${pageBar }
      </div>
      <script>
      	$(".memberTd").click(e=>{
      		let tr=$(e.target).parent().attr('id');
      		if(tr!=undefined){
      			$.ajax({
      				url:"${path}/admin/orderAddr.do",
      				data:{no:tr},
      				success:data => {
      					$("#orderList").html(data);
      					location.href="#totalList";
      				}
      				
      			})
      		}
      	})
      	$(".dBtn").click(e=>{
      		if(confirm("삭제하시겠습니까?")){
      		$.ajax({
      			url:"${path}/admin/deleteMember.do",
      			data:{no:$(e.target).val()},
      			success:data => {
      				if(data==true){
      					alert("삭제되었습니다.");
      				}else{alert("실패했습니다.");
      				}
      			}
      		})
      		}
      	})
      	$(".pointTd").click(e=>{
      		let val=$(e.target).parent().attr('id');
      		$("#mNo").val(val);
      		location.href="#pointList";
      	})
      </script>