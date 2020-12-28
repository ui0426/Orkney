<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fc" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<!-- Google Fonts Roboto -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
<!-- Material Design Bootstrap -->
<link rel="stylesheet" href="${path}/resources/css/mdb.min.css">
<!-- Your custom styles (optional) -->
<link rel="stylesheet" href="${path}/resources/css/style.css">

<script type="text/javascript" src="${path}/resources/js/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="${path}/resources/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="${path}/resources/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="${path}/resources/js/mdb.min.js"></script>

 <link rel="stylesheet" href="${path}/resources/css/common/header/default.css">
    <link rel="stylesheet" href="${path}/resources/css/common/header/header.css">
    <link rel="stylesheet" href="${path}/resources/css/common/header/header-aside.css">
    <link rel="stylesheet" href="${path}/resources/css/common/header/test.css">
    
    
    

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        
    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
	
	 <!-- 웹소켓 이용위해 -->
    <script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

      <!-- MDB icon -->
  <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Google Fonts Roboto -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" href="${path}/resources/css/bootstrap.min.css">
  <!-- Material Design Bootstrap -->
  <link rel="stylesheet" href="${path}/resources/css/mdb.min.css">
  <!-- Your custom styles (optional) -->
  <link rel="stylesheet" href="${path }/resources/css/style.css">

  
<script type="text/javascript" src="${path }/resources/js/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="${path }/resources/js/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="${path }/resources/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="${path }/resources/js/mdb.min.js"></script>
<!-- Your custom scripts (optional) -->

<link rel="stylesheet" href="${path }/resources/css/review/reviewUpdate.css"/>

</head>
<body onload="mark(${review.product_grade});" >
<section class="review-container">
	<div class="review-container-content">
		<div class="review-container-inner">
			<div class="reviewTitle">
				<h1 class="reviewform-title">리뷰 작성</h1>				
			</div>
			<div class="part-line"><hr class="line-c"></div>
			<form name="reviewForm" id="reviewForm">
				<div class="review-small-container">
					<input type="hidden" name="review_no" value="${review.review_no }"/>
					<h3 class="review-sub-title">상품</h3>
					<div class="media">
					  	<img class="d-flex mr-3 img-size" src="${path }/resources/images/product/${review.product_pic}" alt="상품 이미지">
						<div class="media-body p-info">
					    	<h5 class="mt-0 font-weight-bold p-name"><c:out value="${review.product_name }"/> </h5> 
					    	<c:out value="${review.small_category_content }"/>/<c:out value="${review.product_color }"/>&nbsp;&nbsp;<c:out value="${review.product_width }"/>*<c:out value="${review.product_height }"/>*<c:out value="${review.product_depth }"/>
					  	</div> 
					</div>
				</div>
				<div class="part-line"><hr class="line-c"></div>
				<div>
					<div class="review-small-container review-contents">
						<div><h3 class="review-sub-title">별점</h3></div>
						<div>
							<span class="star-input">
								<img id="image1" onmouseover="show(1)" onclick="mark(1)" onmouseout="noshow(1)" src="${path }/resources/svg/star-0.svg"/>
								<img id="image2" onmouseover="show(2)" onclick="mark(2)" onmouseout="noshow(2)" src="${path }/resources/svg/star-0.svg"/>
								<img id="image3" onmouseover="show(3)" onclick="mark(3)" onmouseout="noshow(3)" src="${path }/resources/svg/star-0.svg"/>
								<img id="image4" onmouseover="show(4)" onclick="mark(4)" onmouseout="noshow(4)" src="${path }/resources/svg/star-0.svg"/>
								<img id="image5" onmouseover="show(5)" onclick="mark(5)" onmouseout="noshow(5)" src="${path }/resources/svg/star-0.svg"/>	
							</span>	
							<span id="startext"></span>
							<input id="grade" type="hidden" name="product_grade">			
						</div>
					</div>
					<div class="review-small-container review-contents">
						<div><h3 class="review-sub-title">리뷰</h3></div>
						<div class="form-group shadow-textarea">
						  <textarea name="review_content" class="form-control z-depth-1" id="exampleFormControlTextarea6" rows="3"><c:out value="${review.review_content }"/></textarea>
						</div>
					</div>
					<div class="review-small-container review-contents">
						<!-- <div><h3 class="review-sub-title">사진 첨부</h3></div> -->
						<div class="file-container">
							<ul id="file-list">
								<c:forEach items="${review.riList }" var="ri">
									<li>
										<div id="preview1" class="review-file">
											<img src="${path }/resources/upload/review/${ri.renamedFileName}" style="opacity: 0.5; position:absolute; width:100%; height:100%;">
										</div>
									</li>
								 </c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="reviewForm-btn">
					<input type="button" class="btn btn-primary" id="review-update" value="수정하기">
				</div>
			</form>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">리뷰 수정</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<h5 id="modalcontent"></h5>
	      </div>
	      <div class="modal-footer">
	        <button id="check-btn" type="button" class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
</section>

