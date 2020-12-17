<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>

    <c:forEach items="${list }" var="l">
      <tr class="listTr" id="${l.FAQ_NO}">
      <td class="listTd no" height='5'>${l.FAQ_NO }</td>
      <td class="listTd title" height='5'>${l.FAQ_TITLE }</td>
      <td class="listTd category" height='5'>${l.CATEGORY }</td>
      <td class="listTd popular" height='5'>${l.POPULAR }&nbsp&nbsp
      <span>
      <button class="modify" value="${l.FAQ_NO}">수정</button>
      <button class="delete" value="${l.FAQ_NO}">삭제</button>
      </span>
      <input type="hidden" value="${l.FAQ_CONTENT }" class="hidden">
      </td>
    </tr>
    <tr>
    	<td colspan="4" align="center" class="tdContent">${l.FAQ_CONTENT }</td>
    </tr>
    </c:forEach>
    
    <script>
    $(".listTr").click(e=>{
		if($(e.target).parent().next().children().css('display')=='none'){
		$(e.target).parent().next().children().css('display','table-cell');					
		}else if($(e.target).parent().next().children().css('display')=='table-cell'){
			$(e.target).parent().next().children().css('display','none');					
			}
	})
	$(".modify").click(e=>{
				let val=$(e.target).val();
				$(".listTr").each((i,v)=>{
					let id=$(v).attr("id");
					if(id==val){
						let title=$(v).find(".title").html();
						let content=$(v).find(".hidden").val();
						let ca=$(v).find(".category").html();
						$("#realModify").val(id);
						$("#textContent").val(content);
						$("#mTitle").val(title);
						$("#cSelect").children().each((i,v)=>{
							if($(v).val()==ca){
								$(v).prop('selected',true);
							}else{
								$(v).prop('selected',false);
							}
						})
						location.href='#modi-add';
					}
				})
			})
			
			$(".delete").click(e=>{
				if(confirm('삭제하시겠습니까?')){
					$.ajax({
						url:'${path}/admin/deleteFAQ.do',
						data:{no:$(e.target).val()},
						success:data => {
							if(data==true){
								alert('삭제 성공');
							}else{
								alert('삭제 실패');
							}
						}
					})
				}
			})
    </script>