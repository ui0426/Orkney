<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@taglib prefix="fc" uri="http://java.sun.com/jsp/jstl/functions" %>
 <c:set var="path" value="${pageContext.request.contextPath}"/>
    
 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
 <style>
 	.wrapDiv{padding: 1rem 7rem 0rem;}
 	.fontSize{font-size: 0.875rem;font-weight:400}
 	.marginLeft{margin-left:0.5rem;}
 	.fontweight{font-weight:700;}
 	.questionHeader{margin-bottom:5rem;}
 	.marginB{margin-bottom:2.5rem;}
 	.popular-question{
 	background: #bfdafb;
 	max-width: 1060px;
 	padding:0rem 2rem 0rem;
 	padding: 10px;
    padding-top: 30px;
    background: #bfdafb;
    max-width: 1060px;
    margin: 0 auto;
 	}
 	.questionContent{
 	/* padding:0rem 2rem 0rem;
 	padding: 10px;
    padding-top: 30px;
    background: #bfdafb; */
    max-width: 1060px;
    margin: 0 auto;
    margin-bottom:4rem;
    }
 	.question{position:relative;}
 	.question:before{
 	content: 'Q';
    position: absolute;
    display: block;
    top: 5px;
    left: -40px;
    width: 26px;
    height: 26px;
    border-radius: 34px;
    line-height: 26px;
    background: #2a5aaa;
    font-size: 14px;
    font-weight: 700;
    color: #fff;
    text-align: center;
    }
    .qdiv:before{
    content: 'Q';
    position: absolute;
    display: block;
    top: 5px;
    left: -40px;
    width: 26px;
    height: 26px;
    border-radius: 34px;
    line-height: 26px;
    background: #ffe160;
    font-size: 14px;
    font-weight: 700;
    color: #fff;
    text-align: center;
    }
    .li{padding: 20px 30px;
    background: #fff;
    margin-bottom: 2px;
    transition: all .3s;
    list-style: none;}
    .tag{font-size: 12px;
    color: #999;
    margin-bottom: 10px;}
    .questionWrap{padding-left: 40px;cursor:pointer;}
    .answer{position:relative;
    padding: 30px;
    margin-top: 40px;
    box-sizing: border-box;
    /* background: #fff; */
    background: #eff5fa;
    display:none;}
    .answer:before{
    content: 'A';
    top: 45px;
    background: #000;
    position: absolute;
    display: block;
    left: -40px;
    width: 26px;
    height: 26px;
    border-radius: 34px;
    line-height: 26px;
    font-size: 14px;
    font-weight: 700;
    color: #fff;
    text-align: center;
}
.txt{line-height: 200%;font-size:15px;}
.support{
	margin-top: 45px;
    padding-top: 10px;
    /* background: #fff; */
    border-top: 1px solid #e5e5e5;
    font-size: 12px;
    }
    .stxt{color: #999;font-size:11px;}
    .ph4{font-size: 18px; margin-bottom: 20px; padding-left: 30px;}
    .category{
    margin: 50px auto 20px auto;
    padding: 20px;
    background: #f4f4f4;
    max-width: 1060px;
    }
    .category-ul{font-size: 0;margin-left: -5px;
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    /* padding-inline-start: 40px; */}
    .category-span{
    display: block;
    height: 50px;
    line-height: 50px;
    text-align: center;
    font-size: 12px;
    cursor: pointer;
    font-weight:500;
    }
    .category-div{margin-left: 5px;background: #fff;}
    .category-li{display: inline-block;width: 20%;margin-bottom: 5px;}
    .category-space{
    margin-top: 20px;
    padding: 15px 0;
    font-size: 0;
    border-top: 1px solid #000;
    max-width: 1060px;
    margin: 20px auto 0 auto;
    }
    .category-question{border-top: 1px solid #000;max-width: 1060px;margin: 20px auto 0 auto;}
    .question-space{padding: 50px 0;text-align: center;}
    .faq-list{/* background: #ffe160; */color: #000;}
    .faq-li:hover{background-color:#eff5fa;}
    .faq-li{border-bottom: 1px solid #e2e3e7;}
    .answerb{background:#fff;}
    .fsfw{font-weight:500;font-size:14px;}
    .marb{margin-bottom:4rem;}
    .Bbtn{
    position: relative;
    display: inline-flex;
    text-decoration: none;
    justify-content: center;
    align-items: center;
    text-align: center;
    border: 0;
    font-weight: 700;
    font-size: .875rem;
    line-height: 1.5;
    padding: 0;
    transition-property: all;
    transition-duration: 100ms;
    transition-timing-function: cubic-bezier(0.4, 0, 0.4, 1);
    cursor: pointer;
    box-sizing: border-box;
    background: transparent;
    border-radius: 64px;
    vertical-align: top;
    border: 1px solid #dfdfdf;
    }
    .btnspan{
    height: 2.5rem;
    padding: 1rem 1.5rem;
    font-size: .75rem;
    line-height: 1.33333;
    }
    .active{background:#ffe160;}
    
    @media(max-width:740px){
    .category-li{
    width:47%;}
    *{font-size:10px;}
    .txt{font-size:10px;}
    }
    .Bbtn:hover{border:1px solid black;}
 </style>
 <div class="wrapDiv"><!-- 전체감싸는 -->
 	<div class="questionHeader">
 	<span class="fontSize"><a>홈</a></span>
 	<span class="marginLeft"><i class="fas fa-angle-right"></i></span>
 	<span class="fontSize marginLeft"><a>고객 문의</a></span>
 	<span class="marginLeft"><i class="fas fa-angle-right"></i></span>
 	<span class="fontSize marginLeft">자주 묻는 질문</span>
 	<hr>
 	</div>
 	<div class="questionContent"><!-- 자주 묻는 질문 -->
 	<div class="marginB"><h2 class="fontweight">자주 묻는 질문</h2></div>
 		<div class="popular-question">
 			<h3 class="fontweight ph4">가장 많은 찾은 질문과 답변</h3>
 			<ul id="questionItem">
 			<c:forEach items="${plist }" var="p">
 				<li class="li">
 				<div class="questionWrap">
 					<div class="question">
 					<input type="hidden" value="${p.FAQ_NO }" class="fNo">
 						<div class="tag">
 						카테고리 : <span>${p.CATEGORY}</span>
 						</div>
 						<span class="fontSize ptitle">${p.FAQ_TITLE}</span>
 					</div>
 					<div class="answer">
 						<p class="txt">${p.FAQ_CONTENT}<!-- 내용 -->
                    </p>
			<div class="support">
				<span class="txt stxt">찾으시는 질문이 없나요? IKEA 고객지원센터로 문의해 주세요</span><br>
				<span class="txt stxt">(운영시간: 10:00 am ~ 10:00 pm, 설날과 추석 당일은 휴무)</span>
			</div>
 					</div>
 				</div>
 				</li>
 				</c:forEach>
 			</ul>
 		</div>
 	</div>
 	<div class="category-content"><!-- 카테고리 질문내용 -->
 	<div class="category"><!-- 카테고리 -->
 	<h5 class="fontweight">카테고리</h5>
 	<div>
 		<ul class="category-ul">
 			<li class="category-li"><div class="category-div"><span class="category-span">전체보기</span></div></li>
 			<li class="category-li"><div class="category-div"><span class="category-span">온라인 주문</span></div></li>
 			<li class="category-li"><div class="category-div"><span class="category-span">매장 공통</span></div></li>
 			<li class="category-li"><div class="category-div"><span class="category-span">ORKNEY 서비스</span></div></li>
 			<li class="category-li"><div class="category-div"><span class="category-span">제품정보</span></div></li>
 			<li class="category-li"><div class="category-div"><span class="category-span">교환환불</span></div></li>
 		</ul>
 	</div>
 	</div>
 	<div class="category-space"></div><!-- 중간 여백 -->
 	<div class="category-question">
 	<ul class="faq-list" id="faq-content">
 			<c:forEach items="${list }" var="l">
 				<li class="li faq-li">
 				<div class="questionWrap">
 					<div class="question qdiv">
 					<input type="hidden" value="${l.FAQ_NO }" class="fNo">
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
 			</ul>
 	<div class="question-space"></div>
 	</div> <!-- 질문내용 -->
 	</div>
 	<div class="marb"><hr></div>
 	<div class="help marb"><!-- 도움말 더보기 -->
 		<div>
 			<h4 class="fontweight">도움말 더 보기</h4>
 			<p class="fsfw">궁금한 점이 있거나 도움이 필요하다면 ORKNEY 고객 서비스에 문의하여 필요한 <br>답을 찾아보세요.</p>
 		</div>
 	</div>
 	<div class="marb"><a class="Bbtn"><span class="btnspan">문의하기</span></a></div>
 </div>
 <script>
 	$(".question").click(e=>{
 		
 		let q=$(e.target).next();
 		if($(q).hasClass("answer")){
 			if($(q).css("display")=='none'){
 				let val=$(e.target).find(".fNo").val();
		 			$.ajax({
		 				url:'${path}/notice/increasePopular.do',
		 				data:{no:val},
		 				success:data => {
		 					if(data==true) console.log('증가');
		 					else console.log('실패');
		 				}
		 				
		 			})
 			}
 			$(q).slideToggle(1000);
 		}
 	})
 	
 	$(".category-span").click(e=>{
 		$(".category-span").each((i,v)=>{
 			$(v).removeClass("active");
 		})
 		
 		let type=$(e.target).html();
 		$(e.target).addClass("active");
 		$.ajax({
 			url:"${path}/notice/categoryFAQ.do",
 			data:{type:type},
 			success:data => {
 				$("#faq-content").html(data);
 			}
 			
 		})
 	})
 </script>
 
 <jsp:include page="/WEB-INF/views/common/footer.jsp"/>