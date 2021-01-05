<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>


<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${path }/resources/css/member/point.css">

<section>
<jsp:useBean id="today" class="java.util.Date"/>
<fmt:formatDate value="${today }" pattern="MM" var="MM"/>
<div class="point-container">
	<div class="point-info-box">
		<div class="info-logo">Orkney POINT</div>
		<div class="info-info">
			<span class="info-title">사용가능 포인트</span>
			<span class="info-point"><fmt:formatNumber value="${login.POINT }" pattern="###,###"/>p</span>
		</div>
		<div class="point-detail-choice">
			<div class="small-display">
				<button type="button" class="small-select">전체</button>
				<button type="button" class="small-select">적립</button>
				<button type="button" class="small-select">차감</button>
			</div>
			<div class="big-display">
				<div class="month-choice">
					<button type="button" class="mon-select-btn">전체</button>
					<c:if test="${MM == 1 }">
					<button type="button" class="mon-select-btn"><c:out value="10"/>월</button>
					<button type="button" class="mon-select-btn"><c:out value="11"/>월</button>
					<button type="button" class="mon-select-btn"><c:out value="12"/>월</button>
					</c:if>
					<c:if test="${MM != 1 }">
					<button type="button" class="mon-select-btn"><c:out value="${MM - 3}"/>월</button>
					<button type="button" class="mon-select-btn"><c:out value="${MM - 2}"/>월</button>
					<button type="button" class="mon-select-btn"><c:out value="${MM - 1}"/>월</button>
					</c:if>
					<button type="button" class="mon-select-btn lastbtn"><c:out value="${MM}"/>월</button>
				</div>
				<div class="day-choice">
						<input type="date" id="start-date">
						<span>~</span>
						<input type="date" id="end-date">
				</div>
				<div class="detail-choice" >
					<select class="select" id="select-box">
					  <option value="1" selected>전체</option>
					  <option value="2">적립</option>
					  <option value="3">차감</option>
					</select>
				</div>
				<div class="choice-btn">조회</div>
			</div>
		</div>
	</div>
	<div class="point-list-box">
	</div>
</div>
</section>

<script>
$(function(){
	$.ajax({
		url: '${path}/point/point.do',
		success: data=>{
			$.parseHTML(data);
			$('.point-list-box').html(data);
		}
	})
	
	today = new Date();
	m = today.getMonth()+1;
	d = today.getDate();
	if(m < 10) {
		m = "0" + m;
	}
	if(d < 10){
		d = "0" + d;
	}
	$('#end-date').val(today.getFullYear() + '-' + m + '-' + d);
	$('#start-date').val((today.getFullYear()-2) + '-' + m + '-' + d);
	$('.mon-select-btn').eq(0).css({'background':'#0058ab', 'text-decoration':'underline', 'color':'white'});
})

//스몰 디스플레이에서 조회조건 눌렀을 때
$('.small-select').click(e=>{
	let type = $(e.target).text();
	
	$.ajax({
		url: '${path}/point/point.do',
		data: {type: type},
		success: data=>{
			$.parseHTML(data);
			$('.point-list-box').html(data);
		}
	})
})