<script>

	//별점
	var locked = 0;
	var text = "";
	
	//별 위에 마우스 댔을 때
	function show(star){
		if(locked>0) return false;
		var i;
		var image;
		var el;
		var e = document.getElementById('startext');
		var stateMsg;
		for(i = 1; i <= star; i++){
			image = 'image' + i;
			el = document.getElementById(image);
			el.src = "${path}/resources/svg/star-1.svg";
		}
		switch(star){
			case 1:
				stateMsg = "매우 별로";
				break;
			case 2:
				stateMsg = "별로";
				break;
			case 3:
				stateMsg = "보통";
				break;
			case 4 :
				stateMsg = "만족";
				break;
			case 5 :
				stateMsg = "매우 만족";
				break;
			default:
				stateMsg = "";
	 	}
		e.innerHTML = stateMsg;
	}
	
	//별에 올렸던 마우스를 치웠을 때
	function noshow(star){
		var i;
		var image;
		var el;
		var e = document.getElementById('startext');
	    	
		if(locked > 0 ){
			for(i=1; i<=locked; i++){
	    		image="image"+i;
	    		el=document.getElementById(image);
	    		el.src="${path}/resources/svg/star-1.svg";
	    	}
			for(i=5; i>locked; i--){
	    		image="image"+i;
	    		el=document.getElementById(image);
	    		el.src="${path}/resources/svg/star-0.svg";
			}
			e.innerHTML = text;
			return;
		}else{
	    	for(i=1; i<=star; i++){
	    		image="image"+i;
	    		el=document.getElementById(image);
	    		el.src="${path}/resources/svg/star-0.svg";
	    	}
	    	e.innerHTML = text;
		}
	}
	
	
	function lock(star){
		show(star);
		locked = star;
	}
	
	//클릭했을 때
	function mark(star){
		console.log(${review.review_no});
		lock(star);
		for(i = 1; i <= star; i++){
			image = 'image' + i;
			el = document.getElementById(image);
			el.src = "${path}/resources/svg/star-1.svg";
		}
		for(i = 5; i>star; i--){
			image = 'image' + i;
			el = document.getElementById(image);
			el.src = "${path}/resources/svg/star-0.svg";
		}
		var e = document.getElementById('startext');
		var stateMsg;
		switch(star){
			case 1:
				stateMsg = "매우 별로";
				break;
			case 2:
				stateMsg = "별로";
				break;
			case 3:
				stateMsg = "보통";
				break;
			case 4 :
				stateMsg = "만족";
				break;
			case 5 :
				stateMsg = "매우 만족";
				break;
			default:
				stateMsg = "";
	 	}
		e.innerHTML = stateMsg;
		text = stateMsg;
		console.log("선택"+star);
		document.getElementById("grade").value=star;
	}
	
	//이미지 미리보기
	/* function handleFiles(file, name){
		console.log(file);
		console.log("파일경로 이름 확장명 : "+name);
		console.log(name.length);
		var _lastDot = name.lastIndexOf('.');//확장자 있는 자릿수
		console.log(_lastDot);
		var ext = name.substring(_lastDot, name.length);
		console.log(ext);
		ext = name.substring(_lastDot, name.length).toLowerCase();//소문자로 변경
		console.log(ext);
		console.log(ext.indexOf('.pdf'));
		console.log(ext.indexOf('.jpg'));
		console.log(ext.indexOf('.png'));
		
		if(ext.indexOf('.gif')>-1 || ext.indexOf('.png')>-1 || ext.indexOf('.jpg')>-1 || ext.indexOf('.jpeg')>-1){
			console.log("이미지다");
			console.log(file.closest("div"));
			file.closest("div").setAttribute("class","none");//input태그 있는 div는 숨기기
			
	        const img = document.createElement("img");
	       	file.parentNode.parentNode.nextSibling.nextSibling.setAttribute("class","review-file");
	       	console.log("이미지 넣을 div에 클래스 설정");
	       	file.parentNode.parentNode.nextSibling.nextSibling.appendChild(img);
	        img.src = URL.createObjectURL(file.files[0]);
	        img.setAttribute("style","position:absolute; width:100%; height:100%;");
	        console.log("이미지까지 무사히 들어옴");
	        
	        console.log(file.parentNode.parentNode.nextSibling.nextSibling.nextSibling);
	        console.log("버튼보임!!!!!!!!");
	        console.log("========================여기까지 이미지 미리보기 끝=========================")
	       
		}else{
			alert("이미지 아니다");
		}
	}; */
	
	//이미지 삭제하기
	/* function deletePreview(btn, i){
	  console.log(btn);
	  console.log(i);
	  var div = btn.parentNode;
	  var img = btn.parentNode.lastChild; 
	  console.log(div);
	  img = img.parentNode.removeChild(img);//미리보기 이미지 태그는 완전히 제거
	  console.log(img);
	  
	  div.setAttribute("class","none");//미리보기 이미지 담았던 div숨기기
	  
	  console.log($(btn).parent().prev().find("input").val());
	  $(btn).parent().prev().find("input").val("");
	  console.log($(btn).parent().prev().find("input").val());
	  $(btn).parent().prev().find("input").prop("type","text");
	  $(btn).parent().prev().find("input").prop("type","file");
	 console.log($(btn).parent().prev().find("input"));
	 
	  var box = "#img-box"+i;
	  $(box).removeClass("none").addClass("filebox").addClass("review-file");
	  console.log("다시 새로운 인풋");
	  
	} */

        
	//최종 수정 등록
	$("#review-update").click(e  =>{
		
	    	var star = $("#grade").val();
			var content = $("#exampleFormControlTextarea6").val().trim();
			console.log(content);
			if(star == ""){
				alert("별점입력해주세요");
				return false;
			};
			if(content == ""){
				alert("내용을 입력해주세요");
				return false;
			};
			$.ajax({
				url:"${path}/review/reviewUpdateEnd.do",
				data:$("#reviewForm").serialize(),
				success:data=>{
					if(data > 0){
						$("#modalcontent").html("리뷰 수정이 완료되었습니다.");
					}else{
						$("#modalcontent").html("에러가 발생했습니다. 고객센터에 문의해주세요.");
					}
					$("#updateModal").modal();
				}
			})
	})
	
	$("#check-btn").click(e=>{
		window.opener.location.href="${path}/review/reviewList.do?s=wrote";
		window.open("about:blank","_self").close();
	})
 
</script>
</body>
</html>