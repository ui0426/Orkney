<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<style>
.order-container{
	padding: 0 2rem 0 2rem;
}
.order-title{
	margin-top: 1.5em;
	margin-bottom: 2.5rem;
}
.order-title-text{
	font-weight: bold;
    font-size: 1.5rem;
}
.order-btn-title{
	color: #111;
    font-size: 1.125rem;
    line-height: 1.44444;
    font-weight: 700;
}
.admin-order-container{
	margin-bottom: 2em;
}
.basic-info-container{
	border: yellowgreen 1px solid;
    border-radius: .2em;
    padding: .5em;
    margin: .5em 0;
}
.basic-info{
    margin-bottom: .1em;
}
.order-from-to{
	display: grid;
	grid-template-columns: 1fr 1fr;
}
.o-table{
    width: -webkit-fill-available;
}
.o-table td{
	padding: .4em;
    font-size: .8rem;
    border-bottom: 1px black solid;
    border-top: 1px black solid;
}
.o-table td:first-child{
	border-right: 1px black solid;
	font-weight: 600;
} 
#addr-post{
	width: 50px;
}
.apply-btn{
	display:flex;
	justify-content: center;
    padding: .5em;
}
.svg-size{
	width: 10px;
}
.img-size{
	width: 70px;
    height: 70px;
}
.admin-order-member{
	padding-right: 1em;
}
</style>
<section class="order-container">
 	<div class="order-container-inner">
		<div class="order-content order">
			<div class="order-title">
				<h1 class="order-title-text">주문 상세 정보</h1>	
				<input id="oNo" type="hidden" value="${order.order_no }"/>
			</div>
		</div>
		<div class="admin-order-container">
			<div>
				<h2 class="order-btn-title">기본 정보</h2>
			</div>
			<div class="basic-info-container">
				<p class="basic-info">주문번호 : <c:out value="${order.order_no }"/></p>
				<p class="basic-info">주문일시 : <c:out value="${order.order_date }"/></p>
				<p class="basic-info">
					진행상태 : <span id="state"><c:out value="${order.order_state }"/></span> <svg aria-hidden="true" focusable="false" data-prefix="fas" data-icon="arrow-right" class="svg-inline--fa fa-arrow-right fa-w-14 svg-size" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><path fill="currentColor" d="M190.5 66.9l22.2-22.2c9.4-9.4 24.6-9.4 33.9 0L441 239c9.4 9.4 9.4 24.6 0 33.9L246.6 467.3c-9.4 9.4-24.6 9.4-33.9 0l-22.2-22.2c-9.5-9.5-9.3-25 .4-34.3L311.4 296H24c-13.3 0-24-10.7-24-24v-32c0-13.3 10.7-24 24-24h287.4L190.9 101.2c-9.8-9.3-10-24.8-.4-34.3z"></path></svg>
					<select id="o_state">
						<option>배송중</option>
		                <option>제품준비중</option>
		                <option>배송터미널도착</option>
		                <option>배송완료</option>
					</select>
				</p>
			</div>
			<div class="apply-btn">
				<button id="state-change" class="btn btn-primary btn-sm">적용</button>
			</div>
		</div>
		<script>
			$("#state-change").click(e=>{
				var state = $("#o_state").val();
				var oNo = $("#oNo").val();
				console.log(oNo);
				console.log(state);
				$.ajax({
					url:"${path}/admin/updateOrderState.do",
					data:{oNo:oNo,state:state},
					success:data => {
						if(data =="실패"){			
							alert("배송상태 변경 실패!");
						}else{
							$("#state").html(data);							
						}
					}
				})
			})
		</script>
		<div class="admin-order-container">
			<div class="order-from-to">
				<div>
					<div>
						<h2 class="order-btn-title">주문자 정보</h2>
					</div>
					<div class="admin-order-member">
						<table class="o-table">
							<tr>
								<td>주문자ID</td>
								<td><c:out value="${order.member_id }"/></td>
							</tr>
							<tr>
								<td>주문자 이름</td>
								<td><c:out value="${order.member_name }"/></td>
							</tr>
							<tr>
								<td>주문자 연락처</td>
								<td><c:out value="${order.phone }"/></td>
							</tr>
						</table>
					</div>
				</div>
				<div>
					<div>
						<h2 class="order-btn-title">수령자 정보</h2>
					</div>
					<div>
						<table class="o-table">
							<tr>
								<td>수령자</td>
								<td><input type="text" value="${order.order_name }"/></td>
							</tr>
							<tr>
								<td>수렁주소</td>
								<td><input type="text" value="${order.address_post }" id="addr-post"/> <button>우편번호 찾기</button><br>
									<input type="text" value="<c:out value="${order.address_addr }"/>"/><br>
									<input type="text" value="<c:out value="${order.address_detail }"/>"/></td>
							</tr>
							<tr>
								<td>연락처</td>
								<td><input type="text" value="<c:out value="${order.order_phone }"/>" /></td>
							</tr>
							<tr>
								<td>메모</td>
								<td><input type="text" value="<c:out value="${order.order_memo }"/>"/></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class="apply-btn">
				<button class="btn btn-primary btn-sm">적용</button>
			</div>
		</div>
		<div class="admin-order-container">
			<div>
				<h2 class="order-btn-title">주문 내역</h2>
			</div>
			<div>
			<table class="table table-striped">
			  <thead>
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">상품 정보</th>
			      <th scope="col">수량</th>
			      <th scope="col">금액</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach items="${order.odList }" var="od">
			    <tr>
			      <th scope="row"><input type="checkbox" name="xxx" value="yyy"></th>
			      <td>
			      	<div class="media">
					  	<img class="d-flex mr-3 img-size" src="${path }/resources/images/product/${od.product_pic}" alt="상품 이미지">
						<div class="media-body p-info">
					    	<h5 class="mt-0 font-weight-bold p-name"><c:out value="${od.product_name }"/></h5> 
					    	<c:out value="${od.small_category_content }"/>/<c:out value="${od.product_color }"/>
					  	</div> 
					</div>
			      </td>
			      <td><c:out value="${od.product_qty }"/></td>
			      <td><c:out value="${od.product_qty * od.product_price }"/></td>
			    </tr>
			    </c:forEach>
			  </tbody>
			</table>
			</div>
			<div>
				<button class="btn btn-outline-primary waves-effect btn-sm">배송후 반품신청</button>
				<button class="btn btn-outline-primary waves-effect btn-sm">배송후 교환신청</button>
			</div>
		</div>
		<div class="admin-order-container">
			<div>
				<h2 class="order-btn-title">결제 내역</h2>
			</div>
			<div>
				<table class="o-table">
						<tr>
							<td>총 주문금액</td>
							<td><c:out value="${order.total_price }"/>원 (상품금액 <c:out value="${order.total_price-5000 }"/>원 + 배송비 5,000원)</td>
						</tr>
						<tr>
							<td>사용 포인트</td>
							<td>0</td>
						</tr>
						<tr>
							<td>최종 결제 금액</td>
							<td><c:out value="${order.total_price }"/>원</td>
						</tr>
				</table>
			</div>
		</div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/adminFooter.jsp"/>