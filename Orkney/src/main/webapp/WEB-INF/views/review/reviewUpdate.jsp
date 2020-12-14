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


<style>
h1, h3{margin : 0;}
.review-container-content{
	margin: 1.5rem 1rem 3rem 1rem;
}
.review-container-inner{
	max-width: 656px;
	margin:0 auto;
}
.reviewform-title{
	text-align: center;
	font-weight: 700;
	font-size: 1.5rem;
	margin: 1rem 0px;
}
.review-sub-title{
	font-size: 1.125rem;
	font-weight: 700;
	margin-bottom: 1em;
}
@media(min-width: 769px){
	.review-small-container{
	    grid-template-columns: 25% 1fr;
	    display: grid;
	}
	.review-sub-title{
		margin-buttom: 0;
	}
}
/* @media(min-width: 1024px){
	
	.reviewform-title{
		font-size: 2.25rem;
	}
	
	.review-sub-title{
		font-size: 1.375rem;
		margin-left: 1em;
	}
	
} */
.review-small-container{
	margin: 0 .7em 0 1em;
}

.review-contents{
	margin-bottom: 1.5em;
}
.p-info{
	font-size: .8em;
}
.p-name{
	font-size: 1.3em;
}
.img-size{
    width: 10em;
    height: auto;
}

/* 별점 */
.star-input img{
	width:20px;
}
#startext{
	font-size: .75em;
    font-weight: 900;
}


/* 사진업로드 */
.review-file{
    width: 93px;
    height: 93px;
}

/* 파일 필드 숨기기 */
.filebox input[type="file"] {  
	position: absolute; 
	width: 1px; 
	height: 1px; 
	padding: 0; 
	margin: -1px; 
	overflow: hidden; 
	clip:rect(0,0,0,0); 
	border: 0;
}
.file-container ul{
	margin: -5px;
    overflow: hidden;
}
.file-container ul li{
    float: left;
    margin: 5px;
}
.review-file label{
	display: block;
    box-sizing: border-box;
    height: 100%;
    padding-top: 24px;
    border: 1px solid #ddd;
    background: #fff;
    font-size: 13px;
    line-height: 17px;
    text-align: center;
    cursor: pointer;
    position: relative;
}
.review-file label:before{
	display: block;
    content: url("../resources/svg/camera-retro-solid.svg");
    background-position: -1046px -464px;
    width: 26px;
    height: 21px;
    margin: 0 auto 6px;
}
.none{
	display: none;
}

</style>
</head>
<body onload="mark(${review.product_grade});" >
<section class="review-container">
	<div class="review-container-content">
		<div class="review-container-inner">
			<div class="reviewTitle">
				<h1 class="reviewform-title">리뷰 작성</h1>				
			</div>
			<div class="part-line"><hr class="line-c"></div>
			<form name="reviewForm" id="reviewForm" action="${path }/review/reviewUpdateEnd.do" method="post">
				<div class="review-small-container">
					<%-- <input type="hidden" name="review_no" value="${review.review_no }"/> --%>
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
						<div><h3 class="review-sub-title">사진 첨부</h3></div>
						<div class="file-container">
							<ul id="file-list">
								<li>
									<div id="img-box1" class="filebox review-file">
										<label id="upload-label1">
											<span id="file1">사진 업로드</span>
											<input type="file" id="img_input1" name="review_img" onchange="handleFiles(this, this.value)" accept="image/jpeg, image/jpg, image/png" /> 
										</label>
									</div>
								</li>
								<li>
									<div id="img-box1" class="filebox review-file">
										<label id="upload-label1">
											<span id="file1">사진 업로드</span>
											<input type="file" id="img_input1" name="review_img" onchange="handleFiles(this, this.value)" accept="image/jpeg, image/jpg, image/png" /> 
										</label>
									</div>
								</li>
								<li>
									<div id="img-box1" class="filebox review-file">
										<label id="upload-label1">
											<span id="file1">사진 업로드</span>
											<input type="file" id="img_input1" name="review_img" onchange="handleFiles(this, this.value)" accept="image/jpeg, image/jpg, image/png" /> 
										</label>
									</div>
								</li>
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
</section>
<script> 

    //별점
    //별점
    var locked = 0;
    var text = "";
    
    //별 위에 마우스 댔을 때
    function show(star){
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
    	lock(star);
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
    	

     	//업로드 한 이미지 미리보기
        function setThumbnail(event) { 

            // 파일 읽는 객체 생성
            var reader = new FileReader();
            
            // 파일이 올라갔을 시 발생할 이벤트 작성
            reader.onload = function(event) { //파일이 올라갔을 때
                
                var img = document.createElement("img"); //이미지 태그 생성
                img.setAttribute("src", event.target.result); //생성된 이미지태그에 src속성을 생성하고 input태그에 들어간 값(파일명)을 넣어서 이미지가 나오게한다
                img.setAttribute("width","100px");
                img.setAttribute("height","100px");
                document.querySelector("div#image_container").appendChild(img);
                
            };

            reader.readAsDataURL(event.target.files[0]);
        }; 
        
   		
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
        		
        		//$("#reviewForm").submit();
               
        		var form = $("#reviewForm")[0];
        		var forData = new FormData(form);
        		var rNo = ${review.review_no };
        		var pGrade = $("#grade").val();
        		var rContent = $("#exampleFormControlTextarea6").val();
        		
        		formData.append("rNo",rNo);
        		formData.append("pGrade",pGrade);
        		formData.append("rContent",rContent);
        		
        		$.ajax({
        			type : 'post',
                    url : '${path }/review/reviewUpdateEnd.do',
                    data : formData,
                    processData : false,
                    contentType : false,
                    success : function(html) {
                        alert("파일 업로드하였습니다.");
                        opener.document.location.reload();

                		self.close();

                    },
                    error : function(error) {
                        alert("파일 업로드에 실패하였습니다.");
                        console.log(error);
                        console.log(error.status);
                    }
        		})
        		
        })
		 
</script>
</body>
</html>