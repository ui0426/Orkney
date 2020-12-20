<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"/>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	border: #4285f4 1px solid;
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
.addr-post{
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
							alert("배송상태 변경 완료");
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
						<form id="order-info-change">
							<input id="oNo" name="no" type="hidden" value="${order.order_no }"/>
							<table class="o-table">
								<tr>
									<td>수령자</td>
									<td><input id="oName" name="name" type="text" value="${order.order_name }"/></td>
								</tr>
								<tr>
									<td>수령주소</td>
									<td><input type="text" value="${order.address_post }" id="zip" class="addr-post" name="post"/> 
										<button type="button" class="adrBtn marb" id="adrbtn">우편번호 찾기</button><br>
										<input type="text" id="adrinput" class="o-table" name="addr" value="<c:out value="${order.address_addr }"/>" disabled><br>
										<input type="text" id="detailadr" class="o-table" name="detail" value="<c:out value="${order.address_detail }"/>" required>
									</td>
								</tr>
								<tr>
									<td>연락처</td>
									<td><input type="text" id="phone" value="<c:out value="${order.order_phone }"/>" name="phone"/></td>
								</tr>
								<tr>
									<td>메모</td>
									<td><input type="text" id="oMemo" class="o-table" value="<c:out value="${order.order_memo }"/>" name="memo"/></td>
								</tr>
							</table>
						</form>	
					</div>
				</div>
			</div>
			<div class="apply-btn">
				<button id="order-info-change-btn" class="btn btn-primary btn-sm">적용</button>
			</div>
		</div>
		<script>
			$("#order-info-change-btn").click(e=>{
				
				
				console.log($("#order-info-change").serialize());
				$.ajax({
					url:"${path}/admin/updateOrderInfo.do",
					data:$("#order-info-change").serialize(),
					success:data => {
						if(data =="실패"){			
							alert("수령자 정보 변경 실패!");
						}else{
							alert("수령자 정보 변경 완료");						
						}
					}
				})
			})
			
			/* 주소검색 api */
     $("#adrbtn").click(e=>{
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            var test=data.postcode;
         console.log(test);
         console.log(data.zonecode);
            
            
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                //document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                //document.getElementById("sample6_extraAddress").value = '';
            }
         
            console.log(data.zonecode+" : "+addr);
            
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("#zip").val(data.zonecode);
            $("#adrinput").val(addr);
            $("#zip").attr("disabled",false);
            $("#adrinput").attr("disabled",false);
            $("#zip").attr("readonly",true);
            $("#adrinput").attr("readonly",true);
            // 커서를 상세주소 필드로 이동한다.
            $("#detailadr").focus();
            console.log(data.zonecode+" : "+addr+" : "+extraAddr);
        }
    }).open();
     })
		</script>
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