//달 선택하면 class로 month-select 넣어주기
$('.mon-select-btn').click(e=>{
	$('.mon-select-btn').css({'background':'white', 'text-decoration':'none', 'color':'black'});
	$(e.target).css({'background':'#0058ab', 'text-decoration':'underline', 'color':'white'});
	let mon = $(e.target).text();
	mon = mon.substring(0, (mon.length-1));
	if((today.getMonth()+1) == 1){
		switch(mon){
			case "01":
			case "03":	
			case "05":	
			case "07":	
			case "08":	$('#start-date').val(today.getFullYear() + '-' + mon + '-' + "01");
						$('#end-date').val(today.getFullYear() + '-' + mon + '-' + "31"); break;
			case "10":
			case "12":  $('#start-date').val(today.getFullYear()-1 + '-' + mon + '-' + "01");
						$('#end-date').val(today.getFullYear()-1 + '-' + mon + '-' + "31"); break;
			case "02":   $('#start-date').val(today.getFullYear() + '-' +mon + '-' + "01");
						$('#end-date').val(today.getFullYear() + '-' + mon + '-' + "29"); break;
			case "04": 
			case "06":
			case "09":	$('#start-date').val(today.getFullYear() + '-' + mon + '-' + "01");
						$('#end-date').val(today.getFullYear() + '-' + mon + '-' + "30"); break;
			case "11":  $('#start-date').val(today.getFullYear()-1 + '-' + mon + '-' + "01");
						$('#end-date').val(today.getFullYear()-1 + '-' + mon + '-' + "30"); break;
		}
	} else {
		switch(mon){
			case "01": 
			case "03":	
			case "05":	
			case "07":	
			case "08":	$('#start-date').val(today.getFullYear() + '-' + mon + '-' + "01");
						$('#end-date').val(today.getFullYear() + '-' + mon + '-' + "31"); break;
			case "10":
			case "12":  $('#start-date').val(today.getFullYear() + '-' + mon + '-' + "01");
						$('#end-date').val(today.getFullYear() + '-' + mon + '-' + "31"); break;
			case "02":   $('#start-date').val(today.getFullYear() + '-' + mon + '-' + "01");
						$('#end-date').val(today.getFullYear() + '-' + mon + '-' + "29"); break;
			case "04": 
			case "06":
			case "09":	$('#start-date').val(today.getFullYear() + '-' + mon + '-' + "01");
						$('#end-date').val(today.getFullYear() + '-' + mon + '-' + "30"); break;
			case "11":  $('#start-date').val(today.getFullYear() + '-' + mon + '-' + "01");
						$('#end-date').val(today.getFullYear() + '-' + mon + '-' + "30"); break;
		}
	}
	if($(e.target).text() == "전체"){
		$('#start-date').val(today.getFullYear()-2 + '-' + m + '-' + d);
		$('#end-date').val(today.getFullYear() + '-' + m + '-' + d);
	}
		
})
	$('#end-date, #start-date').change(e=>{
		console.log(today.getFullYear()-2);
		let ago = new Date((today.getFullYear()-2), (today.getMonth()+1), today.getDate()); //2년전;
		console.log(ago.getTime());
		let sd = $('#start-date').val();
		sd = sd.split('-');
		sd = new Date(sd[0], sd[1], sd[2]);
		
		let ed = $(e.target).val();
		ed = ed.split('-');
		ed = new Date(ed[0], ed[1], ed[2]);
		
		real_today = new Date(today.getFullYear(), (today.getMonth()+1), today.getDate());
		
		console.log(today.getTime());
		console.log(sd.getTime());
		if(ago.getTime() > sd.getTime()){
			alert('최근 2년 내 내역까지만 조회 가능합니다.');
			$('#start-date').val(today.getFullYear()-2 + '-' + m + '-' + d);
			return;
		}
		if(ago.getTime() > ed.getTime()){
			alert('최근 2년 내 내역까지만 조회 가능합니다.');
			$('#end-date').val(today.getFullYear() + '-' + m + '-' + d);
			return;
		}
		if(real_today.getTime() < sd.getTime()){
			alert('현재 이후 날짜로 조회하실 수 없습니다.');
			$('#start-date').val(today.getFullYear() + '-' + m + '-' + d);
			return;	
		}
		if(real_today.getTime() < ed.getTime()){
			alert('현재 이후 날짜로 조회하실 수 없습니다.');
			$('#end-date').val(today.getFullYear() + '-' + m + '-' + d);
			return;
		}
		if(sd.getTime() > ed.getTime()){
			$(e.target).val($('#start-date').val());
			return;
		}
	})

$('.choice-btn').click(e=>{
	let startDate = $('#start-date').val();
	startDate = startDate.split('-');
	startDate = startDate[0] + startDate[1] + startDate[2];
	let endDate = $('#end-date').val();
	endDate = endDate.split('-');
	endDate = endDate[0] + endDate[1] + endDate[2];
	
	let type = $('#select-box').val();
	
	if(type == '2'){
		type = '적립';
	} else if(type == '3'){
		type = '차감';
	}
	
	$.ajax({
		url: '${path}/point/point.do',
		data: {startDate: startDate, endDate: endDate, type: type},
		success: data=>{
			$.parseHTML(data);
			$('.point-list-box').html(data);
		}
	})
})

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>