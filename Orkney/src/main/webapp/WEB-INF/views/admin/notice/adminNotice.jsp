<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<c:set var="path" value="${pageContext.request.contextPath }"/>

    <jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
		<style>
			#FAQList{width:100%; margin-bottom:5rem;}
			.title{text-align:center;margin-bottom:3rem;margin-top:3rem;}
			.listTd{max-width: 352px;word-break:break-all;cursor:pointer;}
			.listTr{height:10px;}
			.listSpan{height:10px;}
			.tdContent{display:none;}
			.cBtn{text-align: center;}
			.modifySpace{display:flex;padding: 0rem 2rem 2rem;}
			.mContent{border:1px solid; width:100%;margin-left: 3rem;}
			.title-cate{display:flex;}
		</style>
		<div class="title">
			<h2>문의 관리<hr></h2>
		</div>
		<div class="cBtn">
			<div class="btn-group" role="group" aria-label="Basic example">
			  <button type="button" class="btn btn-cyan btn1" value="전체보기">전체보기</button>
			  <button type="button" class="btn btn-cyan btn1" value="ORKNEY 서비스">ORKENY 서비스</button>
			  <button type="button" class="btn btn-cyan btn1" value="교환환불">교환환불</button>
			  <button type="button" class="btn btn-cyan btn1" value="매장 공통">매장 공통</button>
			  <button type="button" class="btn btn-cyan btn1" value="온라인 주문">온라인 주문</button>
			  <button type="button" class="btn btn-cyan btn1" value="제품정보">제품정보</button>
			</div>
		</div>
		<div id="FAQList">
			<table class="table">
  <thead class="black white-text">
    <tr>
      <th scope="col">FAQ 번호</th>
      <th scope="col" style="text-align:center;">제목</th>
      <th scope="col">카테고리</th>
      <th scope="col">찾아보는 양</th>
    </tr>
  </thead>
  <tbody id="contentBody">
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
  </tbody>
</table>
		</div>
		<div class="title">
			<h2 id="modi-add">내용 수정/추가<hr></h2>
		</div>
		<div>
		
		<div class="modifySpace">
			<div><textarea cols="65" rows="15" id="textContent"></textarea></div>
			<div class="mContent"><p id="txtC"></p></div>
		</div>
		<div class="modifySpace">
			<input class="form-control" type="text" id="mTitle" placeholder="FAQ 제목" style="margin-right:3rem;">
			<select class="browser-default custom-select" id="cSelect" style="width:40%;">
			  <c:forEach items="${category }" var="c">
			  	<option value="${c}">${c}</option>
			  </c:forEach>
			</select>
			<button id="realModify" style="width:8%;">수정</button>
			<button id="add" style="width:8%;">추가</button>
		</div>
		</div>
		<script>
			$("#add").click(e=>{
				let title=$("#mTitle").val();
				let content=$("#textContent").val();
				let category=$("#cSelect").val();
				if(title!=''&&content!=''&&category!=''){
					$.ajax({
						url:'${path}/admin/addFAQ.do',
						data:{title:title,content:content,category:category},
						success:data => {
							if(data==true){
								alert("추가 성공");
								$("#mTitle").val('');
								$("#textContent").val('');
								$("#cSelect").val('');
								$(e.target).val('');
								$("#txtC").html('');
							}else{
								alert("추가 실패");
							}
						}
					})
				}
			})
			$("#realModify").click(e=>{
				$.ajax({
					url:"${path}/admin/modifyFAQ.do",
					data:{"title":$("#mTitle").val(),"content":$("#textContent").val(),
						"category":$("#cSelect").val(),"no":$(e.target).val()},
					success:data => {
						if(data==true){
							alert('수정 성공');
							$("#mTitle").val('');
							$("#textContent").val('');
							$("#cSelect").val('');
							$(e.target).val('');
							$("#txtC").html('');
						}else{
							alert('수정 실패');
						}
					}
				})
			})
			$(".listTr").click(e=>{
				console.log($(e.target));
				if($(e.target).parent().next().children().css('display')=='none'){
				$(e.target).parent().next().children().css('display','table-cell');					
				}else if($(e.target).parent().next().children().css('display')=='table-cell'){
					$(e.target).parent().next().children().css('display','none');					
					}
			})
			$(".btn1").click(e=>{
				$.ajax({
					url:"${path}/admin/FAQcategory.do",
					data:{type:$(e.target).val()},
					success:data => {
						$("#contentBody").html(data);
					}
				})
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
			$("#textContent").keyup(e=>{
				$("#txtC").html($(e.target).val());
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
		
    <jsp:include page="/WEB-INF/views/common/adminFooter.jsp"/>